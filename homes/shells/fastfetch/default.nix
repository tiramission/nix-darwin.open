{...}: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "kitty-icat";
        source = ./logo.png;
        width = 30;
        padding = {
          top = 3;
          left = 1;
          right = 5;
        };
      };

      modules = [
        "title"
        "separator"
        "os"
        "host"
        "kernel"
        "uptime"
        "packages"
        "shell"
        "display"
        "theme"
        "icons"
        "font"
        "terminal"
        "terminalfont"
        "cpu"
        "memory"
        "disk"
        "localip"
        "battery"
        "poweradapter"
        "locale"
        "break"
        "colors"
      ];
    };
  };
}
