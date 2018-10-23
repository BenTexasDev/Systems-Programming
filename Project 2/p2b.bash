#1/bin/bash
# bash file running Problem B.
# The final result should be placed in "p2b.out"
# This uses p2a.sed,sort,uniq, and p2b.sed

# p2a.sed will combine the 2 log files into 1, togetherLog.out 
cat lastlog1.out lastlog2.out > togetherLog.out

# p2a.sed will edit togetherLog.out
# It will print the users who havent logged on/haven't logged on in 2017.(ID only), allID.out
sed -f p2a.sed togetherLog.out > allID.out

# This will sort the ID's from both files and get a count of each unique value,
# In lastlogID.out there will be a count for how many times an ID was matched.
sort allID.out | uniq -c > lastlogID.out

# p2b.sed will remove text lines containing 1 for the count from lastlogID.out
# It will also remove the count values of 2 to leave just the IDs.
sed -f p2b.sed lastlogID.out > p2b.out

#Used this script to check if both files match
#sort p2b.out > p2bsort.out
#sort p2a.out > p2asort.out
#diff -s p2bsort.out p2asort.out > match.out
