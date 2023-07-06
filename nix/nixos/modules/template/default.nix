{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.modules.template;
in {
  options.modules.template = {
    enable = mkEnableOption "template things";
  };

  config = mkIf cfg.enable {

    environment.systemPackages = with pkgs; [
      template
    ];

  };
}
