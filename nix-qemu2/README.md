
# Make a Qemu VM with nixos

These scripts provision a qemu image with nixos on it 

The configuration.nix file is copied into the VM at /etc/nixos. In addition, anything in the nixos
folder is also copied.

modified from nix-qemu to bootstrap a more complete system
https://gist.github.com/tarnacious/f9674436fff0efeb4bb6585c79a3b9ff


# Usage

compile the image

    make

start a VM

    ./nixos-virtinstall.sh nixos2

Login to the VM on console (root with no password)

    nixos-generate-config
    nixos-rebuild switch
    passwd sig
    
    
