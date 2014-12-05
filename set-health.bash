#!/bin/bash

set -eo pipefail

host="$1"
port="$2"
healthy="$3"

curl -X PUT \
     -d '{"healthy": '"$healthy"'}' \
     -H "Content-Type: application/json" \
     http://"$host":"$port"/health

echo
