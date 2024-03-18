with import <nixpkgs> {};

mkShell {
  name = "java17";
  packages = [
    jdk17
  ];
}
