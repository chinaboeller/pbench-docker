FROM centos/tools
MAINTAINER Florian Schroeder <florian@yinkan.de>

# install COPR
RUN yum -y install yum-plugin-copr
RUN yum copr enable -y ndokos/pbench

RUN yum -y update ca-certificates
RUN yum -y install epel-release
RUN yum -y install perl-JSON-XS
RUN yum -y install \
    pbench-agent \
    configtools \
    pbench-dashboard \
    pbench-dbench \
    pbench-fio \
    pbench-iozone \
    pbench-iperf \
    pbench-linpack \
    pbench-netperf \
#    pbench-server \ # requires rh-python35
    pbench-smallfile \
    pbench-stress \
    pbench-sysbench \
    pbench-sysstat \
    pbench-uperf \
    pbench-web-server

RUN yum -y clean all

# Clone openshift-performance repo
RUN git clone https://github.com/redhat-performance/openshift-performance
