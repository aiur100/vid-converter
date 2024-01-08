#!/bin/bash

# Convert MOV to MP4 using ffmpeg
ffmpeg -i marketing_4.mov marketing_4.mp4

# Upload MP4 video to S3 with public-read ACL
aws s3 cp marketing_4.mp4 s3://rl-public-graphics/rli_assets/videos/marketing_4.mp4 --acl public-read

# Upload HTML to S3 with public-read ACL
aws s3 cp marketing.html s3://rl-public-graphics/rli_assets/marketing.html --acl public-read

# Invalidate CloudFront cache
aws cloudfront create-invalidation --distribution-id E3SE6TXV9N9RJQ --paths "/rli_assets*"

# End of script
