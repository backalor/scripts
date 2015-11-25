#!/bin/bash
# see: http://blog.tomtung.com/2009/11/cowsay-fortune
#      http://www.commandlinefu.com/commands/view/3584/remove-color-codes-special-characters-with-sed
#      https://github.com/busyloop/lolcat
#      https://github.com/dorentus/mruby-lolcat-bin
#
#      requires `fortune`, `cowsay`,
#        and ruby gem `lolcat` or its mruby version equivalent

if [[ $OSTYPE == darwin* ]]; then
	sed_exec=gsed
	sort_exec=gsort
else
	sed_exec=sed
	sort_exec=sort
fi

export LANG="en_US.UTF-8"

printf "\n"

msg=`fortune -a -s`

# Randomly pick a mode of the cow
modes=("" -b -d -g -p -s -t -w -y ); mode=${modes[$(($RANDOM % 9))]}

# cowsay or cowthink?
cowdos=(cowsay cowthink); cowdo=${cowdos[$(($RANDOM % 2))]}

# Radomly pick a cow picture file
speaker=`cowsay -l | $sed_exec '1d;s/ /\n/g'| $sort_exec -R | head -1`

# lolcat
cmd_lolcat="$(command -v lolcat_m)" || cmd_lolcat="$(command -v lolcat)"

# That's it ^^
echo "$msg" | $cowdo -n -f $speaker $mode | $sed_exec -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g" | $cmd_lolcat -f

printf "\n"
