#!/bin/bash
bookmarks=$HOME/.bookmarks
valid=0
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
	if [[ $1 == "--mark" || $1 == "--delete" ]]; then
		echo Deleting $name
		sed -i "/^$name /d" $bookmarks
		valid=1
	fi
	if [[ $1 == "--mark" ]]; then 
		echo "Adding $(pwd) as bookmark $name"
		echo $name $(pwd) >> $bookmarks
		cat $bookmarks
	fi
fi
fi
if [[ $valid -eq 0 ]]; then
	echo "Not enough parameters, use --mark, --delete or --list"
fi