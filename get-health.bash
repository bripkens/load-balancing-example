#!/bin/bash

set -eo pipefail

host="$1"
port="$2"

curl http://"$host":"$port"/health

echo
