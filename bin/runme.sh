#!/bin/bash

CLIENTREF="${1:-origin/master}"
KBFSREF="${2:-origin/master}"

rm -rf /root/build/*

cd /go/src/github.com/keybase/kbfs
git fetch origin
git reset --hard "$KBFSREF"

cd /go/src/github.com/keybase/client
git fetch origin
git reset --hard "$CLIENTREF"

cd /go/src/github.com/keybase/client/packaging/linux
KEYBASE_SKIP_32_BIT=1 ./build_binaries.sh prerelease /root/build

DATESTR=$(date +%Y%m%d%H%M%S)
mkdir /data/$DATESTR
cp -R /root/build/binaries/amd64/* /data/$DATESTR
rm -rf /root/build/*
