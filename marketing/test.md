

ffmpeg -i marketing_4.mov marketing_4.mp4
aws s3 cp marketing_4.mp4 s3://rl-public-graphics/rli_assets/videos/marketing_4.mp4 --acl public-read
aws s3 cp marketing.html s3://rl-public-graphics/rli_assets/marketing.html --acl public-read
aws cloudfront create-invalidation --distribution-id d38q8170pzcxii --paths "/rli_assets*"
