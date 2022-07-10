
sudo apt-get update -y
sudo apt-get install qemu-utils -y

tar -xvf analysis-image.ova
qemu-img convert -O raw analysis-image-disk001.vmdk analysis-image-disk001.raw
