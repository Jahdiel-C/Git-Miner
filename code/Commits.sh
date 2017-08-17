#!/bin/bash

function array
{
	cd ..
	exec < ProjectList.txt

	x=0

	while read LINE
	do
		arrLine[x]=$LINE
		((x++))

		echo "Array:" $x "("$LINE")"
		

		re="https:\/\/github\.com\/[^\/]+\/([^\/]+).git"
	
		if [[ $LINE =~ $re ]]; then 
			FILE=${BASH_REMATCH[1]}
		fi

		arrFile[y]=$FILE
		((y++))
		echo "Array:" $y "("$FILE")"
		echo
	done
}

function create
{
	COUNT=1
	
	for FILE in "${arrFile[@]}"
	do
		echo "Commit Set" $COUNT "("$FILE")"
	
		cd ./Projects/$FILE
	
		Log=$(git log)

		cd ../..

		if [ ! -d ./Commits/Commits ]; then
  			mkdir -p ./Commits/Commits
		fi
	
		echo "$Log" > ./Commits/Commits/$FILE.txt

		COUNT=`expr $COUNT + 1`
	done

}

function list
{	
	: > ./Text/List.txt

	z=0

	for URL in "${arrLine[@]}"
	do
		FILE=${arrFile[z]}
		((z++))
		echo $FILE
		
		exec < ./Commits/Commits/$FILE.txt
	
		while read CHECK
		do
			if [[ $CHECK == *"commit "* ]]; then
				ID=${CHECK#"commit "}
			fi

			if [[ $CHECK == *"fix"* ]]; then
				echo "$URL, $ID" >> ./Text/List.txt
				#echo $CHECK >> ./Text/List.txt
				echo "$URL, $ID"
				echo $CHECK
				Reset=0

			elif [[ $Reset == 0 && $CHECK == *"commit "* ]]; then
				echo "$URL, $ID" >> ./Text/List.txt
				echo >> ./Text/List.txt				
				echo "$URL, $ID"
				echo
				Reset=1
			fi

		done
	
		echo
	done 
}

function search
{
	for URL in "${arrLine[@]}"
	do
		z=0
		FILE=${arrFile[z]}
		((z++))
		echo $FILE
		
		exec < ../Commits/Commits/$FILE.txt
	
		while read CHECK
		do
			if [[ $CHECK == *"fix charset bug"* ]]; then
				echo "Project $FILE"
			fi

		done
	
		echo
	done 
}

array
echo
echo
create
echo
echo
list
#search
