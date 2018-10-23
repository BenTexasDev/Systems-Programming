#!/bin/bash

#bash file that runs awk scripts and sort. It should only contain two lines
#(the shebang line and the one line that invokes the awk/sort).
awk -f p3a.awk unsortedNames.txt | sort > lastSorted.out | awk -f p3a.awk lastSorted.out > p3a.out 
