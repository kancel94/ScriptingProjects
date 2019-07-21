#!/bin/bash
#bash script number 1
#ask for their name, greet user, display information about user/server/and other users
#includes login id, servername, ip address, OS release and flavor, past login records, available memory,running processes, current file systems, course IDs, and number of logins for this semester 
#will also print a message based on system time

echo "Hello and welcome to Tim's Script 1a."
echo "Please enter your first name: "
read Fname
echo "Please enter your last name: "
read Lname
echo

echo "Hey $Fname $Lname, how are you doing today? I hope you are doing well!"
echo "Your Linux login ID is: $USER"
echo

echo "Server name: "
hostname
echo "IP address: "
hostname -i
echo

echo "OS release and Linux flavor: "
cat /etc/os-release | head -2
echo

echo "Record log of YOUR past logins: "
last | grep $USER
echo

echo "Server available memory (in kilobytes): "
free | head -2 | tail -1 | awk '{print $7}'
#tr " " ":" | cut -d: -f42 (changes empty space to colons and cuts 42nd field) 
#this is somewhat unreliable so awk is better
echo

echo "Currently running processes (excluding root): "
ps -ef | grep -v root
echo

echo "Server current file system: "
df -h
echo

#Only works with specific environment with 2018FA description in passwd file
#echo "All user IDs in course: "
#cat /etc/passwd | grep 2018FA | cut -d: -f1,5 | tr "," : | cut -d: -f1,2 | tr ":" ", "
#echo

#echo "Number of logins created for 2018 FA semester: "
#cat /etc/passwd | grep 2018FA | wc -l
#echo

#echo "Thank you for running this script!"

#exit 0

echo "Hello. Your current system time is: "
date | awk '{print $4}'
Hour=`date | cut -c12-13`
if [ $Hour -ge 0 -a $Hour -lt 12 ]
then
 echo "Good morning, hope you enjoyed this very basic bash script!"
elif [ $Hour -ge 12 -a $Hour -lt 18 ]
then
 echo "Good afternoon, hope you enjoyed this very basic bash script!"
else
 echo "Good evening, hope you enjoyed this very basic bash script!"
fi

exit 0