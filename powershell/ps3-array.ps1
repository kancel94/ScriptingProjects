#PowerShell script number 3
#5 arrays have been provided with information
#This script will calculate the average performance and print out members of groups meeting the following criteria:
#(a) Native language is English
#(b) Age is greater than 20
#(c) Age is greater than 20 and native language is English
#(d) Performance score is greater than 70

#6 arrays with 4 items each
$firstnames = "Sarah", "Jareth", "Ludo", "Hoggle"
$lastnames = "Williams", "King", "Beast", "Dwarf"
$ages = 15, 39, 33, 43
$nativelanguages = "English", "English", "Romanian", "English"
$performancescores = 85, 99, 35, 75

#initialize variables and arrays
$totalage=0
$totalvalues=0
$NativeEng = @()
$Age20Up = @()
$Age20UpEng = @()
$PerfScoreGT70 = @()

for ($i=0; $i -lt 4; $i++) #for loop to go through each item array
{
 #for calculating average
 $totalage += $performancescores[$i] #continuously add within each loop
 $totalvalues++ #raise counter
 
 if ($nativelanguages[$i] -eq "English") #if native language is English
 {
  $NativeEng += ($firstnames[$i] + " " + $lastnames[$i]) #first and last name will be added to array
 }
 if ($ages[$i] -gt 20) #if age is greater than 20
 {
  $Age20Up += ($firstnames[$i] + " " + $lastnames[$i]) #first and last name will be added to array
 }
 if ($ages[$i] -gt 20 -and $nativelanguages[$i] -eq "English") #if age is greater than 20 and native language is English
 {
  $Age20UpEng += ($firstnames[$i] + " " + $lastnames[$i]) #first and last name will be added to array
 }
 if ($performancescores[$i] -gt 70) #if performance score is greater than 70
 {
  $PerfScoreGT70 += ($firstnames[$i] + " " + $lastnames[$i]) #first and last name will be added to array
 }
}
$averagePerf=$totalage/$totalvalues #calculate average
Write-Host "Average performance score of these $totalvalues participants: $averagePerf`n"

#display each array item separated by comma
Write-Host "(a) Native language is English: "
$NativeEng -join ", "
Write-Host "`n(b) Age is greater than 20: "
$Age20Up -join ", " 
Write-Host "`n(c) Age is greater than 20 and native language is English: "
$Age20UpEng -join ", " 
Write-Host "`n(d) Performance score is greater than 70: "
$PerfScoreGT70 -join ", " 