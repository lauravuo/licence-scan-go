#!/bin/sh

# We don't want to check error return values by our self here.
set -e

tmpfile=$(mktemp /tmp/lichen-scan.XXXXXX)

go build -o "$tmpfile" .

# subscript does the scanning and cleanup
/lichen.sh "$tmpfile" "$@"