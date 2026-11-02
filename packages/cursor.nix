{ inputs, ... }:

let
  pkgs-master = import inputs.nixpkgs-master {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };
in
{
  home.packages = [
    pkgs-master.code-cursor
  ];
}
