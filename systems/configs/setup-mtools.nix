{
  inputs,
  lib,
  mlib,
  pkgs,
  ...
}: let
  secrets = inputs.secrets;
in {
  imports = lib.concatLists [
    (mlib.includeif ../mtools/alias-apps.nix true)
    (mlib.includeif ../mtools/disable-apps.nix true)
    (mlib.includeif ../mtools/frp.nix true)
    (mlib.includeif ../mtools/attic.nix true)
  ];

  # 不应用 Applications 包
  mtool.disable-apps.enable = true;
  # 应用 Applications 包时使用别名而非链接
  mtool.alias-apps.enable = false;
  # 不启用 frp 服务，在用户级别配置
  mtool.services.frp = {
    enable = true;
    package = pkgs.unstable.frp;
    role = "client";
    configFile = secrets.configs.frpc;
  };
  # 添加私有 attic 仓库
  mtool.feature.attic = {
    enable = true;
    substituter = "http://192.168.30.10:8080/default";
    trustPublicKey = "default:9wMBoTJQmVcz+2YMmyx611BWkJj6KlHZsW8Wv4RXIhg=";
    atticConfigFile = secrets.configs.attic;
  };
}
