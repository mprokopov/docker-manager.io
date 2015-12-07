FROM ubuntu:trusty
RUN apt-get update -qq && apt-get -y install mono-complete wget
RUN mkdir /manager
RUN mkdir /data
WORKDIR /manager
RUN wget http://download.manager.io/ManagerServer.tar.gz
RUN tar -xzf ManagerServer.tar.gz
CMD mono ManagerServer.exe -port 8080 -path "/data"
EXPOSE 8080
