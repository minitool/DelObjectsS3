#!/bin/bash
link="s3://{yourBucketName}"
value=$(<./list)
listFolder=$(aws s3 ls "${link}/kv" --recursive  | awk '{print $4}')

for i in $value; do
  for j in $listFolder; do
    if [[ "$j" == *"$d"* ]]; then
      target="${link}/${j}"
      echo "$target"
      aws s3 rm "$target"
    fi
  done
done