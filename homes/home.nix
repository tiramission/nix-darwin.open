{
  lib,
  mlib,
  ...
}: {
  imports = [
    ./setup-envs.nix
    ./setup-pkgs.nix
    ./setup-apps.nix
    ./setup-mtools.nix
    ./setup-stools.nix

    ./fixs/disable-apps.nix
  ];
  home.stateVersion = "25.05";
}
