
sudo apt-get update -y
apt-get install docker.io -y
sudo apt-get install qemu-utils -y
sudo apt-get install kpartx -y

tar -xvf analysis-image.ova
qemu-img convert -O raw analysis-image-disk001.vmdk analysis-image-disk001.raw
sudo fdisk -l analysis-image-disk001.raw
mkdir /mnt/container
losetup /dev/loop0 analysis-image-disk001.raw   
kpartx -a /dev/loop0   
mount /dev/mapper/loop0p1 /mnt/container

ls /mnt/container
tar -C /mnt/container -czf image.tar.gz .
docker import image.tar.gz demotest:1.0
docker image list
docker run -i -t 891dcfcad752 /bin/bash
