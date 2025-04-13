{
  lib,
  pkgs,
  ...
}: {
  programs.sketchybar = {
    config = {
      recursive = true;
      source = let
        src = pkgs.fetchFromGitHub {
          owner = "m4xshen";
          repo = "dotfiles";
          rev = "main";
          sha256 = null;
        };
      in "${src}/sketchybar/sketchybar";
    };
  };
}
