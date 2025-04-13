{params, ...}: {
  system.defaults = {
    NSGlobalDomain = {
      # 显示扩展名
      AppleShowAllExtensions = true;
      # 不隐藏菜单栏
      _HIHideMenuBar = false;
    };
    # 自动登录用户
    loginwindow.autoLoginUser = params.username;
    # 点击空白处不显示桌面
    WindowManager.EnableStandardClickToShowDesktop = false;
  };
}
