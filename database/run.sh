#!/bin/bash

# parameters
SERVICENAME="ps-sql"
IMAGENAME="mysql:8.0.21"

# launch & persist
docker rm -v $(docker ps -qa -f name="${SERVICENAME}" -f status=exited) 2>/dev/null
RUNNING=$(docker ps -q -f name="${SERVICENAME}")
if [[ -z "$RUNNING" ]]; then
	printf "[${SERVICENAME}] not running - now starting\n" 1>&2
	docker run -d -P --net host \
		--name "${SERVICENAME}" \
		-e MYSQL_ROOT_PASSWORD="password" \
		-e TIMEOUT_REG="5" \
		-e TIMEOUT_OTHER="5" \
	"${IMAGENAME}"
fi
