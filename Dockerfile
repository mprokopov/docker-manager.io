FROM ubuntu:latest
MAINTAINER Maksym Prokopov <mprokopov@gmail.com>
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb http://download.mono-project.com/repo/debian wheezy main" | tee /etc/apt/sources.list.d/mono-xamarin.list
RUN apt-get update -qq && apt-get -y install mono-complete wget
RUN mkdir /manager
RUN mkdir /data
VOLUME ["/data"]
WORKDIR /manager
ENV MANAGER_VER 16.4.95
RUN wget -N https://mngr.s3.amazonaws.com/ManagerServer.tar.gz
RUN tar -xzf ManagerServer.tar.gz
CMD mono ManagerServer.exe -port 8080 -path "/data"
EXPOSE 8080
