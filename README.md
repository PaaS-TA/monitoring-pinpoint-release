# Related Repositories
<table>
  <tr>
    <td colspan=2 align=center>플랫폼</td>
    <td colspan=2 align=center><a href="https://github.com/PaaS-TA/paasta-deployment">어플리케이션 플랫폼</a></td>
    <td colspan=2 align=center><a href="need_change">컨테이너 플랫폼</a></td>
  </tr>
  <tr>
    <td colspan=2 rowspan=2 align=center>포털</td>
    <td colspan=2 align=center><a href="https://github.com/PaaS-TA/portal-deployment">AP 포털</a></td>
    <td colspan=2 align=center><a href="need_change">CP 포털</a></td>
  </tr>
  <tr align=center>
    <td colspan=4><a href="https://github.com/PaaS-TA/PaaS-TA-Monitoring">모니터링 대시보드</a></td>
  </tr>
  <tr align=center>
    <td rowspan=2 colspan=2><a href="https://github.com/PaaS-TA/monitoring-deployment">모니터링</a></td>
    <td><a href="https://github.com/PaaS-TA/PaaS-TA-Monitoring-Release">Monitoring Release</a></td>
    <td><a href="https://github.com/PaaS-TA/paas-ta-monitoring-logsearch-release">Logsearch Release</a></td>
    <td><a href="https://github.com/PaaS-TA/paas-ta-monitoring-influxdb-release">InfluxDB Release</a></td>
    <td><a href="https://github.com/PaaS-TA/paas-ta-monitoring-redis-release">Redis Release</a></td>
  </tr>
  <tr align=center>
    <td>🚩<a href="https://github.com/PaaS-TA/PAAS-TA-PINPOINT-MONITORING-RELEASE">Pinpoint Release</td>
    <td><a href="https://github.com/PaaS-TA/PAAS-TA-PINPOINT-MONITORING-BUILDPACK">Pinpoint Buildpack</td>
    <td></td>
    <td></td>
  </tr>
  </tr>
  <tr align=center>
    <td rowspan=4 colspan=2><a href="https://github.com/PaaS-TA/service-deployment">AP 서비스</a></td>
    <td><a href="https://github.com/PaaS-TA/PAAS-TA-CUBRID-RELEASE">Cubrid Release</a></td>
    <td><a href="https://github.com/PaaS-TA/PAAS-TA-API-GATEWAY-SERVICE-RELEASE">Gateway Release</a></td>
    <td><a href="https://github.com/PaaS-TA/PAAS-TA-GLUSTERFS-RELEASE">GlusterFS Release</a></td>
    <td><a href="https://github.com/PaaS-TA/PAAS-TA-APP-LIFECYCLE-SERVICE-RELEASE">Lifecycle Release</a></td>
  </tr>
  <tr align=center>
    <td><a href="https://github.com/PaaS-TA/PAAS-TA-LOGGING-SERVICE-RELEASE">Logging Release</a></td>
    <td><a href="https://github.com/PaaS-TA/PAAS-TA-MONGODB-SHARD-RELEASE">MongoDB Release</a></td>
    <td><a href="https://github.com/PaaS-TA/PAAS-TA-MYSQL-RELEASE">MySQL Release</a></td>
    <td><a href="https://github.com/PaaS-TA/PAAS-TA-PINPOINT-RELEASE">Pinpoint APM Release</a></td>
  </tr>
  <tr align=center>
    <td><a href="https://github.com/PaaS-TA/PAAS-TA-DELIVERY-PIPELINE-RELEASE">Pipeline Release</a></td>
    <td align=center><a href="https://github.com/PaaS-TA/rabbitmq-release">RabbitMQ Release</a></td>
    <td><a href="https://github.com/PaaS-TA/PAAS-TA-ON-DEMAND-REDIS-RELEASE">Redis Release</a></td>
    <td><a href="https://github.com/PaaS-TA/PAAS-TA-SOURCE-CONTROL-RELEASE">Source Control Release</a></td>
  </tr>
  <tr align=center>
    <td><a href="https://github.com/PaaS-TA/PAAS-TA-WEB-IDE-RELEASE-NEW">WEB-IDE Release</a></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr align=center>
    <td rowspan=1 colspan=2><a href="https://github.com/PaaS-TA/service-deployment">CP 서비스</a></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
</table>
<i>*🚩─ You are here.</i>

