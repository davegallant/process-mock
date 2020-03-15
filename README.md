# eset-nod32-mock

This project mocks the ESET NOD32 antivirus. But could be used as a template to mock any process that is supposed to be running.

In Linux, this process is often in `/opt/eset/esets/sbin/esets_daemon`

## Install

Requires `gcc` and `systemd`.

```shell
make install
```

## Uninstall

```shell
make uninstall
```
