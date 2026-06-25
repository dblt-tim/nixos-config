{ config, pkgs, lib, inputs, ... }:

let
  nixosConfig = "/home/tim/.config/nixos";
in
{
  home.username = "tim";
  home.homeDirectory = "/home/tim";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    firefox
    eza
    kitty
    zed-editor
  ] ++ (with inputs.astal.packages.${pkgs.system}; [
    notifd
  ]);


  programs.git = {
    enable = true;
    userName = "dblt-tim";
    userEmail = "timeodiebolt@gmail.com";

    extraConfig = {
      pull.rebase = true;
      init.defaultBranch = "main";
    };
    delta.enable = true;
  };

  programs.fish = {
    enable = true;

    shellAliases = {
      ls = "eza -l --icons";
    };

    interactiveShellInit = ''
      set -g fish_greeting ""
    '';
  };
  
  programs.ags = {
    enable = true;

    configDir = null; # we manage it manually

    extraPackages = with inputs.astal.packages.${pkgs.system}; [
      battery
      network
      bluetooth
      tray
      mpris
      notifd
    ];
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    settings = lib.mkForce {};
    extraConfig = lib.mkForce "";
  };
  xdg.configFile."hypr/hyprland.lua" = lib.mkForce {
    source = 
      config.lib.file.mkOutOfStoreSymlink "${nixosConfig}/home/tim/hypr/hyprland.lua";
  };

  programs.home-manager.enable = true;
}
