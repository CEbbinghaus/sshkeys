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
