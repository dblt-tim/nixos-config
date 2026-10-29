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

      liberation_ttf
      carlito
      caladea
    ];

    fontconfig.defaultFonts = {
      sansSerif = [ "Inter" "Noto Sans" ];
      serif = [ "Noto Serif" ];
      monospace = [ "JetBrainsMono Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };
    fontconfig = {
      antialias = true;
      hinting = {
        enable = true;
        style = "slight"; # try "none" if glyphs look snapped or uneven at 1.25
      };
      subpixel = {
        rgba = "none";    # grayscale; see below
        lcdfilter = "default";
      };
    };
  };
}
