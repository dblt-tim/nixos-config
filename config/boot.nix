{ pkgs, ... }:

{
  boot.loader = {
    efi.canTouchEfiVariables = true;

    limine = {
      enable = true;

      efiSupport = true;
      maxGenerations = 5;

      secureBoot = {
        enable = true;
        sbctl = pkgs.sbctl;
      };
    };
  };
}
