#!/bin/bash
#bash script number 3
#This script will create a directory called wastebasket
# and relocate files that a user chooses into this directory.
#Files with same names can be used for relocation since
# a random number will be attached to the end.
#An error message will be given if no file is specified
# or if the file does not exist.
#This script will have no limit to files at one given time.

mkdir $HOME/WasteBasket > /dev/null 2>&1
#create directory, hide error message if already created

#if user enters no arguments
if [ $# -eq 0 ]
then
 echo "Error: Filename has not been entered"
 echo "Proper usage of this command: myrm fileName"
 exit 1 #exit number to show there was an error in usage
fi


for arguments in "$@"
#for loop for each argument to allow any number of arguments
do
 ls $arguments > /dev/null 2>&1 #gives no error message if file does not exist
 if [ $? -ne 0 ] #if the ls commmand gave an error
 then
  echo "File $arguments does not exist"
 else #if there was no error
  mv $arguments $HOME/WasteBasket/$arguments.$RANDOM > /dev/null 2>&1
#move file to Wastebasket and add a random number to name
  if [ $? -ne 0 ] #if moving the file failed (due to lack of permissions)
  then
   echo "Don't have permissions to delete file $arguments"
  else
   echo "File $arguments has been successfully deleted"
  fi
 fi
done

exit 0