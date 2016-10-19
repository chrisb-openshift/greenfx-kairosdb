FROM docker.io/centos:7

MAINTAINER anthony@atgreen.org

RUN yum -y update
RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-8.noarch.rpm && \
    yum install -y https://github.com/kairosdb/kairosdb/releases/download/v1.1.2/kairosdb-1.1.2-1.rpm && \
    yum clean all

RUN useradd kairosdb && for d in /opt/kairosdb /tmp/hsperfdata_root /tmp/kairos_cache; do chown -R kairosdb:kairosdb $d; done

EXPOSE 8080
EXPOSE 4242

USER kairosdb

CMD /opt/kairosdb/bin/kairosdb.sh run


