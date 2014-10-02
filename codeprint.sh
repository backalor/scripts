#!/bin/bash
# Script to print code to 2-column landscape pdf files for printing

FILES="$@"
for f in $FILES
do
	enscript -2 -j -r -C -p - ${f} | pstopdf -i -o ./${f}.pdf
done
echo "Successfully converted $# files"
