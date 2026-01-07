

{
  description = "Tim's NixOS config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";

    dotfiles.url = "github:dblt-tim/tim-shell";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, dotfiles, ... }: {
    nixosConfigurations.snowflake = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./config/configuration.nix
        ./hosts/laptop.nix 
	dotfiles.nixosModules.dotfiles
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
