{ pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;

    userSettings = {}; # we'll see later
  };
}