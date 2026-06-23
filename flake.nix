{
  description = "Tim's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs"; # share nixpkgs to avoid duplication
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.fw12 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; }; # pass inputs to modules
      modules = [
        ./hosts/fw12
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true; # use system nixpkgs
            useUserPackages = true; # install to /etc/profiles

            users.tim = import ./home/tim;

            extraSpecialArgs = { inherit inputs; };
          };
        }
      ];
    };
  };
}
