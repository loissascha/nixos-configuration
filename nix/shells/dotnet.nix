with import <nixpkgs> {};

mkShell {
  name = "dotnet-env";
  packages = [
    (with dotnetCorePackages; combinePackages [
	sdk_6_0
	sdk_7_0
	sdk_8_0
    ])
  ];
  LD_LIBRARY_PATH = lib.makeLibraryPath [ pkgs.stdenv.cc.cc ];
  shellHook = ''
    export ConnectionStrings__PiANetConnection="server=localhost;port=30306;database=pianet;user=root;password=root";
    export CRONJOB_SERVER=0;
  '';
}
