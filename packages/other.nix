{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wget
    curl
    htop
    firefox
  ];
}
