#!/usr/bin/env python3
import argparse
import sys
import socket
import random
import struct

from scapy.all import sendp, get_if_list, get_if_hwaddr, Ether
from scapy.fields import *
from scapy.packet import Packet
from struct import pack
class P4calc(Packet):
    name = "P4calc"
    fields_desc = [
        StrFixedLenField("p", "P", length=1),
        StrFixedLenField("four", "4", length=1), 
        XByteField("ver", 0x01), 

        # h1 input
        BitField("mac_source", 0, 48),
        BitField("mac_dest", 0, 48),
        BitField("msg_len", 0, 16),
        BitField("seq_id", 0, 16),
        BitField("msg_type", 0, 4),
        BitField("inter_arrival_time", 0, 8),
        BitField("zero", 0, 4),
        BitField("s1_replication", 0, 32),
        BitField("s4_replication", 0, 32),
        BitField("msg_index", 0, 32),
        # s0 output
        BitField("s0_output_0_0", 0, 32),
        BitField("s0_output_0_1", 0, 32),
        BitField("s0_output_0_2", 0, 32),
        BitField("s0_output_0_3", 0, 32),
        BitField("s0_output_0_4", 0, 32),
        BitField("s0_output_0_5", 0, 32),
        BitField("s0_output_1_0", 0, 32),
        BitField("s0_output_1_1", 0, 32),
        BitField("s0_output_1_2", 0, 32),
        BitField("s0_output_1_3", 0, 32),
        BitField("s0_output_1_4", 0, 32),
        BitField("s0_output_1_5", 0, 32),
        BitField("s0_output_2_0", 0, 32),
        BitField("s0_output_2_1", 0, 32),
        BitField("s0_output_2_2", 0, 32),
        BitField("s0_output_2_3", 0, 32),
        BitField("s0_output_2_4", 0, 32),
        BitField("s0_output_2_5", 0, 32),
        BitField("s0_output_3_0", 0, 32),
        BitField("s0_output_3_1", 0, 32),
        BitField("s0_output_3_2", 0, 32),
        BitField("s0_output_3_3", 0, 32),
        BitField("s0_output_3_4", 0, 32),
        BitField("s0_output_3_5", 0, 32),
        BitField("s0_output_4_0", 0, 32),
        BitField("s0_output_4_1", 0, 32),
        BitField("s0_output_4_2", 0, 32),
        BitField("s0_output_4_3", 0, 32),
        BitField("s0_output_4_4", 0, 32),
        BitField("s0_output_4_5", 0, 32),
        BitField("s0_output_5_0", 0, 32),
        BitField("s0_output_5_1", 0, 32),
        BitField("s0_output_5_2", 0, 32),
        BitField("s0_output_5_3", 0, 32),
        BitField("s0_output_5_4", 0, 32),
        BitField("s0_output_5_5", 0, 32),
        BitField("s0_output_6_0", 0, 32),
        BitField("s0_output_6_1", 0, 32),
        BitField("s0_output_6_2", 0, 32),
        BitField("s0_output_6_3", 0, 32),
        BitField("s0_output_6_4", 0, 32),
        BitField("s0_output_6_5", 0, 32),
        BitField("s0_output_7_0", 0, 32),
        BitField("s0_output_7_1", 0, 32),
        BitField("s0_output_7_2", 0, 32),
        BitField("s0_output_7_3", 0, 32),
        BitField("s0_output_7_4", 0, 32),
        BitField("s0_output_7_5", 0, 32),
       
        # s1 input
        BitField("s1_output_0_0", 0, 32),
        BitField("s1_output_0_1", 0, 32),
        BitField("s1_output_0_2", 0, 32),
        BitField("s1_output_0_3", 0, 32),
        BitField("s1_output_0_4", 0, 32),
        BitField("s1_output_0_5", 0, 32),
        BitField("s1_output_1_0", 0, 32),
        BitField("s1_output_1_1", 0, 32),
        BitField("s1_output_1_2", 0, 32),
        BitField("s1_output_1_3", 0, 32),
        BitField("s1_output_1_4", 0, 32),
        BitField("s1_output_1_5", 0, 32),
        BitField("s1_output_2_0", 0, 32),
        BitField("s1_output_2_1", 0, 32),
        BitField("s1_output_2_2", 0, 32),
        BitField("s1_output_2_3", 0, 32),
        BitField("s1_output_2_4", 0, 32),
        BitField("s1_output_2_5", 0, 32),
        BitField("s1_output_3_0", 0, 32),
        BitField("s1_output_3_1", 0, 32),
        BitField("s1_output_3_2", 0, 32),
        BitField("s1_output_3_3", 0, 32),
        BitField("s1_output_3_4", 0, 32),
        BitField("s1_output_3_5", 0, 32),
        BitField("s1_output_4_0", 0, 32),
        BitField("s1_output_4_1", 0, 32),
        BitField("s1_output_4_2", 0, 32),
        BitField("s1_output_4_3", 0, 32),
        BitField("s1_output_4_4", 0, 32),
        BitField("s1_output_4_5", 0, 32),
        BitField("s1_output_5_0", 0, 32),
        BitField("s1_output_5_1", 0, 32),
        BitField("s1_output_5_2", 0, 32),
        BitField("s1_output_5_3", 0, 32),
        BitField("s1_output_5_4", 0, 32),
        BitField("s1_output_5_5", 0, 32),
        BitField("s1_output_6_0", 0, 32),
        BitField("s1_output_6_1", 0, 32),
        BitField("s1_output_6_2", 0, 32),
        BitField("s1_output_6_3", 0, 32),
        BitField("s1_output_6_4", 0, 32),
        BitField("s1_output_6_5", 0, 32),
        BitField("s1_output_7_0", 0, 32),
        BitField("s1_output_7_1", 0, 32),
        BitField("s1_output_7_2", 0, 32),
        BitField("s1_output_7_3", 0, 32),
        BitField("s1_output_7_4", 0, 32),
        BitField("s1_output_7_5", 0, 32),
        BitField("s7_output_0_0", 0, 32),
        BitField("s7_output_0_1", 0, 32),
        BitField("s7_output_1_0", 0, 32),
        BitField("s7_output_1_1", 0, 32),
        BitField("s7_output_2_0", 0, 32),
        BitField("s7_output_2_1", 0, 32),
        BitField("s7_output_3_0", 0, 32),
        BitField("s7_output_3_1", 0, 32),
        BitField("s7_output_4_0", 0, 32),
        BitField("s7_output_4_1", 0, 32),
        BitField("s7_output_5_0", 0, 32),
        BitField("s7_output_5_1", 0, 32),
        BitField("s7_output_6_0", 0, 32),
        BitField("s7_output_6_1", 0, 32),
        BitField("s7_output_7_0", 0, 32),
        BitField("s7_output_7_1", 0, 32),
    ]

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

