{pkgs, ...}: {
  hello-go = pkgs.callPackage ./hello-go {};
  empty = pkgs.callPackage ./empty {};
  directory = pkgs.callPackage ./directory {};
  skhd-zig = pkgs.callPackage ./skhd-zig {};
}
