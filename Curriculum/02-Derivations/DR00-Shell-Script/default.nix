{
  stdenv,
  pkgs,
}: let
  nix-tutor-script = pkgs.writeShellScriptBin "hello-nix-tutor" ''
    echo "Hello, Nix Tutor!"
  '';
in
  stdenv.mkDerivation {
    name = "shell-script";
    src = ./.;
    installPhase = ''
      mkdir -p $out/bin
      cp ${nix-tutor-script}/bin/hello-nix-tutor $out/bin
    '';
  }
