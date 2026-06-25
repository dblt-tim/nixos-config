{
  description = "Tim's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs"; # share nixpkgs to avoid duplication
    };
    
    astal ={
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.astal.follows = "astal";
    };
  };

  outputs = { self, nixpkgs, home-manager, ags, astal, ... }@inputs: {
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
            sharedModules    = [ inputs.ags.homeManagerModules.default ];
          };
        }
      ];
    };
  };
}
