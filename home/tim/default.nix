
{
  imports = [
    ./shell.nix
    ./git.nix
    ./editor.nix
    
    ../shared
  ];
  
  home = {
    username = "tim";
    homeDirectory = "/home/tim";
    stateVersion = "26.05";
  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}