#!/bin/bash

set -exu

mkdir -p workspace

tag=ffmpeg-test
docker build -t ${tag} -f Dockerfile .
docker run -it \
    -u $(id -u):$(id -g) \
    -v `pwd`/ffmpeg:/ffmpeg:ro \
    -v `pwd`/../opencv:/opencv:ro \
    -v `pwd`/../opencv_extra:/opencv_extra:ro \
    -v `pwd`/scripts:/scripts:ro \
    -v `pwd`/workspace:/workspace \
    ${tag} \
    /bin/bash -c /scripts/build.sh
    # /bin/bash
