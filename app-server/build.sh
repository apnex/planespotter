#!/bin/bash

docker rmi -f apnex/planespotter-app-server:alpine 2>/dev/null
docker build --rm -t apnex/planespotter-app-server:alpine .

