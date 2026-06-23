{ config, pkgs, inputs, ... }:

{
  imports = [ ../shared.nix ./hardware.nix];

  networking.hostName = "nixy";
}
