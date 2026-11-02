{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.xserver.excludePackages = [
    pkgs.xterm
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    discover
    qrca
  ];
}
