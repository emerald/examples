#!/usr/bin/env bash

set -euo pipefail

scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

"${scriptdir}/clean.sh"

dontrun="boring|dmandel|duska12"

for f in *.m
do
  if echo "$f" | egrep "^(${dontrun}).m$"; then
    continue
  fi
  echo "$f"
  "${scriptdir}/run.sh" "$f"
done
