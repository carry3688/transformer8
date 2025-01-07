/* -*- P4_16 -*- */
#include <core.p4>
#include <v1model.p4>

/*
 * Standard ethernet header
 */
header ethernet_t {
    bit<48> dstAddr;
    bit<48> srcAddr;
    bit<16> etherType;
}

const bit<16> P4CALC_ETYPE = 0x1234;
const bit<8>  P4CALC_P     = 0x50;   // 'P'
const bit<8>  P4CALC_4     = 0x34;   // '4'
const bit<8>  P4CALC_VER   = 0x01;   // v0.1

const bit<48> weight_mac_source = 0x12345678;
const bit<48> bias_mac_source = 0x00000001;
const bit<48> weight_mac_dest = 0x12345678;
const bit<48> bias_mac_dest = 0x00000001;

header p4calc_t {
    bit<8> p;
    bit<8> four;
    bit<8> ver;
    // Input features(6 features)
    bit<48> mac_source;
    bit<48> mac_dest;
    bit<16> msg_len;
    bit<16> seq_id;
    bit<4>  msg_type;
    bit<8>  inter_arrival_time;

    bit<4> zero;

    bit<32> s1_replication;
    bit<32> s4_replication;
    bit<32> msg_index;
}

header s0_output0_calc_t {
    bit<32> s0_output_0_0;
    bit<32> s0_output_0_1;
    bit<32> s0_output_0_2;
    bit<32> s0_output_0_3;
    bit<32> s0_output_0_4;
    bit<32> s0_output_0_5;
    bit<32> s0_output_1_0;
    bit<32> s0_output_1_1;
    bit<32> s0_output_1_2;
    bit<32> s0_output_1_3;
    bit<32> s0_output_1_4;
    bit<32> s0_output_1_5;
    bit<32> s0_output_2_0;
    bit<32> s0_output_2_1;
    bit<32> s0_output_2_2;
    bit<32> s0_output_2_3;
    bit<32> s0_output_2_4;
    bit<32> s0_output_2_5;
    bit<32> s0_output_3_0;
    bit<32> s0_output_3_1;
    bit<32> s0_output_3_2;
    bit<32> s0_output_3_3;
    bit<32> s0_output_3_4;
    bit<32> s0_output_3_5;
    bit<32> s0_output_4_0;
    bit<32> s0_output_4_1;
    bit<32> s0_output_4_2;
    bit<32> s0_output_4_3;
    bit<32> s0_output_4_4;
    bit<32> s0_output_4_5;
    bit<32> s0_output_5_0;
    bit<32> s0_output_5_1;
    bit<32> s0_output_5_2;
    bit<32> s0_output_5_3;
    bit<32> s0_output_5_4;
    bit<32> s0_output_5_5;
    bit<32> s0_output_6_0;
    bit<32> s0_output_6_1;
    bit<32> s0_output_6_2;
    bit<32> s0_output_6_3;
    bit<32> s0_output_6_4;
    bit<32> s0_output_6_5;
    bit<32> s0_output_7_0;
    bit<32> s0_output_7_1;
    bit<32> s0_output_7_2;
    bit<32> s0_output_7_3;
    bit<32> s0_output_7_4;
    bit<32> s0_output_7_5;
}

header s1_output0_calc_t {
    bit<32> s1_output_0_0;
    bit<32> s1_output_0_1;
    bit<32> s1_output_0_2;
    bit<32> s1_output_0_3;
    bit<32> s1_output_0_4;
    bit<32> s1_output_0_5;
    bit<32> s1_output_1_0;
    bit<32> s1_output_1_1;
    bit<32> s1_output_1_2;
    bit<32> s1_output_1_3;
    bit<32> s1_output_1_4;
    bit<32> s1_output_1_5;
    bit<32> s1_output_2_0;
    bit<32> s1_output_2_1;
    bit<32> s1_output_2_2;
    bit<32> s1_output_2_3;
    bit<32> s1_output_2_4;
    bit<32> s1_output_2_5;
    bit<32> s1_output_3_0;
    bit<32> s1_output_3_1;
    bit<32> s1_output_3_2;
    bit<32> s1_output_3_3;
    bit<32> s1_output_3_4;
    bit<32> s1_output_3_5;
    bit<32> s1_output_4_0;
    bit<32> s1_output_4_1;
    bit<32> s1_output_4_2;
    bit<32> s1_output_4_3;
    bit<32> s1_output_4_4;
    bit<32> s1_output_4_5;
    bit<32> s1_output_5_0;
    bit<32> s1_output_5_1;
    bit<32> s1_output_5_2;
    bit<32> s1_output_5_3;
    bit<32> s1_output_5_4;
    bit<32> s1_output_5_5;
    bit<32> s1_output_6_0;
    bit<32> s1_output_6_1;
    bit<32> s1_output_6_2;
    bit<32> s1_output_6_3;
    bit<32> s1_output_6_4;
    bit<32> s1_output_6_5;
    bit<32> s1_output_7_0;
    bit<32> s1_output_7_1;
    bit<32> s1_output_7_2;
    bit<32> s1_output_7_3;
    bit<32> s1_output_7_4;
    bit<32> s1_output_7_5;
}

