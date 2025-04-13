{
  pkgs,
  mlib,
  ...
}: {
  home.sessionPath = [
    "$HOME/.local/bin"
  ];
  programs.uv = {
    enable = true;
    package = mlib.pkgshould pkgs.master.uv pkgs.cflake.uv;
    settings = {
      preview = true;
      python-downloads = "manual";
      python-preference = "only-managed";
      index-url = "https://pypi.tuna.tsinghua.edu.cn/simple";
    };
  };
}
