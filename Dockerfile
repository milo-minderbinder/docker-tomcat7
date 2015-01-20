FROM mminderbinder/java-jdk7:0.9.15
MAINTAINER Milo Minderbinder <minderbinder.enterprises@gmail.com>

ENV HOME /root
CMD ["/sbin/my_init"]


RUN apt-get update && apt-get -y install tomcat7 tomcat7-common libtomcat7-java

ADD tomcat-setenv.sh /usr/share/tomcat7/bin/setenv.sh
RUN chmod +x /usr/share/tomcat7/bin/*.sh

#RUN mkdir /etc/service/tomcat7
#ADD run-tomcat7.sh /etc/service/tomcat7/run


EXPOSE 8080

# Clean up APT when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
