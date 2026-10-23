{ ... }:

{
  boot.loader.limine = {
      enable = true;
  
      efiSupport = true;
  
      maxGenerations = 3;
      enableEditor = false;
  
      extraConfig = ''
        timeout: 3
      '';
    };
}