## Table of Contents
1. [문서 개요](#1)
  - 1.1. [목적](#11)
  - 1.2. [범위](#12)
  - 1.3. [시스템 구성도](#13)
  - 1.4. [참고자료](#14)
2. [Pinpoint 서비스팩 설치](#2)
  - 2.1. [설치전 준비사항](#21)
  - 2.2. [Pinpoint 릴리즈 생성하기](#22)
  - 2.3. [Pinpoint 서비스 릴리즈 업로드](#23)
  - 2.4. [Pinpoint 서비스 Deployment 파일 수정 및 배포](#24)
  - 2.5. [Pinpoint security-group 등록](#25)
  - 2.6. [Pinpoint 서비스 브로커 등록](#26)
3. [Sample Web App 연동 Pinpoint 연동](#3)
  - 3.1. [Sample Web App 구조](#31)
  - 3.2. [Sample Web App에 서비스 바인드 신청 및 App 확인](#32)

# <div id='1'> 1. 문서 개요
### <div id='11'> 1.1. 목적

본 문서(SaaS Monitoring Pinpoint 서비스팩 설치 가이드)는 전자정부표준프레임워크 기반의 PaaS-TA에서 제공되는 서비스팩인 Pinpoint 서비스팩을 Bosh2.0을 이용하여 설치 하는 방법과 PaaS-TA의 SaaS 형태로 제공하는 Application 에서 Pinpoint 서비스를 사용하는 방법을 기술하였다.
PaaS-TA 3.5 버전부터는 Bosh2.0 기반으로 deploy를 진행하며 기존 Bosh1.0 기반으로 설치를 원할경우에는 PaaS-TA 3.1 이하 버전의 문서를 참고한다.

### <div id='12'> 1.2. 범위
설치 범위는 Pinpoint 서비스팩을 검증하기 위한 기본 설치를 기준으로 작성하였다.

### <div id='13'> 1.3. 시스템 구성도

본 문서의 설치된 시스템 구성도입니다. Pinpoint Server, HBase의 HBase Master, Collector , WebUI2로 최소사항을 구성하였다. 

![시스템구성도][pinpoint_image_01]

<table>
  <tr>
    <th>구분</th>
    <th>Resource Pool</th>
    <th>스펙</th>
  </tr>
  <tr>
  <td>collector      </td><td>pinpoint\_medium</td><td>2vCPU / 2GB RAM / 8GB Disk</td>
  </tr>
  <td>h_master      </td><td>pinpoint\_medium</td><td>2vCPU / 2GB RAM / 8GB Disk</td>
  </tr>
  <tr>
  <td>haproxy_webui </td><td>services-small </td><td>1vCPU / 1GB RAM / 4GB Disk</td>
  </tr>
  <tr>
  <td>pinpoint_web          </0><td>services-small </td><td>1vCPU / 1GB RAM / 4GB Disk</td>
  </tr>
</table>

### <div id='14'> 1.4. 참고자료
[**http://bosh.io/docs**](http://bosh.io/docs)  
[**http://docs.cloudfoundry.org/**](http://docs.cloudfoundry.org/)

# <div id='2'> 2. Pinpoint 서비스팩 설치

### <div id='21'> 2.1. 설치전 준비사항

본 설치 가이드는 Linux 환경에서 설치하는 것을 기준으로 하였다.
서비스팩 설치를 위해서는 먼저 BOSH CLI v2 가 설치 되어 있어야 하고 BOSH 에 로그인이 되어 있어야 한다.<br>
BOSH CLI v2 가 설치 되어 있지 않을 경우 먼저 BOSH2.0 설치 가이드 문서를 참고 하여 BOSH CLI v2를 설치를 하고 사용법을 숙지 해야 한다.<br>

- BOSH2.0 사용자 가이드
>BOSH2 사용자 가이드 : **<https://github.com/PaaS-TA/Guide-4.0-ROTELLE/blob/master/PaaS-TA_BOSH2_사용자_가이드v1.0.md>**

>BOSH CLI V2 사용자 가이드 : **<https://github.com/PaaS-TA/Guide-4.0-ROTELLE/blob/master/Use-Guide/Bosh/PaaS-TA_BOSH_CLI_V2_사용자_가이드v1.0.md>**

- PaaS-TA에서 제공하는 압축된 릴리즈 파일들을 다운받는다. (PaaSTA-Deployment.zip, PaaSTA-Sample-Apps.zip, PaaSTA-Services.zip)

- 다운로드 위치
>Download : **<https://paas-ta.kr/download/package>**

또한 Pinpoint 서비스팩 사용을 위해서는 Pinpoint 빌드팩 등록 작업이 선행되어야 하며, 다음 문서를 참고하여 빌드팩 등록 작업을 수행할 수 있다.
>PaaS-TA Pinpoint Monitoring Buildpack Guide : **<https://github.com/PaaS-TA/PAAS-TA-PINPOINT-MONITORING-BUILDPACK>**

### <div id='22'> 2.2. Pinpoint 릴리즈 생성하기

- Github Repository clone 및 src 다운로드
```
 $ git clone https://github.com/PaaS-TA/PAAS-TA-PINPOINT-MONITORING-RELEASE.git
 
 $ cd PAAS-TA-PINPOINT-MONITORING-RELEASE
 
 $ wget -O src.zip https://nextcloud.paas-ta.org/index.php/s/iEkZoqF7LQftMFo/download
 
 $ unzip src.zip
 
 $ rm src.zip
 ```

- 릴리즈 생성하는 쉘 스크립트 실행
```
 $ sh create.sh
``` 

### <div id='23'> 2.3. paasta-pinpoint-monitoring-release 서비스 릴리즈 업로드

-	업로드 되어 있는 릴리즈 목록을 확인한다.

- **사용 예시**

		$ bosh -e micro-bosh releases
		Using environment '10.0.1.6' as client 'admin'

		Name                                       Version    Commit Hash  
		binary-buildpack                           1.0.32*    2399a07  
		bosh-dns                                   1.12.0*    5d607ed  
		bosh-dns-aliases                           0.0.3*     eca9c5a  
		bpm                                        1.1.0*     27e1c8f  
		~                                          1.0.4*     420dc51  
		capi                                       1.82.0*    123bb4c  
		cf-cli                                     1.16.0*    05d9348  
		cf-networking                              2.22.0*    b6e87aeb  
		cf-smoke-tests                             40.0.108*  22ec7a9  
		cf-syslog-drain                            10.2*      684147e  
		cfcr-etcd                                  1.11.1*    d398cd0  
		cflinuxfs3                                 0.96.0*    c6d6f88  
		credhub                                    2.4.0*     7d6110b+  
		diego                                      2.31.0*    728880441+  
		docker                                     35.2.1*    0b69b44  
		dotnet-core-buildpack                      2.2.11*    6a746c2  
		empty-java-release                         1.0*       e8c1477+  
		garden-runc                                1.19.2*    9d00b9d+  
		go-buildpack                               1.8.39*    11a1d25  
		haproxy                                    9.6.0*     3a9b189  
		influxdb                                   1.5.1*     non-git  
		java-buildpack                             4.19*      d6a7949  
		kubo                                       0.34.1*    non-git  
		log-cache                                  2.2.2*     0a03032  
		loggregator                                105.5*     d5153da3  
		loggregator-agent                          3.9*       d344140  
		logsearch                                  209.0.1*   b7bb8e7  
		logsearch-for-cloudfoundry                 207.0.1*   8598207  
		nats                                       27*        bf8cb86  
		nginx-buildpack                            1.0.11*    1c7d690  
		nodejs-buildpack                           1.6.49*    d013a42  
		paasta-container-service-projects-release  1.0*       ced4610+  
		paasta-monitoring                          4.0*       non-git  
		paasta-monitoring-agent                    4.0*       non-git  
		php-buildpack                              4.3.76*    c98344f  
		postgres                                   37*        98ed910  
		pxc                                        0.17.0*    d673b2a  
		python-buildpack                           1.6.32*    af43eb3  
		r-buildpack                                1.0.9*     9145ed1  
		redis                                      14.0.1*    96f111b  
		routing                                    0.188.0*   db449e4  
		ruby-buildpack                             1.7.38*    36a39f1  
		silk                                       2.22.0*    4691b7b  
		staticfile-buildpack                       1.4.42*    22e3fc4  
		statsd-injector                            1.10.0*    b81ab23  
		syslog                                     11.4.0*    feedfa7  
		uaa                                        72.0*      804589c  

		(*) Currently deployed
		(+) Uncommitted changes

		48 releases

		Succeeded


-	Pinpoint 서비스 릴리즈가 업로드 되어 있지 않은 것을 확인

-	Pinpoint 서비스 릴리즈 파일을 업로드한다.

- **사용 예시**

		$ cd ~/workspace/paasta-5.0/release/paasta-monitoring
		
		$ bosh -e micro-bosh upload-release  paasta-pinpoint-monitoring-release.tgz

-	업로드 된 Pinpoint 릴리즈를 확인한다.

- **사용 예시**

		$ bosh -e micro-bosh releases
		Using environment '10.0.1.6' as client 'admin'

		Name                                       Version    Commit Hash  
		binary-buildpack                           1.0.32*    2399a07  
		bosh-dns                                   1.12.0*    5d607ed  
		bosh-dns-aliases                           0.0.3*     eca9c5a  
		bpm                                        1.1.0*     27e1c8f  
		~                                          1.0.4*     420dc51  
		capi                                       1.82.0*    123bb4c  
		cf-cli                                     1.16.0*    05d9348  
		cf-networking                              2.22.0*    b6e87aeb  
		cf-smoke-tests                             40.0.108*  22ec7a9  
		cf-syslog-drain                            10.2*      684147e  
		cfcr-etcd                                  1.11.1*    d398cd0  
		cflinuxfs3                                 0.96.0*    c6d6f88  
		credhub                                    2.4.0*     7d6110b+  
		diego                                      2.31.0*    728880441+  
		docker                                     35.2.1*    0b69b44  
		dotnet-core-buildpack                      2.2.11*    6a746c2  
		empty-java-release                         1.0*       e8c1477+  
		garden-runc                                1.19.2*    9d00b9d+  
		go-buildpack                               1.8.39*    11a1d25  
		haproxy                                    9.6.0*     3a9b189  
		influxdb                                   1.5.1*     non-git  
		java-buildpack                             4.19*      d6a7949  
		kubo                                       0.34.1*    non-git  
		log-cache                                  2.2.2*     0a03032  
		loggregator                                105.5*     d5153da3  
		loggregator-agent                          3.9*       d344140  
		logsearch                                  209.0.1*   b7bb8e7  
		logsearch-for-cloudfoundry                 207.0.1*   8598207  
		nats                                       27*        bf8cb86  
		nginx-buildpack                            1.0.11*    1c7d690  
		nodejs-buildpack                           1.6.49*    d013a42  
		paasta-container-service-projects-release  1.0*       ced4610+  
		paasta-monitoring                          4.0*       non-git  
		paasta-monitoring-agent                    4.0*       non-git  
		paasta-pinpoint-monitoring-release         1.1*       12caa47+  
		php-buildpack                              4.3.76*    c98344f  
		postgres                                   37*        98ed910  
		pxc                                        0.17.0*    d673b2a  
		python-buildpack                           1.6.32*    af43eb3  
		r-buildpack                                1.0.9*     9145ed1  
		redis                                      14.0.1*    96f111b  
		routing                                    0.188.0*   db449e4  
		ruby-buildpack                             1.7.38*    36a39f1  
		silk                                       2.22.0*    4691b7b  
		staticfile-buildpack                       1.4.42*    22e3fc4  
		statsd-injector                            1.10.0*    b81ab23  
		syslog                                     11.4.0*    feedfa7  
		uaa                                        72.0*      804589c  

		(*) Currently deployed
		(+) Uncommitted changes

		48 releases

		Succeeded

		
-	Pinpoint 서비스 릴리즈가 업로드 되어 있는 것을 확인

-	Deploy시 사용할 Stemcell을 확인한다.

- **사용 예시**

		$ bosh -e micro-bosh stemcells
		Using environment '10.0.1.6' as client 'admin'

		Name                                     Version  OS             CPI  CID  
		bosh-aws-xen-hvm-ubuntu-xenial-go_agent  315.41*  ubuntu-xenial  -    ami-0b518d9f77a3c1e5e  
		~                                        315.36*  ubuntu-xenial  -    ami-008187a18d65e29b1  

		(*) Currently deployed

		2 stemcells



### <div id='24'> 2.4. PINPOINT 서비스 Deployment 파일 및 deploy_pinpoint-프로바이더.sh 수정 및 배포

BOSH Deployment manifest 는 components 요소 및 배포의 속성을 정의한 YAML 파일이다.
Deployment manifest 에는 sotfware를 설치 하기 위해서 어떤 Stemcell (OS, BOSH agent) 을 사용할것이며 Release (Software packages, Config templates, Scripts) 이름과 버전, VMs 용량, Jobs params 등을 정의가 되어 있다.

deployment 파일에서 사용하는 network, vm_type 등은 cloud config 를 활용하고 해당 가이드는 Bosh2.0 가이드를 참고한다.

-	cloud config 내용 조회

- **사용 예시**

		$ bosh -e micro-bosh cloud-config
		Using environment '10.0.1.6' as client 'admin'
		
		  azs:
		  - cloud_properties:
		      datacenters:
		      - clusters:
			- BD-HA:
			  resource_pool: CF_BOSH2_Pool
			name: BD-HA
		    name: z1
		  - cloud_properties:
		      datacenters:
		      - clusters:
			- BD-HA:
			  resource_pool: CF_BOSH2_Pool
			name: BD-HA
		    name: z2
		  - cloud_properties:
		      datacenters:
		      - clusters:
			- BD-HA:
			  resource_pool: CF_BOSH2_Pool
			name: BD-HA
		    name: z3
		  - cloud_properties:
		      datacenters:
		      - clusters:
			- BD-HA:
			  resource_pool: CF_BOSH2_Pool
			name: BD-HA
		    name: z4
		  - cloud_properties:
		      datacenters:
		      - clusters:
			- BD-HA:
			  resource_pool: CF_BOSH2_Pool
			name: BD-HA
		    name: z5
		  - cloud_properties:
		      datacenters:
		      - clusters:
			- BD-HA:
			  resource_pool: CF_BOSH2_Pool
			name: BD-HA
		    name: z6
		  compilation:
		    az: z1
		    network: default
		    reuse_compilation_vms: true
		    vm_type: large
		    workers: 5
		  disk_types:
		  - disk_size: 1024
		    name: default
		  - disk_size: 1024
		    name: 1GB
		  - disk_size: 2048
		    name: 2GB
		  - disk_size: 4096
		    name: 4GB
		  - disk_size: 5120
		    name: 5GB
		  - disk_size: 8192
		    name: 8GB
		  - disk_size: 10240
		    name: 10GB
		  - disk_size: 20480
		    name: 20GB
		  - disk_size: 30720
		    name: 30GB
		  - disk_size: 51200
		    name: 50GB
		  - disk_size: 102400
		    name: 100GB
		  - disk_size: 1048576
		    name: 1TB
		  networks:
		  - name: default
		    subnets:
		    - azs:
		      - z1
		      - z2
		      - z3
		      - z4
		      - z5
		      - z6
		      cloud_properties:
			name: Internal
		      dns:
		      - 8.8.8.8
		      gateway: 10.30.20.23
		      range: 10.30.0.0/16
		      reserved:
		      - 10.30.0.0 - 10.30.111.40
		  - name: public
		    subnets:
		    - azs:
		      - z1
		      - z2
		      - z3
		      - z4
		      - z5
		      - z6
		      cloud_properties:
			name: External
		      dns:
		      - 8.8.8.8
		      gateway: 115.68.46.177
		      range: 115.68.46.176/28
		      reserved:
		      - 115.68.46.176 - 115.68.46.188
		      static:
		      - 115.68.46.189 - 115.68.46.190
		    type: manual
		  - name: service_private
		    subnets:
		    - azs:
		      - z1
		      - z2
		      - z3
		      - z4
		      - z5
		      - z6
		      cloud_properties:
			name: Internal
		      dns:
		      - 8.8.8.8
		      gateway: 10.30.20.23
		      range: 10.30.0.0/16
		      reserved:
		      - 10.30.0.0 - 10.30.106.255
		      static:
		      - 10.30.107.1 - 10.30.107.255
		  - name: service_public
		    subnets:
		    - azs:
		      - z1
		      - z2
		      - z3
		      - z4
		      - z5
		      - z6
		      cloud_properties:
			name: External
		      dns:
		      - 8.8.8.8
		      gateway: 115.68.47.161
		      range: 115.68.47.160/24
		      reserved:
		      - 115.68.47.161 - 115.68.47.174
		      static:
		      - 115.68.47.175 - 115.68.47.185
		    type: manual
		  - name: portal_service_public
		    subnets:
		    - azs:
		      - z1
		      - z2
		      - z3
		      - z4
		      - z5
		      - z6
		      cloud_properties:
			name: External
		      dns:
		      - 8.8.8.8
		      gateway: 115.68.46.209
		      range: 115.68.46.208/28
		      reserved:
		      - 115.68.46.216 - 115.68.46.222
		      static:
		      - 115.68.46.214
		    type: manual
		  vm_extensions:
		  - cloud_properties:
		      ports:
		      - host: 3306
		    name: mysql-proxy-lb
		  - name: cf-router-network-properties
		  - name: cf-tcp-router-network-properties
		  - name: diego-ssh-proxy-network-properties
		  - name: cf-haproxy-network-properties
		  - cloud_properties:
		      disk: 51200
		    name: small-50GB
		  - cloud_properties:
		      disk: 102400
		    name: small-highmem-100GB
		  vm_types:
		  - cloud_properties:
		      cpu: 1
		      disk: 8192
		      ram: 1024
		    name: minimal
		  - cloud_properties:
		      cpu: 1
		      disk: 10240
		      ram: 2048
		    name: default
		  - cloud_properties:
		      cpu: 1
		      disk: 30720
		      ram: 4096
		    name: small
		  - cloud_properties:
		      cpu: 2
		      disk: 20480
		      ram: 4096
		    name: medium
		  - cloud_properties:
		      cpu: 2
		      disk: 20480
		      ram: 8192
		    name: medium-memory-8GB
		  - cloud_properties:
		      cpu: 4
		      disk: 20480
		      ram: 8192
		    name: large
		  - cloud_properties:
		      cpu: 8
		      disk: 20480
		      ram: 16384
		    name: xlarge
		  - cloud_properties:
		      cpu: 2
		      disk: 51200
		      ram: 4096
		    name: small-50GB
		  - cloud_properties:
		      cpu: 2
		      disk: 51200
		      ram: 4096
		    name: small-50GB-ephemeral-disk
		  - cloud_properties:
		      cpu: 4
		      disk: 102400
		      ram: 8192
		    name: small-100GB-ephemeral-disk
		  - cloud_properties:
		      cpu: 4
		      disk: 102400
		      ram: 8192
		    name: small-highmem-100GB-ephemeral-disk
		  - cloud_properties:
		      cpu: 8
		      disk: 20480
		      ram: 16384
		    name: small-highmem-16GB
		  - cloud_properties:
		      cpu: 1
		      disk: 4096
		      ram: 2048
		    name: caas_small
		  - cloud_properties:
		      cpu: 1
		      disk: 4096
		      ram: 1024
		    name: caas_small_api
		  - cloud_properties:
		      cpu: 1
		      disk: 4096
		      ram: 4096
		    name: caas_medium
		  - cloud_properties:
		      cpu: 2
		      disk: 8192
		      ram: 4096
		    name: service_medium
		  - cloud_properties:
		      cpu: 2
		      disk: 10240
		      ram: 2048
		    name: service_medium_2G

		  Succeeded


-	Deployment 파일을 서버 환경에 맞게 수정한다.

```yaml
# pinpoint_property.yml 설정 파일 내용
---
### On-Demand Bosh Deployment Name Setting ###
deployment_name: paasta-pinpoint-monitoring                       #Deployment Name
#
#### Main Stemcells Setting ###
stemcell_os: ubuntu-xenial                                      # Deployment Main Stemcell OS
stemcell_version: latest                                       # Main Stemcell Version
stemcell_alias: default                                         # Main Stemcell Alias
#
#
#### VM Type
vm_type: caas_small_highmem
#broker_vm_type: service_medium
#service_vm_type: service_tiny
#test_vm_type: service_tiny
#
#### On-Demand Release Deployment Setting ### 
releases_name :  paasta-pinpoint-monitoring-release                              # Release Name
internal_networks_name : default                        # Some Network From Your 'bosh cloud-config(cc)'
external_networks_name : vip
haproxy_public_ip : 15.165.3.150
mariadb_disk_type : 30GB # MariaDB Disk Type 'bosh cloud-config(cc)'
PemSSH : false                                                       #  h_master에서 ssh접근시 사용하는 key file(default : false) 
```



-	Pinpoint 서비스팩을 배포한다.

- **사용 예시**

		$ cd ~/workspace/paasta-5.0/deployment/paasta-deployment-monitoring/paasta-pinpoint-monitoring
		$ ./deploy_pinpoint-{클라우드프로바이더}.sh
		  Using deployment 'paasta-pinpoint-monitoring'

		  + azs:
		  + - cloud_properties:
		  +     datacenters:
		  +     - clusters:
		  +       - BD-HA:
		  +           resource_pool: CF_BOSH2_Pool
		  +       name: BD-HA
		  +   name: z1
		  + - cloud_properties:
		  +     datacenters:
		  +     - clusters:
		  +       - BD-HA:
		  +           resource_pool: CF_BOSH2_Pool
		  +       name: BD-HA
		  +   name: z2
		  + - cloud_properties:
		  +     datacenters:
		  +     - clusters:
		  +       - BD-HA:
		  +           resource_pool: CF_BOSH2_Pool
		  +       name: BD-HA
		  +   name: z3
		  + - cloud_properties:
		  +     datacenters:
		  +     - clusters:
		  +       - BD-HA:
		  +           resource_pool: CF_BOSH2_Pool
		  +       name: BD-HA
		  +   name: z4
		  + - cloud_properties:
		  +     datacenters:
		  +     - clusters:
		  +       - BD-HA:
		  +           resource_pool: CF_BOSH2_Pool
		  +       name: BD-HA
		  +   name: z5
		  + - cloud_properties:
		  +     datacenters:
		  +     - clusters:
		  +       - BD-HA:
		  +           resource_pool: CF_BOSH2_Pool
		  +       name: BD-HA
		  +   name: z6

		  + vm_types:
		  + - cloud_properties:
		  +     cpu: 1
		  +     disk: 8192
		  +     ram: 1024
		  +   name: minimal
		  + - cloud_properties:
		  +     cpu: 1
		  +     disk: 10240
		  +     ram: 2048
		  +   name: default
		  + - cloud_properties:
		  +     cpu: 1
		  +     disk: 30720
		  +     ram: 4096
		  +   name: small
		  + - cloud_properties:
		  +     cpu: 2
		  +     disk: 20480
		  +     ram: 4096
		  +   name: medium
		  + - cloud_properties:
		  +     cpu: 2
		  +     disk: 20480
		  +     ram: 8192
		  +   name: medium-memory-8GB
		  + - cloud_properties:
		  +     cpu: 4
		  +     disk: 20480
		  +     ram: 8192
		  +   name: large
		  + - cloud_properties:
		  +     cpu: 8
		  +     disk: 20480
		  +     ram: 16384
		  +   name: xlarge
		  + - cloud_properties:
		  +     cpu: 2
		  +     disk: 51200
		  +     ram: 4096
		  +   name: small-50GB
		  + - cloud_properties:
		  +     cpu: 2
		  +     disk: 51200
		  +     ram: 4096
		  +   name: small-50GB-ephemeral-disk
		  + - cloud_properties:
		  +     cpu: 4
		  +     disk: 102400
		  +     ram: 8192
		  +   name: small-100GB-ephemeral-disk
		  + - cloud_properties:
		  +     cpu: 4
		  +     disk: 102400
		  +     ram: 8192
		  +   name: small-highmem-100GB-ephemeral-disk
		  + - cloud_properties:
		  +     cpu: 8
		  +     disk: 20480
		  +     ram: 16384
		  +   name: small-highmem-16GB
		  + - cloud_properties:
		  +     cpu: 1
		  +     disk: 4096
		  +     ram: 2048
		  +   name: caas_small
		  + - cloud_properties:
		  +     cpu: 1
		  +     disk: 4096
		  +     ram: 1024
		  +   name: caas_small_api
		  + - cloud_properties:
		  +     cpu: 1
		  +     disk: 4096
		  +     ram: 4096
		  +   name: caas_medium
		  + - cloud_properties:
		  +     cpu: 2
		  +     disk: 8192
		  +     ram: 4096
		  +   name: service_medium
		  + - cloud_properties:
		  +     cpu: 2
		  +     disk: 10240
		  +     ram: 2048
		  +   name: service_medium_2G

		  + vm_extensions:
		  + - cloud_properties:
		  +     ports:
		  +     - host: 3306
		  +   name: mysql-proxy-lb
		  + - name: cf-router-network-properties
		  + - name: cf-tcp-router-network-properties
		  + - name: diego-ssh-proxy-network-properties
		  + - name: cf-haproxy-network-properties
		  + - cloud_properties:
		  +     disk: 51200
		  +   name: small-50GB
		  + - cloud_properties:
		  +     disk: 102400
		  +   name: small-highmem-100GB

		  + compilation:
		  +   az: z1
		  +   network: default
		  +   reuse_compilation_vms: true
		  +   vm_type: large
		  +   workers: 5

		  + networks:
		  + - name: default
		  +   subnets:
		  +   - azs:
		  +     - z1
		  +     - z2
		  +     - z3
		  +     - z4
		  +     - z5
		  +     - z6
		  +     cloud_properties:
		  +       name: Internal
		  +     dns:
		  +     - 8.8.8.8
		  +     gateway: 10.30.20.23
		  +     range: 10.30.0.0/16
		  +     reserved:
		  +     - 10.30.0.0 - 10.30.111.40
		  + - name: public
		  +   subnets:
		  +   - azs:
		  +     - z1
		  +     - z2
		  +     - z3
		  +     - z4
		  +     - z5
		  +     - z6
		  +     cloud_properties:
		  +       name: External
		  +     dns:
		  +     - 8.8.8.8
		  +     gateway: 115.68.46.177
		  +     range: 115.68.46.176/28
		  +     reserved:
		  +     - 115.68.46.176 - 115.68.46.188
		  +     static:
		  +     - 115.68.46.189 - 115.68.46.190
		  +   type: manual
		  + - name: service_private
		  +   subnets:
		  +   - azs:
		  +     - z1
		  +     - z2
		  +     - z3
		  +     - z4
		  +     - z5
		  +     - z6
		  +     cloud_properties:
		  +       name: Internal
		  +     dns:
		  +     - 8.8.8.8
		  +     gateway: 10.30.20.23
		  +     range: 10.30.0.0/16
		  +     reserved:
		  +     - 10.30.0.0 - 10.30.106.255
		  +     static:
		  +     - 10.30.107.1 - 10.30.107.255
		  + - name: service_public
		  +   subnets:
		  +   - azs:
		  +     - z1
		  +     - z2
		  +     - z3
		  +     - z4
		  +     - z5
		  +     - z6
		  +     cloud_properties:
		  +       name: External
		  +     dns:
		  +     - 8.8.8.8
		  +     gateway: 115.68.47.161
		  +     range: 115.68.47.160/24
		  +     reserved:
		  +     - 115.68.47.161 - 115.68.47.174
		  +     static:
		  +     - 115.68.47.175 - 115.68.47.185
		  +   type: manual
		  + - name: portal_service_public
		  +   subnets:
		  +   - azs:
		  +     - z1
		  +     - z2
		  +     - z3
		  +     - z4
		  +     - z5
		  +     - z6
		  +     cloud_properties:
		  +       name: External
		  +     dns:
		  +     - 8.8.8.8
		  +     gateway: 115.68.46.209
		  +     range: 115.68.46.208/28
		  +     reserved:
		  +     - 115.68.46.216 - 115.68.46.222
		  +     static:
		  +     - 115.68.46.214
		  +   type: manual

		  + disk_types:
		  + - disk_size: 1024
		  +   name: default
		  + - disk_size: 1024
		  +   name: 1GB
		  + - disk_size: 2048
		  +   name: 2GB
		  + - disk_size: 4096
		  +   name: 4GB
		  + - disk_size: 5120
		  +   name: 5GB
		  + - disk_size: 8192
		  +   name: 8GB
		  + - disk_size: 10240
		  +   name: 10GB
		  + - disk_size: 20480
		  +   name: 20GB
		  + - disk_size: 30720
		  +   name: 30GB
		  + - disk_size: 51200
		  +   name: 50GB
		  + - disk_size: 102400
		  +   name: 100GB
		  + - disk_size: 1048576
		  +   name: 1TB

		  + name: paasta-pinpoint-monitoring

		  Continue? [yN]: y

		  Task 4506

		  Task 4506 | 06:04:10 | Preparing deployment: Preparing deployment (00:00:01)
		  Task 4506 | 06:04:12 | Preparing package compilation: Finding packages to compile (00:00:00)
		  Task 4506 | 06:04:12 | Compiling packages: cli/24305e50a638ece2cace4ef4803746c0c9fe4bb0
		  Task 4506 | 06:04:12 | Compiling packages: openjdk-1.8.0_45/57e0ee876ea9d90f5470e3784ae1171bccee850a
		  Task 4506 | 06:04:12 | Compiling packages: op-mysql-java-broker/3bf47851b2c0d3bea63a0c58452df58c14a15482
		  Task 4506 | 06:04:12 | Compiling packages: syslog_aggregator/078da6dcb999c1e6f5398a6eb739182ccb4aba25
		  Task 4506 | 06:04:12 | Compiling packages: common/ba480a46c4b2aa9484fb24ed01a8649453573e6f
		  Task 4506 | 06:06:53 | Compiling packages: syslog_aggregator/078da6dcb999c1e6f5398a6eb739182ccb4aba25 (00:02:41)
		  Task 4506 | 06:06:53 | Compiling packages: golang/f57ddbc8d55d7a0f08775bf76bb6a27dc98c7ea7
		  Task 4506 | 06:06:55 | Compiling packages: common/ba480a46c4b2aa9484fb24ed01a8649453573e6f (00:02:43)
		  Task 4506 | 06:06:55 | Compiling packages: python/4e255efa754d91b825476b57e111345f200944e1
		  Task 4506 | 06:06:55 | Compiling packages: cli/24305e50a638ece2cace4ef4803746c0c9fe4bb0 (00:02:43)
		  Task 4506 | 06:06:55 | Compiling packages: check/d6811f25e9d56428a9b942631c27c9b24f5064dc
		  Task 4506 | 06:07:05 | Compiling packages: boost/3eb8bdb1abb7eff5b63c4c5bdb41c0a778925c31
		  Task 4506 | 06:07:10 | Compiling packages: openjdk-1.8.0_45/57e0ee876ea9d90f5470e3784ae1171bccee850a (00:02:58)
		  Task 4506 | 06:07:53 | Compiling packages: golang/f57ddbc8d55d7a0f08775bf76bb6a27dc98c7ea7 (00:01:00)
		  Task 4506 | 06:07:53 | Compiling packages: switchboard/fad565dadbb37470771801952001c7071e55a364
		  Task 4506 | 06:07:53 | Compiling packages: route-registrar/f3fdfb8c940e7227a96c06e413ae6827aba8eeda
		  Task 4506 | 06:07:55 | Compiling packages: check/d6811f25e9d56428a9b942631c27c9b24f5064dc (00:01:00)
		  Task 4506 | 06:07:55 | Compiling packages: gra-log-purger/f02fa5774ab54dbb1b1c3702d03cb929b85d60e6
		  Task 4506 | 06:08:30 | Compiling packages: route-registrar/f3fdfb8c940e7227a96c06e413ae6827aba8eeda (00:00:37)
		  Task 4506 | 06:08:30 | Compiling packages: galera-healthcheck/3da4dedbcd7d9f404a19e7720e226fd472002266
		  Task 4506 | 06:08:31 | Compiling packages: gra-log-purger/f02fa5774ab54dbb1b1c3702d03cb929b85d60e6 (00:00:36)
		  Task 4506 | 06:08:31 | Compiling packages: mariadb_ctrl/7658290da98e2cad209456f174d3b9fa143c87fc
		  Task 4506 | 06:08:32 | Compiling packages: switchboard/fad565dadbb37470771801952001c7071e55a364 (00:00:39)
		  Task 4506 | 06:08:58 | Compiling packages: galera-healthcheck/3da4dedbcd7d9f404a19e7720e226fd472002266 (00:00:28)
		  Task 4506 | 06:08:59 | Compiling packages: mariadb_ctrl/7658290da98e2cad209456f174d3b9fa143c87fc (00:00:28)
		  Task 4506 | 06:09:42 | Compiling packages: boost/3eb8bdb1abb7eff5b63c4c5bdb41c0a778925c31 (00:02:37)
		  Task 4506 | 06:11:27 | Compiling packages: python/4e255efa754d91b825476b57e111345f200944e1 (00:04:32)
		  Task 4506 | 06:11:27 | Compiling packages: scons/11e7ad3b28b43a96de3df7aa41afddde582fcc38 (00:00:22)
		  Task 4506 | 06:11:49 | Compiling packages: galera/d15a1d2d15e5e7417278d4aa1b908566022b9623 (00:13:18)
		  Task 4506 | 06:25:07 | Compiling packages: mariadb/43aa3547bc5a01dd51f1501e6b93c215dd7255e9 (00:18:49)
		  Task 4506 | 06:43:56 | Compiling packages: xtrabackup/2e701e7a9e4241b28052d984733de36aae152275 (00:10:26)
		  Task 4506 | 06:55:22 | Creating missing vms: proxy/023edddd-418e-46e4-8d40-db452c694e16 (0)
		  Task 4506 | 06:55:22 | Creating missing vms: paasta-mysql-java-broker/bb5676ca-efba-48fc-bc11-f464d0ae9c78 (0)
		  Task 4506 | 06:57:23 | Creating missing vms: proxy/023edddd-418e-46e4-8d40-db452c694e16 (0) (00:02:01)
		  Task 4506 | 06:57:23 | Creating missing vms: paasta-mysql-java-broker/bb5676ca-efba-48fc-bc11-f464d0ae9c78 (0) (00:02:01)

		  Task 4506 Started  Fri Aug 31 06:04:10 UTC 2018
		  Task 4506 Finished Fri Aug 31 07:08:06 UTC 2018
		  Task 4506 Duration 01:03:56
		  Task 4506 done

		  Succeeded

-	배포된 Pinpoint 서비스팩을 확인한다.

- **사용 예시**

		$ bosh -e micro-bosh -d paasta-pinpoint-monitoring vms
		Deployment 'paasta-pinpoint-monitoring'

		Instance                                            Process State  AZ  IPs           VM CID               VM Type             Active  
		collector/a7932462-5a55-4ad6-9a50-6d9775d8391a      running        z3  10.0.81.122   i-0104012f0c4cf1051  caas_small_highmem  true  
		h_master/7024f1d8-7911-4cc6-ac5c-8d9295221efa       running        z3  10.0.81.121   i-02b1cd70c35117d8d  caas_small_highmem  true  
		haproxy_webui/b30b856c-ad74-4ff5-a9ee-32e2ef641ffa  running        z7  10.0.0.122    i-046052aa5360f6b6f  caas_small_highmem  true  
										       15.165.3.150                                             
		pinpoint_web/c23b79cf-ef55-42f5-9c2a-b8102b6e5ca8   running        z3  10.0.81.123   i-02a82ab6f02784317  caas_small_highmem  true 


### <div id='25'> 2.5. security-group 등록
Pinpoint collector와 배포 app간 통신을 위한  처리.

```
$ vi pinpoint-asg.json

[
  {
    "protocol": "all",
    "destination": "xx.x.xx.0/24",
    "log": true,
    "description": "Allow tcp traffic to Z3"
  }
]
```

```
$ cf create-security-group pinpoint pinpoint-asg.json
```

```
$ cf bind-staging-security-group pinpoint
```

```
$ cf bind-running-security-group pinpoint
```

### <div id='26'> 2.6. Pinpoint User-Provided service 등록

Pinpoint 서비스팩 배포가 완료 되었으면 Application에서 서비스 팩을
사용하기 위해서 먼저 Pinpoint User-Provided service를 등록해 주어야 한다.

User-Provided service 등록시 PaaS-TA에서 서비스를 등록 할
수 있는 사용자로 로그인이 되어 있어야 한다.

<br>
-   서비스 목록을 확인한다.

```
$ cf services
```
```
Getting services as admin...

name   url
No service brokers found
```

<br>
-   Pinpoint User-Provided service를 등록한다.

```
$ cf cups {서비스 이름} -p '{"application_name":"{App Name}", "collector_host":"{PINOINT COLLECTOR IP}","collector_span_port":"{COLLECTOR SPAN PORT}","collector_stat_port":"{COLLECTOR START PORT}","collector_tcp_port":"{COLLECTOR TCP PORT}"}' -t 'pinpoint'
```

```
$ cf cups pinpoint_monitoring_service -p '{"application_name":"spring-music-pinpoint","collector_host":"10.0.81.122","collector_span_port":"29996","collector_stat_port":"29995","collector_tcp_port":"29994"}'  -t 'pinpoint'
```
```
Creating user provided service pinpoint_monitoring_service in  as admin...
OK
```

<br>
-   등록된 Pinpoint User-Provided service를 확인한다.

```
$ cf services
```
```
Getting services as admin...
name url
pinpoint_monitoring_service   user-provided 
```
<br>

#  <div id='3'> 3. Sample Web App 연동 Pinpoint 연동

본 Sample Web App은 개방형 클라우드 플랫폼에 배포되며 Pinpoint의 서비스를 Provision과 Bind를 한 상태에서 사용이 가능하다.

### <div id='31'> 3.1. Sample Web App 구조

Sample Web App은 PaaS-TA에 App으로 배포가 된다. 배포된
App에 Pinpoint 서비스 Bind 를 통하여 초기 데이터를 생성하게 된다. 바인드
완료 후 연결 url을 통하여 브라우저로 해당 App에 대한 Pinpoint 서비스
모니터링을 할 수 있다.

-   Spring-music App을 이용하여 Pinpoint 모니터링을 테스트 하였다.
-   앱을 다운로드 후 –b 옵션을 주어 buildpack을 지정하여 push 해 놓는다.

```
$ cf push -b java_buildpack_pinpoint --no-start
```

```
Using manifest file /home/ubuntu/workspace/user/arom/spring-music/manifest.yml

Creating app spring-music-pinpoint in org org / space space as admin...
OK

Creating route spring-music-pinpoint.monitoring.open-paas.com...
OK

Binding spring-music-pinpoint.monitoring.open-paas.com to spring-music-pinpoint...
OK

Uploading spring-music-pinpoint...
Uploading app files from: /tmp/unzipped-app175965484
Uploading 21.2M, 126 files
Done uploading               
OK
```

```
$ cf apps
```
```
Getting apps in org org / space space as admin...
OK

name                    requested state   instances   memory   disk   urls
spring-music-pinpoint   stopped           0/1         512M     1G     spring-music-pinpoint.monitoring.open-paas.com
```

### <div id='32'> 3.2. Sample Web App에 서비스 바인드 신청 및 App 확인
-------------------------------------------------

Sample Web App에서 Pinpoint 서비스를 사용하기 위해서는 서비스
신청(Provision)을 해야 한다.

```  
$ cf bind-service {App명} {서비스명}
```
```
서비스명 : p-Pinpoint로 Marketplace에서 보여지는 서비스 명칭이다.
서비스플랜 : 서비스에 대한 정책으로 plans에 있는 정보 중 하나를 선택한다. Pinpoint 서비스는 10 connection, 100 connection 를 지원한다.
내서비스명 : 내 서비스에서 보여지는 명칭이다. 이 명칭을 기준으로 환경설정정보를 가져온다.

```

```
$ cf bind-service spring-music-pinpoint pinpoint_monitoring_service
```
```
```

<br>
-   생성된 Pinpoint 서비스 인스턴스를 확인한다.

```
$ cf services
```
```
Getting services in org org / space space as admin...
OK

name             service         plan                bound apps               last operation
pinpoint_monitoring_service   user-provided                       spring-music-pinpoint                                               
```
<br>
-   바인드가 적용되기 위해서 App을 restage한다.(최초 app실행시 cf start {App명})

```
$ cf restage spring-music-pinpoint
```
```

Restaging app spring-music-pinpoint in org org / space space as admin...
Downloading binary_buildpack...
Downloading go_buildpack...
Downloading staticfile_buildpack...
Downloading java_buildpack...
Downloading ruby_buildpack...
Downloading nodejs_buildpack...
Downloading python_buildpack...
Downloading php_buildpack...
Downloaded python_buildpack
Downloaded binary_buildpack
Downloaded go_buildpack
Downloaded java_buildpack
Downloaded ruby_buildpack
Downloaded nodejs_buildpack
Downloaded staticfile_buildpack
Downloaded php_buildpack
Creating container
Successfully created container
Downloading app package...
Downloaded app package (24.5M)
Downloading build artifacts cache...
Downloaded build artifacts cache (54.1M)
Staging...
-----> Java Buildpack Version: v3.7.1 | https://github.com/cloudfoundry/java-buildpack.git#78c3d0a
-----> Downloading Open Jdk JRE 1.8.0_91-unlimited-crypto from https://java-buildpack.cloudfoundry.org/openjdk/trusty/x86_64/openjdk-1.8.0_91-unlimited-crypto.tar.gz (found in cache)
     Expanding Open Jdk JRE to .java-buildpack/open_jdk_jre (1.6s)
-----> Downloading Open JDK Like Memory Calculator 2.0.2_RELEASE from https://java-buildpack.cloudfoundry.org/memory-calculator/trusty/x86_64/memory-calculator-2.0.2_RELEASE.tar.gz (found in cache)
     Memory Settings: -XX:MaxMetaspaceSize=64M -Xss995K -Xmx382293K -Xms382293K -XX:MetaspaceSize=64M
-----> Downloading Spring Auto Reconfiguration 1.10.0_RELEASE from https://java-buildpack.cloudfoundry.org/auto-reconfiguration/auto-reconfiguration-1.10.0_RELEASE.jar (found in cache)
-----> Downloading Tomcat Instance 8.0.39 from https://java-buildpack.cloudfoundry.org/tomcat/tomcat-8.0.39.tar.gz (found in cache)
     Expanding Tomcat Instance to .java-buildpack/tomcat (0.1s)
-----> Downloading Tomcat Lifecycle Support 2.5.0_RELEASE from https://java-buildpack.cloudfoundry.org/tomcat-lifecycle-support/tomcat-lifecycle-support-2.5.0_RELEASE.jar (found in cache)
-----> Downloading Tomcat Logging Support 2.5.0_RELEASE from https://java-buildpack.cloudfoundry.org/tomcat-logging-support/tomcat-logging-support-2.5.0_RELEASE.jar (found in cache)
-----> Downloading Tomcat Access Logging Support 2.5.0_RELEASE from https://java-buildpack.cloudfoundry.org/tomcat-access-logging-support/tomcat-access-logging-support-2.5.0_RELEASE.jar (found in cache)
Exit status 0
Staging complete
Uploading droplet, build artifacts cache...
Uploading droplet...
Uploading build artifacts cache...
Uploaded build artifacts cache (54.1M)
Uploaded droplet (77.3M)
Uploading complete

0 of 1 instances running, 1 starting
0 of 1 instances running, 1 starting
0 of 1 instances running, 1 starting
1 of 1 instances running

App started


OK
```
<br>
-   App이 정상적으로 Pinpoint 서비스를 사용하는지 확인한다.

![pinpoint_image_03]

<br>
-  환경변수 확인

```
$ cf env spring-music-pinpoint
```
```
Getting env variables for app spring-music-pinpoint in org org / space space as admin...
OK

System-Provided:
{
"VCAP_SERVICES": {
"user-provided": [
 {
  "credentials": {
   "application_name": "spring-music-pinpoint",
   "collector_host": "10.0.81.122",
   "collector_span_port": 29996,
   "collector_stat_port": 29995,
   "collector_tcp_port": 29994
  },
  "label": "user-provided",
  "instance_name": "pinpoint_monitoring_service",
  "name": "pinpoint_monitoring_service",
  "syslog_drain_url": null,
  "tags": [],
  "volume_mounts": []
 }
]
}
}

{
"VCAP_APPLICATION": {
"application_id": "b010e6e9-5431-4198-81f8-7d6ba9c14f40",
"application_name": "spring-music-pinpoint",
"application_uris": [
 "spring-music-pinpoint.monitoring.open-paas.com"
],
"application_version": "9a600116-97bd-45da-a33e-3b0d5592b1d0",
"limits": {
 "disk": 1024,
 "fds": 16384,
 "mem": 512
},
"name": "spring-music-pinpoint",
"space_id": "bc70b951-d870-49ca-b57d-5c7137060e5e",
"space_name": "space",
"uris": [
 "spring-music-pinpoint.monitoring.open-paas.com"
],
"users": null,
"version": "9a600116-97bd-45da-a33e-3b0d5592b1d0"
}
}

No user-defined env variables have been set

No running env variables have been set

No staging env variables have been set
```

<br>
- App 정상 구동 확인
```
$ curl http://15.165.3.150:8079/#/main/spring-music-pinpoint@TOMCAT
```

[pinpoint_image_01]:/images/pinpoint-image1.png
[pinpoint_image_03]:/images/pinpoint-image3.png
