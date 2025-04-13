inputs: defaultParams: params': let
  lib = inputs.nixpkgs.lib;
  params = defaultParams // params';
  system = params.system;
  mlib = {
    # 与 lib.optionals 相反的函数：先接受模块列表，再接受条件
    includeif = modules: condition: lib.optionals condition (lib.toList modules);
    # 选择同版本时优先级更高的包，即第一个包
    pkgshould = prio: next:
      if prio.version == next.version
      then prio
      else next;
  };
in
  inputs.nix-darwin.lib.darwinSystem {
    inherit system;
    specialArgs = {inherit inputs params mlib;};
    modules = lib.concatLists [
      (mlib.includeif ../systems/setup-config.nix true)
      (mlib.includeif ../systems/setup-homebrew.nix true)
      (mlib.includeif ../systems/setup-home.nix true)
    ];
  }
