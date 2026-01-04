
{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./users/tim.nix

      ./core/boot.nix
      ./core/console.nix
      ./core/lang.nix
      ./core/time.nix
      ./core/keyboard.nix
      ./core/sound.nix
      ./core/network.nix
      ./packages.nix
    ];

  networking.hostName = "snowflake"; # Define your hostname.

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.11"; # Did you read the comment?

}

