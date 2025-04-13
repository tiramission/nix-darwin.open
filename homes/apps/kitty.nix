{pkgs, ...}: {
  programs.kitty = {
    enable = true;
    package = pkgs.self.empty;
    shellIntegration.enableZshIntegration = true;
    environment = {
      TERM = "xterm-256color";
    };

    settings = {
      confirm_os_window_close = 0;
      cursor_trail = "1";
      cursor_trail_decay = "0.1 0.4";
      macos_titlebar_color = "background";
      window_padding_width = "10";
      # remember_window_size = "yes";
      initial_window_width = "110c";
      initial_window_height = "34c";
    };
    font = {
      name = "Maple Mono NF CN";
      size = 13;
    };
    # theme
    themeFile = "Adapta_Nokto_Maia";
  };
}