header s7_output0_calc_t {
    bit<32> s7_output_0_0;
    bit<32> s7_output_0_1;
    bit<32> s7_output_1_0;
    bit<32> s7_output_1_1;
    bit<32> s7_output_2_0;
    bit<32> s7_output_2_1;
    bit<32> s7_output_3_0;
    bit<32> s7_output_3_1;
    bit<32> s7_output_4_0;
    bit<32> s7_output_4_1;
    bit<32> s7_output_5_0;
    bit<32> s7_output_5_1;
    bit<32> s7_output_6_0;
    bit<32> s7_output_6_1;
    bit<32> s7_output_7_0;
    bit<32> s7_output_7_1;
}

struct headers {
    ethernet_t   ethernet;
    p4calc_t     p4calc;
    s0_output0_calc_t s0_output0_calc;
    s1_output0_calc_t s1_output0_calc;
    s7_output0_calc_t s7_output0_calc;
}
struct ingress_metadata_t {
}

struct metadata {
    bit<32>  seq_len;
}

/*************************************************************************
 ***********************  P A R S E R  ***********************************
 *************************************************************************/
parser MyParser(packet_in packet,
                out headers hdr,
                inout metadata meta,
                inout standard_metadata_t standard_metadata) {

    state start {
        packet.extract(hdr.ethernet);
        transition select(hdr.ethernet.etherType) {
            P4CALC_ETYPE : check_p4calc;
            default      : accept;
        }
    }

    state check_p4calc {
        transition select(packet.lookahead<p4calc_t>().p,
        packet.lookahead<p4calc_t>().four,
        packet.lookahead<p4calc_t>().ver) {
            (P4CALC_P, P4CALC_4, P4CALC_VER) : parse_p4calc;
            default                          : accept;
        }
    }

    state parse_p4calc {
        packet.extract(hdr.p4calc);
        transition parse_s0_output0_calc;
    }

    state parse_s0_output0_calc {
        packet.extract(hdr.s0_output0_calc);
        transition parse_s1_output0_calc;
    }

    state parse_s1_output0_calc {
        packet.extract(hdr.s1_output0_calc);
        transition parse_s7_output0_calc;
    }

    state parse_s7_output0_calc {
        packet.extract(hdr.s7_output0_calc);
        transition accept;
    }
}

/*************************************************************************
 ************   C H E C K S U M    V E R I F I C A T I O N   *************
 *************************************************************************/
control MyVerifyChecksum(inout headers hdr,
                         inout metadata meta) {
    apply { }
}

/*************************************************************************
 **************  I N G R E S S   P R O C E S S I N G   *******************
 *************************************************************************/
