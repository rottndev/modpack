#!/usr/bin/env bash
cd ${0%[\\/]*}
set -eu

declare base=xonotic
if [ ! -d "$base" ]; then
    echo "RTFM (README.md)"
    exit 1
fi
: ${QCC:=$PWD/gmqcc/gmqcc}
export QCC
cd ${base} && make BUILD_MOD=1