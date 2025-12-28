
{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./users/tim.nix

      ./boot.nix
      ./console.nix
      ./lang.nix
      ./time.nix
      ./keyboard.nix
      ./sound.nix
      ./packages.nix

      ./serial.nix
    ];

  networking.hostName = "snowflake"; # Define your hostname.

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.11"; # Did you read the comment?

}

