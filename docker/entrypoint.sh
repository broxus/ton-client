#!/bin/bash


if [ -z "$1"} ]; 
then echo "Enter TON git url."; exit; 
fi

echo
echo "TON will be pulled from $1"

if [ -n "$2"} ]; 
then echo "Commit is $2"; 
fi

echo


cd build

rm -rf ton || true

git clone $1 ton

cd ton

if [ -n "$2"} ]; 
then git checkout $2;
fi




git submodule init
git submodule update

cp /workdir/tl/CMakeLists.txt /workdir/build/ton/tl/CMakeLists.txt
cp /workdir/example/android/CMakeLists.txt /workdir/build/ton/example/android/CMakeLists.txt
cp /workdir/example/android/native-lib.cpp /workdir/build/ton/example/android/native-lib.cpp

cd example/android

mkdir build

cd build

cmake ..


cmake --build . --target prepare_cross_compiling
cmake --build .
cmake --build . --target tl_generate_java
