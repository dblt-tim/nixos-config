{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    gh

    curl
    wget
    vim
    unzip
    zip
    file
    tree
    jq

    ripgrep
    fd
    btop

    pciutils
    usbutils
  ];
}