#!/bin/bash

export PATH=$PATH:/opt/gradle/gradle-3.4.1/bin

cd ../Text

: > Fail.txt
: > Pass.txt

COUNT=1
PCOUNT=0
FCOUNT=0

echo
echo "Building Projects"
echo 

exec < Files.txt

while read FILE
do
	
	cd ../Projects

	echo "Build" $COUNT "("$FILE")"
	
	cd $FILE

	GOUT=$(gradle --no-daemon 2>&1)

	echo
	echo "$GOUT"
	echo

	cd ..	
		
	if [[ $GOUT == *"BUILD SUCCESSFUL"* ]]; then
		echo "BUILD SUCCESSFUL"
		PCOUNT=`expr $PCOUNT + 1`
		echo "Build" $COUNT "("$FILE")" >> ../Text/Pass.txt
	else
		echo "BUILD FAILED"
		FCOUNT=`expr $FCOUNT + 1`
		#echo "/********************************************/" >> Fail.txt
		echo "Build" $COUNT "("$FILE")" >> ../Text/Fail.txt
		#echo >> Fail.txt
		#echo "$GOUT" >> Fail.txt
		#echo "/********************************************/" >> Fail.txt
	fi
	
	echo

	COUNT=`expr $COUNT + 1`
done

cd ../Text

echo
echo $PCOUNT "Builds passed"
echo $FCOUNT "Builds failed"

if [[ $PCOUNT == 0 ]]; then
	echo "No Builds Passed" >> Pass.txt
fi

if [[ $PCOUNT == 0 ]]; then
	echo "No Builds Failed" >> Fail.txt
fi
