#! /bin/bash
echo "Run:      " $0		#スクリプト名を表示
echo "Router:   " $1		#1つ目の引数を表示
echo "Interace: " $2		#2つ目の引数を表示

if [ $# != 2 ]; then
    echo usage: ./pcap.sh Router_No Num_of_Interface
    exit 1
else
    for ((i=0; i<$2-1; i++))
    do
        docker exec R$1 tcpdump -nni net$i -w /tmp/R$1_net$i.pcap -W1 -G90 &
    done
fi