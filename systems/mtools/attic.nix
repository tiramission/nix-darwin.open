{
  config,
  params,
  lib,
  pkgs,
  ...
}: let
  cfg = config.mtool.feature.attic;
in {
  options = {
    mtool.feature.attic = {
      enable = lib.mkEnableOption "attic";
      substituter = lib.mkOption {
        type = lib.types.str;
        default = null;
        description = ''
          The URL of the Attid server.
          This is used to connect to the Attid service.
        '';
      };
      package = lib.mkPackageOption pkgs "attic-client" {};
      trustPublicKey = lib.mkOption {
        type = lib.types.str;
        default = null;
        description = ''
          The public key to trust for the Attid server.
          This is used to verify the authenticity of the server.
        '';
      };
      atticConfigFile = lib.mkOption {
        type = lib.types.path;
        default = null;
        description = ''
          The configuration file for Attid, which is used by the attic client.
        '';
      };
    };
  };
  config = lib.mkIf cfg.enable {
    nix.settings.substituters = lib.mkBefore [cfg.substituter];
    nix.settings.trusted-public-keys = [cfg.trustPublicKey];
  };
}
