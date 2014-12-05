#!/bin/bash

set -eo pipefail

docker run -d --name lb-app lb-app
docker run -d --link=lb-app:app -p 8080:80 --name lb-nginx lb-nginx
