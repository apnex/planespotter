#!/bin/bash
docker rmi -f apnex/adsb-sync:slim 2>/dev/null
docker build --rm -t apnex/adsb-sync:slim .
