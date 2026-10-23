{ inputs, lib, ... }:

{
  imports = [
    ./users.nix
    ./boot.nix
    ./locale.nix
    ./network.nix
    ./bluetooth.nix
    ./audio.nix
    ./fonts.nix
    ./power.nix
    ./desktop.nix
    ./display-manager.nix
    ./packages.nix
    ./services.nix
  ];

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];

      trusted-users = [ "root" "@wheel" ];

      auto-optimise-store = true;

      warn-dirty = false;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };

    registry.nixpkgs.flake = inputs.nixpkgs;
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "26.05";
}