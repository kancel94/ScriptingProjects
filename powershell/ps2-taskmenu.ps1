#PowerShell script number 2
#This script will provide a menu that will display the output of a specific task
#The task is based on what number a user inputs
#It will continuously loop until user inputs 7 to exit

function oneOpt #function when user inputs option 1
{
 $name=hostname #save server name to variable and output it
 Write-Host "Server Name (Your PC): $name`n"
}

function twoOpt #function when user inputs option 2
{
 #grab ip information
 $ipaddr=Test-Connection -ComputerName (hostname) -Count 1  | Select -ExpandProperty IPV4Address
 #display ONLY ip address
 $iponly=$ipaddr.IPAddressToString
 Write-Host "IP address: $iponly`n"
}

function threeOpt #function when user inputs option 3
{
 Write-Host "All users on server: "
 #grabbing users on server and formatting in a clean table
 Get-WmiObject -Class Win32_UserAccount -Filter  "LocalAccount='True'" | select name | Format-Table
}

function fourOpt #function when user inputs option 4
{
 Write-Host "System disk information: "
 #system disk information in table format
 get-wmiobject win32_logicaldisk | Format-Table
}

function fiveOpt #function when user inputs option 5
{
 $date=get-date -Format g | %{"$($_.Split()[0])"} #date in simple format and only take first section to avoid giving time
 Write-Host "Date: $date`n"
}

function sixOpt #function when user inputs option 6
{
 #filter command list to only show get commands in table format
 Get-Command -verb get | select Name | Format-Table
}

Do #do while loop to keep running menu and allow for user input until 7 is inputted
{
 #display menu options
 Write-Host "1. Display the server name (your PC)"
 Write-Host "2. Display the server IP address"
 Write-Host "3. Display all users currently on the server"
 Write-Host "4. Display the server disks information"
 Write-Host "5. Display the system date"
 Write-Host "6. Display all PowerShell Get Commands"
 Write-Host "7. Exit Program"
 #read user input
 $selection=Read-Host "Enter selection "
 #switch statement for each option to call a different function
 switch($selection)
 {
  1 {oneOpt}
  2 {twoOpt}
  3 {threeOpt}
  4 {fourOpt}
  5 {fiveOpt}
  6 {sixOpt}
  7 {Write-Host "Thank you for running this script.`n"} #if user exits
  default {Write-Host "Not a valid option.`n"} #if user doesnt input integer between 1-7
 }
} While ($selection -ne 7) #exit condition of do while loop