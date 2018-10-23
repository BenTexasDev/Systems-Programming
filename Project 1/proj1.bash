#!/bin/bash


go=0
while [ $go ]; do
# Display Menu
echo "Enter one of the following actions or press CTRL-D to exit."
echo "C - create a customer file"
echo "P - accept a customer payment"
echo "F - find customer by apartment number"
# Read each action if it exists
if ! read action; then
    break;
fi
# Created exCase
case "$action" in
    [Cc]) ./CreateFile.bash;; # Run CreateFile.bash
    [Pp]) ./Payment.bash;; # Run Payment.bash
    [Ff]) ./Find.bash;; # Run Find.bash
    *) echo "Error: invalid action value\n";; # Redisplay menu

    esac
done
