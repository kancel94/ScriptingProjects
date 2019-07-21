#!/usr/bin/perl
#perl script number 3
#This script will create a hash containing first name/last name key/value pairs
#The user will be prompted to enter their first name...
#The full name will be printed based on what the user entered.

#creating hash with first name as key and last name as values
%datName = (
        John => "Norman",
        Robert => "Anson",
        Christopher => "Fowler",
        Robert => "Harris",
        Dan => "Simmons"
        );

print "Please enter your first name (Please capitalize first letter): ";
chomp($Fname = <STDIN>);
#allow user to enter first name

#if first name exists in this hash
if (exists($datName{$Fname}))
{
 if ($Fname ne "Robert")
 #if first name is not Robert since there are 2
 {
  #proper full name will be given
  print "Your full name is $Fname $datName{$Fname}.\n";
 }
 else #if first name is Robert
 {
  print "Does your last name start with A or H? ";
  chomp($RobertL = <STDIN>);
  #allow user to answer
  my @lname = ("Anson","Harris"); #array of Robert last names

  if ($RobertL eq "A" || $RobertL eq "a")
  #if capital or lower case A
  {
   $lastname = $lname[0]; #1st element in array
   print "Your full name is $Fname $lastname.\n";
  }
  elsif ($RobertL eq "H" || $RobertL eq "h")
  #if capital or lower case H
  {
   $lastname = $lname[1]; #2nd element in array
   print "Your full name is $Fname $lastname.\n";
  }
  else
  {
   print "Not a valid choice.\n";
  }
 }
}
else #if you enter a random first name
{
 print "Not a valid name.\n";
}
exit 0;