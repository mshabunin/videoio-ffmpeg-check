#!/bin/bash

mkdir -p ffmpeg && pushd ffmpeg

wget \
    https://ffmpeg.org/releases/ffmpeg-4.3.1.tar.xz \
    https://ffmpeg.org/releases/ffmpeg-4.2.4.tar.xz \
    https://ffmpeg.org/releases/ffmpeg-4.1.6.tar.xz \
    https://ffmpeg.org/releases/ffmpeg-4.0.6.tar.xz \
    https://ffmpeg.org/releases/ffmpeg-3.4.8.tar.xz \
    https://ffmpeg.org/releases/ffmpeg-3.2.15.tar.xz \
    https://ffmpeg.org/releases/ffmpeg-2.8.17.tar.xz \
    https://ffmpeg.org/releases/ffmpeg-3.3.9.tar.xz \
    https://ffmpeg.org/releases/ffmpeg-3.1.11.tar.xz \
    https://ffmpeg.org/releases/ffmpeg-3.0.12.tar.xz \
    https://ffmpeg.org/releases/ffmpeg-2.7.7.tar.xz \
    https://ffmpeg.org/releases/ffmpeg-2.6.9.tar.xz \
    https://ffmpeg.org/releases/ffmpeg-2.5.11.tar.xz \
    https://ffmpeg.org/releases/ffmpeg-2.4.14.tar.bz2 \
    https://ffmpeg.org/releases/ffmpeg-2.3.6.tar.bz2 \
    https://ffmpeg.org/releases/ffmpeg-2.2.16.tar.bz2 \
    https://ffmpeg.org/releases/ffmpeg-2.1.8.tar.bz2 \
    https://ffmpeg.org/releases/ffmpeg-2.0.7.tar.bz2 \
    https://ffmpeg.org/releases/ffmpeg-1.2.12.tar.bz2 \
    https://ffmpeg.org/releases/ffmpeg-1.1.16.tar.bz2

wget\
    https://libav.org/releases/libav-9.21.tar.xz \
    https://libav.org/releases/libav-11.12.tar.xz \
    https://libav.org/releases/libav-12.3.tar.xz

popd