control MyIngress(inout headers hdr,
                  inout metadata meta,
                  inout standard_metadata_t standard_metadata) {
    register<bit<32>>(48) input_data;
    register<bit<32>>(1) seq_len;
    register<bit<32>>(1) msg_index;
    // 读取输入，把不同的输入通过技巧放入我们的32位定点数里面
    action read_input(){     
        bit<32> seq_len_num;
        seq_len.read(seq_len_num , 0);
        bit<32> seq_num = seq_len_num * 6;

        //处理mac_source
        bit<48> transformed_mac_source = hdr.p4calc.mac_source * weight_mac_source + bias_mac_source;
        bit<24> transformed_mac_source_low_24bits = transformed_mac_source[23:0];  // 取低 24 位
        bit<32> result_mac_source_32bits = 0;
        result_mac_source_32bits[31:8] = transformed_mac_source_low_24bits;
        result_mac_source_32bits[7:0] = 0;
        input_data.write(seq_num, result_mac_source_32bits);

        //处理mac_dest
        bit<48> transformed_mac_dest = hdr.p4calc.mac_dest * weight_mac_dest + bias_mac_dest;
        bit<24> transformed_mac_dest_low_24bits = transformed_mac_dest[23:0];  
        bit<32> result_mac_dest_32bits = 0;
        result_mac_dest_32bits[31:8] = transformed_mac_dest_low_24bits;  
        result_mac_dest_32bits[7:0] = 0;
        input_data.write(seq_num + 1, result_mac_dest_32bits);

        //处理msg_len
        bit<32> result_msg_len_32bits = 0;
        result_msg_len_32bits[31:24] = 0;
        result_msg_len_32bits[23:8] = hdr.p4calc.msg_len;
        result_msg_len_32bits[7:0] = 0;
        input_data.write(seq_num + 2, result_msg_len_32bits);

        //处理seq_id
        bit<32> result_seq_id_32bits = 0;
        result_seq_id_32bits[31:24] = 0;
        result_seq_id_32bits[23:8] = hdr.p4calc.seq_id;
        result_seq_id_32bits[7:0] = 0;
        input_data.write(seq_num + 3, result_seq_id_32bits);

        //处理msg_type
        bit<32> result_msg_type_32bits = 0;
        result_msg_type_32bits[31:12] = 0;
        result_msg_type_32bits[11:8] = hdr.p4calc.msg_type ;
        result_msg_type_32bits[7:0] = 0;
        input_data.write(seq_num + 4, result_msg_type_32bits);

        //处理inter-arrival_time
        bit<32> result_inter_arrival_time_32bits = 0;
        result_inter_arrival_time_32bits[31:16] = 0;
        result_inter_arrival_time_32bits[15:8] = hdr.p4calc.inter_arrival_time;
        result_inter_arrival_time_32bits[7:0] = 0;
        input_data.write(seq_num + 5, result_inter_arrival_time_32bits);

      
    }

    // 丢弃
    action operation_drop() {
        mark_to_drop(standard_metadata);
    }

    action operation_read_seq_len() {
        bit<32> seq_len_num;
        seq_len.read(seq_len_num , 0);
        meta.seq_len = seq_len_num;

        // 更新seq_len
        seq_len.write(0, seq_len_num + 1);
    }

    
    // 清零寄存器
    action clear_register() {
        seq_len.write(0, 0);
    }
    
    // 发送
    action operation_send() {
        input_data.read(hdr.s0_output0_calc.s0_output_0_0, 0);
        input_data.read(hdr.s0_output0_calc.s0_output_0_1, 1);
        input_data.read(hdr.s0_output0_calc.s0_output_0_2, 2);
        input_data.read(hdr.s0_output0_calc.s0_output_0_3, 3);
        input_data.read(hdr.s0_output0_calc.s0_output_0_4, 4);
        input_data.read(hdr.s0_output0_calc.s0_output_0_5, 5);
        input_data.read(hdr.s0_output0_calc.s0_output_1_0, 6);
        input_data.read(hdr.s0_output0_calc.s0_output_1_1, 7);
        input_data.read(hdr.s0_output0_calc.s0_output_1_2, 8);
        input_data.read(hdr.s0_output0_calc.s0_output_1_3, 9);
        input_data.read(hdr.s0_output0_calc.s0_output_1_4, 10);
        input_data.read(hdr.s0_output0_calc.s0_output_1_5, 11);
        input_data.read(hdr.s0_output0_calc.s0_output_2_0, 12);
        input_data.read(hdr.s0_output0_calc.s0_output_2_1, 13);
        input_data.read(hdr.s0_output0_calc.s0_output_2_2, 14);
        input_data.read(hdr.s0_output0_calc.s0_output_2_3, 15);
        input_data.read(hdr.s0_output0_calc.s0_output_2_4, 16);
        input_data.read(hdr.s0_output0_calc.s0_output_2_5, 17);
        input_data.read(hdr.s0_output0_calc.s0_output_3_0, 18);
        input_data.read(hdr.s0_output0_calc.s0_output_3_1, 19);
        input_data.read(hdr.s0_output0_calc.s0_output_3_2, 20);
        input_data.read(hdr.s0_output0_calc.s0_output_3_3, 21);
        input_data.read(hdr.s0_output0_calc.s0_output_3_4, 22);
        input_data.read(hdr.s0_output0_calc.s0_output_3_5, 23);
        input_data.read(hdr.s0_output0_calc.s0_output_4_0, 24);
        input_data.read(hdr.s0_output0_calc.s0_output_4_1, 25);
        input_data.read(hdr.s0_output0_calc.s0_output_4_2, 26);
        input_data.read(hdr.s0_output0_calc.s0_output_4_3, 27);
        input_data.read(hdr.s0_output0_calc.s0_output_4_4, 28);
        input_data.read(hdr.s0_output0_calc.s0_output_4_5, 29);
        input_data.read(hdr.s0_output0_calc.s0_output_5_0, 30);
        input_data.read(hdr.s0_output0_calc.s0_output_5_1, 31);
        input_data.read(hdr.s0_output0_calc.s0_output_5_2, 32);
        input_data.read(hdr.s0_output0_calc.s0_output_5_3, 33);
        input_data.read(hdr.s0_output0_calc.s0_output_5_4, 34);
        input_data.read(hdr.s0_output0_calc.s0_output_5_5, 35);
        input_data.read(hdr.s0_output0_calc.s0_output_6_0, 36);
        input_data.read(hdr.s0_output0_calc.s0_output_6_1, 37);
        input_data.read(hdr.s0_output0_calc.s0_output_6_2, 38);
        input_data.read(hdr.s0_output0_calc.s0_output_6_3, 39);
        input_data.read(hdr.s0_output0_calc.s0_output_6_4, 40);
        input_data.read(hdr.s0_output0_calc.s0_output_6_5, 41);
        input_data.read(hdr.s0_output0_calc.s0_output_7_0, 42);
        input_data.read(hdr.s0_output0_calc.s0_output_7_1, 43);
        input_data.read(hdr.s0_output0_calc.s0_output_7_2, 44);
        input_data.read(hdr.s0_output0_calc.s0_output_7_3, 45);
        input_data.read(hdr.s0_output0_calc.s0_output_7_4, 46);
        input_data.read(hdr.s0_output0_calc.s0_output_7_5, 47);

        clear_register();
        standard_metadata.mcast_grp =  1;

        bit<32> msg_index_num;
        msg_index.read(msg_index_num , 0);
        hdr.p4calc.msg_index = msg_index_num;
        bit<32> msg_index_num_plus_one = msg_index_num + 1;
        // index四个一循环
        bit<32> msg_index_mod_four = (msg_index_num_plus_one & 0x3);
        msg_index.write(0, msg_index_mod_four);
    }


    table seq_len_action_table {
        key = {
            meta.seq_len : exact; 
        }
        actions = {
            operation_drop;
            operation_send;
        }
        default_action = operation_drop();
        entries = {
            7 : operation_send();
        }
    }



    apply {
        if (hdr.p4calc.isValid()) {
            read_input();
            operation_read_seq_len();
            seq_len_action_table.apply();
        } else {
            operation_drop();
        }
    }
}

/*************************************************************************
 ****************  E G R E S S   P R O C E S S I N G   *******************
 *************************************************************************/
control MyEgress(inout headers hdr,
                 inout metadata meta,
                 inout standard_metadata_t standard_metadata) {
    apply { }
}

/*************************************************************************
 *************   C H E C K S U M    C O M P U T A T I O N   **************
 *************************************************************************/

control MyComputeChecksum(inout headers hdr, inout metadata meta) {
    apply { }
}

/*************************************************************************
 ***********************  D E P A R S E R  *******************************
 *************************************************************************/
control MyDeparser(packet_out packet, in headers hdr) {
    apply {
        packet.emit(hdr.ethernet);
        packet.emit(hdr.p4calc);
        packet.emit(hdr.s0_output0_calc);
        packet.emit(hdr.s1_output0_calc);
        packet.emit(hdr.s7_output0_calc);
    }
}

/*************************************************************************
 ***********************  S W I T T C H **********************************
 *************************************************************************/

V1Switch(
MyParser(),
MyVerifyChecksum(),
MyIngress(),
MyEgress(),
MyComputeChecksum(),
MyDeparser()
) main;