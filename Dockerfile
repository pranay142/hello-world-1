FROM tomcat:jre8-openjdk-slim

RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps/

# Maintainer 
COPY webapp/target/webapp.war /usr/local/tomcat/webapps
