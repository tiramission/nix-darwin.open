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
          owner = "FelixKratz";
          repo = "dotfiles";
          rev = "master";
          sha256 = "sha256-e7HE7sS6cwwA3S92OmUmovA/CXy1fIWvmsJVwH8RQVw=";
        };
      in "${src}/.config/sketchybar";
    };
    configType = "lua";
  };

  home.packages = [
    pkgs.switchaudio-osx
    pkgs.nowplaying-cli
  ];
}
