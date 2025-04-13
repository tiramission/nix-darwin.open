{pkgs, ...}: {
  home.packages = with pkgs.unstable; [bun];
  home.sessionPath = [
    "$HOME/.bun/bin"
  ];
}
