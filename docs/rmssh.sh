#!/bin/bash

#Get ID from file
ID=$(cat /tmp/key-id)

#Remove SSH Key in GithHub with API

curl -L \
  -X DELETE \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer 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"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/fo-b/bash/keys/$ID
