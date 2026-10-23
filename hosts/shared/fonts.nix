{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      inter
      nerd-fonts.jetbrains-mono
      font-awesome

      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji

      liberation-ttf
      carlito
      caladea
    ];

    fontconfig.defaultFonts = {
      sansSerif = [ "Inter" "Noto Sans" ];
      serif = [ "Noto Serif" ];
      monospace = [ "JetBrainsMono Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}