#!/bin/bash

set -e

pkill kanshi || true
exec kanshi
