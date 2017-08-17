#!/bin/bash

: > ../Text/Files.txt

cd ..

exec < ProjectList.txt

cd Text

while read LINE
do
	re="https:\/\/github\.com\/[^\/]+\/([^\/]+).git"
	if [[ $LINE =~ $re ]]; then 
		FILE=${BASH_REMATCH[1]}
	fi

	echo $FILE >> Files.txt
done
