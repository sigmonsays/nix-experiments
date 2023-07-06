{ config, pkgs, ... }:
{
  imports =
    [
      ./device.nix
      ./hardware-configuration.nix
      ./modules/emacs
      ./modules/myuser
    ];


  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  #nixpkgs.config.allowUnfree = true;
  modules.emacs.enable = true;
  modules.myuser.enable = true;

  environment.systemPackages = import ./packages.nix pkgs;


  time.timeZone = "America/Los_Angeles";

  i18n.defaultLocale = "en_US.UTF-8";
  virtualisation.docker.enable = true;
  services.openssh.enable = true;
  networking.firewall.enable = false;

  system.stateVersion = "23.11";
}
