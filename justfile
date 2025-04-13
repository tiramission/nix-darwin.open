f:
        nix fmt .

a: f
        git add .

b: a
        @echo nh darwin switch /etc/nix-darwin --ask
        @nh darwin switch /etc/nix-darwin --ask

bf: a
        @echo nh darwin switch /etc/nix-darwin
        @nh darwin switch /etc/nix-darwin

c MSG: a
	git commit -m "{{MSG}}"

r:
        nix repl --extra-experimental-features 'flakes' .#darwinConfigurations.jaign-mac

rh:
        nix repl --extra-experimental-features 'flakes' .#darwinConfigurations.jaign-mac.config.home-manager.users.jaign

sync:
        attic push default /nix/store/*

u:
        nix flake update nixpkgs nixpkgs-stable nixpkgs-unstable nixpkgs-master
        nix flake update nix-darwin home-manager nix-homebrew
        nix flake update nur cflake nix4nvchad nixvim 