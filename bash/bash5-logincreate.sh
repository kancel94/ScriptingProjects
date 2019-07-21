#!/bin/bash
#bash script number 5
#Interactive way of adding a user that will do the following...
#1. Ask for an id and test if its a duplicate
#2. Allow user to enter id owner full name
#3. Use a unique UID
#4. Add given information to /etc/password file
#5. Add given information to /etc/group file
#5. Create a home directory for the new user and give it proper permissions (755)
#6. Copying necessary .bash_profile into directory
#7. Setting a password
#8. Display some information about newly created user
#9. Loop program so multiple users can be added.

LoopVar="y" #declaring variable to start while loop
echo 

while [ $LoopVar = "y" ] #while this variable is y
do 

echo -n "Enter a unique new login id: "
read loginid #variable for storing loginid

 cat /etc/passwd | grep $loginid: >/dev/null
 #look through file to find loginid without displaying output

 #if grep finds the same exact login id
 if [ $? -eq 0 ]
 then 
  echo "Login in $loginid already exists. Please provide a different login id."
  #give user opportunity to try again
  echo -n "Try again? (y/n): "
  read LoopVar2 
  if [ $LoopVar2 = "y" ] || [ $LoopVar2 = "Y" ] #if user inputs y or Y
  then
   LoopVar2="y" #set it as lowercase for while loop
   echo
  elif [ $LoopVar2 = "n" ] || [ $LoopVar2 = "N" ] #if user inputs n or N
  then
   echo "Thank you for running this script" #program exits
   exit 0
  else
   echo "Invalid choice. Run this script again." 
   #if user inputs something that is not y, Y, n, N
   exit 1
  fi

 #if grep doesn't find same exact login id
 else
  echo
  echo -n "Enter login id owner full name: " 
  read FullName
  #allow user to input id owner full name

  echo 
  echo "Please wait... checking all information..." #simple statement to show that its progressing
  echo

  #last entry in /etc/passwd
  echo "Last entry in /etc/passwd is as following..."
  cat /etc/passwd | tail -1 

  #adding 1 to UID of last line in /etc/passwd
  currentUID=$(cat /etc/passwd | cut -d: -f3 | tail -1)
  newUID=$(($currentUID + 1))
  echo "Next UID available is $newUID." 

 WhileNo="5" #variable for looping
 while [ $WhileNo = "5" ] #While variable is 5
 do
 
  #ask user if they want to use this UID
  echo -n "Would you like to use this number? (y/n): "
  read wantUID
  #if they do
  if [ $wantUID = "y" ] || [ $wantUID = "Y" ]
  then
   echo "Okay!"
    #check to see if same UID exists since its supposed to be unique
    cat /etc/passwd | cut -d: -f3 | grep $newUID >/dev/null 
    #if it's not unique and there is a match
    if [ $? -eq 0 ]
    then  
     echo "That UID already exists. Please try again"
     WhileNo="5" #loops around and asks again
    #if it is unique 
    else 
     WhileNo="6" #set variable so it exists loop
     echo "Thank you."
     myUID=$newUID
    fi #end UID check if else sequence
   myUID=$newUID #store result in variable for later use
   echo

  #if they dont
  elif [ $wantUID = "n" ] || [ $wantUID = "N" ]
  then
      echo -n "What number would you like to use? " #if they dont, ask what number they want
    read gimmeeUID
    #check to see if same UID exists since its supposed to be unique
    cat /etc/passwd | cut -d: -f3 | grep $gimmeeUID >/dev/null 
    #if it's not unique and there is a match
    if [ $? -eq 0 ]
    then  
     echo "That UID already exists. Please try again"
     WhileNo="5" #loops around and asks again
    #if it is unique 
    else 
     WhileNo="6" #set variable so it exists loop
     echo "Thank you."
     myUID=$gimmeeUID
    fi #end UID check if else sequence
  else #if invalid choice is given
   echo "Invalid choice. Run this script again."
   exit 1
  fi #end of if else statement of keeping UID
 done
  echo "Last entry in /etc/group is as following..."
  cat /etc/group | tail -1 #last line of /etc/group
  echo
  
  echo "Adding new information into /etc/passwd..."
  echo "Adding new information into /etc/group..."
  echo "Creating home directory /home/$loginid..."
  echo "Setting home directory to 755 permission..."
  echo "Setting ownership of home directory..."
  echo "Copying /etc/skel into home directory"
  useradd $loginid -c "$FullName, Scripting Course" -m -k /etc/skel -d /home/$loginid -u $myUID -s /bin/bash
  #useradd populates field in /etc/passwd, group, and also creates a home directory with skel directory files
  chmod 755 /home/$loginid
  #change permissions for newly created directory

  echo "Setting password for ID $loginid..."
  passwd $loginid #allows user to create password for new user
  echo "Creating $loginid id complete..."
  echo
  
  echo "Home directory is /home/$loginid"
  ls -l /home | grep $loginid
  echo "The user profile is shown below..."
  ls -al /home/$loginid/.profile 
  echo "Last entry in /etc/passwd is now as following..."
  cat /etc/passwd | tail -1
  echo "Last entry in /etc/group is now as following..."
  cat /etc/group | tail -1
  
  echo -n "Install another login id? (y/n): "
  read AgainRun
  if [ $AgainRun = "y" ] || [ $AgainRun = "Y" ]
  then
   LoopVar="y"
  elif [ $AgainRun = "n" ] || [ $AgainRun = "N" ]
  then
   echo "Thank you for running this script. Goodbye."
   exit 0
  else
   echo "Invalid choice. Goodbye."
   exit 1
  fi
 fi
done 