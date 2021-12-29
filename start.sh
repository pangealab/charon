#!/usr/bin/env bash
# set -x

# Log
log() {
  echo "[$(date --rfc-3339=seconds)]: $*"
}

# Pin Container
pincontainer() {
	log "Pinning container"
	exec tail -f /dev/null
}

# Pin Container
pincontainer