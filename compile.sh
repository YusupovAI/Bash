#!/bin/bash
git clone https://github.com/raspberrypi/tools
git clone https://github.com/akhtyamovpavel/PatternsCollection
cd PatternsCollection
mkdir build
cd build
DON_PI=ON
DPATH="../../tools/arm-bcm2708/arm-linux-gnueabihf/bin"
PATH=${PATH}:$DPATH
DSYSROOT="../../tools/arm-bcm2708/arm-bcm2708hardfp-linux-gnueabi/arm-bcm2708hardfp-linux-gnueabi/sysroot"
PREFIX="../../bin-final"
#cd $DPATH
cmake "-DON_PI=$DON_PI" "-DSYSROOT=$DSYSROOT" "-DCMAKE_INSTALL_PREFIX=$PREFIX"  ".."
make 
make install
cd ..
rm -rf bin-arm build lib-arm
tar-cf bin-final src.tar
