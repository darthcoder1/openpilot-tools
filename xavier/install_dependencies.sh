#!/bin/bash

# core tools
sudo apt install -y git curl python-pip
sudo pip install -y --upgrade pip>=18.0 pipenv

# ffmpeg
sudo apt install -y ffmpeg libavformat-dev libavcodec-dev libavdevice-dev libavutil-dev libswscale-dev libavresample-dev libavfilter-dev

# build tools
sudo apt install -y autoconf automake clang clang-3.9 libtool pkg-config build-essential

# libarchive
sudo apt install -y libarchive-dev

# qt python bindings
sudo apt install -y python-qt4

# zmq
curl -LO https://github.com/zeromq/libzmq/releases/download/v4.2.3/zeromq-4.2.3.tar.gz
tar xfz zeromq-4.2.3.tar.gz
cd zeromq-4.2.3
./autogen.sh
./configure CPPFLAGS=-DPIC CFLAGS=-fPIC CXXFLAGS=-fPIC LDFLAGS=-fPIC --disable-shared --enable-static
make
sudo make install
