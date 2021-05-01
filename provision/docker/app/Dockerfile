FROM golang:1.14.2-alpine

ARG stage
ARG GORELEASER_VERSION=0.140.0

LABEL NAME luismayta-hello_go-app-$stage

ENV USERNAME developer

ENV PACKAGES git \
        bash \
        curl \
        make \
        netcat-openbsd

# Set ENV variables
ENV REPO_URL=github.com/luismayta/hello_go
ENV GOPATH=/usr/src
env GO_VERSION=1.14.2
env BUILT_BY=$(whoami)-$(hostname)
ENV APP_PATH=${GOPATH}/${REPO_URL}
ENV WORK_PATH=${APP_PATH}

# Set working directory
WORKDIR ${WORK_PATH}

# Copy all the application files
COPY . .

RUN apk --no-cache add ${PACKAGES} \
    && curl -L https://github.com/goreleaser/goreleaser/releases/download/v${GORELEASER_VERSION}/goreleaser_Linux_x86_64.tar.gz | tar xz -C ./bin/ \
    # application
    && go mod download \
    && bin/goreleaser build --snapshot --rm-dist \
    && rm -rf  /var/cache/apk/*

# Expose port 8080 to the outside world
EXPOSE 8080

# Command to run the executable
CMD ["./dist/default_linux_amd64/core"]
