{
  description = "NixOS configuration for mentomori";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs = {self, nixpkgs, ... }@inputs: {
    nixosConfigurations.mentomori = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./hardware-configuration.nix
        ./configuration.nix
      ];
    };
  };
}
