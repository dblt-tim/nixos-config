{ inputs, pkgs, ... }:

{
  imports = [ ];

  home.packages = with pkgs; [
    libreoffice-fresh
    marker
    texworks
    texliveFull
    nautilus
    firefox
  ];
}