{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    pciutils
    usbutils
  ];

  programs.nano.enable = false;
  documentation.nixos.enable = false;
}
