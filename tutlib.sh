#!/bin/bash

if [ ! -e $START/.progress ]
then
	cat /dev/null > $START/.progress
fi

if [ ! -s $START/.progress ]
then
	echo 1 >$START/.progress
fi

read lastcmd
current_step=$(cat $START/.progress)

step_1(){
	case "$current_step" in
		"1")
			echo "Welcome to the tutorial!"
			echo "Let's begin by printing a directory listing."
			echo "Type 'ls' to continue."
			echo 1.1>$START/.progress
			;;
		"1.1")
			case "$lastcmd" in
				"ls")
					echo "Good job!"
					echo 1.2>$START/.progress
					;;
				*)
					echo "Try again. You typed \"$lastcmd\""
					;;
			esac
			;;
	esac
}

# Run the handler for the current step.
step_${current_step%%.*}

