{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wget
    curl
    htop
    sshfs
    firefox
    telegram-desktop
    spotify
    obsidian
    kdePackages.ktorrent
  ];
}
