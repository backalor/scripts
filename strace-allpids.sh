#!/bin/bash

for a in $(ps ax | awk '{print $1}'); do
	strace -e trace=open,read $a 2>&1 | tee strace-${a}.out &
done;
