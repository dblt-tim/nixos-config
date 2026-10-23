{ inputs, pkgs, ... }:

{
  imports = [ ];

  home.packages = with pkgs; [
    libreoffice
    marker
    texworks
    texliveFull
    nautilus
    firefox
  ];
}