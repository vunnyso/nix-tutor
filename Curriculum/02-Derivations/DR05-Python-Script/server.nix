{ config, lib, pkgs, ... }:
let cfg = config.server;
in with lib; {
  options.server.enable = mkOption {
    default = false;
    type = types.bool;
    description = "Adding option to enable server";
  };

  config = mkIf cfg.enable {
    systemd.services.pythonServer = {
      description = "Running systemd service for server";
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        ExecStart =
          let python = pkgs.python3.withPackages (ps: with ps; [ flask ]);
          in "${python.interpreter} ${./server.py}";
      };
    };
  };
}

