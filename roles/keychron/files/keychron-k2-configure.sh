#!/bin/bash

set -e
echo 0 | /usr/bin/tee /sys/module/hid_apple/parameters/fnmode
