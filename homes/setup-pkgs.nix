{
  pkgs,
  lib,
  mlib,
  ...
}: {
  home.packages = with pkgs.unstable; [
    eza
    zoxide
    alejandra
    # neovim # use nix4nvchad instead
    # fastfetch
    pstree
    duf
    bat
    yq
    gettext
    unrar
    httpie
    just
    devenv
    android-tools
    zig
    zls
    # bun
    nh
    chafa
    timg
    pkgs.cflake.scrcpy
  ];
}
