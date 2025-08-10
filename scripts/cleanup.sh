#!/usr/bin/env sh
# Removes a bunch of stuff and adds the IPs if missing.
# All empty lines, anything pointing to localhost, comments, trailing whitespaces, multiple spaces, tabs, etc. get removed.
# All domains should point to 127.0.0.1
# If any of the domains exist in the whitelist it's ignored.
# Once everything is clean the file gets sorted and any duplicate gets removed.
#

for file in "$@"; do
        [ ! -f "$file" ] && echo "$file does not exist" && continue

        # Remove comments, stuff pointing to localhost, whitespaces, tabs, etc.
        sed -i 's/#.*$//g;/^$/d;/localhost$/d;/::/d;/local$/d;/localdomain$/d;/broadcasthost$/d;/0.0.0.0$/d;/^[[:space:]]*$/d;s/[ \t]*$//g;s/^[ \t]*//g;s/[[:blank:]]/ /g;s/https\?:\/\///g;s/\/.*$//g;s/\?.*$//g' "$file"

        # All domains should point to 127.0.0.1
        ## Add it to all lines not starting with an IP address
        sed -i -r '/^([0-9]{1,3}\.){3}[0-9]{1,3} /! s/^/127.0.0.1 /' "$file"
        ## Replace all IPs with 127.0.0.1
        sed -i -r 's/^([0-9]{1,3}\.){3}[0-9]{1,3} /127.0.0.1 /g' "$file"
        ## Remove any lines pointing to an IP address, hosts file only works with domains or hostnames
        sed -i -r '/ ([0-9]{1,3}\.){3}[0-9]{1,3}$/d' "$file"
        ## Remove any lines that don't have a dot after the 127.0.0.1
        sed -i '/127\.0\.0\.1 [^ ]*\.[^ ]*/!d' "$file"

        # Remove multiple spaces and return lines (If anybody knows how to do this with sed please let me know)
        tr -s ' ' < "$file" | tr -d '\r' > "$file.tmp"

        # Remove any domain that exists in the whitelist
        grep -v -x -f ../whitelist "$file.tmp" > "$file.tmp2"

        # Remove duplicates
        sort -u -o "$file"_clean "$file.tmp2"

        # Remove the old files
        rm "$file.tmp" "$file.tmp2" "$file"
done
