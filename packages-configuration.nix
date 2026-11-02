{ lib, ... }:

let
  names = builtins.attrNames (builtins.readDir ./packages);
  nixFiles = builtins.filter (name: lib.hasSuffix ".nix" name) names;
in
{
  imports = map (name: ./packages + "/${name}") nixFiles;

  home.username = "sd5th";
  home.homeDirectory = "/home/sd5th";
  home.stateVersion = "26.05";
}
