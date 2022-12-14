#!/bin/bash

set -eu

source ./build/scripts/buildspecs.in

echo "${BOLD}Building ${PACKAGE} build environment ...${NC}"

if [ "$PLATFORM" == "TERMUX" ] || [ $(id -u) -eq 0 ]; then
	SUDO=""
else
	SUDO="sudo"
fi

if [ "$PLATFORM" == "TERMUX" ]; then
	PACKAGES+=""
else
	PACKAGES+="universal-ctags python3-pip tomcat9"
fi

$SUDO apt update && \
$SUDO apt install $PACKAGES

exit $?

#EOF
