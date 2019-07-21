#!/usr/bin/perl
#perl script number 2
#Perl script that will do the following tasks...
#1. Create an array listing six of your favorite foods and six of your least liked foods
#2. Move the disliked foods to another array.
#3. Print out the first three items in the favorite foods array.
#4. Ask the user to input another disliked food and append to array.
#5. Move the newly added element to the beginning of array.
#6. For the "favorite foods" array, move the value of the first element of the array to become the last element of the same array.
#7.Print out the first and last elements of both arrays to show the changes fromthe previous step.
#8. Print to the terminal the number of elements in each array with some text.

#creating an array with 12 elements
@faveFoods = qw(kbbq steak galbi ramen sushi pasta vegeburger beans mango olives raisins candycorn);

#splicing last 6 elements into a new array
@ewwwFoods = splice(@faveFoods, 6);

print "3 of my favorite foods...\n";
print "@faveFoods[0..2]\n";
#list first 3 from array
print "1. @faveFoods[0] - \"popular method in Korean cuisine of grilling meat, typically beef, pork, or chicken\"\n";
print "2. @faveFoods[1] - \"meat generally sliced across the muscle fibers, potentially including a bone\"\n";
print "3. @faveFoods[2] - \"Korean word for rib, and the dish is usually made with beef short ribs\"\n\n";

#allow for user input
print "What disliked food do you have? ";
chomp($newDislike = <STDIN>);
push @ewwwFoods, $newDislike;
#push answer/element to end of array

print "Unliked Foods: \n";
print "Before changes--> @ewwwFoods[0]...@ewwwFoods[6]\n";
#remove last element and add to front
unshift(@ewwwFoods, pop(@ewwwFoods));
print "After changes--> @ewwwFoods[0]...@ewwwFoods[6]\n\n";

print "Liked Foods: \n";
print "Before changes--> @faveFoods[0]...@faveFoods[5]\n";
#remove first element and add to end
push(@faveFoods, shift(@faveFoods));
print "After changes--> @faveFoods[0]...@faveFoods[5]\n\n";

$sizeYUM= 0+@faveFoods;
$sizeEW= 0+@ewwwFoods;
print "Number of elements in Favorite Foods array: $sizeYUM.\n";
print "Number of elements in Disliked Foods array: $sizeEW.\n";

exit 0;