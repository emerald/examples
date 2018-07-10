#!/usr/bin/env bash

set -euo pipefail

basepath="${1%.*}"

set +e
ec "${basepath}.m" \
  1> "${basepath}.ec.stdout" \
  2> "${basepath}.ec.stderr"
exitcode=$?
set -e
printf "%s\n" $exitcode > "${basepath}.ec.exitcode"
if [ $exitcode -ne 0 ]; then
  exit 0
fi

set +e
emx "${basepath}.x" \
  1> "${basepath}.emx.stdout" \
  2> "${basepath}.emx.stderr"
exitcode=$?
set -e
printf "%s\n" $exitcode > "${basepath}.emx.exitcode"
