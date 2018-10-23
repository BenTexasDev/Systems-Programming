#!/.../sed
# produces a user ID file as described above with a $ after the user
# IDs for a use as a pattern file

#Deletes the header line Username since it is not an ID.
#Its not effecient since it would delete any line that contains Username
#But in this case it works for a quick delete.
/Username/d

#Deletes any line that ends with 2017.
/2017$/d

#Prints ID only with a $ 
s/ .*$/$/g


