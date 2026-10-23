{ ... }:

{
  time.timeZone = "Europe/Paris";

  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_TIME = "fr_FR.UTF-8";
      LC_MONETARY = "fr_FR.UTF-8";
      LC_MEASUREMENT = "fr_FR.UTF-8";
      LC_PAPER = "fr_FR.UTF-8";
    };
  };

  services.xserver.xkb = {
    layout = "fr";
    variant = "";
  };

  console.useXkbConfig = true;
}