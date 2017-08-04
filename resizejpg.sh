#!/bin/bash
for f in *.JPG; do convert -resize 25% "$f" "${f%.JPG}-smaller.jpg"; done
