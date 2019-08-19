.PHONY: build build-alpine clean test help default

BIN_NAME=esets_daemon

GIT_COMMIT=$(shell git rev-parse HEAD)
GIT_DIRTY=$(shell test -n "`git status --porcelain`" && echo "+CHANGES" || true)

default: build

help:
	@echo 'Management commands for eset-mock:'
	@echo
	@echo 'Usage:'
	@echo '    make build           Compile the project.'
	@echo '    make clean           Clean the directory tree.'
	@echo

build:
	@echo "building ${BIN_NAME}"
	mkdir -p ./bin
	gcc -o ./bin/${BIN_NAME} main.c

clean:
	@test ! -e bin/${BIN_NAME} || rm bin/${BIN_NAME}