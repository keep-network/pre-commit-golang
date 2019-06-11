#!/bin/bash
set -e -u -o pipefail # Fail on error

gitroot=$(git rev-parse --show-toplevel)

GOPATH=${GOPATH:-}:$gitroot

cd $gitroot

pkg=$(go list)
for dir in $(echo $@|xargs -n1 dirname|sort -u); do
  go vet $pkg/$dir
done
