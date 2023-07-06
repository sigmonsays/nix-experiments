{ config, pkgs, ... }:

{
  imports =
    [
      ./device.nix
      ./hardware-configuration.nix
    ];


  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";

  time.timeZone = "America/Los_Angeles";

  i18n.defaultLocale = "en_US.UTF-8";

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

  environment.systemPackages = import ./packages.nix pkgs;
  # environment.systemPackages = [
  # 	vim
  # ];

  virtualisation.docker.enable = true;

  services.openssh.enable = true;

  networking.firewall.enable = false;

  system.stateVersion = "23.11";
}
