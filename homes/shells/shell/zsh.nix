{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
      ];
    };
    shellAliases = {
      ls = "eza";
      ll = "eza -l";
      la = "eza -la";
    };
  };
}
