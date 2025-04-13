{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.mtool.services.frp;
  settingsFormat = pkgs.formats.toml {};
  configFile = settingsFormat.generate "frp.toml" cfg.settings;
  isClient = cfg.role == "client";
  # isServer = cfg.role == "server";
in {
  options = {
    mtool.services.frp = {
      enable = lib.mkEnableOption "frp";
      package = lib.mkPackageOption pkgs "frp" {};
      role = lib.mkOption {
        type = lib.types.enum [
          "server"
          "client"
        ];
        description = ''
          The frp consists of `client` and `server`. The server is usually
          deployed on the machine with a public IP address, and
          the client is usually deployed on the machine
          where the Intranet service to be penetrated resides.
        '';
      };
      configFile = lib.mkOption {
        type = lib.types.oneOf [lib.types.str lib.types.path];
        description = ''
          The configuration file for frp, which is generated
          by the settings option.
        '';
      };
      settings = lib.mkOption {
        type = settingsFormat.type;
        default = {};
        description = ''
          Frp configuration, for configuration options
          see the example of [client](https://github.com/fatedier/frp/blob/dev/conf/frpc_full_example.toml)
          or [server](https://github.com/fatedier/frp/blob/dev/conf/frps_full_example.toml) on github.
        '';
        example = {
          serverAddr = "x.x.x.x";
          serverPort = 7000;
        };
      };
    };
  };
  config = let
    realConfigFile = cfg.configFile or configFile;
    executableFile =
      if isClient
      then "frpc"
      else "frps";
  in
    lib.mkIf cfg.enable {
      launchd.agents.frp = {
        enable = true;
        config = {
          ProgramArguments = [
            "${cfg.package}/bin/${executableFile} --strict_config -c ${realConfigFile}"
          ];
          ProcessType = "Background";
          KeepAlive = {
            Crashed = true;
            SuccessfulExit = false;
          };
          StandardOutPath = "${config.home.homeDirectory}/Library/Logs/frp/launchd-stdout.log";
          StandardErrorPath = "${config.home.homeDirectory}/Library/Logs/frp/launchd-stderr.log";
        };
      };
    };
}
