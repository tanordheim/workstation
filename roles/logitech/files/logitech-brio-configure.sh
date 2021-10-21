#!/bin/bash

set -e

DEVICE="$1"
/usr/bin/v4l2-ctl -d $DEVICE --set-ctrl=zoom_absolute=160
/usr/bin/v4l2-ctl -d $DEVICE --set-ctrl=pan_absolute=0
