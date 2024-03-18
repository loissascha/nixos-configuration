with import <nixpkgs> {};

mkShell {
  buildInputs = with pkgs; [ dotnet-sdk ];
  shellHook = ''
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${
      with pkgs;
      lib.makeLibraryPath [ libGL xorg.libX11 xorg.libXi xorg.libXcursor xorg.libXext xorg.libXrandr 
	xorg.libXinerama libxkbcommon  ]
    }"
  '';
}
