{
  lib,
  config,
  inputs,
  params,
  pkgs,
  ...
}: {
  imports = [
    inputs.nix-homebrew.darwinModules.nix-homebrew
  ];

  environment.systemPath = lib.mkAfter [
    "/opt/homebrew/bin"
  ];

  nix-homebrew = {
    enable = true;
    enableRosetta = false;
    user = params.username;
    autoMigrate = true;
    mutableTaps = false;
    enableZshIntegration = false;
    enableBashIntegration = false;
    enableFishIntegration = false;
    taps = {
      "laishulu/homebrew-homebrew" = inputs."laishulu/homebrew";
      "brewforge/homebrew-chinese" = inputs."brewforge/chinese";
      "brewforge/homebrew-extras" = inputs."brewforge/extras";
      "tiramission/homebrew-self" = pkgs.self.directory.override {src = ./repo;};
    };
  };

  # darwin
  homebrew = {
    enable = true;
    brews = lib.mkForce []; # 强制关闭brews包
    greedyCasks = true;
    taps = builtins.attrNames config.nix-homebrew.taps;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
      extraFlags = [
        # "--upgrade"
        "--quiet"
        ">&2"
      ]; # 将输出重定向到标准错误
    };
  };
}
