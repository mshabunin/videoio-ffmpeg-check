#!/bin/bash

set -e

mkdir -p /opt/cache
mkdir -p /opt/ffmpeg
mkdir -p /opt/opencv

export OPENCV_DOWNLOAD_PATH=/opt/cache

build_ffmpeg()
{
    pushd /opt/ffmpeg
    tar -xf /ffmpeg/${FFMPEG}.tar.bz2 || tar -xf /ffmpeg/${FFMPEG}.tar.xz
    pushd ${FFMPEG}
    ./configure --enable-shared --disable-static --enable-avresample --disable-programs --prefix=`pwd`/install
    make -j8 install
    popd
    popd
}

build_opencv()
{
    pushd /opt/opencv
    rm -rf *
    PKG_CONFIG_PATH=/opt/ffmpeg/${FFMPEG}/install/lib/pkgconfig \
    cmake \
        -GNinja \
        -DBUILD_LIST=videoio \
        /opencv
    grep -q 'WITH_FFMPEG:BOOL=ON' CMakeCache.txt
    ninja opencv_videoio
    popd
}

for FFMPEG in /ffmpeg/* ; do
    FFMPEG=$(basename -- "${FFMPEG}")
    FFMPEG=${FFMPEG/\.tar\.xz/}
    FFMPEG=${FFMPEG/\.tar\.bz2/}
    echo "=== BEGIN: ${FFMPEG}"
    build_ffmpeg
    build_opencv || true
    echo "=== END: ${FFMPEG}"
done
