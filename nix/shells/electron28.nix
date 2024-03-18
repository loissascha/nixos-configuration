with import <nixpkgs> {};

mkShell {
  name = "electron28-env";
  packages = [ ];
  LD_LIBRARY_PATH = "$LD_LIBRARY_PATH:${ with pkgs; lib.makeLibraryPath [
    electron_28
] }";
}
