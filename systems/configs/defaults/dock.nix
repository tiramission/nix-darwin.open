{params, ...}: {
  system.defaults.dock = {
    autohide = false;
    persistent-apps = let
      appOf = path: {app = path;};
      spacer = {spacer = {small = true;};};
      cappOf = name: appOf "/Applications/${name}.app"; # 普通应用
      sappOf = name: appOf "/System/Applications/${name}.app"; # 系统应用
      Safari = appOf "/System/Volumes/Preboot/Cryptexes/App/System/Applications/Safari.app";
    in [
      # 系统应用
      (sappOf "Launchpad")
      (sappOf "System Settings")
      spacer # ===== ===== =====
      (sappOf "App Store")
      (sappOf "Photos")
      #
      Safari # (cappOf "Safari")
      (cappOf "Microsoft Edge")
      spacer # ===== ===== =====
      # 聊天
      (cappOf "QQ")
      (cappOf "WeChat")
      # 视频
      (cappOf "哔哩哔哩")
      (cappOf "抖音")
      # 音乐
      (cappOf "QQMusic")
      (cappOf "NeteaseMusic")
      # IDEs
      (cappOf "Visual Studio Code")
      (cappOf "Zed")
      # 终端
      (cappOf "Kitty")
      (cappOf "Ghostty")
    ];
    persistent-others = [
      "/Users/${params.username}/Downloads/"
      "/Users/${params.username}/本地/"
    ];
    show-recents = true;
    tilesize = 48;
    static-only = false;
    orientation = "left";
  };
}
