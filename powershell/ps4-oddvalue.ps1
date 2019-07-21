#PowerShell script number 4
#creating a function to complete code in Powershell

$a1 = 1,1,2,2,3,3,4,4,5,5,6,7,7,7,7
$a2 = 10,10,7,7,6,6,2,2,3,3,4,4,5,5,6,7,7,7,7,10,10
$a3 = 6,6,10,10,7,7,6,6,2,2,3,3,4,4,5,5,6,7,7,7,7,10,10
$a4 = 10,10,7,7,2,2,3,3,4,4,5,5,7,7,7,7,10,10,6
$a5 = 6,6
$a6 = 1


function findOddCount($a) #function with paramter $a
{
 $counter=@{} #creating empty hash
 $a | Sort-Object | ForEach-Object { $counter[$_] = 0 } #creating a hashtable for each object
 ForEach($num in $a) #for each number in hash table
 {
  if($counter.ContainsKey($num)) #raises counter if number is present
  {
   $counter[$num]++
  }
 } #after the hash table is completed with every counter
 for ($i=1; $i -le 10; $i++) #for loop to cycle through each counter and see which is even
 {
  $oddeven = $counter[$i]%2 #finding remainder when divided by 2
  $arrHolder = @() #array to hold odd values if there are more than 1
  if ($oddeven -ne 0 -and $counter[$i] -ne 0) #if the number exists (doesnt have a counter of 0) AND is odd
  {
   return $i #return with result
  } 
 }
 Write-Host "Nothing"
}

Write-Host -noNewLine "odd value in a1 is "; findOddCount($a1)
Write-Host -noNewLine "odd value in a2 is "; findOddCount($a2)
Write-Host -noNewLine "odd value in a3 is "; findOddCount($a3)
Write-Host -noNewLine "odd value in a4 is "; findOddCount($a4)
Write-Host -noNewLine "odd value in a5 is "; findOddCount($a5)
Write-Host -noNewLine "odd value in a6 is "; findOddCount($a6)