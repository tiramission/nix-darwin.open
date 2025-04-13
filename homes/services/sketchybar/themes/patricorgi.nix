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
          owner = "patricorgi";
          repo = "dotfiles_demo";
          rev = "main";
          sha256 = "sha256-KsuArny05Pun39whU2CXtP8PARtZUGrr+cnvjwdh2CQ=";
        };
      in "${src}/.config/sketchybar";
    };
  };
}
