# eset-nod32-mock

This project mocks the ESET NOD32 antivirus. In Linux, this process often resides in `/opt/eset/esets/sbin/esets_daemon`

## Building the binary

This project requires Go to be installed.

Running it then should be as simple as:

```bash
# build
make
# run
./bin/esets_daemon
```
