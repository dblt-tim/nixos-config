

{
  description = "Tim's NixOS config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations.snowflake = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./config/configuration.nix
        ./hosts/laptop.nix 
        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            users.tim = import ./config/users/home.tim.nix;
            backupFileExtension = "backup";
          };
        }
      ];
    };
  };  
}
