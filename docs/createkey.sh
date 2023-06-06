#!/bin/bash

#Removes all prev SSH Key
rm -rf /tmp/key*

#Creates the new tmp SSH Key
#sudo ssh-keygen -b 4096 -t rsa -f /tmp/key -q -P ""
ssh-keygen -t rsa -N "" -f /tmp/key

#Calls the GitHub API which will upload my SSH Key to the repo
curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer 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"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
  -H "Content-Type: application/json" \
  -d '{"title":"fo-b@macbook","key":"'"$(cat /tmp/key.pub)"'"}' \
  --output /tmp/keycurl.out \
  https://api.github.com/repos/fo-b/bash/keys

#Modify Key
sed 's/^/    /g' /tmp/key > /tmp/keymod

#Print out the private Key
clear
cat /tmp/keymod

#Copies the ID to the file
sed -n '/"id":/p' /tmp/keycurl.out | sed 's/^........//' | sed 's/.$//' > /tmp/key-id

#Sleeps 5min
sleep 335

#Call rmssh to remove SSH Key
source /Users/fabiobeti/rmssh.sh
