{
  description = "NixOS + nix-darwin dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }: {
    nixosConfigurations.poggy = nixpkgs.lib.nixosSystem {
      modules = [
        ./modules/cli.nix
          ./modules/desktop.nix
          ./modules/firefox.nix	
          ./hosts/nixos
      ];
    };

    darwinConfigurations.tbd = nix-darwin.lib.darwinSystem {
      modules = [ 
        ./modules/cli.nix
        ./modules/desktop.nix
        ./modules/firefox.nix
        ./hosts/mac
      ];
    };
  };
}
