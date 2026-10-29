{ config, inputs, pkgs, ... }:
let
  astal = inputs.astal.packages.${pkgs.stdenv.hostPlatform.system};
  dots = "${config.home.homeDirectory}/.config/nixos/dotfiles";
in
{
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;
    extraPackages = (with astal; [
      apps
      battery
      bluetooth
      hyprland
      mpris
      network
      notifd
      powerprofiles
      tray
      wireplumber
    ]) ++ [ pkgs.libadwaita ];

  };

  xdg.configFile."ags".source = config.lib.file.mkOutOfStoreSymlink "${dots}/ags";
}