{
  users.users.sd5th = {
    isNormalUser = true;
    description = "SD5th";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  security.sudo.enable = true;
}
