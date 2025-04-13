{
  description = "Example nix-darwin system flake";

  inputs = {
    secrets.url = "github:tiramission/nix-secrets/nix-darwin";

    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    nix-darwin.url = "github:nix-darwin/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";

    cflake.url = "github:tiramission/cflake";
    cflake.inputs.nixpkgs.follows = "nixpkgs";

    nix4nvchad.url = "github:nix-community/nix4nvchad";
    nix4nvchad.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    "laishulu/homebrew" = {
      url = "github:laishulu/homebrew-homebrew";
      flake = false;
    };
    "brewforge/chinese" = {
      url = "github:brewforge/homebrew-chinese";
      flake = false;
    };
    "brewforge/extras" = {
      url = "github:brewforge/homebrew-extras";
      flake = false;
    };

  };

  outputs = inputs @ {self, ...}: let
    system = "aarch64-darwin";
    mkDarwin = import ./lib/mk-darwin.nix inputs {inherit system;};
    mkShell = import ./lib/mk-shell.nix inputs {inherit system;};
    pkgs = import ./lib/mk-pkgs.nix inputs {inherit system;} {};
    mkPackage = import ./lib/mk-package.nix inputs {inherit system;};
  in {
    darwinConfigurations."jaign-mac" = mkDarwin {
      username = "jaign";
    };
    devShells.${system}.default = mkShell {};
    formatter.${system} = pkgs.alejandra;
    packages.${system} = mkPackage {inherit pkgs;};
  };
}
