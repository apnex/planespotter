#!/bin/bash
docker rmi -f apnex/planespotter-web-server:alpine 2>/dev/null
docker build --rm -t apnex/planespotter-web-server:alpine .
