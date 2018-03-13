#!/bin/bash

sudo echo "Need to run with sudo" || exit 1
killall keybase
killall Keybase
killall kbfsfuse
sudo killall keybase-redirector

sleep 1

sudo cp -R $1/* /
run_keybase
