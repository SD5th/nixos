let
  flclashx = builtins.getFlake "github:devmoded/flclashx-flake/ec7de2a2765d44793f74fdb03c311da9f926dff1";
in
{
  home.packages = [
    (flclashx.packages.x86_64-linux.flclashx.override {
      waylandBackend = true;
    })
  ];
}
