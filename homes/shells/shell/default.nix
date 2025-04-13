{
  lib,
  mlib,
  ...
}: {
  imports = lib.concatLists [
    (mlib.includeif ./zsh.nix true)
    (mlib.includeif ./nushell.nix true)
  ];
  home.shellAliases = {
    f = "fastfetch";
    u = "security -v unlock-keychain ~/Library/Keychains/login.keychain-db";
    gc = "nh clean all --ask";
    jb = "just -f /etc/nix-darwin/justfile b";
  };
  programs.oh-my-posh = {
    enable = true;
    useTheme = "amro";
    enableNushellIntegration = true;
    enableZshIntegration = false;
  };
}
