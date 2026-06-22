{ config, pkgs, ... }:

{
  home.username = "tim";
  home.homeDirectory = "/home/tim";

  programs.git.enable = true;
  

  home.stateVersion = "26.05"; 
}
