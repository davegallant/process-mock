#!/bin/bash

# This script will generate a .deb package
# and must be run on a debian-based distro.

set -e

PACKAGE_VERSION="1.0-1"
PACKAGE_NAME="esetnod32mock_$PACKAGE_VERSION"

rm -rf ${PACKAGE_NAME:?}/*
rmdir $PACKAGE_NAME

mkdir -p $PACKAGE_NAME/usr/local/bin

# This requires the binary to be built
cp "../bin/esets_daemon" $PACKAGE_NAME/usr/local/

mkdir $PACKAGE_NAME/DEBIAN
cat > $PACKAGE_NAME/DEBIAN/control <<EOF 
Package: eset-nod32-mock
Version: $PACKAGE_VERSION
Section: base
Priority: optional
Architecture: amd64
Maintainer: Dave Gallant <davegallant@gmail.com>
Description: eset mock
 When you need some mockings, just run this
 small program!
EOF

mkdir -p $PACKAGE_NAME/etc/systemd/system
cat > $PACKAGE_NAME/etc/systemd/system/eset-nod32-mock.service <<EOF
[Unit]
Description=esets_daemon mock

[Service]
ExecStart=/usr/local/esets_daemon

[Install]
WantedBy=multi-user.target
EOF
chmod 664 $PACKAGE_NAME/etc/systemd/system/eset-nod32-mock.service

dpkg-deb --build $PACKAGE_NAME