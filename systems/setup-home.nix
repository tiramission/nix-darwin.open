{
  config,
  lib,
  inputs,
  params,
  mlib,
  ...
}: let
  stool = config.mtool;
  casks = config.homebrew.casks;
  caskNames = map (cask: cask.name) casks;
  hasCask = c: builtins.elem c caskNames;
  hasAnyCask = cs: lib.any hasCask cs;
  hlib = {
    inherit hasCask hasAnyCask;
  };
in {
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  system.primaryUser = params.username;
  users.users.${params.username} = {
    home = "/Users/${params.username}";
    # shell = pkgs.zsh; # 不能修改已存在的用户（nix-darwin）
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs params mlib hlib stool;
    };
    users.${params.username} = {...}: {
      imports = [
        ../homes/home.nix
      ];
    };
  };
}
