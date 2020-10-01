#!/bin/bash

for ARGUMENT in "$@"
do
    key=$(echo "$ARGUMENT" | cut -f1 -d=)
    value=$(echo "$ARGUMENT" | cut -f2 -d=)   

    case "$key" in
        url)            url=${value} ;;
        commit)         commit=${value} ;;
        threads)        threads=${value} ;;
        *)
    esac
done

if [ -z "$url" ]; 
then echo "Enter TON git url."; exit 1; 
fi

echo
echo "TON will be pulled from $url"
if [ -n "$commit" ]; 
then echo "Commit is $commit"; 
fi
echo

cd build

rm -rf ton || true

git clone "$url" ton

cd ton

if [ -n "$commit" ]; 
then git checkout "$commit";
fi

if [ -n "$threads" ];
then make_flags="-- -j$threads"
fi

git submodule init
git submodule update third-party/crc32c

mkdir build
cd build

cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DTON_USE_ROCKSDB=OFF \
    -DTON_USE_ABSEIL=OFF \
    -DTON_BUILD_NATIVE_LIB=ON \
    -DTON_ONLY_TONLIB=ON \
    -DTON_ARCH="" \
    .. \
    || exit 1

cmake --build . --target prepare_cross_compiling $make_flags
cmake --build . --target native-lib $make_flags
cmake --build . --target tl_generate_java $make_flags
