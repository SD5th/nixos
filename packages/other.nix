{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wget
    curl
    htop
    firefox
    telegram-desktop
    spotify
  ];
}
