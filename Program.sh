#!/bin/bash

if [ ! -d Projects ]; then
	mkdir -p Projects
fi

if [ ! -d Text ]; then
	mkdir -p Text
fi

cd code

chmod u+x GitClone.sh
chmod u+x Files.sh
chmod u+x GradleBuild.sh
chmod u+x Commits.sh
chmod u+x Erase.sh

echo "Cloning GitHub Projects"
echo
echo 
./GitClone.sh
./Files.sh
echo
echo
echo "Building Projects"
echo
echo
#./GradleBuild.sh
echo
echo
echo "Searching for Interesting Commits"
echo
echo
./Commits.sh
echo
echo
echo "Removing Original Repositories"
#./Erase.sh
