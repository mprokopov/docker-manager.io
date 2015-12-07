 docker run --rm --volumes-from managerio_data_1 -v $(pwd):/backup mprokopov/manager.io tar czvf /backup/Manager-backup.tar.gz /data
