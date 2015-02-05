#!/bin/sh

echo "Calling the tomcat7 startup script..."
exec /usr/share/tomcat7/bin/catalina.sh run 2>&1
