#!/usr/bin/env python3
import pandas as pd
import numpy as np
import sys
import socket
import random
import struct
import ipaddress
from scapy.all import sendp, get_if_list, get_if_hwaddr, Ether
from scapy.fields import *
from scapy.packet import Packet
from struct import pack
class P4calc(Packet):
    name = "P4calc"
    fields_desc = [
        # ptp input
        
        BitField("feature_0", 0 ,16),
        BitField("feature_1", 0 ,16),
        BitField("feature_2", 0 ,16),
        BitField("feature_3", 0 ,16),
        BitField("feature_4", 0 ,16),
        BitField("feature_5", 0 ,16),

        StrFixedLenField("p", "P", length=1),
        StrFixedLenField("four", "4", length=1), 
        XByteField("ver", 0x01), 
        
        # h1 input
        BitField("s1_replication", 0, 32),
        BitField("s4_replication", 0, 32),
        BitField("msg_index", 0, 32),
        # s0 output
        BitField("s0_output_0_0", 0, 16),
        BitField("s0_output_0_1", 0, 16),
        BitField("s0_output_0_2", 0, 16),
        BitField("s0_output_0_3", 0, 16),
        BitField("s0_output_0_4", 0, 16),
        BitField("s0_output_0_5", 0, 16),
        BitField("s0_output_1_0", 0, 16),
        BitField("s0_output_1_1", 0, 16),
        BitField("s0_output_1_2", 0, 16),
        BitField("s0_output_1_3", 0, 16),
        BitField("s0_output_1_4", 0, 16),
        BitField("s0_output_1_5", 0, 16),
        BitField("s0_output_2_0", 0, 16),
        BitField("s0_output_2_1", 0, 16),
        BitField("s0_output_2_2", 0, 16),
        BitField("s0_output_2_3", 0, 16),
        BitField("s0_output_2_4", 0, 16),
        BitField("s0_output_2_5", 0, 16),
        BitField("s0_output_3_0", 0, 16),
        BitField("s0_output_3_1", 0, 16),
        BitField("s0_output_3_2", 0, 16),
        BitField("s0_output_3_3", 0, 16),
        BitField("s0_output_3_4", 0, 16),
        BitField("s0_output_3_5", 0, 16),
        BitField("s0_output_4_0", 0, 16),
        BitField("s0_output_4_1", 0, 16),
        BitField("s0_output_4_2", 0, 16),
        BitField("s0_output_4_3", 0, 16),
        BitField("s0_output_4_4", 0, 16),
        BitField("s0_output_4_5", 0, 16),
        BitField("s0_output_5_0", 0, 16),
        BitField("s0_output_5_1", 0, 16),
        BitField("s0_output_5_2", 0, 16),
        BitField("s0_output_5_3", 0, 16),
        BitField("s0_output_5_4", 0, 16),
        BitField("s0_output_5_5", 0, 16),
        BitField("s0_output_6_0", 0, 16),
        BitField("s0_output_6_1", 0, 16),
        BitField("s0_output_6_2", 0, 16),
        BitField("s0_output_6_3", 0, 16),
        BitField("s0_output_6_4", 0, 16),
        BitField("s0_output_6_5", 0, 16),
        BitField("s0_output_7_0", 0, 16),
        BitField("s0_output_7_1", 0, 16),
        BitField("s0_output_7_2", 0, 16),
        BitField("s0_output_7_3", 0, 16),
        BitField("s0_output_7_4", 0, 16),
        BitField("s0_output_7_5", 0, 16),
       
        # s1 input
        BitField("s1_output_0_0", 0, 16),
        BitField("s1_output_0_1", 0, 16),
        BitField("s1_output_0_2", 0, 16),
        BitField("s1_output_0_3", 0, 16),
        BitField("s1_output_0_4", 0, 16),
        BitField("s1_output_0_5", 0, 16),
        BitField("s1_output_1_0", 0, 16),
        BitField("s1_output_1_1", 0, 16),
        BitField("s1_output_1_2", 0, 16),
        BitField("s1_output_1_3", 0, 16),
        BitField("s1_output_1_4", 0, 16),
        BitField("s1_output_1_5", 0, 16),
        BitField("s1_output_2_0", 0, 16),
        BitField("s1_output_2_1", 0, 16),
        BitField("s1_output_2_2", 0, 16),
        BitField("s1_output_2_3", 0, 16),
        BitField("s1_output_2_4", 0, 16),
        BitField("s1_output_2_5", 0, 16),
        BitField("s1_output_3_0", 0, 16),
        BitField("s1_output_3_1", 0, 16),
        BitField("s1_output_3_2", 0, 16),
        BitField("s1_output_3_3", 0, 16),
        BitField("s1_output_3_4", 0, 16),
        BitField("s1_output_3_5", 0, 16),
        BitField("s1_output_4_0", 0, 16),
        BitField("s1_output_4_1", 0, 16),
        BitField("s1_output_4_2", 0, 16),
        BitField("s1_output_4_3", 0, 16),
        BitField("s1_output_4_4", 0, 16),
        BitField("s1_output_4_5", 0, 16),
        BitField("s1_output_5_0", 0, 16),
        BitField("s1_output_5_1", 0, 16),
        BitField("s1_output_5_2", 0, 16),
        BitField("s1_output_5_3", 0, 16),
        BitField("s1_output_5_4", 0, 16),
        BitField("s1_output_5_5", 0, 16),
        BitField("s1_output_6_0", 0, 16),
        BitField("s1_output_6_1", 0, 16),
        BitField("s1_output_6_2", 0, 16),
        BitField("s1_output_6_3", 0, 16),
        BitField("s1_output_6_4", 0, 16),
        BitField("s1_output_6_5", 0, 16),
        BitField("s1_output_7_0", 0, 16),
        BitField("s1_output_7_1", 0, 16),
        BitField("s1_output_7_2", 0, 16),
        BitField("s1_output_7_3", 0, 16),
        BitField("s1_output_7_4", 0, 16),
        BitField("s1_output_7_5", 0, 16),

        # s7 output
        BitField("s7_before_sigmoid_0", 0, 16),
        BitField("s7_before_sigmoid_1", 0, 16),
        BitField("s7_before_sigmoid_2", 0, 16),
        BitField("s7_before_sigmoid_3", 0, 16),
        BitField("s7_before_sigmoid_4", 0, 16),
        BitField("s7_before_sigmoid_5", 0, 16),
        BitField("s7_before_sigmoid_6", 0, 16),
        BitField("s7_before_sigmoid_7", 0, 16),
        BitField("s7_output_0", 0, 16),
        BitField("s7_output_1", 0, 16),
        BitField("s7_output_2", 0, 16),
        BitField("s7_output_3", 0, 16),
        BitField("s7_output_4", 0, 16),
        BitField("s7_output_5", 0, 16),
        BitField("s7_output_6", 0, 16),
        BitField("s7_output_7", 0, 16),
    ]

