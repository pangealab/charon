#!/usr/bin/env bash
# set -x

# Set Lock
LOCKFILE=/var/lib/postgresql/data/configured.lock

# Log
log() {
  echo "[$(date --rfc-3339=seconds)]: $*"
}

# Configure
configure() {

  if [ ! -e $LOCKFILE ]; then

    log "Configuring Database"

    # Delete 'main' DB
	rm -rf /var/lib/postgresql/14

	# Set Database Folder Ownership
	chown -R postgres:postgres /var/lib/postgresql/data

	# Edit DB config
	sed -i -e "s|/var/lib/postgresql/14/main|/var/lib/postgresql/data/pgsql|g" /etc/postgresql/14/main/postgresql.conf

	# Create new Database
	sudo -u postgres /usr/lib/postgresql/14/bin/initdb -D /var/lib/postgresql/data/pgsql

	# Start Database
	service postgresql start	

    # Set the lock
    touch $LOCKFILE

    log "Database configured"
  else
	log "Database already configured"
  fi
  return 0

} 

# Pin Container
pincontainer() {
	log "Pinning container"
	exec tail -f /dev/null
}

# Start All
configure
pincontainer