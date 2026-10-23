{ config, pkgs, ... }:

let
  dots = "${config.home.homeDirectory}/.config/nixos/dotfiles";

in
{
  xdg.configFile."hypr".source = config.lib.file.mkOutOfStoreSymlink "${dots}/hypr";

  home.packages = with pkgs; [
    wl-clipboard
    cliphist
    grim
    slurp
    brightnessctl
  ];
}