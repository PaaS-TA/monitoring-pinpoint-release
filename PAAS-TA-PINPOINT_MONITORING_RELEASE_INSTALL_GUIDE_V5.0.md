
# PAAS-TA-PINPOINT-MONITORING-RELEASE Guide

## 1. Github Repository 및 src Package Download
```
  $ git clone https://github.com/PaaS-TA/PAAS-TA-PINPOINT-MONITORING-RELEASE.git
 
  $ cd PAAS-TA-PINPOINT-MONITORING-RELEASE

  $ mkdir src

  $ cd src
  
  $ wget -O paasta-pinpoint-src.zip http://45.248.73.44/index.php/s/yr9JK7efeYEXExZ/download

  $ tar xvf paasta-pinpoint-src.zip

  $ rm -rf paasta-pinpoint-src.zip
  
  $ cd ..
``` 


## 2. Pinpoint Cluster Configuration
- Hadoop master(=Hbase master) :: 1 machine
- Collector :: 1 machine(s)
- HAproxy webui ::  1 machine
- Webui :: 2 machine(s)
- Agent :: 1 machine(s)

### 3 Create & Upload Release
```
  $ sh create.s
```

## 4. deploy
```
  $ cd deployments

  $ sh deploy_pinpoint-{IaaS}.sh
