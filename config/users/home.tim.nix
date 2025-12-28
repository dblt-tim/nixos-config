{ config, pkgs, ... }:

{
  home.username = "tim";

  home.homeDirectory = "/home/tim";

  home.packages = with pkgs; [
    git
  ];

  home.stateVersion = "25.11";
}
