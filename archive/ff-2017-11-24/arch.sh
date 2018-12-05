#!/bin/sh
#
# figure out architecture

set -e
arch=`uname -m`

case "$arch" in
    x86_64|amd64)
        arch=x86_64;;
    i*86)
	arch=i386;;
    arm*)
	arch=arm;;
    sparc|mips|mipsel);;
    *ppc)
        arch=ppc;;
    *)
	echo "unsupported architecture" 1>&2
	exit 1;;
esac

echo $arch
