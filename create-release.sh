#!/bin/bash

if [ -d ./.dev_builds ]; then
  echo "delete .dev_builds"
  rm -rf .dev_builds
fi

if [ -d ./dev_releases ]; then
  echo "delete dev_releases"
  rm -rf dev_releases
fi

if [ -f ./monitoring-pinpoint-release-5.8.1.tgz ]; then
  echo "delete monitoring-pinpoint-release-5.8.1.tgz"
  rm -rf monitoring-pinpoint-release-5.8.1.tgz
fi

#if [ -d ./blobs ]; then
#  echo "delete blobs"
#  rm -rf blobs
#fi
#

bosh create-release --force --tarball monitoring-pinpoint-release-5.8.1.tgz --name monitoring-pinpoint-release --version 5.8.1
