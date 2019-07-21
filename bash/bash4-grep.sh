#!/bin/bash
# bash script number 4- grep practice
# This script will do a series of grep statements that will
# make use of the grepDatafile.txt file in /home/sam/datafile directory

#fancy ASCII heading
echo "************************************************************"
echo "  ____ ____  _____ ____    ____   ____ ____  ___ ____ _____ "
echo " / ___|  _ \| ____|  _ \  / ___| / ___|  _ \|_ _|  _ \_   _|"
echo "| |  _| |_) |  _| | |_) | \___ \| |   | |_) || || |_) || |  "
echo "| |_| |  _ <| |___|  __/   ___) | |___|  _ < | ||  __/ | |  "
echo " \____|_| \_\_____|_|     |____/ \____|_| \_\___|_|    |_|  "
echo "************************************************************"
echo

echo "1.Print all lines that contain a phone number with an extension (the letter x or X followed by four digits)"
grep -i "[[:digit:]]\{3\}[ -]\?[[:digit:]]\{3\}[ -]\?[[:digit:]]\{4\}[[:space:]]\<x....\>" /home/sam/datafile/grepDatafile.txt
#-i turns off case sensitive, find 3 digits followed by dash, then 3 digits followed by dash, then 4 digits followed by a space with x and 4 characters
echo

echo "2. Print all lines that begin with three digits followed by a blank. Your answer must use the \{ and \} repetition specifier."
grep '^[[:digit:]]\{3\}[[:space:]]' /home/sam/datafile/grepDatafile.txt
# begins with 3 digits followed by a space
echo

echo "3. Print all lines that contain a date. Hint: this is a very simple pattern. It does not have to work for any year before 2000."
grep '^[[:alpha:]]\{3\}\.[[:space:]][[:digit:]]\{1,2\}\,[[:space:]]\<2...\>' /home/sam/datafile/grepDatafile.txt
#begins with 3 letters of any case, then followed by period and space, then 1 or 2 digits, then space, and a 4 digit year starting with 2
echo

echo "4. Print all lines containing a vowel (a, e, i, o, or u) followed by a single character followed by the same vowel again. Thus, it will find “eve” or “adam” but not “vera”. Hint: \( and \)"
grep '\([aeiou]\).\1' /home/sam/datafile/grepDatafile.txt
#using a capture group for first vowel and \1 matches that group after a period
echo

echo "5. Print all lines that do not begin with a capital S."
grep -v '^S' /home/sam/datafile/grepDatafile.txt
#excluding capital S
echo

echo "6. Print all lines that contain CA in either uppercase or lowercase."
grep -i 'CA' /home/sam/datafile/grepDatafile.txt
#ignoring case of CA
echo

echo "7. Print all lines that contain an email address (they have an @ in them), preceded by the line number."
grep -n '.@.' /home/sam/datafile/grepDatafile.txt
#-n shows line number and the dots before and after @ sign will ensure there is atleast 1 character before or after the sign
echo

echo "8. Print all lines that do not contain the word Sep. (including the period)."
grep -v 'Sep.' /home/sam/datafile/grepDatafile.txt
#excluding Sep.
echo

echo "9. Print all lines that contain the word de as a whole word."
grep -w 'de' /home/sam/datafile/grepDatafile.txt
#-w ensures de is a word
echo

exit 0