FROM mono:5.8

COPY init.sh /

RUN mkdir /manager /data
WORKDIR /manager

VOLUME ["/data"]
EXPOSE 8080

ENTRYPOINT ["/init.sh"]