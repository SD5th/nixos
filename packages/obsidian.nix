{ pkgs, ... }:

let
  # Electron only picks kioclient for KDE 3–5. Plasma 6 falls through to
  # `gio trash`, and gio is not on PATH, so system trash always fails.
  obsidian = pkgs.symlinkJoin {
    name = "obsidian";
    paths = [ pkgs.obsidian ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/obsidian --set ELECTRON_TRASH kioclient
    '';
  };
in
{
  home.packages = [ obsidian ];
}
