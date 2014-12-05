#!/bin/bash

set -eo pipefail

# Preprend the upstream configuration
echo "upstream app { server $APP_PORT_80_TCP_ADDR:$APP_PORT_80_TCP_PORT; }" > /etc/nginx/conf.d/proxy.conf
cat proxy.conf.part2 >> /etc/nginx/conf.d/proxy.conf

# Log the resulting configuration file
cat /etc/nginx/conf.d/proxy.conf

# Start nginx
nginx -g "daemon off;"
