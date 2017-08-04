#!/bin/bash
if [ ! -d "jpg" ]; then
	mkdir jpg
fi
#ufraw-batch --out-type=jpeg --out-path=./jpg ./*.nef
dcraw -e *.nef
mv *.jpg jpg
