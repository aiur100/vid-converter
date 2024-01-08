aws s3 sync output/ s3://rl-public-graphics/rli_assets/videos/ --acl public-read
aws cloudfront create-invalidation --distribution-id d38q8170pzcxii --paths "/rli_assets*"