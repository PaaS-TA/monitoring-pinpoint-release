bosh create-release --force --tarball paasta-pinpoint-monitoring-release.tgz --name paasta-pinpoint-monitoring-release --version 1.2

bosh ur paasta-pinpoint-monitoring-release.tgz
