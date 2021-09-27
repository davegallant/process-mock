# process-mock

This project mocks the ESET NOD32 antivirus. 

In Linux, the eset daemon is `/opt/eset/esets/sbin/esets_daemon`.

This can be used as a template to mock any process that is expected to be running.

## Install

Requires `gcc` and `systemd`.

```shell
make install
```

## Uninstall

```shell
make uninstall
```
