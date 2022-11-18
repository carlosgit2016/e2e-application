#!/bin/bash

set -e

main() {

    /opt/halyard/bin/halyard
}

main

export MINIO_ACCESS_KEY=VwxMAwhRw3lMYPAE
export MINIO_SECRET_KEY=HnwjNi6DP2uSn85dL6N1YaWpTYoHkStk
export ENDPOINT=https://minio.default.svc.cluster.local:443

echo $MINIO_SECRET_KEY | hal config storage s3 edit --endpoint $ENDPOINT \
    --access-key-id $MINIO_ACCESS_KEY \
    --secret-access-key # will be read on STDIN to avoid polluting your
                        # ~/.bash_history with a secret

hal config storage edit --type s3
hal config storage s3 edit --path-style-access true