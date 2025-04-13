inputs: defaultParams: params': let
  params = defaultParams // params';
  system = params.system;
  pkgs = import inputs.nixpkgs-unstable {inherit system;};
in
  import ../packages {pkgs = params.pkgs;}
