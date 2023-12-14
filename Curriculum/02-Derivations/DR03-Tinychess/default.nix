{pkgs ? import <nixpkgs> {}}:
pkgs.stdenv.mkDerivation {
  name = "Tinychess";

  src = pkgs.fetchgit {
    url = "https://github.com/zwegner/tinychess.git";
    rev = "5a3395a";
    sha256 = "sha256-sTQr8n72P4EQ8pvMpZzUAzFIWqUpoG8CduHllLo8LGA=";
  };

  buildPhase = ''
    gcc -o tinychess tinychess.c
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp tinychess $out/bin
  '';

  meta = with pkgs.lib; {
    description = "TinyChess: A chess engine in less than 1,000 lines of C";
    license = licenses.mit;
  };
}