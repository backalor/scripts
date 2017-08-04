#!/bin/sh

filename=$(basename "${1}")
extension="${filename##*.}"
filename="${filename%.*}"

iconv -c -f SHIFT-JIS -t UTF-8 "${1}" > "${filename}"_utf8."${extension}"
