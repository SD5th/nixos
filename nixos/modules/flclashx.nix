{ inputs, ... }:

{
  imports = [
    inputs.flclashx.nixosModules.default
  ];

  programs.flclashx = {
    enable = true;
    tunMode.enable = true;
    wayland.enable = true;
  };
}
