SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

BIN_NAME ?= esets_daemon
DIST ?= dist

default: build

## help: Display usage
help:
	@echo 'Usage:'
	@echo
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /' | sort
	@echo
.PHONY: help

## build: Compile the project
build:
	@echo "building ${BIN_NAME}"
	mkdir -p ./$(DIST)
	gcc -o ./$(DIST)/${BIN_NAME} main.c
.PHONY: build

## install: Enable as a systemd service
install: build
	@echo "installing ${BIN_NAME}"
	mkdir -p $(HOME)/.config/systemd/user
	mkdir -p $(HOME)/.local/bin
	cp ./.config/systemd/user/eset-nod32-mock.service $(HOME)/.config/systemd/user
	cp ./$(DIST)/$(BIN_NAME) $(HOME)/.local/bin/
	systemctl --user daemon-reload
	systemctl enable --user eset-nod32-mock.service
	systemctl start --user eset-nod32-mock.service
.PHONY: install

## uninstall: Remove all traces from system
uninstall:
	@echo "uninstalling ${BIN_NAME}"
	mkdir -p $(HOME)/.config/systemd/user
	mkdir -p $(HOME)/.local/bin
	rm -f $(HOME)/.config/systemd/user/eset-nod32-mock.service
	rm -f $(HOME)/.local/bin/$(BIN_NAME)
	systemctl disable --user eset-nod32-mock.service
	systemctl stop --user eset-nod32-mock.service
.PHONY: uninstall
