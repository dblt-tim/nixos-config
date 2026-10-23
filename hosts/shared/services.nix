{ ... }:

{
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.sddm.enableGnomeKeyring = true;

  services.gvfs.enable = true;

  services.udisks2.enable = true;

  services.tumbler.enable = true;

  services.printing.enable = true;

  services.fstrim.enable = true;
}