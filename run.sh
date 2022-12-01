#!/bin/bash

mkdir -p workspace

docker build -t ffmpeg-test .
docker run -it \
    -u $(id -u):$(id -g) \
    -v `pwd`/ffmpeg:/ffmpeg:ro \
    -v `pwd`/../opencv:/opencv:ro \
    -v `pwd`/scripts:/scripts:ro \
    -v `pwd`/workspace:/workspace \
    ffmpeg-test \
    /bin/bash
    # script -c ./do.sh
