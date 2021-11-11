#!/bin/bash
echo "Start pcap."
docker cp R2:/tmp/R2_net0.pcap pcap/R2_net0.pcap  
docker cp R2:/tmp/R2_net1.pcap pcap/R2_net1.pcap   
docker cp R2:/tmp/R2_net2.pcap pcap/R2_net2.pcap   
docker cp R4:/tmp/R4_net0.pcap pcap/R4_net0.pcap   
docker cp R4:/tmp/R4_net1.pcap pcap/R4_net1.pcap   
docker cp R4:/tmp/R4_net2.pcap pcap/R4_net2.pcap   
