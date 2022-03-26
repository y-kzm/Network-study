#!/bin/bash
echo "-------------------------------"
echo "Run:                      " $0		# スクリプト名
echo "Node Type:                " $1        # R, C, S, ...
echo "Index of Node :           " $2		# NodeのIndex
echo "Total Number of Interace: " $3		# Interfaceの数

if [ $# != 3 ]; then
    echo usage: ./pcap.sh [Node] [Index] [IfNum]
    exit 1
else
    for ((i=0; i<$3; i++))
    do
        # -nn: そのまま表示 -i: Interface -w: ファイル出力 -W: ローテート回数 -G: 間隔時間
        docker exec $1$2 tcpdump -nni net$i -s 65535 -w /tmp/$1$2_net$i.pcap -W1 -G60 &
        echo ">> Pcap $1$2 net$i."
    done
fi

exit 0

