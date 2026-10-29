{ inputs, pkgs, ... }:

{
  imports = [ ];

  home.packages = with pkgs; [
    onlyoffice-desktopeditors
    marker
    texworks
    texliveFull
    nautilus
    firefox
  ];
}
