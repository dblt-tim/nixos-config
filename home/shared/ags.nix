{ config, inputs, pkgs, ... }:

let
  dots = "${config.home.homeDirectory}/.config/nixos/dotfiles";
  astal = inputs.astal.packages.${pkgs.stdenv.hostPlatform.system};

in
{
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;

    extraPackages = with astal; [
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
    ];

    systemd.enable = true;
  };

  xdg.configFile."ags".source = config.lib.file.mkOutOfStoreSymlink "${dots}/ags";
}