FROM ubuntu:20.04

RUN apt-get update 
RUN apt-get install -y iproute2 iputils-ping net-tools build-essential tcpdump
RUN apt-get install -y openvswitch-switch openvswitch-common
RUN apt-get install -y git python-dev python-setuptools python3-pip

WORKDIR /work
RUN git clone https://github.com/osrg/ryu.git
WORKDIR ryu/
RUN pip install .

