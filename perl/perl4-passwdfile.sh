#!/usr/bin/perl
#perl script number 4
#Script will look at /etc/passwd and do the following tasks...
#1. Count how many usernames that are using bash shell and those that are using nologin shell
#2. Print out the largest UID number
#3. Display all usernames where the user id is less than 1000
#4. Display all usernames that are greater or equal to 2000, sorted by username

use List::Util qw( min max ); #to find highest UID

#declaring 2 variables- 1 for number of lines of accounts using bash, other is for nologin shell
$bashNum=`cat /etc/passwd | awk -F: '{print \$1\", \" \$7}' | grep /bin/bash | wc -l`;
$nologinNum=`cat /etc/passwd | awk -F: '{print \$1\", \" \$7}' | grep /nologin | wc -l`;
print "Number of usernames that are using bash shell: $bashNum";
print "Number of usernames that are using nologin shell: $nologinNum\n";

#third field of /etc/passwd which is UID column
@uidNum=`cat /etc/passwd | awk -F: '{print \$3}' | sort -n`;
#using perl's max function to show largest number
$max = max @uidNum;
print "Largest UID number: $max\n";

#creating 2 arrays
@uidArr=`cat /etc/passwd | awk -F: '{print \$3}'`; #this array is for UIDs
@userNameArr=`cat /etc/passwd | awk -F: '{print \$1}'`; #this array is for usernames
#Can compare both arrays by using index number
$sizeArr= @uidArr; #size of array so that a for loop can be used

print "All usernames where the user id is less than 1000: \n";

#initializing at 0, til size of array, incrementing by 1
for ($i=0; $i<$sizeArr; $i++)
{
 if (@uidArr[$i] < 1000) #if UID is less than 1000
 {
   print @userNameArr[$i]; #print out corresponding username
 }
}

print "\nAll usernames where the user id is greater than or equal to 2000 (sorted): \n";
@storageArray=(); #creating a storage array so it can be sorted later
#same for loop as before
for ($i=0; $i<$sizeArr; $i++)
{
 if (@uidArr[$i] >= 2000) #if UID is greater than or equal to 2000
 {
   #saves UID into variable
   $userTwoK=@userNameArr[$i];
   #will push and add that element into storage array
   push(@storageArray, $userTwoK);
 }
}
print sort @storageArray; #sort and print

exit 0;