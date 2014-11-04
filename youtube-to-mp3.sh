#!/bin/sh
youtube-dl -a $1 --no-playlist
ls -1 *.mp4 > list
(IFS=$'\n'; for file in $(cat list); do ffmpeg -i $file -vn -ar 44100 -ac 2 -ab 192k -f mp3 ${file/mp4/mp3}; done)
rm list *.mp4
