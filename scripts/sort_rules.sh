#!/bin/sh

FILENAME="alexanderadam.txt"
SCRIPTNAME="$0"

run_linter() {
  if [ -f "node_modules/.bin/aglint" ]; then
    node_modules/.bin/aglint "$1"
  elif npx --version >/dev/null 2>&1; then
    npx aglint "$1"
  else
    echo "Warning: aglint not available, skipping lint check"
    echo "Run 'npm install' to enable linting"
    return 0
  fi
}

if git diff --cached --name-only | grep -qE "$FILENAME|$SCRIPTNAME"; then
  if ! run_linter "$FILENAME"; then
    echo "Linting failed. Aborting."
    exit 1
  fi

  awk 'BEGIN { header = 1 }
       /^[[:space:]]*$/ { next }
       header && /^[!]/ { print; next }
       header { header = 0; print ""; }
       !seen[$0]++ { lines[++count] = $0 }
       END {
         n = asort(lines, sorted_lines);
         for (i = 1; i <= n; i++) print sorted_lines[i]
       }' "$FILENAME" > temp

  if [ -s temp ]; then
    if grep -q "##.adsbygoogle" temp; then
      mv temp "$FILENAME"
      git add "$FILENAME"
    else
      echo "Error: temp file does not contain '##.adsbygoogle' which should make sure that rules are included. Aborting."
      echo "Please check the file manually:"
      echo "% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %"
      cat temp
      echo "% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %"
      rm temp
      exit 1
    fi
  else
    echo "Error: temp file is empty. Aborting."
    rm temp
    exit 1
  fi
fi
