
sudo apt-get update -y
apt-get install docker.io -y
sudo apt-get install qemu-utils -y

tar -xvf analysis-image.ova
qemu-img convert -O raw analysis-image-disk001.vmdk analysis-image-disk001.raw
parted -s analysis-image-disk001.raw b print
mkdir /mnt/container
mount -o loop,ro,offset=1045876 analysis-image-disk001.raw /mnt/container
ls /mnt/container
