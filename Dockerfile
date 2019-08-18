# Build Stage
FROM lacion/alpine-golang-buildimage:1.12.4 AS build-stage

LABEL app="build-eset-mock"
LABEL REPO="https://github.com/davegallant/eset-nod32-mock"

ENV PROJPATH=/go/src/github.com/davegallant/eset-mock

# Because of https://github.com/docker/docker/issues/14914
ENV PATH=$PATH:$GOROOT/bin:$GOPATH/bin

ADD . /go/src/github.com/davegallant/eset-mock
WORKDIR /go/src/github.com/davegallant/eset-mock

RUN make build-alpine

# Final Stage
FROM lacion/alpine-base-image:latest

ARG GIT_COMMIT
ARG VERSION
LABEL REPO="https://github.com/davegallant/eset-nod32-mock"
LABEL GIT_COMMIT=$GIT_COMMIT
LABEL VERSION=$VERSION

# Because of https://github.com/docker/docker/issues/14914
ENV PATH=$PATH:/opt/eset-mock/bin

WORKDIR /opt/eset-mock/bin

COPY --from=build-stage /go/src/github.com/davegallant/eset-mock/bin/eset-mock /opt/eset-mock/bin/
RUN chmod +x /opt/eset-mock/bin/eset-mock

# Create appuser
RUN adduser -D -g '' eset-mock
USER eset-mock

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["/opt/eset-mock/bin/esets_daemon"]
