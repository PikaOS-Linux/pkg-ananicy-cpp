#! /bin/bash

DEBIAN_FRONTEND=noninteractive

# Clone Upstream
git clone https://gitlab.com/ananicy-cpp/ananicy-cpp.git
cd ananicy-cpp
cp -rvf ../debian ./

# Remove weird path from the systemd file due to our prefix overiding
sed -e s/@CMAKE_INSTALL_PREFIX@/usr/g -i ananicy-cpp.service

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
