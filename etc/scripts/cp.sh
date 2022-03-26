#!/bin/bash
echo "-------------------------------"
echo "Run:                      " $0		# スクリプト名
echo "Node Type:                " $1        # R, C, S, ...
echo "Index of Node :           " $2		# NodeのIndex
echo "Total Number of Interace: " $3		# Interfaceの数

if [ $# != 3 ]; then
    echo usage: ./cp.sh [Node] [Indewx] [IfNum]
    exit 1
else
    for ((i=0; i<$3; i++))
    do
        docker cp $1$2:/tmp/$1$2_net$i.pcap pcap/$1$2_net$i.pcap
        echo ">> Cp $1$2 net$i."
    done
fi

exit 0
