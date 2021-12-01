#!/bin/bash
echo "Move pcap."
echo "Run:      " $0		#スクリプト名を表示
echo "Router:   " $1		#1つ目の引数を表示
echo "Interace: " $2		#2つ目の引数を表示

if [ $# != 2 ]; then
    echo usage: ./mv_pcap.sh Router_No Num_of_Interface
    exit 1
else
    for ((i=0; i<$2-1; i++))
    do
        docker cp R$1:/tmp/R$1_net$i.pcap pcap/R$1_net$i.pcap  
    done
fi