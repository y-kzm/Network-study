#!/bin/env python3
# ./test.py [yaml file] [pcap path]
from genericpath import samestat
import yaml
import subprocess
import sys

args = sys.argv
argc = len(args)
if argc != 3:
    print('Argment error')
    quit()
path = args[2]
 
with open(args[1]) as file:
    yml = yaml.safe_load(file)
    nodes = yml['nodes'] 
    name = [d.get('name') for d in nodes]

list = []
for j in name:
    try:
        result = subprocess.check_output(["docker", "exec", j, "ps"])
    except:
        print('Command error1')
        quit()
    result = result.decode().strip().split('\n') 
    sampling = [i for i in result if "tcpdump" in i]
    #print(sampling)
    for index, item in enumerate(sampling):  
        if sampling != []:
            num = sampling[index].split(' ') 
            print(num[2])
            # [2]: ps_num [14]: pcap_path
            sub = [j, num[2], num[14]]
            list.append(sub)
    else:
        print('Process does not exist')
print(list)

for index, item in enumerate(list):
    try:
        subprocess.check_output(["docker", "exec", list[index][0], "kill", list[index][1]])
    except:
        print('Command error2')

for index, item in enumerate(list):
    com1 = list[index][0] + ':' + list[index][2]
    pcap_name = item[2].split('/') 
    com2 = path + pcap_name[2]
    #print(com1)
    #print(com2)
    try:
        subprocess.check_output(["docker", "cp", com1, com2])
    except:
        print('Command error2')
