{inputs, ...}: let
  mkOverlay = pkg: name: final: prev: {
    ${name} = import pkg {
      inherit (prev) system config;
    };
  };
  others = {
    self.overlays.default = final: prev: {
      self = inputs.self.packages.${prev.system};
    };
    stable.overlays.default = mkOverlay inputs.nixpkgs-stable "stable";
    unstable.overlays.default = mkOverlay inputs.nixpkgs-unstable "unstable";
    master.overlays.default = mkOverlay inputs.nixpkgs-master "master";
  };
in {
  nixpkgs.overlays = [
    others.stable.overlays.default
    others.unstable.overlays.default
    others.master.overlays.default
    others.self.overlays.default

    inputs.nur.overlays.default
    inputs.cflake.overlays.default
  ];
}
