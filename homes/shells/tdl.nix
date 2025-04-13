{pkgs, ...}: let
  tdlStorage = builtins.toJSON {
    type = "bolt";
    path = "/tmp/tdl/data";
  };
in {
  home.packages = [pkgs.unstable.tdl];
  home.sessionVariables = {
    TDL_STORAGE = ''
      "${pkgs.lib.escapeShellArg tdlStorage}"
    '';
    TDL_PROXY = "http://127.0.0.1:7890";
  };
}
