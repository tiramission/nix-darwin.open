{
  lib,
  mlib,
  ...
}: {
  imports = lib.concatLists [
    (mlib.includeif ./homebrew/config.nix true)
    (mlib.includeif ./homebrew/pkgs.nix true)
    (mlib.includeif ./homebrew/fonts.nix true)
  ];
}
