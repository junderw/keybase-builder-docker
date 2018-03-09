FROM golang:1.9

MAINTAINER Jonathan Underwood

# Need nodejs, yarn, rsync
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs rsync build-essential libc6-dev-i386
RUN npm install -g yarn

# Clone git repositories
# $GOPATH is /go

# We need kbfs
RUN mkdir -p /go/src/github.com/keybase/kbfs
RUN git clone https://github.com/keybase/kbfs.git /go/src/github.com/keybase/kbfs

# We need client
RUN mkdir -p /go/src/github.com/keybase/client
RUN git clone https://github.com/keybase/client.git /go/src/github.com/keybase/client

WORKDIR /go/src/github.com/keybase/client/packaging/linux
RUN KEYBASE_SKIP_32_BIT=1 ./build_binaries.sh prerelease /root/build

WORKDIR /root
COPY runme.sh /root/newbuild
RUN chmod a+x /root/newbuild
