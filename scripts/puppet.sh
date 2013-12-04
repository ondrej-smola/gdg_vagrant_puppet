#!/usr/bin/env bash
set -e

if [ "$EUID" -ne "0" ] ; then
        echo "Script must be run as root." >&2
        exit 1
fi

if which puppet > /dev/null ; then
        echo "Puppet is already installed"
        exit 0
fi

echo "Installing Puppet repo for Debian wheezy"
wget -qO /tmp/puppetlabs-release-wheezy.deb https://apt.puppetlabs.com/puppetlabs-release-wheezy.deb
dpkg -i /tmp/puppetlabs-release-wheezy.deb

rm /tmp/puppetlabs-release-wheezy.deb
apt-get update
echo "Installing puppet"
apt-get install -y puppet
echo "Puppet installed!"
