Test OpenCV build with various FFmpeg libraries.

Instruction (in current directory):
1. `git clone opencv` -> checkout revision
2. `./download.sh` (create _ffmpeg_ subdirectory and download archives with FFmpeg and libav sources)
3. `./do.sh` (build docker image and run _bash_ in it, mount _ffmpeg_, _opencv_ and _scripts_ directories)
4. [in container] `script -c ./do.sh` (run _scripts/do.sh_ and record console to the file _scripts/typescript_)
5. Inspect _scripts/typescript_