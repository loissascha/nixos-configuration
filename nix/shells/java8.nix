with import <nixpkgs> {};

mkShell {
  name = "java8";
  packages = [
    jdk8
  ];
}
