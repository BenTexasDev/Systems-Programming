#Bash file for running problem A

# p2a.sed will edit lastlog1 and print out only user ID's to id.out
# It contains ID's of users who haven't logged on/logged on in 2017.
sed -f p2a.sed lastlog1.out > id.out

# p2aDollar.sed will edit lastlog2 and print out only user ID's with a $ to idDollar.out
# It contains ID's of users who havent logged on/logged on in 2017 with a printed $.
sed -f p2aDollar.sed lastlog2.out > idDollar.out

# grep -f will find the intersection of the 2 files
# The intersection of those result files gives us the people who didn't log into both of those servers during
# the desired time.
grep -f idDollar.out id.out > p2a.out
