#!/bin/bash

# Initialize default values
BITRATE="1M"

# Parse flag-based arguments
while getopts "i:s:f:e:b:" opt; do
  case $opt in
    i) INPUT_FILE="$OPTARG" ;;
    s) START_TIME="$OPTARG" ;;
    f) SPEED_FACTOR="$OPTARG" ;;
    e) END_TIME="$OPTARG" ;;
    b) BITRATE="$OPTARG" ;;
    *) echo "Usage: ./convert_video.sh -i <input_file> -s <start_time> -f <speed_factor> [-e <end_time>] [-b <bitrate>]"
       exit 1
  esac
done

# Validate required arguments
if [[ -z "$INPUT_FILE" || -z "$START_TIME" || -z "$SPEED_FACTOR" ]]; then
  echo "Usage: ./convert_video.sh -i <input_file> -s <start_time> -f <speed_factor> [-e <end_time>] [-b <bitrate>]"
  exit 1
fi

NEW_SPEED=$(bc <<< "scale=2; 1 / $SPEED_FACTOR")

# Optional End Time
END_TIME_OPTION=""
if [ -n "$END_TIME" ]; then
  END_TIME_OPTION="-to $END_TIME"
fi

BASE_NAME=$(basename -- "$INPUT_FILE")
FILE_NAME="${BASE_NAME%.*}"

echo "$BITRATE is the bit rate"

# WEBM Conversion
ffmpeg -y -ss $START_TIME $END_TIME_OPTION -i $INPUT_FILE -vf "setpts=$NEW_SPEED*PTS" -c:v libvpx -b:v $BITRATE -crf 10 -an -pass 1 -f webm /dev/null
ffmpeg -y -ss $START_TIME $END_TIME_OPTION -i $INPUT_FILE -vf "setpts=$NEW_SPEED*PTS" -c:v libvpx -b:v $BITRATE -crf 10 -an -pass 2 "./output/$FILE_NAME.webm"

# MP4 Conversion
ffmpeg -y -ss $START_TIME $END_TIME_OPTION -i $INPUT_FILE -vf "setpts=$NEW_SPEED*PTS" -c:v libx264 -b:v $BITRATE -an "./output/$FILE_NAME.mp4"

echo "Video conversion completed. Output saved as output_$INPUT_FILE.webm and output_$INPUT_FILE.mp4"
