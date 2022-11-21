#!/bin/bash


echo "Start!!!"
for i in `seq 100`
do
    (time ./ptr-client 192.168.200.20) >> time.log 2>&1
done



