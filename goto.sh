#!/bin/bash
bookmarks=$HOME/.bookmarks
valid=0

if [[ ! -f $bookmarks ]]; then
	> $bookmarks
fi

if [[ $# == 1 ]]; then 
	if [[ $1 == "--list" ]]; then 
			cat $bookmarks
			valid=1
	else
		target=`eval grep "^$1 " $bookmarks | awk '{print $2}'`
		if [[ -z $target ]]; then
			echo "Could not find bookmark $1"
		else
			cd $target
		fi
		valid=1
	fi
else if [[ $# == 2 ]]; then 
	name=$2
	count=`eval grep "^$name " $bookmarks | wc -l`
	if [[ $1 == "--mark" || $1 == "--delete" ]]; then
		sed -i "/^$name /d" $bookmarks
		if [[ $1 == "--delete" ]]; then 
			if [[ $count -eq 0 ]]; then 
				echo Bookmark not found.
			else
				echo Deleted bookmark $name
			fi 
		else
			if [[ $count -eq 0 ]]; then 
				echo Adding bookmark $name
			else
				echo Replacing bookmark $name
			fi 
			echo $name $(pwd) >> $bookmarks
		fi
		valid=1
	fi
fi
fi
if [[ $valid -eq 0 ]]; then
	echo "Usage:"
	echo "goto --mark <name>"
   	echo "  Sets the bookmark"
	echo "goto <name>"
	echo "  Jumps to the bookmark" 	
	echo "goto --delete <name>"
	echo "  Deletes the bookmark"
	echo "goto --list"
	echo "  Lists all the bookmarks"
fi
