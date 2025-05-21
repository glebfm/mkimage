#!/bin/sh -efu

: "${OUTNAME?}"

out="$OUTNAME"

cd /.image

mkdir -p "$out"
cp -a check-me me-too -t "$out"
