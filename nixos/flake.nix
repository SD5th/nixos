{
  description = "NixOS configuration for mentomori";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";

    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.mentomori = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = {
        inherit inputs;
      };

      modules = [
        ./hardware-configuration.nix
        ./system-configuration.nix
        ({ inputs, ... }: {
          imports = [
            inputs.home-manager.nixosModules.home-manager
          ];

          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {
              inherit inputs;
            };
            backupFileExtension = "backup";
            users.sd5th = import ./packages-configuration.nix;
          };
        })
      ];
    };
  };
}
