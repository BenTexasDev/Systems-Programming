#!/bin/bash

read -p "Email: " email
read -p "Payment Amount: $" amount

# If it exists then Customer exists, otherwise Customer not found
# Could use gt -0, if the customer is greater than 0/ equal to 1
if [ $(find ./Data -name "$email" |wc -l) -eq 1 ]; then 
        items=()
        while read line; do
            items+=( $line )
            done < Data/$email

        #Add amount to payment
        ((newBalance=${items[5]} + $amount))
        echo "$newBalance"
        echo ${items[@]:0:3}
        echo "${items[@]:3:2} $newBalance ${items[6]}"
    else
        echo -e "Error: customer not found\n"
fi

