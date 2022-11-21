#!/bin/bash
ip netns add BLUE
ip netns exec BLUE ip link set lo up

ip link add name veth1 type veth peer name br-veth1
ip link add name blue type veth peer name br-blue

ip link set blue netns BLUE

ip link add br0 type bridge
ip link set dev br-veth1 master br0
ip link set dev br-blue master br0

ip netns exec BLUE ip link set blue up
ip link set veth1 up
ip link set br-veth1 up
ip link set br-blue up

ip link set br0 up