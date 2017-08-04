#!/bin/bash

PWD=`pwd`

# delete all old tags for my sanity
find . -type f -name tags -exec rm {} \;
find . -type f -name "cscope.*" -exec rm {} \;

find ${PWD}/ -name '*.py' \
-o -name '*.java' \
-o -iname '*.[CH]' \
-o -name '*.cpp' \
-o -name '*.cc' \
-o -name '*.hpp'  \
-o -name .git -prune \
-o -name .svn -prune \
-o -name .hg -prune \
-o -name bundle -prune \
-o -name vendor -prune \
-o -name min -prune \
-o -name builds -prune \
> cscope.files 2>/dev/null

# -b: just build the cross-reference only
# -q: create inverted index
# -R: recursive
# -i: include only these files
cscope -b -q -R -i cscope.files 2>/dev/null

rm cscope.files

ctags -R .
