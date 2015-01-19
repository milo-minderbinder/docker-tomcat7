FROM mminderbinder/baseimage:0.9.15
MAINTAINER Milo Minderbinder <minderbinder.enterprises@gmail.com>

ENV HOME /root
CMD ["/sbin/my_init"]


RUN apt-get update && apt-get -y install tomcat7 tomcat7-common libtomcat7-java
ADD tomcat-setenv.sh /usr/share/tomcat7/bin/setenv.sh


# Clean up APT when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
