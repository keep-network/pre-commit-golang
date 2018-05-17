#!/bin/bash
#
# Capture and print stdout, since gofmt doesn't use proper exit codes
#
set -e -u -o pipefail # Fail on error

exec 5>&1
output="$(goimports -l -w "$@" | tee /dev/fd/5)"
[[ -z "$output" ]]
