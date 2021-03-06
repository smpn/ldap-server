FROM stackbrew/centos
MAINTAINER yonecle

# this is test A1

RUN yum -y install openldap-servers ; yum clean all

# this is test a1
# kopksdop
# kpsodfkplp[sd

# this is test a3
# this is test a4
# this is test a5

ADD config.cpio /tmp/
RUN cd /tmp ; cpio --quiet -i -F config.cpio

RUN rm -fr /etc/openldap/slapd.d
RUN cp /tmp/slapd.conf /etc/openldap/slapd.conf
RUN cp /tmp/DB_CONFIG /var/lib/ldap/DB_CONFIG ; chown ldap:ldap /var/lib/ldap/*
RUN slapadd -l /tmp/base.ldif ; slapadd -l /tmp/user.ldif ; chown ldap:ldap /var/lib/ldap/*
# RUN /usr/sbin/slapd -h ldapi:/// -u ldap ; ldapadd -x -H ldapi:/// -D "cn=Manager,dc=ad,dc=example,dc=com" -w redhat -f /tmp/base.ldif

EXPOSE 389

LABEL Vendor="smpn.jp" License=GPLv2
LABEL Version=1.0
LABEL Architecture="amd64
LABEL RUN="docker run -d -p 80:80 --name NAME IMAGE""

ENTRYPOINT ["/usr/sbin/slapd","-h","ldap:///","ldapi:///","-u","ldap","-d","1"]
