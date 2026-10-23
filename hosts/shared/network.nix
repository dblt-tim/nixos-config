{ ... }:

{
  networking = {
    networkmanager.enable = true;

    firewall = {
      enable = true;
      # allowedTCPPorts = [ ];
      # allowedUDPPorts = [ ];
    };
  };

  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNSSEC = "allow-downgrade";
      DNSOverTLS = "opportunistic";
    };
    
  };
}