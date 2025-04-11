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

//48位
const bit<48> weight_mac_source = 0x12345678;
const bit<48> bias_mac_source = 0x1;
const bit<48> weight_mac_dest = 0x12345678;
const bit<48> bias_mac_dest = 0x1;
//16位
const bit<16> weight_message_length = 0x1234;
const bit<16> bias_message_length = 0x1;
const bit<16> weight_sequence_id = 0x1234;
const bit<16> bias_sequence_id = 0x1;
//4、8位也采用16位映射
const bit<16> weight_message_type = 0x1234;
const bit<16> bias_message_type = 0x1;
const bit<16> weight_inter_arrival_time = 0x1234;
const bit<16> bias_inter_arrival_time = 0x1;


const bit<16> ETHERTYPE_PTP  = 0x88F7;

header ptp_t {
    bit<4>   transport_specifics;
    bit<4>   message_type;
    bit<4>   reserved1;
    bit<4>   version;
    bit<16>  message_legth;
    bit<8>   domain_number;
    bit<8>   reserved2;
    bit<16>  flagfiled;
    bit<64>  correction_field;
    bit<32>  reserved3;
    bit<80>  source_port_identity;
    bit<16>  sequence_id;
    bit<8>   control_field;
    bit<8>   log_message_interval;
}

header p4calc_t {
    bit<8> p;
    bit<8> four;
    bit<8> ver;

    bit<32> s1_replication;
    bit<32> s4_replication;
    bit<32> msg_index;
}

header s0_output0_calc_t {
    bit<16> s0_output_0_0;
    bit<16> s0_output_0_1;
    bit<16> s0_output_0_2;
    bit<16> s0_output_0_3;
    bit<16> s0_output_0_4;
    bit<16> s0_output_0_5;
    bit<16> s0_output_1_0;
    bit<16> s0_output_1_1;
    bit<16> s0_output_1_2;
    bit<16> s0_output_1_3;
    bit<16> s0_output_1_4;
    bit<16> s0_output_1_5;
    bit<16> s0_output_2_0;
    bit<16> s0_output_2_1;
    bit<16> s0_output_2_2;
    bit<16> s0_output_2_3;
    bit<16> s0_output_2_4;
    bit<16> s0_output_2_5;
    bit<16> s0_output_3_0;
    bit<16> s0_output_3_1;
    bit<16> s0_output_3_2;
    bit<16> s0_output_3_3;
    bit<16> s0_output_3_4;
    bit<16> s0_output_3_5;
    bit<16> s0_output_4_0;
    bit<16> s0_output_4_1;
    bit<16> s0_output_4_2;
    bit<16> s0_output_4_3;
    bit<16> s0_output_4_4;
    bit<16> s0_output_4_5;
    bit<16> s0_output_5_0;
    bit<16> s0_output_5_1;
    bit<16> s0_output_5_2;
    bit<16> s0_output_5_3;
    bit<16> s0_output_5_4;
    bit<16> s0_output_5_5;
    bit<16> s0_output_6_0;
    bit<16> s0_output_6_1;
    bit<16> s0_output_6_2;
    bit<16> s0_output_6_3;
    bit<16> s0_output_6_4;
    bit<16> s0_output_6_5;
    bit<16> s0_output_7_0;
    bit<16> s0_output_7_1;
    bit<16> s0_output_7_2;
    bit<16> s0_output_7_3;
    bit<16> s0_output_7_4;
    bit<16> s0_output_7_5;
}

header s1_output0_calc_t {
    bit<16> s1_output_0_0;
    bit<16> s1_output_0_1;
    bit<16> s1_output_0_2;
    bit<16> s1_output_0_3;
    bit<16> s1_output_0_4;
    bit<16> s1_output_0_5;
    bit<16> s1_output_1_0;
    bit<16> s1_output_1_1;
    bit<16> s1_output_1_2;
    bit<16> s1_output_1_3;
    bit<16> s1_output_1_4;
    bit<16> s1_output_1_5;
    bit<16> s1_output_2_0;
    bit<16> s1_output_2_1;
    bit<16> s1_output_2_2;
    bit<16> s1_output_2_3;
    bit<16> s1_output_2_4;
    bit<16> s1_output_2_5;
    bit<16> s1_output_3_0;
    bit<16> s1_output_3_1;
    bit<16> s1_output_3_2;
    bit<16> s1_output_3_3;
    bit<16> s1_output_3_4;
    bit<16> s1_output_3_5;
    bit<16> s1_output_4_0;
    bit<16> s1_output_4_1;
    bit<16> s1_output_4_2;
    bit<16> s1_output_4_3;
    bit<16> s1_output_4_4;
    bit<16> s1_output_4_5;
    bit<16> s1_output_5_0;
    bit<16> s1_output_5_1;
    bit<16> s1_output_5_2;
    bit<16> s1_output_5_3;
    bit<16> s1_output_5_4;
    bit<16> s1_output_5_5;
    bit<16> s1_output_6_0;
    bit<16> s1_output_6_1;
    bit<16> s1_output_6_2;
    bit<16> s1_output_6_3;
    bit<16> s1_output_6_4;
    bit<16> s1_output_6_5;
    bit<16> s1_output_7_0;
    bit<16> s1_output_7_1;
    bit<16> s1_output_7_2;
    bit<16> s1_output_7_3;
    bit<16> s1_output_7_4;
    bit<16> s1_output_7_5;
}

