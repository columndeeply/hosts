#!/usr/bin/env sh
# Removes any domains it finds on the whitelist
#

# Remove temp file from previous runs if needed
rm -f merged.tmp

# Merge all files into one
cat ../hosts* > merged.tmp

# Remove the old lists
rm -f ../hosts*

# Remove duplicates
sort < merged.tmp | uniq > merged
sort < ../whitelist | uniq > whitelist
mv whitelist ../whitelist

# Check whitelist and remove matches
comm -2 -3 merged ../whitelist > merged2
mv merged2 merged

# Split the merged file into 90MB chunks to avoid GitHub's limit
split merged hosts -C 90MB -d

# Move the new hosts files and the merged list to the parent directory
mv hosts* ..
mv merged ..

# Show how many changes in total
git diff --stat ../hosts*

# Remove tmp files
rm -- merged.tmp
