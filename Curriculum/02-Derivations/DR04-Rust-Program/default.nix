{
  lib,
  rustPlatform,
}: let
  manifest = (lib.importTOML ./Cargo.toml).package;
in
  rustPlatform.buildRustPackage rec {
    buildType = "release";
    pname = manifest.name;
    inherit (manifest) version;
    inherit (manifest) edition;
    src = ./.;

    cargoLock = {
      lockFile = ./Cargo.lock;
    };
  }