def main():
    mac_addresses = [
        0x112233445566, 0x223344556677, 0x334455667788,
        0x445566778899, 0x5566778899AA, 0x66778899AABB,
        0x778899AABBCC, 0x8899AABBCCDD, 0x99AABBCCDDEE,
        0xAABBCCDDEEFF, 0xBBCCDDEEFF00, 0xCCDDEEFF0011
    ]

    msg_lens = [1024, 2048, 4096, 8192, 16384]
    seq_ids = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    msg_types = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]  # 半字节
    inter_arrival_times = [50, 100, 150, 200, 250]

    iface = get_if()

    for i in range(40):
        # 按序选择字段
        mac_source = mac_addresses[i % len(mac_addresses)]
        mac_dest = mac_addresses[(i + 1) % len(mac_addresses)]
        msg_len = msg_lens[i % len(msg_lens)]
        seq_id = seq_ids[i % len(seq_ids)]
        msg_type = msg_types[i % len(msg_types)]
        inter_arrival_time = inter_arrival_times[i % len(inter_arrival_times)]
        zero = 0

        # 转换为大端序
        mac_source_be = int.from_bytes(pack(">Q", mac_source)[2:], "big")  # MAC 是 6 字节
        mac_dest_be = int.from_bytes(pack(">Q", mac_dest)[2:], "big")
        msg_len_be = int.from_bytes(pack(">H", msg_len), "big")  # msg_len 是 2 字节
        seq_id_be = int.from_bytes(pack(">H", seq_id), "big")  # seq_id 是 2 字节

        msg_type_be = msg_type & 0xF  # 确保只保留 4 位

        inter_arrival_time_be = int.from_bytes(pack(">B", inter_arrival_time), "big")  # 间隔时间是 1 字节

        # 构造数据包
        pkt = Ether(
            src=get_if_hwaddr(iface), dst="ff:ff:ff:ff:ff:ff", type=0x1234
        ) / P4calc(
            mac_source=mac_source_be,
            mac_dest=mac_dest_be,
            msg_len=msg_len_be,
            seq_id=seq_id_be,
            msg_type=msg_type_be,
            inter_arrival_time=inter_arrival_time_be,
            zero=zero,
        )

        sendp(pkt, iface=iface, verbose=False)



if __name__ == "__main__":
    main()