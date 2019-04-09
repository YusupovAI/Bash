#!/bin/bash
sudo apt install libboost-dev
sudo apt install libssl-dev
sudo apt install libcurl4-openssl-dev
sudo apt install libcurl4-gnutls-dev
sudo apt install libgnutls28-dev
sudo apt install doxygen
sudo apt install libgsasl7-dev
sudo apt install sendmail

git clone https://github.com/akhtyamovpavel/PatternsCollection
cp config.ini ./PatternsCollection/Decorator/cpp-source/configs/config.ini

cd PatternsCollection
mkdir build
cd build
cmake ..
make
