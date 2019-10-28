#!/bin/bash

echo 'y' | bosh -d paasta-pinpoint-monitoring deploy paata_pinpoint.yml\
     -o use-public-network.yml \
     -l pinpoint_property.yml\
     -l pem.yml
