#!/bin/bash

set -ev

if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then
    DIR="$(pwd)"
    cd ..
    export SWIFT_VERSION=swift-5.2.5
    export SWIFT_RELEASE=${SWIFT_VERSION}-RELEASE
    export UBUNTU_VERSION=ubuntu20.04
    wget https://swift.org/builds/${SWIFT_VERSION}-release/ubuntu2004/${SWIFT_RELEASE}/${SWIFT_RELEASE}-${UBUNTU_VERSION}.tar.gz
    tar xzf ${SWIFT_RELEASE}-${UBUNTU_VERSION}.tar.gz
    export PATH="${PWD}/${SWIFT_RELEASE}-${UBUNTU_VERSION}/usr/bin:${PATH}"
    cd "$DIR"
fi
