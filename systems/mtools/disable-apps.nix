{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    mtool.disable-apps.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "use disable macos syslink";
    };
  };
  config = lib.mkIf config.mtool.disable-apps.enable {
    system.activationScripts.applications.text = pkgs.lib.mkForce "";
  };
}
