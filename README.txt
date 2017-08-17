The list of projects to work with are stored in ProjectList.txt.

To be able to use the program, you must use 'chmod u+x Program.sh' in the terminal. 
Call the program by using './Program.sh'. 
This will start the tool.

In the first part of Program.sh, read/write abilities are given to all necessary shell files. 

Then the program reaches GitClone.sh. This program takes all the projects from ProjectList.txt and clones them into a repository.

Once that is complete, Files.sh is used to store all the folder names into a text file in ./Text/Files.txt.

Then GradleBuild.sh is called to build all of the cloned projects. The list of failed projects are saved in ./Text/Fail.txt and the passed projects are saved in ./Text/Pass.txt

Lastly, Commits.sh gathers all the commits for each project and stores the interesting commits in ./Text/List.txt

The instruementation code is completely commented out since it was only prepared for a single project.
