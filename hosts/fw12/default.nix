{ hostname, ... }:

{
  imports = [ ./hardware.nix ];

  networking.hostName = hostname;
}