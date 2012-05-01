#!/bin/bash

export START=${START:=`dirname $0`}

# reset progress file
cat /dev/null > .progress

PS1="\`history | tail -n 1 | cut -c 8- | $START/tutlib.sh\`\\ntutor:\\w\\$ " bash --noprofile --norc
