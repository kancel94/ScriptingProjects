#!/bin/bash
#bash script number 6
#by Timothy Kang
#This script makes use of bash shell, grep, awk, sed to check the root file system usage.
#If the usage is greater than 95%, this script will automatically send an email to me.

#Fancy ascii heading
echo "  ____             _      ____ _               _     "
echo " |  _ \ ___   ___ | |_   / ___| |__   ___  ___| | __ "
echo " | |_) / _ \ / _ \| __| | |   | '_ \ / _ \/ __| |/ / "
echo " |  _ < (_) | (_) | |_  | |___| | | |  __/ (__|   <  "
echo " |_| \_\___/ \___/ \__|  \____|_| |_|\___|\___|_|\_\ "
echo

RootPercent=$(df -h | grep "/$" | awk '{print $5}' | sed 's/%//')
#df -h shows human readable file system disk space usage
#grep finds line where it ends with root (/)
#awk will print out 5th row which is percent
#sed will get rid of % sign
echo "Current Root File System Usage: $RootPercent%"
echo

#declaring variable
Warning="The root file system is greater than or equal to 95%. Please take immediate action to reduce the disk space usage. This is an automatic message sent by the system."

if [ $RootPercent -ge 95 ] #if RootPercent is greater than or equal to 95%
then
#Output of echo will be redirected to a txt file and be sent to email
 echo "$Warning" > Warning.txt
 mailx -s "Filesystem full reminder" tkang6@hawk.iit.edu < Warning.txt
 echo "Email has been sent."
else #if it is less than 95%
 echo "The root file system is less than 95%. No immediate action is necessary."
fi
exit 0