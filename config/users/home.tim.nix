{ config, pkgs, ... }:

{
  home.username = "tim";

  home.homeDirectory = "/home/tim";

  home.packages = with pkgs; [
    git
    firefox
  ];

  home.stateVersion = "25.11";
}
