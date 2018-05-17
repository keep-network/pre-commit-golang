#!/bin/bash
#
# Capture and print stdout, since gofmt doesn't use proper exit codes
#
set -e -u -o pipefail # Fail on error

for file in "$@"; do
    output=$(goimports -w $file)
    [[ -z "$output" ]]
done
