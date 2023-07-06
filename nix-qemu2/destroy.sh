#!/usr/bin/env sh

name="$1"

virsh destroy $name
virsh undefine $name
rm -f /srv/libvirt/images/$name.qcow2
