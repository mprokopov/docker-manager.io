FROM mono:6.8

RUN apt-get update && apt-get install wget unzip

COPY init.sh /

RUN mkdir /manager /data
WORKDIR /manager

VOLUME ["/data"]
EXPOSE 8080

ENTRYPOINT ["/init.sh"]