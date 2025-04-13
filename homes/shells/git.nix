{
  inputs,
  pkgs,
  ...
}: let
  secrets = inputs.secrets;
in {
  programs.git = {
    enable = true;
    userName = "tiramission";
    userEmail = "37465086+tiramission@users.noreply.github.com";
    extraConfig = {
      safe.directory = "*";
      init.defaultBranch = "main";
    };
    delta = {
      enable = true;
      options = {
        features = "side-by-side";
      };
    };
  };

  programs.gh = {
    enable = true;
    package = pkgs.unstable.gh;
  };

  home.sessionVariables = {
    GH_TOKEN = secrets.gh-token;
  };
}
