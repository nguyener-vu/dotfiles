#!/bin/sh

if [ -z $CODESPACES ]; then
	echo "Is not in CODESPACES"
	chmod +x post-install.sh
	sh post-install.sh
else
	echo "Is in CODESPACES"
fi
