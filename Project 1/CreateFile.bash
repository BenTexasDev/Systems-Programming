#!/bin/bash
# this reads from stdin
read -p "Email:" email
read -p "Full Name (First Last):" firstname lastname
read -p "Apt: APT-" apt
read -p "Monthly Rent Amount: $" monthlyrent
read -p "Next Due Date:" duedate
balance=0 #Default account balance to zero

#See if customer exists
if [ $(find ./Data -name "$email" | wc -l) -eq 1 ]; then 
    echo "Error: customer already exists" #Do nothing if exists
else

#Create Customer File
echo "Creating Customer File.."
echo "$email $firstname $lastname" >Data/$email # Redirect to file in sub Data
echo "APT-$apt $monthlyrent $balance $duedate" >>Data/$email # Appent to redirected file in sub Data

#Print New Created Customer
echo -e "\n------New Customer------"
echo "$email $firstname $lastname"
echo -e "$apt $monthlyrent $balance $duedate\n"

fi

