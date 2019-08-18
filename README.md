# eset-nod32-mock

This project mocks the ESET NOD32 antivirus.

In Linux, this process is often in `/opt/eset/esets/sbin/esets_daemon`

## Building the binary

Requires `gcc`.

```bash
# build
make

# run
./bin/esets_daemon
```

## Building a Debian package

If you run debian-based Linux distro, a debian package can be built:

```bash
# build the .deb package
./build_debian.sh

# install the .deb package
sudo dpkg -i deb/eset-mock_$(cat VERSION).deb

# start the process
sudo systemctl start eset-nod32-mock

# check the status of the process
sudo systemctl status eset-nod32-mock

# enable the process upon boot
sudo systemctl enable eset-nod32-mock
```