# -----------------------------
# 获取接口名
# -----------------------------
def get_if():
    iface = None
    for i in get_if_list():
        if "eth0" in i:
            iface = i
            break
    if not iface:
        print("Cannot find eth0 interface")
        exit(1)
    return iface


# -----------------------------
# IP地址转换函数
# -----------------------------
def ip_to_int(ip_str):
    try:
        ip_str = str(ip_str).strip()
        full_ip = int(ipaddress.IPv4Address(ip_str))
        last_two_bytes = full_ip & 0xFFFF
        return last_two_bytes
    except:
        return 0
    
def main():
  
    iface = get_if()
    df = pd.read_csv("test_data.csv")
    features = ["Source IP", " Destination IP", " Flow Packets/s", " Flow IAT Max", " Protocol", " Flow IAT Mean"]
    
    df = df[features]

    df = df.tail(2400).reset_index(drop=True)

    for i in range(len(df)):
        # 按序选择字段
        dst_mac = "00:00:0a:00:0a:02" 
        zero = 0
        row = df.iloc[i]

        # 构造数据包
        pkt = Ether(
            src=get_if_hwaddr(iface), dst=dst_mac, type=0x1234
        ) / P4calc(
            feature_0=int(row[features[0]])*256,
            feature_1=int(row[features[1]])*256,
            feature_2=int(row[features[2]])*256,
            feature_3=int(row[features[3]])*256,
            feature_4=int(row[features[4]])*256,
            feature_5=int(row[features[5]])*256,
        )

        sendp(pkt, iface=iface, verbose=False)



if __name__ == "__main__":
    main()