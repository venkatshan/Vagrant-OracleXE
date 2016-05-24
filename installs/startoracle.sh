#!/bin/bash

rm -rf /dev/shm && mkdir /dev/shm && mount -t tmpfs shmfs -o size=1500m /dev/shm && service oracle-xe start
