#!/bin/bash

#Strict mode
set -euo pipefail

#Main logic

trap 'echo "Script failed"; exit 1' ERR
echo -e '<--- Log Archive Tool --->'

while true; do
	read -p "Select directories to Archive: " -a dirs
	filename=""
	#Verifying that dirs is not empty
	if [ "${#dirs[@]}" -eq 0 ]; then
		echo "quitting!, no directories selected"
		exit 1
	fi
	for dir in "${dirs[@]}"; do
		#Verify Existence of path
		if [ ! -e "$dir" ]; then
			echo "quitting, path to $dir does not exist..."
			exit 1
		fi
		#Verify that path is a directory
		if [ ! -d "$dir" ]; then
			echo "quitting!, $dir is not a directory"
			exit 1
		fi
		#Verify permissions
		if [ ! -x "$dir" ] || [ ! -r "$dir" ]; then
			echo "quitting!, user cannot enter in $dir directory"
			exit 1
		fi
	done
	 filename="LogArchive-$(date +%Y_%m_%d-%H_%M_%S)"
		find "${dirs[@]}" -readable -print | \
		 tar --ignore-failed-read -zcf "$filename.tar" "${dirs[@]}" \
		--exclude=/proc \
		--exclude=/sys \
		--exclude=/dev \
		--exclude=/run
	echo "Archive created: $filename.tar"
	ans=y
	read -p "Archive more directories? (y/n): " ans
	[[ $ans != y ]] && break
done
