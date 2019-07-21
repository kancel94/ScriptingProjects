#!/usr/bin/perl
#Perl script number 6

@a1 = (1,1,2,2,3,3,4,4,5,5,6,7,7,7,7,7);
@a2 = (10,10,7,7,6,6,2,2,3,3,4,4,5,5,6,7,7,7,7,10,10);
@a3 = (6,6,10,10,7,7,6,6,2,2,3,3,4,4,5,5,6,7,7,7,7,10,10);
@a4 = (10,10,7,7,2,2,3,3,4,4,5,5,7,7,7,7,10,10,6);
@a5 = (6,6);
@a6 = (1);

#creating a subroutine function
sub findOddCount
{
 my ($a) = @_; #using argument
 my @newArr =@{$a}; #enter into a new array

 my $arrSize=@newArr;
 for ($i=0; $i<$arrSize; $i++) #for loop to go through each element in array
 {
  $counter = 0;
  for ($j=0; $j<$arrSize; $j++) #secondary for loop to compare
  {
   if ($newArr[$i] == $newArr[$j]) #will proceed to compare
   { #if it is same as a preexisting number
    $counter++; #raise counter
   }
  }
  if ($counter%2 != 0) #if remainder is 0 AKA not an even number
  {
   return $newArr[$i]; #return value for display
  }
 }
 return "Nothing"; #return this if there are no odd values
}
print "odd value in a1 is ", findOddCount(\@a1);
print "\nodd value in a2 is ", findOddCount(\@a2);
print "\nodd value in a3 is ", findOddCount(\@a3);
print "\nodd value in a4 is ", findOddCount(\@a4);
print "\nodd value in a5 is ", findOddCount(\@a5);
print "\nodd value in a6 is ", findOddCount(\@a6), "\n";

exit 0;