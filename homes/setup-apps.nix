{
  lib,
  mlib,
  hlib,
  ...
}: {
  imports = lib.concatLists [
    (mlib.includeif ./shells/shell true)
    (mlib.includeif ./shells/go.nix true)
    (mlib.includeif ./shells/tdl.nix true)
    (mlib.includeif ./shells/uv.nix true)
    (mlib.includeif ./shells/bun.nix true)
    (mlib.includeif ./shells/git.nix true)
    (mlib.includeif ./shells/nvim true)
    (mlib.includeif ./shells/fastfetch true)

    # apps
    (mlib.includeif ./apps/ghostty.nix (hlib.hasCask "ghostty"))
    (mlib.includeif ./apps/kitty.nix (hlib.hasCask "kitty"))
    # services
    (mlib.includeif ./services/sketchybar true)
    (mlib.includeif ./services/skhd true)
  ];
}
