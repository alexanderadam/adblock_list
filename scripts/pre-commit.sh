#!/usr/bin/env bash

if ! sh "scripts/sort_rules.sh"; then
  echo "Pre-commit hook failed. Aborting."
  exit 1
fi
