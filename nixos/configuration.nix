{ config, lib, pkgs, ... }:

{
  # BootLoader: UEFI
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hostname
  networking.hostName = "mentomori";

  # Networking
  networking.networkmanager.enable = true;

  # Time zone
  time.timeZone = "Europe/Moscow";

  # Locale
  i18n.defaultLocale = "en_US.UTF-8";
  
  # Console keyboard layout
  console.keyMap = "us";
  
  # KDE Plasma 6
  services.xserver.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Login manager
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  
  # Audio: PipeWire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.sd5th = {
    isNormalUser = true;
    description = "SD5th";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  # Sudo
  security.sudo.enable = true;  

  # Firmware
  hardware.enableRedistributableFirmware = true;

  # Intel CPU microcode
  hardware.cpu.intel.updateMicrocode = true;

  # Nix flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Allow proprietary packages if needed
  nixpkgs.config.allowUnfree = true;
 
  # Basic utilities
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    curl
    pciutils
    usbutils
    htop
  ];

  # temp
  programs.firefox.enable = true;


  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}

