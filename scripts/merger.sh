#!/usr/bin/env sh
# Merges all files given as parameters with the main one. Once merged it removes all duplicates and sorts the list.
# Should be run after cleaning the lists with cleanup.sh. To merge only clean files run it like this:
## sh merger.sh "*_clean"
#

# If no parameters given exit
[ $# -eq 0 ] && exit

# Remove temp file from previous runs if needed
rm -f merged.tmp

# Check that all parameters are existing files
for file in "$@"; do
	[ ! -f "$file" ] && echo "$file does not exist. Exiting..." && exit
done

# Merge all files into one
cat "$@" ../hosts* > merged.tmp

# Remove the old lists
rm -f ../hosts*

# Remove duplicates
sort -u -o merged merged.tmp

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
rm -- merged.tmp *_clean
