
name="$1"
[ -z "$name" ] && {
	echo "Usage: $0 name"
	exit 1
}

image=/srv/libvirt/images/$name.qcow2
sudo cp -vi --sparse always nixos.qcow2 $image
sudo chmod 0644 $image

sudo virt-install --name=$name \
--memory=8196 \
--vcpus=2 \
--disk $image,device=disk,bus=virtio,size=16 \
--os-type=generic  \
--import \
--nographics \
--console pty,target_type=virtio

#--boot=uefi 
#--cdrom=/srv/libvirt/images/latest-nixos-minimal-x86_64-linux.iso 
