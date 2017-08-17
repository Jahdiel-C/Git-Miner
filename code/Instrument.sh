#!/bin/bash

#Instrument
# -c, --container       the test session container to use
# -d, --destination     the destination file / directory
# -l, --language        e.g. java, cobol
# -r, --root-directory  the root directory of the source files (e.g. the default package)

#Analyze
# -c, --container     the test session container to use
# -g, --coverage-log  the coverage log
# -n, --name          the new name of the test case or test session

#Merge
# -c, --container  the test session container to use
# -n, --name       the new name of the test case or test session
# -s, --session    names of test sessions

#Report
# -c, --container    the test session container to use
# -d, --destination  the destination file / directory
# -s, --session      the name of the test session
# -t, --template     template file defining the layout

#1st Attempt
#cd ~
#cd commons-io
#cd Projects/gradle-simple
#~/codecover-batch-1.0/codecover.sh instrument -r src/main -d src.instr -c commons-io_tsc.xml -l java -v
#cd src.instr
#javac -d ~/Projects/gradle-simple/bin Hello.java
#cd ..
#java -cp bin:lib\junit-3.8.1.jar:lib\JUnit-TestRunner.jar Hello
#~/codecover-batch-1.0/codecover.sh analyze -c hello_tsc.xml -g coverage-log-2017-07-18-18-50-53-255.clf -n JUnitTestSession
#~/codecover-batch-1.0/codecover.sh info -c hello_tsc.xml -T -v
#~/codecover-batch-1.0/codecover.sh report -c hello_tsc.xml -d report.html -s "JUnitTestSession" -t ~/codecover-batch-1.0/report-templates/HTML_Report_hierarchic.xml

#cd ~
#cd Projects/gradle-simple
#~/codecover-batch-1.0/codecover.sh instrument -r src/main/java -d src.instr -c hello_tsc.xml -l java -v
#cd src.instr
#javac -d ~/Projects/gradle-simple/bin Hello.java
#cd ..
#java -cp bin:lib\junit-3.8.1.jar:lib\JUnit-TestRunner.jar Hello
#~/codecover-batch-1.0/codecover.sh analyze -c hello_tsc.xml -g coverage-log-2017-07-18-18-50-53-255.clf -n JUnitTestSession
#~/codecover-batch-1.0/codecover.sh info -c hello_tsc.xml -T -v
#~/codecover-batch-1.0/codecover.sh report -c hello_tsc.xml -d report.html -s "JUnitTestSession" -t ~/codecover-batch-1.0/report-templates/HTML_Report_hierarchic.xml
