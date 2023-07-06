{ config, lib, pkgs, ... }:

with lib;

let
    vmfile = { source, target}:
      {
        source = source;
        target = target;
        mode = "0644";
        user = "root";
        group = "root";
      };
in {
  imports =
    [ 
      <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
      ./machine-config.nix
    ];

    system.build.qcow2 = import <nixpkgs/nixos/lib/make-disk-image.nix> {
        inherit lib config;
        pkgs = import <nixpkgs> { inherit (pkgs) system; }; # ensure we use the regular qemu-kvm package
        # Size in MB
        diskSize = 1024 * 40;
        format = "qcow2";
        contents = [
            # {source, target, mode, user, group}
            # { source = ./nixos/device.nix;
            #   target = "/etc/nixos/device.nix";
            #   mode = "0644";
            #   user = "root";
            #   group = "root";
            # }
            ( vmfile {
                source = ./nixos/device.nix;
                target = "/etc/nixos/device.nix";
            } )
            ( vmfile {
                source = ./nixos/packages.nix;
                target = "/etc/nixos/packages.nix";
            } )
        ];
        configFile = pkgs.writeText "configuration.nix"
        (builtins.readFile ./configuration.nix);
    };
}
