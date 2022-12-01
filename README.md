Test OpenCV build with various FFmpeg libraries.

Assuming following folder layout:
```
- opencv/
- videoio-ffmpeg-check/ (this project)
- - workspace/
- - ffmpeg/
- - scripts/
- - - build.sh
- - run.sh
- - download.sh
```

Instruction (run in current directory):
- `./download.sh` - download selected FFmpeg source archives to `ffmpeg/` directory
- `./run.sh` - build and run Docker container
- (in container) `/scripts/build.sh` - build each FFmpeg and OpenCV
