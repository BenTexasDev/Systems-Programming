#!/.../sed
# removes text lines containing 1 for the count.
# It also removes the count values of 2 to leave just the user IDs.

# removes text lines containing 1 for the count
# Delete lines that could preceed by a combination of spaces and tabs*

/^[ \t]*1/d

# Delete the count 2.
# Could be preceded by a combination of spaces and tabs.

s/^[ \t]*2//

# Deletes any preceding tabs or spaces from the IDs (Just in case)
# Used diff to match p2b.out and p2a.out to see if they had the same content
# They matched.

s/^[ \t]*//
