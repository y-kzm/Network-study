#!/bin/bash
echo "Start pcap."
docker cp R1:/tmp/R1_net2.pcap R1_net2.pcap  
docker cp R1:/tmp/R1_net0.pcap R1_net0.pcap  
docker cp R2:/tmp/R2_net1.pcap R2_net1.pcap  
docker cp R3:/tmp/R3_net2.pcap R3_net2.pcap 
docker cp R3:/tmp/R3_net0.pcap R3_net0.pcap  
docker cp R4:/tmp/R4_net1.pcap R4_net1.pcap 
docker cp R4:/tmp/R4_net2.pcap R4_net2.pcap  
