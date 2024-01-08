#!/bin/bash

# Create a video clip from the JPEG image with a white background and scaled to 1280x720
ffmpeg -loop 1 -framerate 30 -i Redline_Logos-03.jpg -vf "scale=1280:720:force_original_aspect_ratio=decrease,pad=1280:720:(ow-iw)/2:(oh-ih)/2:white,setsar=1" -t 5 -c:v libx264 -r 30 -pix_fmt yuv420p intro.mp4

# Initialize variables
input_files="-i intro.mp4 "
filter_complex=""
concat_params=""
count=0

# Add the fade-in effect to the intro video
filter_complex+="[0:v]fade=t=in:st=0:d=1,scale=1280:720,setsar=1[intro];"
concat_params+="[intro]"

# Loop through each .mp4 file in the directory
for file in *.mp4; do
  if [[ "$file" != "intro.mp4" ]]; then
    input_files+="-i $file "
    filter_complex+="[$((count + 1)):v]fade=t=in:st=0:d=1,scale=1280:720,setsar=1[f$count];"
    concat_params+="[f$count]"
    count=$((count + 1))
  fi
done

# Complete the filter_complex string
filter_complex+="$concat_params concat=n=$((count + 1)):v=1:a=0[vout]"

# Execute the ffmpeg command
ffmpeg $input_files -filter_complex "$filter_complex" -map "[vout]" -c:v libx264 -crf 18 -preset veryfast output_with_intro_rescaled.mp4