header s7_output0_calc_t {
    bit<16> s7_before_sigmoid;
    bit<16> s7_output;
}

struct headers {
    ethernet_t   ethernet;
    ptp_t       ptp;
    p4calc_t     p4calc;
    s0_output0_calc_t s0_output0_calc;
    s1_output0_calc_t s1_output0_calc;
    s7_output0_calc_t s7_output0_calc;
}
struct ingress_metadata_t {
}

struct metadata {
    bit<16> s7_before_sigmoid;
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
            ETHERTYPE_PTP : parse_ptp;
            P4CALC_ETYPE : check_p4calc;
            default      : accept;
        }
    }

    state parse_ptp {
        packet.extract(hdr.ptp);
        transition check_p4calc;
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
    register<bit<16>>(48) input_data;
    register<bit<32>>(1) seq_len;
    register<bit<32>>(1) msg_index;
    /*
    // 读取输入，把不同的输入通过技巧放入我们的32位定点数里面
    // 关于这里定点数，选择采用Q24.8的形式，相当于对对应的value乘以256（左移8位），再用补码表示
    // 这样相当于后8位表示小数部分，前24位表示整数部分，虽有精度损失，但是在可接受范围里面
    */
    /*
    由于e^x的计算在p4里面实现有限制，所以这里先改采用Q8.8的形式
    */
    action read_input(){     
        bit<32> seq_len_num;
        seq_len.read(seq_len_num , 0);
        bit<32> seq_num = seq_len_num * 6;

        //处理mac_source(48)
        bit<48> transformed_mac_source = hdr.ethernet.srcAddr * weight_mac_source + bias_mac_source;
        bit<16> transformed_mac_source_low_16bits = transformed_mac_source[15:0];  // 取低 16 位
        input_data.write(seq_num, transformed_mac_source_low_16bits);

        //处理mac_dest(48)
        bit<48> transformed_mac_dest = hdr.ethernet.dstAddr * weight_mac_dest + bias_mac_dest;
        bit<16> transformed_mac_dest_low_16bits = transformed_mac_dest[15:0];  // 取低 16 位
        input_data.write(seq_num + 1, transformed_mac_dest_low_16bits);

        //处理message_legth(16)
        bit<16> result_msg_len_16bits = hdr.ptp.message_legth * weight_message_length + bias_message_length;
        input_data.write(seq_num + 2, result_msg_len_16bits);

        //处理sequence_id(16)
        bit<16> result_seq_id_16bits = hdr.ptp.sequence_id * weight_sequence_id + bias_sequence_id;
        input_data.write(seq_num + 3, result_seq_id_16bits);

        //处理message_type(4)
        bit<16> result_msg_type_16bits = 0;
        result_msg_type_16bits[3:0] = hdr.ptp.message_type;
        result_msg_type_16bits = result_msg_type_16bits * weight_message_type + bias_message_type;
        input_data.write(seq_num + 4, result_msg_type_16bits);

        //处理inter-arrival_time(8)
        bit<16> result_inter_arrival_time_16bits = 0;
        result_inter_arrival_time_16bits[7:0] = hdr.ptp.log_message_interval;
        result_inter_arrival_time_16bits = result_inter_arrival_time_16bits * weight_inter_arrival_time + bias_inter_arrival_time;
        input_data.write(seq_num + 5, result_inter_arrival_time_16bits);
    }

    // 丢弃
    action operation_drop() {
        mark_to_drop(standard_metadata);
    }

    // 更新seq_len
    action operation_read_seq_len() {
        bit<32> seq_len_num;
        seq_len.read(seq_len_num , 0);
        meta.seq_len = seq_len_num;        
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
            7 : operation_send();// 8*6是输入模型的维度
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
        packet.emit(hdr.ptp);
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