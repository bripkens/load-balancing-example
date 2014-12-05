#!/bin/bash

set -eo pipefail

docker build -t lb-app app/
docker build -t lb-nginx nginx/
