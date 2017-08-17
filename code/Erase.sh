#!/bin/bash

exec < ../Text/ProjectList.txt
cd ../Projects
while read LINE
do
	URL=$LINE
	re="https:\/\/github\.com\/[^\/]+\/([^\/]+).git"
	if [[ $URL =~ $re ]]; then 
		FILE=${BASH_REMATCH[1]}
	fi

	rm -rf $FILE
done
