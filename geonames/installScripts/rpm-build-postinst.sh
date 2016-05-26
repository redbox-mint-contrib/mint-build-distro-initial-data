#!/usr/bin/env bash

if [ `whoami` != 'root' ];
        then echo "this script must be executed as root" && exit 1;
fi

ADMIN_INSTALL_HOME="/opt/mint"
RB_ADMIN_SERVER_ARGS='start'

exit_install() {
	if [ $# -gt 0 ]; then
		echo "ERROR: $@." >&2
	fi
	echo "ERROR: rpm post-install incomplete." >&2
	exit 1
}

log_function() {
 printf  -- "At function: %s...\n" $1
}

install_server() {
 echo 'finished installing'
}
getServerArgs() {
 if ps -efl | pgrep forever > /dev/null; then
  export RB_ADMIN_SERVER_ARGS='restart'
 fi
}

start_server() {
    log_function $FUNCNAME
    cd ${ADMIN_INSTALL_HOME} || exit_install "failed to change to install directory."
    getServerArgs
    service mint restart
}

install_server
start_server
