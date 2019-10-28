bosh create-release --force --tarball paasta-pinpoint-monitoring-release.tgz --name paasta-pinpoint-monitoring-release --version 1.1

bosh ur paasta-pinpoint-monitoring-release.tgz
