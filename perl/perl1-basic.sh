#!/usr/bin/perl
#perl script number 1 of bash1
#It has been rewritten using Perl instead of Bash
#This script will ask user for their name, greet the user,
#and display information about the user, the server,
#and other users in the class.
#This includes login id, servername, ip address, OS release
#and flavor, past login records, available memory, running
#processes, current file systems, course IDs, and
#number of logins for this semester

print "Hello and welcome to Tim's Script 1a.\n";
print "Please enter your first name: ";
chomp($Fname = <STDIN>);
#allow for user to input first name and ignore enter key character
print "Please enter your last name: ";
chomp($Lname = <STDIN>);
#allow for user to input last name and ignore enter key character

#greet user with both first and last name
print "\nHey $Fname $Lname, how are you doing today? I hope you are doing well!\n";
print "Your Linux login ID is: $ENV{USER}\n";
#using environment variable for login ID

#Using Sys::hostname module to get create variable for hostname and ouput it
print "\nServer name: ";
use Sys::Hostname;
$host = hostname();
print "$host\n";
print "IP address: ";
#use Socket module
use Socket;
#use gethostbyname using $host to turn it into an ip address
$address = inet_ntoa(scalar gethostbyname( $host || 'localhost' ));
print "$address\n";

print "\nOS release and Linux flavor: \n";
$OSreleaseFlav=`cat /etc/os-release | head -2`;
#creating variable and using ` for using cat and head to find info
print "$OSreleaseFlav\n";

print "Record log of YOUR past logins: \n";
$Pastlogs=`last | grep $ENV{USER}`;
#list of every time user logged in
print "$Pastlogs\n";

print "Server available memory (in kilobytes): \n";
$AvailMem=`free | head -2 | tail -1 | tr " " ":" | cut -d: -f37`;
#field where available memory info is
print "$AvailMem\n";

print "Currently running processes (excluding root): \n";
$RunProc=`ps -ef | grep -v root`;
#running processes excluding root
print "$RunProc\n";

print "Server current file system: \n";
$currFS=`df -h`;
#current file system
print "$currFS\n";

print "All user IDs in course: \n";
$uidCourse=`cat /etc/passwd | grep 2018FA | cut -d: -f1,5 | tr "," : | cut -d: -f1,2 | tr ":" ", "`;
#every student's name and userid
print "$uidCourse\n";

print "Number of logins created for 2018 FA semester: \n";
$numLogins=`cat /etc/passwd | grep 2018FA | wc -l`;
#number of students logins created for 2018 FA semester
print "$numLogins\n";

print "Thank you for running this script!\n";

exit 0