#!/bin/bash

printf "\nGenerating Default Keyfiles\n\n"

declare -a keys

keys=("github" "gitlab" "wildmouse")

for key in "${keys[@]}"; do

	./genkey.sh "$key" -f

	if [ $? -ne 0 ]; then
		echo "Failed to generate $key"
	fi
	printf "\n"
done

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
