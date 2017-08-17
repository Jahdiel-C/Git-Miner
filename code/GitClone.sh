#!/bin/bash

cd ..
exec < ProjectList.txt

COUNT=1

cd Projects
while read URL
do
	#URL=${URL::-1}
	re="https:\/\/github\.com\/[^\/]+\/([^\/]+).git"
	
	if [[ $URL =~ $re ]]; then 
		FILE=${BASH_REMATCH[1]}
	fi
	
	echo "Project" $COUNT "("$FILE"):" $URL
	echo
	
	git clone $URL

	#cd $FILE

	#git init
	
	#git remote add origin url://to/source/repository
	
	#git checkout $ID
	
	#cd ~
	
	echo
	echo
	
	COUNT=`expr $COUNT + 1`
done
