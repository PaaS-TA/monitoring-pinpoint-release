# PAAS-TA-PINPOINT-MONITORING-RELEASE Guide

## file download
###1. src

>`$ git clone https://github.com/PaaS-TA/PAAS-TA-PINPOINT-MONITORING-RELEASE.git`
 
>`$ cd PAAS-TA-PINPOINT-MONITORING-RELEASE`

>`$ mkdir src`

>`$ cd src`
  
>`$ wget -O paasta-pinpoint-src.zip http://45.248.73.44/index.php/s/yr9JK7efeYEXExZ/download`

>`$ tar xvf paasta-pinpoint-src.zip`

>`$ rm -rf paasta-pinpoint-src.zip`
 

>`$ cd ..`


##1. Pinpoint Cluster Configuration
- Hadoop master(=Hbase master) :: 1 machine
- Collector :: N machine(s)
- HAproxy webui ::  1 machine
- Webui :: N machine(s)
- Agent :: N machine(s)

##2. Create & Upload Release
>`sh create.sh`

##3. deploy
>`$ cd deployments/`

>`$ sh deploy_pinpoint-{IaaS}.sh`
