FROM mminderbinder/java-jdk7:0.9.15
MAINTAINER Milo Minderbinder <minderbinder.enterprises@gmail.com>

CMD ["/sbin/my_init"]


RUN apt-get update && apt-get -y install tomcat7 tomcat7-common libtomcat7-java

# Set up symlinks to fix Tomcat bug (https://bugs.launchpad.net/serverguide/+bug/1232258)
WORKDIR /usr/share/tomcat7
RUN ln -s /var/lib/tomcat7/common/ common
RUN ln -s /var/lib/tomcat7/server/ server
RUN ln -s /var/lib/tomcat7/shared/ shared
RUN mkdir /var/lib/tomcat7/temp
RUN chown tomcat7:tomcat7 /var/lib/tomcat7/temp

# Run Tomcat as a service with runit
RUN mkdir /etc/service/tomcat7
COPY run-tomcat7.sh /etc/service/tomcat7/run
RUN chmod +x /etc/service/tomcat7/run

# Set Tomcat environment variables
COPY tomcat-setenv.sh /usr/share/tomcat7/bin/setenv.sh
RUN chmod +x /usr/share/tomcat7/bin/*.sh


# Clean up APT when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
