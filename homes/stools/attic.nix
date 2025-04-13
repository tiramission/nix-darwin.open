{
  stool,
  params,
  lib,
  pkgs,
  ...
}: let
  cfg = stool.feature.attic;
in {
  config = lib.mkIf cfg.enable {
    home.packages = [cfg.package];
    home.file.".config/attic/config.toml".source = cfg.atticConfigFile;
  };
}
