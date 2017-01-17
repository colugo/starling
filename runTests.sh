#!/bin/bash

COUNTER=5

echo "#### Testing ####"
echo "#mxmlc intermittently fails. The compilation will be attempted $COUNTER times."

echo "Cleaning test binaries."
rm test.swf

until [  $COUNTER -lt 1 ]; do
   echo Compilation attempts remaining $COUNTER
   let COUNTER-=1

   mxmlc app/src/TestRunner.as -o test.swf -compiler.source-path=app/src/main/actionscript  -compiler.library-path app/libs_test -include-libraries -debug=true

   if [ $? -eq 4 ]
   then
     echo "Compilation failed. Trying again"
   else
     echo "Successfully created test swf. Running tests..."
     let COUNTER=0
   fi

done

if [ -a test.swf ]
then
  # uses .fdbinit for config
  fdb
fi
