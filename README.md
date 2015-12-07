# docker-manager.io
Dockerized http://manager.io accounting software

This service uses separate data volume container and stores all data in /data folder.

After docker-compose up enjoy working manager.io on port 8080 of your host.

Backup could be done by 
```
docker run --rm --volumes-from managerio_data_1 \
  -v $(pwd):/backup mprokopov/manager.io \
  tar czvf /backup/Manager-backup.tar.gz /data
```
Restore 
```
 docker run --rm --volumes-from managerio_data_1 \
  -v $(pwd):/backup \ 
 mprokopov/manager.io bash -c "cd / && tar xzvf /backup/Manager-backup.tar.gz"
 ```
 Where managerio_data_1 is your data container.


Advanced usage:

You can create and launch docker-compose.yml with following

```
nginx:
  image: jwilder/nginx-proxy
  ports:
    - "80:80"
  volumes:
    - /var/run/docker.sock:/tmp/docker.sock:ro
  restart: always
dnsmasq:
  image: andyshinn/dnsmasq
  ports:
    - "172.16.236.138:53:53/tcp"
    - "172.16.236.138:53:53/udp"
  cap_add:
    - NET_ADMIN
  command: --address=/dev/172.16.236.138
  restart: always
 ```
Where 172.16.236.138 is your docker host IP address.

Add to /etc/resolver/dev on your host
```
192.16.236.138
```

And just point your browser with address http://manager.dev
Volia!