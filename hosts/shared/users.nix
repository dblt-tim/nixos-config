{ lib, pkgs, users, ... }:

{
  programs.fish.enable = true;

  users.users = lib.genAttrs users (name: {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "wheel" # sudo
      "networkmanager" # network
      "video"
      "audio"
    ];
  });
}