#!/bin/bash

# This script will generate a .deb package

set -e

PACKAGE_VERSION=$(cat VERSION)
PACKAGE_PATH="deb/eset-mock_$PACKAGE_VERSION"

rm -rf deb

mkdir -p $PACKAGE_PATH/usr/local/bin

# Build binary
make
cp "./bin/esets_daemon" $PACKAGE_PATH/usr/local/

mkdir $PACKAGE_PATH/DEBIAN
cat > $PACKAGE_PATH/DEBIAN/control <<EOF 
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

mkdir -p $PACKAGE_PATH/etc/systemd/system
cat > $PACKAGE_PATH/etc/systemd/system/eset-nod32-mock.service <<EOF
[Unit]
Description=esets_daemon mock

[Service]
ExecStart=/usr/local/esets_daemon

[Install]
WantedBy=multi-user.target
EOF
chmod 664 $PACKAGE_PATH/etc/systemd/system/eset-nod32-mock.service

dpkg-deb --build $PACKAGE_PATH