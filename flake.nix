{
  description = "Tim's NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.astal.follows = "astal";
    };
  };

  outputs = { self, nixpkgs, home-manager, ...}@inputs:
  let
    lib = nixpkgs.lib;

    mkHost = { hostname, system ? "x86_64-linux", users}:
      lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs hostname users; };
        modules = [
          ./hosts/shared
          ./hosts/${hostname}
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              users = lib.genAttrs users (user: import ./home/${user});
            };
          }
        ];
      };

    systems = [ "x86_64-linux" ];

    forAllSystems = f: lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});

  in
  {
    nixosConfigurations = {
      fw12 = mkHost {
        hostname = "fw12";
        users = [ "tim" ];
      };
    };

    formatter = forAllSystems (pkgs: pkgs.nixfmt);
  };
}