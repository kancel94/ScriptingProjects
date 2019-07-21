#PowerShell script number 1
#greetme.ps1
<#
This is a greeting script that will do the following tasks...
1. ask user for full name and display a message
2. print system date and time
3. print system disk information
4. print name of Windows machine
5. print name and release of OS
6. display all running processes
7. display the IP address
#>

#allow for user input
$fullname=read-host "Enter your full name: "
write-host "Hello $fullname. How are you? Welcome to Windows PowerShell Scripting."

#format g does short time and short date
$date=get-date -Format g | %{"$($_.Split()[0])"}
#this will only display first field
write-host "Date: $date"
$time=get-date -Format g | %{"$($_.Split()[1,2])"}
#this will display second and third field
write-host "Time: $time"

#simple command for getting disk info
write-host "System disk information: "
Get-Disk

#simple command for getting host name
$windowsname=Hostname
write-host "`nHost Name: $windowsname"

#getting OS information
$osname=(Get-WMIObject win32_operatingsystem).name
#establishing a separator
$separator="|"
#splitting it based on separator
$parts=$osname.split($separator)
#taking only the first section that was separated
$OS=$parts[0]
write-host "Operating System: $OS" 
#simple command for OS version
$OSver=[environment]::OSVersion.Version 
write-host "Operating System Version: $OSver"

#displaying processes in table format
write-host "Running Processes: "
Get-Process | Format-Table

#ip information of computer
$ipaddr=Test-Connection -ComputerName (hostname) -Count 1  | Select -ExpandProperty IPV4Address
#only displaying IP address
$iponly=$ipaddr.IPAddressToString
write-host "IP address: $iponly"

write-host "Goodbye $fullname. See you next time!"