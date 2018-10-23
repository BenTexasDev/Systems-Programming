#!/bin/bash
# check for too few arguments, be careful of spacing
# bash file which causes all the steps to execute.
# It is passed a date (e.g., 10/01/2017)
# SHELL
if [ $# -lt 1 ]; then
    echo "        Where DATE is a date MM/DD/YYYY"
    echo "Usage: $0 DATE"
    exit 1
fi

# If that directory already exists, remove all of its contents; otherwise, create that directory.
date=$1 # Reading the date entered by the user
if [ -d Emails ];then
    echo "Emails directory already exists...Removing contents"
    rm -f Emails/* # Deletes the directory
else
    echo "Emails directory does not exist. Creating the directory.."
mkdir Emails # Creates the directory
fi


# Reading fields from p4Customer.txt
# AWK
while read line; do

    email=`echo $line|awk -F"," '{print $1}'` # command that moves the first field into email variable
    name=`echo $line|awk -F"," '{print $2}'`  # command that moves the second field into name (Full Name) 
    lastname=`echo -tail $name|awk '{print $NF}'` # command that takes the last field from the name (Last Name)(Extra Credit)
    title=`echo $line|awk -F"," '{print $3}'` # command that takes the third field into title (Title)
    owe=`echo $line|awk -F"," '{print $5}'`   # command that takes the fifth field into owe (Owe Amount)
    paid=`echo $line|awk -F"," '{print $4}'`  # command that takes the fourth field into paid (Paid Amount)

# if the owe amount is greater than the paid, then add that person to a result file.
# bc deals with real number comparison since bash only does integer comparison.
if (( $(echo "$owe > $paid"|bc -l) )); then

# The resulting email files should be named the same as the customer's email.
result_file="${email}.txt" 

# subsitute the following matches in template.txt with the printed awk variables from p4Customer.txt
# The generated emails will be placed in a subordinate directory named "Emails"
# SED
cat template.txt|sed -e "s/FULLNAME/$name/" -e "s/EMAIL/$email/" -e "s/TITLE/$title/" -e "s/NAME/$lastname/" -e "s/AMOUNT/$owe/" -e "s|DATE|$date|">Emails/$result_file
fi
done < p4Customer.txt # done < filename
