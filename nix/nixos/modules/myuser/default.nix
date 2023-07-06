{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.modules.myuser;
in {
  options.modules.myuser = {
    enable = mkEnableOption "basic user";
  };

  config = mkIf cfg.enable {
    users.users.sig = {
      isNormalUser = true;
      extraGroups = [ "wheel" "docker" ];
      packages = with pkgs; [
        tree
      ];
    };

    security.sudo.extraRules = [
      {
        users = [ "sig" ];
        commands = [
          {
            command = "ALL";
            options = [ "SETENV" "NOPASSWD" ];
          }
        ];
      }
    ];

  };
}
