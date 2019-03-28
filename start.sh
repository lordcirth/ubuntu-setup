#!/bin/bash
set -e -v

if [ "$USER" == "root" ]; then
	echo "Don't run this as root, it will call sudo as needed"
	exit 1
fi

DIST_NUMBER="18.04"
DIST_NAME="bionic"
SALT_KEY="https://repo.saltstack.com/py3/ubuntu/$DIST_NUMBER/amd64/latest/SALTSTACK-GPG-KEY.pub"
SALT_REPO="deb http://repo.saltstack.com/py3/ubuntu/$DIST_NUMBER/amd64/latest $DIST_NAME main"
SCRIPT_DIR="$(dirname $(readlink -f $0))"
GIT_REPO="https://github.com/lordcirth/ubuntu-setup.git"

if ! which wget; then
	sudo apt install wget -yq
fi


if ! which salt-minion; then
	# Latest stable Python 3 Salt
	wget -q -O - $SALT_KEY | sudo apt-key add -
	echo "$SALT_REPO" | sudo tee /etc/apt/sources.list.d/salt.list

	# We don't want to connect to a salt-master
	sudo mkdir -p /etc/salt/
	sudo cp "$SCRIPT_DIR/minion" /etc/salt/minion
	sudo apt install -yq salt-minion
fi

#mkdir -p ~/gitRepos/
#git clone "$GIT_REPO" ~/gitRepos/ubuntu-setup
mkdir -p /srv/saltstack/states
mkdir -p /srv/saltstack/pillar

sudo cp "$SCRIPT_DIR/states" /srv/saltstack/states
