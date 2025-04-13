{pkgs, ...}: {
  programs.go = {
    enable = true;
    package = pkgs.unstable.go;
  };
  home.sessionPath = [
    "$HOME/go/bin"
  ];
}
