

sudo virt-install --name=nixos \
--memory=8196 \
--vcpus=2 \
--disk /srv/libvirt/images/nixos.qcow2,device=disk,bus=virtio,size=16 \
--os-type=generic  \
--import \
--nographics \
--console pty,target_type=virtio

#--boot=uefi 
#--cdrom=/srv/libvirt/images/latest-nixos-minimal-x86_64-linux.iso 
