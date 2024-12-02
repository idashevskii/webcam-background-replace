#!/bin/bash
set -e
cd "$(dirname "${BASH_SOURCE[0]}")/"

if lsmod | grep -w v4l2loopback >/dev/null 2>/dev/null; then
    echo "[INFO] Module found"
else
    echo "[ERROR] Run android camera script first"
    exit -1
fi

source .venv/bin/activate

lfbw --width 640 --height 480 --fps 30 -w /dev/video0 \
    --threshold 80 \
    --no-postprocess \
    --no-foreground \
    --select-model 0 \
    --background-image ./backgrounds/bg1.jpg 
