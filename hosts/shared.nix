{ config, pkgs, inputs, ... }:

{
  boot.loader.limine = {
    enable = true;

    efiSupport = true;

    maxGenerations = 3;
    enableEditor = false;

    extraConfig = ''
      timeout: 3
    '';
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  programs.hyprland.enable = true;

  time.timeZone = "Europe/Paris";

  i18n.defaultLocale = "fr_FR.UTF-8";

  networking.networkmanager.enable = true;

  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  services.xserver.xkb.layout = "fr";
  services.xserver.xkb.options = "eurosign:e,caps:escape";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  
  users.users.tim = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.fish;
  };
  programs.fish.enable = true;


  environment.systemPackages = with pkgs; [
    git
    vim
    gh
  ];

  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
  ];

  environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05";
}
