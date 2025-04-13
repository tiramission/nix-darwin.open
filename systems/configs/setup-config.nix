{
  inputs,
  pkgs,
  ...
}: let
  secrets = inputs.secrets;
in {
  nix.enable = true;
  nix.settings = {
    experimental-features = "nix-command flakes";
    substituters = [
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
    ];
    use-xdg-base-directories = true;
    access-tokens = "github.com=${secrets.gh-token}";
  };
  nix.channel.enable = false;
  nix.optimise.automatic = true;

  nixpkgs.config.allowUnfree = true;
}
