{ lib, ... }:

let
  names = builtins.attrNames (builtins.readDir ./system);
  nixFiles = builtins.filter (name: lib.hasSuffix ".nix" name) names;
in
{
  imports = map (name: ./system + "/${name}") nixFiles;

  # First NixOS version installed on this machine. Do not change after the initial install.
  system.stateVersion = "26.05";
}
