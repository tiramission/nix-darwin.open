{
  config,
  lib,
  pkgs,
  ...
}: {
  # The default solution doesn't work with Spotlight
  disabledModules = ["targets/darwin/linkapps.nix"];
  home.activation.aliasApplications = let
    apps = pkgs.buildEnv {
      name = "home-manager-applications";
      paths = config.home.packages;
      pathsToLink = "/Applications";
    };
  in
    lib.hm.dag.entryAfter ["linkGeneration"] ''
      echo "Linking Home Manager applications..." 2>&1
      app_path="$HOME/Applications/Home Manager Apps"
      $DRY_RUN_CMD rm -rf "$app_path"
      $DRY_RUN_CMD mkdir -p "$app_path"
      find ${apps}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
      while read -r src; do
        app_name=$(basename "$src")
        echo "copying $app_name" >&2
        $DRY_RUN_CMD ${pkgs.mkalias}/bin/mkalias "$src" "$app_path/$app_name"
      done
    '';
}
