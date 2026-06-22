{
  description = "Tim's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations.fw12 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./config/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            users.tim = import ./config/users/tim.home.nix;

            backupFileExtension = "backup";
          };
        }
      ];
    };
  };
}
