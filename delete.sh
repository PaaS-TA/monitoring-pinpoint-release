echo 'y' | bosh delete-deployment -d paasta-pinpoint-monitoring --force
echo 'y' | bosh delete-release paasta-pinpoint-monitoring-release
