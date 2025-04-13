{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    package = null; # Use homebrew package
    # enableZshIntegration = true; # cannot understand this option
    settings = {
      command = "${pkgs.zsh}/bin/zsh";
      window-padding-x = 10;
      window-padding-y = 10;
      window-width = 110;
      window-height = 34;
      font-family = "Maple Mono NF CN";
    };
  };
}
