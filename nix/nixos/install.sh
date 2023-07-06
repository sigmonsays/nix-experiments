#!/usr/bin/env bash

# Host name to setup config for
host="$1"

if [ -z "$host" ] ; then
	"Usage: $0 host"
	exit 1
fi


cp -v $host.nix /etc/nixos/configuration.nix
cp packages.nix /etc/nixos/
mkdir -pv /etc/nixos/{pkgs,modules}
rsync -ar --delete ../pkgs/ /etc/nixos/pkgs/
rsync -ar --delete ./modules/ /etc/nixos/modules/
