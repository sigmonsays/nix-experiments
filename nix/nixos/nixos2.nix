# device specific configuration - nixos2.lan
{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/emacs
      ./modules/myuser
      ./modules/common
      ./modules/nfsdata
      ./modules/syncthing
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
	networking.hostName = "nixos2";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  #nixpkgs.config.allowUnfree = true;
  modules.common.enable = true;
  modules.myuser.enable = true;
  modules.emacs.enable = true;
  modules.nfsdata.enable = true;
  modules.syncthing.enable = true;

  programs.autojump.enable = true;

  environment.systemPackages = import ./packages.nix pkgs;

  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";

  virtualisation.docker.enable = true;
  networking.firewall.enable = false;
  services.openssh.enable = true;

  system.stateVersion = "23.11";
}
