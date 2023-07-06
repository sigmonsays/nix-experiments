{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.modules.nfsdata;
in {
  options.modules.nfsdata = {
    enable = mkEnableOption "nfs /data mount";
  };

  config = mkIf cfg.enable {
    fileSystems."/data" = {
      device = "172.16.0.99:/volume1/data";
      fsType = "nfs";
      #options = [ "nfsvers=4.2" ];
  };

  };
}
