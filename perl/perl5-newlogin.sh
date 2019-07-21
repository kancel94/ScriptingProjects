#!/usr/bin/perl
#perl script number 5
#Allows user to input their full name, linux ID, and phone number
#Once this information is given, it will be added to passwd and group files
#Shadow file will be skipped due to lack of root access

use Scalar::Util qw(looks_like_number);
#so I can see if phone number is an actual number instead of random letters

print "Enter user's full name: ";
chomp($fname=<STDIN>);
#allow user to input full name

print "Enter user's Linux ID account: ";
chomp($linacct=<STDIN>);
#allow user to enter linux account

$passwdacct = `cut -d: -f1 /home/tkang6/submit/passwd | grep $linacct >/dev/null`;
#check if passwd file has that login id
print "$passwdacct";

if ($? == 0) #if it exists
{
 print "Login id $linacct already exists. Please provide a different login id.\n";
 exit 0;
}

print "Enter user's phone number (no dashes): ";
chomp($pNum=<STDIN>);
#allow user to enter phone number
$pNumVeri= length($pNum); #variable for storing number of characters

#if it looks like a number and not any letters
if (looks_like_number($pNum))
{
 if ($pNumVeri != 10) #check if there are 10 characters
 { #exit out if it is not 10 characters
  print "Not a valid phone number. Must be 10 characters.\n";
  exit 0;
 }
 else # if it is 10 characters
 {
  #store variable with proper phone number format
  $pNum=~ s/^(\d{3})(\d{3})(\d{4})$/$1-$2-$3/;
 }
}
else #if phone number is not a number
{
 print "Not a valid phone number.\n"; #exit out of code
 exit 0;
}

print "\nName: $fname\nLinux ID: $linacct\nPhone Number: $pNum\n";
#display information for confirmation
print "Is this correct (y/n)? ";
chomp($ans=<STDIN>);

#if user inputs n or N for No
if ($ans eq 'n' || $ans eq 'N')
{ #program will exit out
 print "This program will now exit. Please run again.\n";
 exit 0;
}
#if user inputs y or Y for Yes
elsif ($ans eq 'y' || $ans eq 'Y')
{
 #takes UID from last line of passwd file
 $currentUID=`cat /home/tkang6/submit/passwd | cut -d: -f3 | tail -1`;
 $sum=$currentUID+1; #adds 1 to uid

 #open file so it can be appended to
 open(my $fd, '>>/home/tkang6/submit/passwd') or die("Error: Couldn't open file");
 #append this line to end of passwd file
 print $fd "$linacct:x:$sum:$sum:$fname, $pNum:$ENV{HOME}:/bin/bash\n";

 #open group file
 open(my $fd2, '>>/home/tkang6/submit/group') or die("Error: Couldn't open file");
 #append line to end of group file
 print $fd2 "$linacct:x:$sum:\n";

 #just for confirmation, display last 2 lines of both files
 print "Last 2 lines of passwd and group files...\n";
 $last2lines=`cat /home/tkang6/submit/passwd | tail -2\n`;
 print "$last2lines\n";
 $last2lines2=`cat /home/tkang6/submit/group | tail -2\n`;
 print $last2lines2;

 #make a copy of bash profile and put in folder
 $skelCopy=`cp /etc/skel/.bash_profile /home/tkang6/submit`;
 print $skelCopy;
}
else #if user inputs an invalid choice
{
 print "Not a valid choice.\n";
 exit 0; #exit out
}

#close out of both opened files
close $fd;
close $fd2;
exit 0;