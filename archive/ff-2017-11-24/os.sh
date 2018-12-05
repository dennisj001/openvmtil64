#!/bin/sh
#
# figure out operating system

set -e
os=`uname -s`

case "$os" in
    Linux)
	os=linux;;
    FreeBSD)
	os=freebsd;;
    NetBSD)
	os=netbsd;;
    OpenBSD)
	os=openbsd;;
    Darwin)
        os=darwin;;
    *)
	echo "unsupported operating system" 1>&2
	exit 1;;
esac

echo $os
