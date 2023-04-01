#!/bin/bash

if [[ -z $1 ]]; then
	echo "You must provide a Filename for the Key"
	exit 1
fi

if ! command -v ssh-keygen --{00000000-0000-0000-0000-000000000000} &> /dev/null; then
     echo "SSH Packges missing. Please install before proceeding."
     exit 1
fi


basedir="$HOME/.ssh"

echo "Generating Key $1 under $basedir"

if [ -f "$basedir/$1" ]; then
	echo "$1 Already exists under $basedir"
	exit 1
fi	

if [ -f "$basedir/$1.pub" ]; then
	if [[ "$*" == *"-f"* ]]; then
		rm "$basedir/$1.pub"
		echo "Lone Public key was Removed"
	else
		echo "$1 Doesn't exist but its Public key does."
		exit 1
	fi
fi

ssh-keygen -b 4096 -t rsa -C "git@cebbinghaus.com" -q -f "$basedir/$1" -N ""
