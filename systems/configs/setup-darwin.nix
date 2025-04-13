{
  inputs,
  params,
  ...
}: {
  imports = [
    ./defaults/dock.nix
    ./defaults/finder.nix
    ./defaults/other.nix
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
  system.stateVersion = 5;
}
