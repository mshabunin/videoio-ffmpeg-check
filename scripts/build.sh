#!/bin/bash

set -ex

export OPENCV_DOWNLOAD_PATH=/workspace/dlcache
export CCACHE_DIR=/workspace/ccache
export PATH=/usr/lib/ccache:${PATH}

build_ffmpeg()
{
    [ -d /workspace/${FFMPEG} ] && return
    pushd /workspace
    tar -xf /ffmpeg/${FFMPEG}.tar.bz2 || tar -xf /ffmpeg/${FFMPEG}.tar.xz
    pushd ${FFMPEG}
    ./configure --enable-shared --disable-static --enable-avresample --disable-programs --prefix=`pwd`/install || ./configure --enable-shared --disable-static --disable-programs --prefix=`pwd`/install
    make -j12 install
    popd
    popd
}

build_opencv()
{
    mkdir -p /workspace/build-opencv
    pushd /workspace/build-opencv && rm -rf *
    PKG_CONFIG_PATH=/workspace/${FFMPEG}/install/lib/pkgconfig \
    cmake \
        -GNinja \
        -DOPENCV_FFMPEG_ENABLE_LIBAVDEVICE=ON \
        /opencv
    grep -q 'WITH_FFMPEG:BOOL=ON' CMakeCache.txt
    grep -q 'FFMPEG_FOUND:INTERNAL=1' CMakeCache.txt
    ninja opencv_test_videoio
    popd
}

for FFMPEG in /ffmpeg/* ; do
    FFMPEG=$(basename -- "${FFMPEG}")
    FFMPEG=${FFMPEG/\.tar\.xz/}
    FFMPEG=${FFMPEG/\.tar\.bz2/}
    echo "=== BEGIN: ${FFMPEG}"
    build_ffmpeg
    build_opencv
    echo "=== END: ${FFMPEG}"
done
