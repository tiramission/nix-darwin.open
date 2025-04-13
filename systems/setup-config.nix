{
  lib,
  mlib,
  ...
}: {
  imports = lib.concatLists [
    (mlib.includeif ./configs/setup-darwin.nix true)
    (mlib.includeif ./configs/setup-config.nix true)
    (mlib.includeif ./configs/setup-overlays.nix true)
    (mlib.includeif ./configs/setup-mtools.nix true)

    (mlib.includeif ./services/yabai true)
  ];
}
