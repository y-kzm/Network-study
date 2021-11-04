#!/bin/bash
echo "Start pcap."
docker cp R1:/tmp/R0_net0.pcap R1_net0.pcap  
docker cp R2:/tmp/R0_net0.pcap R2_net0.pcap  