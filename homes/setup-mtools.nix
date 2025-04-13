{
  inputs,
  config,
  pkgs,
  ...
}: let
  secrets = inputs.secrets;
in {
  imports = [
    ./mtools/frp.nix
  ];

  mtool.services.frp = {
    enable = false; # 在系统级别配置
    package = pkgs.unstable.frp;
    role = "client";
    configFile = secrets.configs.frpc;
  };
}
