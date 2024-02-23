#!/bin/env python3
# Usage: ./pcap.py [path to spec.yaml] [path to the directory you want to save the pcap file]
# --- spec.yaml ---
#   cmds:
#     - cmd: tcpdump -i net0 -w /tmp/R1-net0.pcap &
# -----------------
from ast import keyword
from genericpath import samestat
from dbus import Interface
import yaml
import subprocess
import sys

def main():
    args = sys.argv
    argc = len(args)
    if argc != 3:
        print("./pcap.py [path to spec.yaml] [path to the directory you want to save the pcap file]")
        print("Example: ./pcap.py bgp/basic/v4/spec.yaml pcap/")
        quit()
    spec = args[1]
    save_dir = args[2]
    if save_dir[-1] != "/":
        print("path to the directory you want to save the pcap file: must end with '/'")
        print("Example: ./pcap.py bgp/basic/v4/spec.yaml pcap/")
        quit()
    print("Start to copy pcap files to " + save_dir + " ...")
    
    with open(spec) as file:
        yml = yaml.safe_load(file)
        nodes = [d.get("name") for d in yml["nodes"]]   # ['R1', 'R2', 'R3', ...]
    for i in nodes:
        try:
            subprocess.check_output(["docker", "exec", i, "pkill", "tcpdump"])
            cmd_rslt = subprocess.check_output(["docker", "exec", i, "ls", "/tmp"])
            cmd_rslt = cmd_rslt.decode().strip().split('\n')  
            sampling = []; key = ".pcap"
            try:
                for j in cmd_rslt:
                    if key in j:
                        sampling.append(j)
                for k in sampling:
                    subprocess.check_output(["docker", "cp", i + ":/tmp/" + k, save_dir + k])
            except:
                print("Error")
            print(i + ": save pcap file to " + save_dir + k);
        except:
            print(i + ": /tmp/*.pcap file does not exist.")

    print("Finish!")
    quit()

if __name__ == "__main__":
    main()