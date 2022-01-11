#!/bin/bash

if [ -d ./.dev_builds ]; then
  echo "Delete .dev_builds folder."
  rm -rf .dev_builds
fi

if [ -d ./dev_releases ]; then
  echo "Delete dev_releases folder."
  rm -rf dev_releases
fi

if [ -f ./paasta-pinpoint-monitoring-release-1.2.tgz ]; then
  echo "Delete paasta-pinpoint-monitoring-release-1.2.tgz file."
  rm -rf paasta-pinpoint-monitoring-release-1.2.tgz
fi

bosh create-release --force --tarball paasta-pinpoint-monitoring-release-1.2.tgz --name paasta-pinpoint-monitoring-release --version 1.2
