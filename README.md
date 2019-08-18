# eset-nod32-mock

This project mocks the ESET NOD32 antivirus.

In Linux, this process often is installed in `/opt/eset/esets/sbin/esets_daemon`

## Building the binary

Requires `gcc` installed.

```bash
# build
make

# run
./bin/esets_daemon
```

## Building a Debian package

If you run debian-based Linux distro, a package can built.
The following instructions assume the binary exists (follow [#Building the binary](#Building-the-binary)).

```bash
cd deb/
# Build the .deb package:
./build.sh

# install the .deb package:
sudo dpkg -i esetnod32mock_1.0-1.deb

# start the process:
sudo systemctl start eset-nod32-mock

# enable the process upon boot:
sudo systemctl enable eset-nod32-mock

# check the status of the process:
sudo systemctl status eset-nod32-mock
```
