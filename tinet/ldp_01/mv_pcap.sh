#!/bin/bash
echo "Start pcap."
docker cp R1:/tmp/R1_net0.pcap pcap/R1_net0.pcap  
docker cp R2:/tmp/R2_net0.pcap pcap/R2_net0.pcap  