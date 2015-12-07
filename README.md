# docker-manager.io
Dockerized http://manager.io accounting software

This service uses separate data volume container and stores all data in /data folder.

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
