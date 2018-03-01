#!/bin/bash

LATEST_VERSION=`curl https://www.manager.io/version.txt`

curl -O https://d2ap5zrlkavzl7.cloudfront.net/$LATEST_VERSION/ManagerServer.tar.gz

tar -xzf ManagerServer.tar.gz

rm -f ManagerServer.tar.gz

mono ManagerServer.exe -port 8080 -path "/data"