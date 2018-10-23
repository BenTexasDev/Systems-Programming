#!/.../sed`
# produces a user ID file as described above. It does't have the $ in the output

#Delete the header lines with Username since it is not an ID.
#Its not effecient since it would delete any line that contains Username
#But in this case it works for a quick delete.
/Username/d

#Delete any line that ends with 2017.
/2017$/d


#print only the ID without using $
s/ .*$//


