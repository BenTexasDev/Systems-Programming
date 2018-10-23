#!/bin/bash

read -p "Apartment number (format: APT-xx): APT-" apt

# Check if apartmnet exists in any other customer files
# Both test and the surrounding single brackets cause bash to invoke the test command
# Find matching customer in subdirectories(should not match substrings)
# If apt exists list the customer info in the result
# Condition is true if equal to 1 customer
if [ $(grep -rw "./Data" -e "$apt" | wc -l) -eq 1 ]; then
    filename=$(grep -rwl "./Data" -e "$apt") #r - recurse, w - word match, l - filenames that contain match
    items=()
while read -r line || [[ -n "$line" ]]; do # Deals with file that does not have \n at end to get last line
    items+=( $line )
    done < $filename

    #Print customer information using array
    echo -e "\n------Customer------"
    echo "Email:${items[0]}"
    echo "Name: ${items[1]}${items[2]}"
    echo "Apt: ${items[3]}"
    echo "Monthly Rent Amount:\$${items[4]}"
    echo -e "Next Due Date: ${items[6]}"
else
    echo -e "Error: apartment number not found\n" #Do nothing if apt doesnt exist
fi

