#!/bin/bash

cd build

rm -rf ton || true

git clone git://github.com/ton-blockchain/ton
cd ton

git submodule init
git submodule update

cp /workdir/tl/CMakeLists.txt /workdir/build/ton/tl/CMakeLists.txt
cp /workdir/example/android/CMakeLists.txt /workdir/build/ton/example/android/CMakeLists.txt
cp /workdir/example/android/native-lib.cpp /workdir/build/ton/example/android/native-lib.cpp

cd example/android

mkdir build

cd build

cmake ..
cmake ..

cmake --build . --target prepare_cross_compiling
cmake --build .
cmake --build . --target tl_generate_java
