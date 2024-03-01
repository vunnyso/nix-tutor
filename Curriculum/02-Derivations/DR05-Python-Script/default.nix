with import <nixpkgs> { };
pkgs.stdenv.mkDerivation {
  name = "server";
  src = ./server.py;
  propogatedBuildInputs = with pkgs.python3Packages; [ flask ];
  dontUnpack = true;
  installPhase = ''
    install -Dm755 ${./server.py} $out/bin/server
  '';
}
