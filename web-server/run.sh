#!/bin/bash

# parameters
SERVICENAME="ps-web"
IMAGENAME="apnex/planespotter-web-server:alpine"

# launch & persist
docker rm -v $(docker ps -qa -f name="${SERVICENAME}" -f status=exited) 2>/dev/null
RUNNING=$(docker ps -q -f name="${SERVICENAME}")
if [[ -z "$RUNNING" ]]; then
	printf "[${SERVICENAME}] not running - now starting\n" 1>&2
	docker run -d -P --net host \
		--name "${SERVICENAME}" \
		-e PLANESPOTTER_API_ENDPOINT="172.16.21.1" \
		-e TIMEOUT_REG="5" \
		-e TIMEOUT_OTHER="5" \
	"${IMAGENAME}"
fi
