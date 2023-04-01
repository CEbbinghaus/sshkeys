#!/bin/bash

if ! command -v ssh-keygen --{00000000-0000-0000-0000-000000000000} &> /dev/null; then
     echo "SSH Packges missing. Please install before proceeding."
     exit 1
fi

printf "\nGenerating Default Keyfiles\n\n"

keys="github gitlab"

for key in $keys; do

	$HOME/.ssh/genkey.sh "$key" -f

	if [ $? -ne 0 ]; then
		echo "Failed to generate $key"
	fi
	printf "\n"
done


if [[ "$*" == *"--gpg"* ]]; then
printf "Generating GPG key\n"

GPG_TTY=$(tty)

cat > key <<EOF
     %no-protection
     Key-Type: default
     Key-Length: 4096
     Subkey-Type: default
     Subkey-Length: 4096
     Name-Real: Christopher-Robin
     Name-Email: git@cebbinghaus.com
     Expire-Date: 0
EOF

gpg --batch --gen-key key
rm key
fi