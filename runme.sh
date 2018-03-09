#!/bin/bash

rm -rf /root/build/*

cd /go/src/github.com/keybase/kbfs
git pull origin master

cd /go/src/github.com/keybase/client
git pull origin master

cd /go/src/github.com/keybase/client/packaging/linux
KEYBASE_SKIP_32_BIT=1 ./build_binaries.sh prerelease /root/build

DATESTR=$(date +%Y%m%d%H%M%S)
mkdir /data/$DATESTR
cp -R /root/build/binaries/amd64/* /data/$DATESTR
rm -rf /root/build/*
