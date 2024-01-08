## Video Conversion Script

### Description

This Bash script allows for flexible video conversions. It converts input videos into both WEBM and MP4 formats while providing control over various parameters like start time, speed factor, optional end time, and bit rate.

### Technology Stack

- Bash
- ffmpeg
- bc (for basic calculations)

### Usage

The script uses flag-based arguments for easier usage and better clarity.

#### Required Flags

- `-i`: Specifies the input file.
- `-s`: Specifies the start time in seconds.
- `-f`: Specifies the speed factor.

#### Optional Flags

- `-e`: Specifies an optional end time in seconds.
- `-b`: Specifies the bit rate, defaulting to 1M if not provided.

#### Example

```bash
./converter.sh -i section_ai_descriptions.mov -s 1 -f 1.1 -b 1M

./converter.sh -i section_price_tool.mov -s 5 -f 1.1 -b 1M

./converter.sh -i section_rli_video.mov -s 13 -f 1.1 -b 2M

./converter.sh -i section_diy.mov -s 8 -f 1.1 -b 2M

./converter.sh -i section_photo_bg.mov -s 3 -f 1.1 -b 2M

./converter.sh -i section_syndicate.mov -s 0 -f 1.1 -b 1M

```

./converter.sh -i ./videos/price_tool_insights.mp4 -s 7 -f 2.1 -b 500K
./converter.sh -i ./videos/gpt_comments.mp4 -s 0 -f 1.8 -b 500K
./converter.sh -i ./videos/photo_studio.mp4 -s 0 -f 2.0 -b 450K
./converter.sh -i ./videos/rli_list_view.mp4 -s 0 -f 2.0 -b 450K
./converter.sh -i ./videos/syndication.mp4 -s 0 -f 2.0 -b 450K
./converter.sh -i ./videos/ai_bg_removal.mp4 -s 0 -f 2.0 -b 450K

In this example, the input video `input.webm` will be converted starting at 5 seconds and with a speed factor of 2. The conversion will end at 10 seconds and will use a bit rate of 2M.

The output files will be saved in the `output` directory.