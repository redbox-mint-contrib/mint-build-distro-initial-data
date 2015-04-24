#!/usr/bin/env bash

if [ `whoami` != 'root' ];
        then echo "this script must be executed as root" && exit 1;
fi

ADMIN_INSTALL_HOME="/opt/mint"

exit_install() {
	if [ $# -gt 0 ]; then
		echo "ERROR: $@." >&2
	fi
	echo "ERROR: rpm pre-install incomplete." >&2
	exit 1
}

log_function() {
 printf  -- "At function: %s...\n" $1
}

stop_server() {
    log_function $FUNCNAME
    ## Added a directory check since in fresh installs, this directory doesn't exist.
    if [ -d ${ADMIN_INSTALL_HOME} ]; then
      service mint stop
      rm -Rf ${ADMIN_INSTALL_HOME}/storage
      rm -Rf ${ADMIN_INSTALL_HOME}/solr/indexes/fascinator/index
    fi
}

stop_server
