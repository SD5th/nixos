{
  description = "NixOS configuration for mentomori";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";

    flclashx.url = "github:devmoded/flclashx-flake";
  };

  outputs = {self, nixpkgs, ... }@inputs: {
    nixosConfigurations.mentomori = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = {
        inherit inputs;
      };

      modules = [
        ./hardware-configuration.nix
        ./configuration.nix

        ./modules/flclashx.nix
      ];
    };
  };
}
