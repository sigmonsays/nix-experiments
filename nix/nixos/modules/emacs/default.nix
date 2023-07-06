{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.modules.emacs;
in {
  options.modules.emacs = {
    enable = mkEnableOption "emacs editor";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      emacsNativeComp
      ripgrep

      binutils
      git

      fd
      imagemagick
      zstd
      sqlite
      age
    ];

  };
}
