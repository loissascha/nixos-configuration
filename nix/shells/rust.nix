with import <nixpkgs> {};

mkShell {
  name = "rust-env";
  packages = [ ];
  LD_LIBRARY_PATH = "$LD_LIBRARY_PATH:${ with pkgs; lib.makeLibraryPath [
    wayland
    libxkbcommon
    fontconfig
] }";
  shellHook = ''
    export ConnectionStrings__PiANetConnection="server=localhost;port=30306;database=pianet;user=root;password=root"
  '';
}
