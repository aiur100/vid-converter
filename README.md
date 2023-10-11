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
./convert_video.sh -i input.webm -s 5 -f 2 -e 10 -b 2M
```

In this example, the input video `input.webm` will be converted starting at 5 seconds and with a speed factor of 2. The conversion will end at 10 seconds and will use a bit rate of 2M.

The output files will be saved in the `output` directory.