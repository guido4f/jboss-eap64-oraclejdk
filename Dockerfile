FROM registry.access.redhat.com/jboss-eap-6/eap64-openshift
USER root

RUN yum remove -y java-1.8.0-openjdk-devel



run curl -L -b "oraclelicense=a" \
    http://download.oracle.com/otn-pub/java/jdk/8u162-b12/0da788060d494f5095bf8624735fa2f1/jdk-8u162-linux-x64.rpm \
    -o jdk.rpm \
    && yum -y install jdk.rpm \
    && rm jdk.rpm
ENV JAVA_VENDOR=Oracle
USER 185


CMD ["/opt/eap/bin/openshift-launch.sh"]