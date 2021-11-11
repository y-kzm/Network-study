#!/bin/bash
echo "Start pcap."
docker cp R1:/tmp/R1_net0.pcap pcap/R1_net0.pcap
docker cp R2:/tmp/R2_net0.pcap pcap/R2_net0.pcap
docker cp R2:/tmp/R2_net1.pcap pcap/R2_net1.pcap
docker cp R3:/tmp/R3_net0.pcap pcap/R3_net0.pcap
docker cp R3:/tmp/R3_net1.pcap pcap/R3_net1.pcap
docker cp R4:/tmp/R4_net0.pcap pcap/R4_net0.pcap