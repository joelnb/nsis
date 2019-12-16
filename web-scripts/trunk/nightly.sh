#/bin/bash

#
# nightly build script
#   ran on drone.io
#
#   DEPRECATED

set -ex

# get zlib library
sudo apt-get -y install scons mingw32 mingw32-binutils zlib1g-dev libcppunit-dev
wget -O /tmp/zlib.zip "https://downloads.sourceforge.net/project/libpng/zlib/1.2.8/zlib128-dll.zip?r=&ts=1403402496&use_mirror=hivelocity"
mkdir /tmp/zlib
unzip /tmp/zlib.zip -d /tmp/zlib

# build
scons ZLIB_W32=/tmp/zlib SKIPUTILS="NSIS Menu" test dist-zip 2>&1 | tee build.log
