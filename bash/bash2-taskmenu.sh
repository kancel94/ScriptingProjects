#!/bin/bash
# bash script number 2
# This script will display a menu that allows user to choose between 5 or 6 choices depending on whether they ran task or task -r
# By adding -r to running this script, the script will run again until user inputs the number 6
# 1 will ping a given server and check if it is up and running
# 2 will find how many router hops it takes to reach a given server site
# 3 will display id owner based on user login ID
# 4 will compress a given directory and email it
# 5 will send a file using email

# Fun ASCII menu title
echo "****************************************************"
echo "  _____         _      ____            _       _    "
echo " |_   _|_ _ ___| | __ / ___|  ___ _ __(_)_ __ | |_  "
echo -E "   | |/ _\` / __| |/ / \___ \ / __| '__| | '_ \| __| "
echo "   | | (_| \__ \   <   ___) | (__| |  | | |_) | |_  "
echo "   |_|\__,_|___/_|\_\ |____/ \___|_|  |_| .__/ \__| "
echo "                                        |_|         "
echo "****************************************************"

# echo asking to choose an option
echo "Hello. Welcome to the task script. Please select one of the following choices..."
# if user ran task -r
if [ "$1" = "-r" ]
then
 MENUchoice=0 #declare variable as 0 so that while loop begins
# while loop will allow this program to continuously run until user inputs 6
 while [ $MENUchoice != 6 ]
 do
# display menu items
  echo "1. Check if a server is up and running."
  echo "2. Find out how many router hops it takes to reach a given server site."
  echo "3. Display ID owner based on Login ID."
  echo "4. Compress a given directory and send file to an email address."
  echo "5. Send a file using email."
  echo "6. Exit program."
  echo
  echo -e "Enter your choice: \c"
  read MENUchoice #variable that will hold user input
# if user chooses 1
  if [ $MENUchoice = 1 ]
  then
   echo "Please input a server to ping (ex: iit.edu)"
   read PINGname
   ping -c3 $PINGname #ping server 3 times
   echo
# if user chooses 2
  elif [ $MENUchoice = 2 ]
  then
   echo "Please input a server site to see how many router hops it takes to reach this destination (ex: google.com)"
   read TRACEname
   traceroute $TRACEname #traceroute the server
   echo
# if user chooses 3
  elif [ $MENUchoice = 3 ]
  then
   echo "What is your login ID?"
   read LoginID
   echo -e "ID owner is: \c"
# cut out ID owner based on login ID
   cat /etc/passwd | grep 2018FA | cut -d: -f1,5 | tr "," : | cut -d: -f1,2 | grep "$LoginID" | cut -d: -f2
   echo
# if user chooses 4
 elif [ $MENUchoice = 4 ]
  then
   echo "What directory would you like to compress? (ex: /var/log)"
   read Directory
   tar -zcvf compressedDir.tar.gz $Directory # compress directory
   echo "Directory has been compressed!" # message confirming command
   echo "Please input your email address."
   read Email1
   mailx -s "Compressed Directory- task script" $Email1 < compressedDir.tar.gz # emailing compressed directory
   echo "Directory has been sent to #$Email1"
   echo
# if user chooses 5
 elif [ $MENUchoice = 5 ]
  then
   echo "Please input your email address."
   read Email2
   echo "What file would you like to email (enter exact location)(ex: /home/tkang6/submit/script1a)?"
   read fileEmail
   mailx -s "File- task script" -a $fileEmail $Email2 </dev/null # mail file as attachment with empty body
   echo "File has been sent to $Email2"
   echo
# if user chooses 6
 elif [ $MENUchoice = 6 ]
  then
   echo "Thank you for running this script!"
   exit 0 #loop ends and program ends
# if user chooses something that isnt 1-6
  else
   echo "Invalid choice. Try again." # program will not exit but just rerun menu
  fi
 done
else
# if user does not use -r option
  echo "1. Check if a server is up and running."
  echo "2. Find out how many router hops it takes to reach a given server site."
  echo "3. Display ID owner based on Login ID."
  echo "4. Compress a given directory and send file to an email address."
  echo "5. Send a file using email."
  echo
  echo -e "Enter your choice: \c"
  read MENUchoice #variable that will hold user input
# if user chooses 1
  if [ $MENUchoice = 1 ]
  then
   echo "Please input a server to ping (ex: iit.edu)"
   read PINGname
   ping -c3 $PINGname #ping server 3 times
   exit 0 #program will exit once command has been run
# if user chooses 2
  elif [ $MENUchoice = 2 ]
  then
   echo "Please input a server site to see how many router hops it takes to reach this destination (ex: google.com)"
   read TRACEname
   traceroute $TRACEname #traceroute the server
   exit 0 #program wil exit once command has been run
# if user chooses 3
  elif [ $MENUchoice = 3 ]
  then
   echo "What is your login ID?"
   read LoginID
   echo -e "ID owner is: \c"
# cut out ID owner based on login ID
   cat /etc/passwd | grep 2018FA | cut -d: -f1,5 | tr "," : | cut -d: -f1,2 | grep "$LoginID" | cut -d: -f2
   exit 0 #program will exit once command has been run
# if user chooses 4
 elif [ $MENUchoice = 4 ]
  then
   echo "What directory would you like to compress? (ex: /var/log)"
   read Directory
   tar -zcvf compressedDir.tar.gz $Directory # compress directory
   echo "Directory has been compressed!" # message confirming command
   echo "Please input your email address."
   read Email1
   mailx -s "Compressed Directory- task script" $Email1 < compressedDir.tar.gz # emailing compressed directory
   echo "Directory has been sent to #$Email1"
   exit 0 #program will exit once command has been run
# if user chooses 5
 elif [ $MENUchoice = 5 ]
  then
   echo "Please input your email address."
   read Email2
   echo "What file would you like to email (enter exact location)(ex: /home/tkang6/submit/script1a)?"
   read fileEmail
   mailx -s "File- task script" -a $fileEmail $Email2 </dev/null # mail file as attachment with empty body
   echo "File has been sent to $Email2"
   exit 0 #program will exit once command has been run
# if user chooses something that isnt 1-5
  else
   echo "Invalid choice. Run script again." # program will not exit due to not valid option
  fi
fi
exit 0