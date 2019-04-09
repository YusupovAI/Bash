#!/bin/bash

tar -xf src.tar
LD_LIBRARY_PATH=./bin-final/lib ./bin-final/bin/Facade
