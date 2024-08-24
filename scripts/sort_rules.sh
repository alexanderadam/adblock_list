#!/bin/sh

FILENAME="alexanderadam.txt"

if git diff --cached --name-only | grep -q "$FILENAME"; then
  awk 'BEGIN { header = 1 }
       /^[[:space:]]*$/ { header = 0 }
       header { print; next }
       /^[\[!]/ { print; next }
       { lines[$0] }
       END {
         n = asort(lines, sorted_lines);
         for (i = 1; i <= n; i++) print sorted_lines[i]
       }' "$FILENAME" > temp && mv temp "$FILENAME"
  git add "$FILENAME"
fi
