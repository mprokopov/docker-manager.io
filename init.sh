#!/bin/bash

wget https://github.com/Manager-io/Manager.zip/releases/latest/download/Manager.zip -O Manager.zip

unzip Manager.zip

rm -f Manager.zip

mono ManagerServer.exe -port 8080 -path "/data"