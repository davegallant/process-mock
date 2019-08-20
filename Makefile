
BIN_NAME=esets_daemon

default: build

.PHONY: help
help:
	@echo 'Management commands for eset-mock:'
	@echo
	@echo 'Usage:'
	@echo '    make build           Compile the project.'
	@echo '    make clean           Clean the directory tree.'
	@echo

.PHONY: build
build:
	@echo "building ${BIN_NAME}"
	mkdir -p ./bin
	gcc -o ./bin/${BIN_NAME} main.c

.PHONY: clean
clean:
	@test ! -e bin/${BIN_NAME} || rm bin/${BIN_NAME}
