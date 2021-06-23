FROM adoptopenjdk/openjdk11
MAINTAINER Nawal <nawal@afnor.com>
  
  
# Install needed package
RUN apt-get update 
#RUN apt-get install dos2unix
RUN apt-get clean

# Install wait-for-it

# Install JAR file
ADD afnor.jar /app/afnor.jar

# Install Running file
ADD ./start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh
#RUN dos2unix /usr/local/bin/start.sh

# Start Application
CMD ["/bin/bash", "/usr/local/bin/start.sh"]


