echo 'y' | bosh delete-deployment -d paasta-pinpoint-monitoring --force
echo 'y' | bosh delete-release paasta-pinpoint-monitoring-release

rm -r dev_releases
rm -r paasta-pinpoint-monitoring-release.tgz

sh create.sh
