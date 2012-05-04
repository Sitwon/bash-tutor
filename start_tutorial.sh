#!/bin/bash

# We need to properly set the $START
START=${START:=`dirname $0`}
CURDIR="`pwd`"
cd "$START"
export START="`pwd`"
cd "$CURDIR"

# reset progress file
cat /dev/null > .progress

PS1="\`history | tail -n 1 | cut -c 8- | $START/tutlib.sh\`\\ntutor:\\w\\$ " bash --noprofile --norc
