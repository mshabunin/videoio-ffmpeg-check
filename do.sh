#!/bin/bash

docker build -t ffmpeg-test .
docker run -it \
    -v `pwd`/ffmpeg:/ffmpeg:ro \
    -v `pwd`/opencv:/opencv:ro \
    -v `pwd`/scripts:/scripts \
    ffmpeg-test \
    /bin/bash
    # script -c ./do.sh
