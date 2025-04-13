{
  lib,
  mlib,
  pkgs,
  ...
}: let
  conf = pkgs.callPackage ./conf.nix {};
in {
  imports = lib.concatLists [
    (mlib.includeif ./themes/FelixKratz.nix false)
    (mlib.includeif ./themes/patricorgi.nix false)
    (mlib.includeif ./themes/m4xshen.nix false)
    (mlib.includeif ./themes/mehd-io.nix false)
  ];
  programs.sketchybar = {
    enable = true;
    configType = "lua";
    config = {
      recursive = true;
      source = conf;
    };
  };
}
