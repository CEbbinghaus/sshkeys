#! /usr/bin/bash

if [[ -z $1 ]]; then
	echo "You must provide a Filename for the Key"
	exit 1
fi

ssh-keygen -b 4096 -t rsa -C "git@cebbinghaus.com" -f "$HOME/.ssh/$1" -N ""
