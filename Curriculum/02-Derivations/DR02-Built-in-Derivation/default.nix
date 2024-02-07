{pkgs}:
derivation {
  name = "Built-in-Derivation";
  system = builtins.currentSystem;
  builder = "${pkgs.bash}/bin/bash";
  args = [./builder.sh];
  inherit (pkgs) gcc;
  inherit (pkgs) coreutils;
  src = ./bar.c;
}
