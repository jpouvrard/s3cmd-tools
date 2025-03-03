#!/bin/bash

# Usage: ./delete_files.sh "bucketname" "30 days"

s3cmd --host=$S3_ENDPOINT --region=$S3_REGION --host-bucket=$S3_BUCKET.$S3_ENDPOINT --access_key=$S3_ACCESS_KEY --secret_key=$S3_SECRET_KEY ls s3://$1 | grep " DIR " -v | while read -r line; do
  createDate=$(echo $line | awk {'print $1" "$2'})
  createDate=$(date -d "$createDate" "+%s")
  olderThan=$(date -d "$2 ago" "+%s")
  fileName=$(echo $line | awk {'print $4'})
  
  if [[ $createDate -le $olderThan ]]; then
    if [ $fileName != "" ]; then
      printf 'Deleting "%s"\n' $fileName
      s3cmd --host=$S3_ENDPOINT --region=$S3_REGION --host-bucket=$S3_BUCKET.$S3_ENDPOINT --access_key=$S3_ACCESS_KEY --secret_key=$S3_SECRET_KEY del "$fileName"
    fi
  fi
done
