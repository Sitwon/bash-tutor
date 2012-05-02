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
current_step=$(tail -n 1 $START/.progress)

# Step 1: Navigation the directory structre.
step_1(){
	case "$current_step" in
		"1")
			echo "Welcome to the tutorial!"
			echo "Let's begin by figuring out where we are."
			echo "To print the present working directory we use the 'pwd' command."
			echo "Hint: Type 'pwd' to continue."
			echo 1.1>>$START/.progress
			;;
		"1.1")
			case "$lastcmd" in
				"pwd")
					echo
					echo "Good job!"
					echo "As you can see above, the current directory is \"`pwd`\"."
					echo 1.2>>$START/.progress
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

