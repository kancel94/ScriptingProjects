#!/bin/bash
#Bash script number 7

a1=(1 1 2 2 3 3 4 4 5 5 6 7 7 7 7)
a2=(10 10 7 7 6 6 2 2 3 3 4 4 5 5 6 7 7 7 7 10 10)
a3=(6 6 10 10 7 7 6 6 2 2 3 3 4 4 5 5 6 7 7 7 7 10 10)
a4=(10 10 7 7 2 2 3 3 4 4 5 5 7 7 7 7 10 10 6)
a5=(6 6)
a6=(1)

#function for finding odd count
function findOddCount()
{
 newArr=("$@") #passing array as argument into function
 arrSize=${#newArr[@]} #size of array
 arrSize2=$(($arrSize-1)) #max index of array
 #for loop to go through list once
 for ((i=0; i<$arrSize; i++)); do
  counter=0 #counter to see if its odd or even
  #another for loop to use for comparison
  for ((j=0; j<$arrSize; j++)); do
   #if there is a match, raise counter by 1
   if [ "${newArr[$i]}" == "${newArr[$j]}" ]; then
    ((counter+=1))
   fi
  done
  #variable for calculating if even or odd
  remainder=$(($counter%2))
  #if it is even
  if [ "$remainder" != "0" ]; then
   #echo the number and exit
   echo ${newArr[$i]}
   exit 0
  fi
 done
 #if there is no odd count value and it never exits out
 echo "Nothing"
}
echo odd value in a1 is ` findOddCount "${a1[@]}"`
echo odd value in a2 is ` findOddCount "${a2[@]}"`
echo odd value in a3 is ` findOddCount "${a3[@]}"`
echo odd value in a4 is ` findOddCount "${a4[@]}"`
echo odd value in a5 is ` findOddCount "${a5[@]}"`
echo odd value in a6 is ` findOddCount "${a6[@]}"`

exit 0