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
			echo "Hint: Type 'pwd' and hit Enter to continue."
			echo 1.1>>$START/.progress
			;;
		"1.1")
			case "$lastcmd" in
				"pwd")
					echo
					echo "Good job!"
					echo "As you can see above, the current directory is \"`pwd`\"."
					echo
					if [ "`pwd`" = "$HOME" ]
					then
						echo "You are already in your home directory. You can always get back here at any time"
						echo "by issuing the change directory command 'cd'. Try it now."
					else
						echo "You are not in your home directory. Please change to your home directory"
						echo "by issuing the change directory command 'cd'."
					fi
					echo 1.2>>$START/.progress
					;;
				*)
					echo "Try again. You typed \"$lastcmd\""
					;;
			esac
			;;
		"1.2")
			if [ "`pwd`" = "$HOME" ]
			then
				echo "Great! Now we're in your home directory."
				echo "Let's make a directory to use for the rest of this tutorial. To make a directory"
				echo "issue the make directory command 'mkdir' with the name of a directory you want to"
				echo "create. In this case, we'll make the 'tutorial' directory."
				echo "Hint: Try typing 'mkdir tutorial'"
				echo 1.3>>$START/.progress
			else
				echo "Try again. You typed \"$lastcmd\""
			fi
			;;
	esac
}

# Run the handler for the current step.
step_${current_step%%.*}

