#!/bin/sh

if [ -z $CODESPACES ]; then
	echo "Is not in CODESPACES"
	sh post-install.sh
else
	echo "Is in CODESPACES"
fi
