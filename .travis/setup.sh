#!/bin/bash

sudo apt-get -qq update && sudo apt-get -qq install -y wget git \
                                                    build-essential \
                                                    squashfs-tools \
                                                    libtool \
                                                    autotools-dev \
                                                    libarchive-dev \
                                                    automake \
                                                    autoconf \
                                                    uuid-dev \
                                                    libssl-dev


sudo sed -i -e 's/^Defaults\tsecure_path.*$//' /etc/sudoers

# Check Python

echo "Python Version:"
python --version
pip -q install sregistry[all]
sregistry version

echo "sregistry Version:"

# Install Singularity

cd /tmp && \
    git clone -b vault/release-2.4 https://www.github.com/sylabs/singularity.git
    cd singularity && \
    ./autogen.sh > /dev/null && \
    ./configure --prefix=/usr/local > /dev/null && \
    make > /dev/null && sudo make install > /dev/null
