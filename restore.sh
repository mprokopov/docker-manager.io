 docker run --rm --volumes-from managerio_data_1 -v $(pwd):/backup mprokopov/manager.io bash -c "cd / && tar xzvf /backup/Manager-backup.tar.gz"
