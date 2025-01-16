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
    // Input features(6 features)

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
    bit<32> s7_output;
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
    bit<32>  is_s1_output_store;
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
    // 存储s1_output，以等待第二个到达和他组成一组输出
    register<bit<32>> (192) s1_ouput_store;
    // msg_index为0到3的到达了几个
    register<bit<32>> (4) is_s1_output_store;

      // 丢弃
    action operation_drop() {
        mark_to_drop(standard_metadata);
    }
    

    // 读出对应的msg_index到达了几个包，存在meta.is_s1_output_store
    action operation_calc_is_s1_output_store(){
        bit<32> s1_msg_index =  hdr.p4calc.msg_index;
        is_s1_output_store.read(meta.is_s1_output_store, s1_msg_index);
    }

    //replication为0的存取
    action operation_store_replication_0(bit<32> input_msg_index){
        bit<32> index = input_msg_index * 48 ;
        // 从index处连存24个前三个特征的值
        s1_ouput_store.write(index + 0, hdr.s1_output0_calc.s1_output_0_0);
        s1_ouput_store.write(index + 1, hdr.s1_output0_calc.s1_output_0_1);
        s1_ouput_store.write(index + 2, hdr.s1_output0_calc.s1_output_0_2);
        s1_ouput_store.write(index + 3, hdr.s1_output0_calc.s1_output_1_0);
        s1_ouput_store.write(index + 4, hdr.s1_output0_calc.s1_output_1_1);
        s1_ouput_store.write(index + 5, hdr.s1_output0_calc.s1_output_1_2);
        s1_ouput_store.write(index + 6, hdr.s1_output0_calc.s1_output_2_0);
        s1_ouput_store.write(index + 7, hdr.s1_output0_calc.s1_output_2_1);
        s1_ouput_store.write(index + 8, hdr.s1_output0_calc.s1_output_2_2);
        s1_ouput_store.write(index + 9, hdr.s1_output0_calc.s1_output_3_0);
        s1_ouput_store.write(index + 10, hdr.s1_output0_calc.s1_output_3_1);
        s1_ouput_store.write(index + 11, hdr.s1_output0_calc.s1_output_3_2);
        s1_ouput_store.write(index + 12, hdr.s1_output0_calc.s1_output_4_0);
        s1_ouput_store.write(index + 13, hdr.s1_output0_calc.s1_output_4_1);
        s1_ouput_store.write(index + 14, hdr.s1_output0_calc.s1_output_4_2);
        s1_ouput_store.write(index + 15, hdr.s1_output0_calc.s1_output_5_0);
        s1_ouput_store.write(index + 16, hdr.s1_output0_calc.s1_output_5_1);
        s1_ouput_store.write(index + 17, hdr.s1_output0_calc.s1_output_5_2);
        s1_ouput_store.write(index + 18, hdr.s1_output0_calc.s1_output_6_0);
        s1_ouput_store.write(index + 19, hdr.s1_output0_calc.s1_output_6_1);
        s1_ouput_store.write(index + 20, hdr.s1_output0_calc.s1_output_6_2);
        s1_ouput_store.write(index + 21, hdr.s1_output0_calc.s1_output_7_0);
        s1_ouput_store.write(index + 22, hdr.s1_output0_calc.s1_output_7_1);
        s1_ouput_store.write(index + 23, hdr.s1_output0_calc.s1_output_7_2);

        bit<32> is_store;
        is_s1_output_store.read(is_store, input_msg_index);
        is_s1_output_store.write(input_msg_index,is_store + 1);
        operation_drop();
    }
    //
    action operation_store_replication_1(bit<32> input_msg_index){
        bit<32> index = input_msg_index * 48 + 24;
        // 从index处连存24个
        s1_ouput_store.write(index + 0, hdr.s1_output0_calc.s1_output_0_3);
        s1_ouput_store.write(index + 1, hdr.s1_output0_calc.s1_output_0_4);
        s1_ouput_store.write(index + 2, hdr.s1_output0_calc.s1_output_0_5);
        s1_ouput_store.write(index + 3, hdr.s1_output0_calc.s1_output_1_3);
        s1_ouput_store.write(index + 4, hdr.s1_output0_calc.s1_output_1_4);
        s1_ouput_store.write(index + 5, hdr.s1_output0_calc.s1_output_1_5);
        s1_ouput_store.write(index + 6, hdr.s1_output0_calc.s1_output_2_3);
        s1_ouput_store.write(index + 7, hdr.s1_output0_calc.s1_output_2_4);
        s1_ouput_store.write(index + 8, hdr.s1_output0_calc.s1_output_2_5);
        s1_ouput_store.write(index + 9, hdr.s1_output0_calc.s1_output_3_3);
        s1_ouput_store.write(index + 10, hdr.s1_output0_calc.s1_output_3_4);
        s1_ouput_store.write(index + 11, hdr.s1_output0_calc.s1_output_3_5);
        s1_ouput_store.write(index + 12, hdr.s1_output0_calc.s1_output_4_3);
        s1_ouput_store.write(index + 13, hdr.s1_output0_calc.s1_output_4_4);
        s1_ouput_store.write(index + 14, hdr.s1_output0_calc.s1_output_4_5);
        s1_ouput_store.write(index + 15, hdr.s1_output0_calc.s1_output_5_3);
        s1_ouput_store.write(index + 16, hdr.s1_output0_calc.s1_output_5_4);
        s1_ouput_store.write(index + 17, hdr.s1_output0_calc.s1_output_5_5);
        s1_ouput_store.write(index + 18, hdr.s1_output0_calc.s1_output_6_3);
        s1_ouput_store.write(index + 19, hdr.s1_output0_calc.s1_output_6_4);
        s1_ouput_store.write(index + 20, hdr.s1_output0_calc.s1_output_6_5);
        s1_ouput_store.write(index + 21, hdr.s1_output0_calc.s1_output_7_3);
        s1_ouput_store.write(index + 22, hdr.s1_output0_calc.s1_output_7_4);
        s1_ouput_store.write(index + 23, hdr.s1_output0_calc.s1_output_7_5);

        bit<32> is_store;
        is_s1_output_store.read(is_store, input_msg_index);
        is_s1_output_store.write(input_msg_index,is_store + 1);
        operation_drop();
    }

  
    
    // 计算残差连接并发送
    action operation_send_replication_0(bit<32> input_msg_index) {
        //从index读出之前存的数据
        bit<32> index = input_msg_index * 48 + 24;
        bit<32> output_0_3;
        bit<32> output_0_4;
        bit<32> output_0_5;
        bit<32> output_1_3;
        bit<32> output_1_4;
        bit<32> output_1_5;
        bit<32> output_2_3;
        bit<32> output_2_4;
        bit<32> output_2_5;
        bit<32> output_3_3;
        bit<32> output_3_4;
        bit<32> output_3_5;
        bit<32> output_4_3;
        bit<32> output_4_4;
        bit<32> output_4_5;
        bit<32> output_5_3;
        bit<32> output_5_4;
        bit<32> output_5_5;
        bit<32> output_6_3;
        bit<32> output_6_4;
        bit<32> output_6_5;
        bit<32> output_7_3;
        bit<32> output_7_4;
        bit<32> output_7_5;

        s1_ouput_store.read(output_0_3, index + 0);
        s1_ouput_store.read(output_0_4, index + 1);
        s1_ouput_store.read(output_0_5, index + 2);
        s1_ouput_store.read(output_1_3, index + 3);
        s1_ouput_store.read(output_1_4, index + 4);
        s1_ouput_store.read(output_1_5, index + 5);
        s1_ouput_store.read(output_2_3, index + 6);
        s1_ouput_store.read(output_2_4, index + 7);
        s1_ouput_store.read(output_2_5, index + 8);
        s1_ouput_store.read(output_3_3, index + 9);
        s1_ouput_store.read(output_3_4, index + 10);
        s1_ouput_store.read(output_3_5, index + 11);
        s1_ouput_store.read(output_4_3, index + 12);
        s1_ouput_store.read(output_4_4, index + 13);
        s1_ouput_store.read(output_4_5, index + 14);
        s1_ouput_store.read(output_5_3, index + 15);
        s1_ouput_store.read(output_5_4, index + 16);
        s1_ouput_store.read(output_5_5, index + 17);
        s1_ouput_store.read(output_6_3, index + 18);
        s1_ouput_store.read(output_6_4, index + 19);
        s1_ouput_store.read(output_6_5, index + 20);
        s1_ouput_store.read(output_7_3, index + 21);
        s1_ouput_store.read(output_7_4, index + 22);
        s1_ouput_store.read(output_7_5, index + 23);

        bit<32> output_0_0 = hdr.s1_output0_calc.s1_output_0_0;
        bit<32> output_0_1 = hdr.s1_output0_calc.s1_output_0_1;
        bit<32> output_0_2 = hdr.s1_output0_calc.s1_output_0_2;
        bit<32> output_1_0 = hdr.s1_output0_calc.s1_output_1_0;
        bit<32> output_1_1 = hdr.s1_output0_calc.s1_output_1_1;
        bit<32> output_1_2 = hdr.s1_output0_calc.s1_output_1_2;
        bit<32> output_2_0 = hdr.s1_output0_calc.s1_output_2_0;
        bit<32> output_2_1 = hdr.s1_output0_calc.s1_output_2_1;
        bit<32> output_2_2 = hdr.s1_output0_calc.s1_output_2_2;
        bit<32> output_3_0 = hdr.s1_output0_calc.s1_output_3_0;
        bit<32> output_3_1 = hdr.s1_output0_calc.s1_output_3_1;
        bit<32> output_3_2 = hdr.s1_output0_calc.s1_output_3_2;
        bit<32> output_4_0 = hdr.s1_output0_calc.s1_output_4_0;
        bit<32> output_4_1 = hdr.s1_output0_calc.s1_output_4_1;
        bit<32> output_4_2 = hdr.s1_output0_calc.s1_output_4_2;
        bit<32> output_5_0 = hdr.s1_output0_calc.s1_output_5_0;
        bit<32> output_5_1 = hdr.s1_output0_calc.s1_output_5_1;
        bit<32> output_5_2 = hdr.s1_output0_calc.s1_output_5_2;
        bit<32> output_6_0 = hdr.s1_output0_calc.s1_output_6_0;
        bit<32> output_6_1 = hdr.s1_output0_calc.s1_output_6_1;
        bit<32> output_6_2 = hdr.s1_output0_calc.s1_output_6_2;
        bit<32> output_7_0 = hdr.s1_output0_calc.s1_output_7_0;
        bit<32> output_7_1 = hdr.s1_output0_calc.s1_output_7_1;
        bit<32> output_7_2 = hdr.s1_output0_calc.s1_output_7_2;

        /*
        hdr.s1_output0_calc.s1_output_0_0 = output_0_0;
        hdr.s1_output0_calc.s1_output_0_1 = output_0_1;
        hdr.s1_output0_calc.s1_output_0_2 = output_0_2;
        hdr.s1_output0_calc.s1_output_0_3 = output_0_3;
        hdr.s1_output0_calc.s1_output_0_4 = output_0_4;
        hdr.s1_output0_calc.s1_output_0_5 = output_0_5;
        hdr.s1_output0_calc.s1_output_1_0 = output_1_0;
        hdr.s1_output0_calc.s1_output_1_1 = output_1_1;
        hdr.s1_output0_calc.s1_output_1_2 = output_1_2;
        hdr.s1_output0_calc.s1_output_1_3 = output_1_3;
        hdr.s1_output0_calc.s1_output_1_4 = output_1_4;
        hdr.s1_output0_calc.s1_output_1_5 = output_1_5;
        hdr.s1_output0_calc.s1_output_2_0 = output_2_0;
        hdr.s1_output0_calc.s1_output_2_1 = output_2_1;
        hdr.s1_output0_calc.s1_output_2_2 = output_2_2;
        hdr.s1_output0_calc.s1_output_2_3 = output_2_3;
        hdr.s1_output0_calc.s1_output_2_4 = output_2_4;
        hdr.s1_output0_calc.s1_output_2_5 = output_2_5;
        hdr.s1_output0_calc.s1_output_3_0 = output_3_0;
        hdr.s1_output0_calc.s1_output_3_1 = output_3_1;
        hdr.s1_output0_calc.s1_output_3_2 = output_3_2;
        hdr.s1_output0_calc.s1_output_3_3 = output_3_3;
        hdr.s1_output0_calc.s1_output_3_4 = output_3_4;
        hdr.s1_output0_calc.s1_output_3_5 = output_3_5;
        hdr.s1_output0_calc.s1_output_4_0 = output_4_0;
        hdr.s1_output0_calc.s1_output_4_1 = output_4_1;
        hdr.s1_output0_calc.s1_output_4_2 = output_4_2;
        hdr.s1_output0_calc.s1_output_4_3 = output_4_3;
        hdr.s1_output0_calc.s1_output_4_4 = output_4_4;
        hdr.s1_output0_calc.s1_output_4_5 = output_4_5;
        hdr.s1_output0_calc.s1_output_5_0 = output_5_0;
        hdr.s1_output0_calc.s1_output_5_1 = output_5_1;
        hdr.s1_output0_calc.s1_output_5_2 = output_5_2;
        hdr.s1_output0_calc.s1_output_5_3 = output_5_3;
        hdr.s1_output0_calc.s1_output_5_4 = output_5_4;
        hdr.s1_output0_calc.s1_output_5_5 = output_5_5;
        hdr.s1_output0_calc.s1_output_6_0 = output_6_0;
        hdr.s1_output0_calc.s1_output_6_1 = output_6_1;
        hdr.s1_output0_calc.s1_output_6_2 = output_6_2;
        hdr.s1_output0_calc.s1_output_6_3 = output_6_3;
        hdr.s1_output0_calc.s1_output_6_4 = output_6_4;
        hdr.s1_output0_calc.s1_output_6_5 = output_6_5;
        hdr.s1_output0_calc.s1_output_7_0 = output_7_0;
        hdr.s1_output0_calc.s1_output_7_1 = output_7_1;
        hdr.s1_output0_calc.s1_output_7_2 = output_7_2;
        hdr.s1_output0_calc.s1_output_7_3 = output_7_3;
        hdr.s1_output0_calc.s1_output_7_4 = output_7_4;
        hdr.s1_output0_calc.s1_output_7_5 = output_7_5;
        */
        
        // 残差连接，结果放在hdr.s1_output0_calc里
        hdr.s0_output0_calc.s0_output_0_0 = output_0_0 + hdr.s0_output0_calc.s0_output_0_0;
        hdr.s0_output0_calc.s0_output_0_1 = output_0_1 + hdr.s0_output0_calc.s0_output_0_1;
        hdr.s0_output0_calc.s0_output_0_2 = output_0_2 + hdr.s0_output0_calc.s0_output_0_2;
        hdr.s0_output0_calc.s0_output_0_3 = output_0_3 + hdr.s0_output0_calc.s0_output_0_3;
        hdr.s0_output0_calc.s0_output_0_4 = output_0_4 + hdr.s0_output0_calc.s0_output_0_4;
        hdr.s0_output0_calc.s0_output_0_5 = output_0_5 + hdr.s0_output0_calc.s0_output_0_5;
        hdr.s0_output0_calc.s0_output_1_0 = output_1_0 + hdr.s0_output0_calc.s0_output_1_0;
        hdr.s0_output0_calc.s0_output_1_1 = output_1_1 + hdr.s0_output0_calc.s0_output_1_1;
        hdr.s0_output0_calc.s0_output_1_2 = output_1_2 + hdr.s0_output0_calc.s0_output_1_2;
        hdr.s0_output0_calc.s0_output_1_3 = output_1_3 + hdr.s0_output0_calc.s0_output_1_3;
        hdr.s0_output0_calc.s0_output_1_4 = output_1_4 + hdr.s0_output0_calc.s0_output_1_4;
        hdr.s0_output0_calc.s0_output_1_5 = output_1_5 + hdr.s0_output0_calc.s0_output_1_5;
        hdr.s0_output0_calc.s0_output_2_0 = output_2_0 + hdr.s0_output0_calc.s0_output_2_0;
        hdr.s0_output0_calc.s0_output_2_1 = output_2_1 + hdr.s0_output0_calc.s0_output_2_1;
        hdr.s0_output0_calc.s0_output_2_2 = output_2_2 + hdr.s0_output0_calc.s0_output_2_2;
        hdr.s0_output0_calc.s0_output_2_3 = output_2_3 + hdr.s0_output0_calc.s0_output_2_3;
        hdr.s0_output0_calc.s0_output_2_4 = output_2_4 + hdr.s0_output0_calc.s0_output_2_4;
        hdr.s0_output0_calc.s0_output_2_5 = output_2_5 + hdr.s0_output0_calc.s0_output_2_5;
        hdr.s0_output0_calc.s0_output_3_0 = output_3_0 + hdr.s0_output0_calc.s0_output_3_0;
        hdr.s0_output0_calc.s0_output_3_1 = output_3_1 + hdr.s0_output0_calc.s0_output_3_1;
        hdr.s0_output0_calc.s0_output_3_2 = output_3_2 + hdr.s0_output0_calc.s0_output_3_2;
        hdr.s0_output0_calc.s0_output_3_3 = output_3_3 + hdr.s0_output0_calc.s0_output_3_3;
        hdr.s0_output0_calc.s0_output_3_4 = output_3_4 + hdr.s0_output0_calc.s0_output_3_4;
        hdr.s0_output0_calc.s0_output_3_5 = output_3_5 + hdr.s0_output0_calc.s0_output_3_5;
        hdr.s0_output0_calc.s0_output_4_0 = output_4_0 + hdr.s0_output0_calc.s0_output_4_0;
        hdr.s0_output0_calc.s0_output_4_1 = output_4_1 + hdr.s0_output0_calc.s0_output_4_1;
        hdr.s0_output0_calc.s0_output_4_2 = output_4_2 + hdr.s0_output0_calc.s0_output_4_2;
        hdr.s0_output0_calc.s0_output_4_3 = output_4_3 + hdr.s0_output0_calc.s0_output_4_3;
        hdr.s0_output0_calc.s0_output_4_4 = output_4_4 + hdr.s0_output0_calc.s0_output_4_4;
        hdr.s0_output0_calc.s0_output_4_5 = output_4_5 + hdr.s0_output0_calc.s0_output_4_5;
        hdr.s0_output0_calc.s0_output_5_0 = output_5_0 + hdr.s0_output0_calc.s0_output_5_0;
        hdr.s0_output0_calc.s0_output_5_1 = output_5_1 + hdr.s0_output0_calc.s0_output_5_1;
        hdr.s0_output0_calc.s0_output_5_2 = output_5_2 + hdr.s0_output0_calc.s0_output_5_2;
        hdr.s0_output0_calc.s0_output_5_3 = output_5_3 + hdr.s0_output0_calc.s0_output_5_3;
        hdr.s0_output0_calc.s0_output_5_4 = output_5_4 + hdr.s0_output0_calc.s0_output_5_4;
        hdr.s0_output0_calc.s0_output_5_5 = output_5_5 + hdr.s0_output0_calc.s0_output_5_5;
        hdr.s0_output0_calc.s0_output_6_0 = output_6_0 + hdr.s0_output0_calc.s0_output_6_0;
        hdr.s0_output0_calc.s0_output_6_1 = output_6_1 + hdr.s0_output0_calc.s0_output_6_1;
        hdr.s0_output0_calc.s0_output_6_2 = output_6_2 + hdr.s0_output0_calc.s0_output_6_2;
        hdr.s0_output0_calc.s0_output_6_3 = output_6_3 + hdr.s0_output0_calc.s0_output_6_3;
        hdr.s0_output0_calc.s0_output_6_4 = output_6_4 + hdr.s0_output0_calc.s0_output_6_4;
        hdr.s0_output0_calc.s0_output_6_5 = output_6_5 + hdr.s0_output0_calc.s0_output_6_5;
        hdr.s0_output0_calc.s0_output_7_0 = output_7_0 + hdr.s0_output0_calc.s0_output_7_0;
        hdr.s0_output0_calc.s0_output_7_1 = output_7_1 + hdr.s0_output0_calc.s0_output_7_1;
        hdr.s0_output0_calc.s0_output_7_2 = output_7_2 + hdr.s0_output0_calc.s0_output_7_2;
        hdr.s0_output0_calc.s0_output_7_3 = output_7_3 + hdr.s0_output0_calc.s0_output_7_3;
        hdr.s0_output0_calc.s0_output_7_4 = output_7_4 + hdr.s0_output0_calc.s0_output_7_4;
        hdr.s0_output0_calc.s0_output_7_5 = output_7_5 + hdr.s0_output0_calc.s0_output_7_5;


        // 对hdr.s1_output0_calc清零
        hdr.s1_output0_calc.s1_output_0_0 = 0;
        hdr.s1_output0_calc.s1_output_0_1 = 0;
        hdr.s1_output0_calc.s1_output_0_2 = 0;
        hdr.s1_output0_calc.s1_output_0_3 = 0;
        hdr.s1_output0_calc.s1_output_0_4 = 0;
        hdr.s1_output0_calc.s1_output_0_5 = 0;
        hdr.s1_output0_calc.s1_output_1_0 = 0;
        hdr.s1_output0_calc.s1_output_1_1 = 0;
        hdr.s1_output0_calc.s1_output_1_2 = 0;
        hdr.s1_output0_calc.s1_output_1_3 = 0;
        hdr.s1_output0_calc.s1_output_1_4 = 0;
        hdr.s1_output0_calc.s1_output_1_5 = 0;
        hdr.s1_output0_calc.s1_output_2_0 = 0;
        hdr.s1_output0_calc.s1_output_2_1 = 0;
        hdr.s1_output0_calc.s1_output_2_2 = 0;
        hdr.s1_output0_calc.s1_output_2_3 = 0;
        hdr.s1_output0_calc.s1_output_2_4 = 0;
        hdr.s1_output0_calc.s1_output_2_5 = 0;
        hdr.s1_output0_calc.s1_output_3_0 = 0;
        hdr.s1_output0_calc.s1_output_3_1 = 0;
        hdr.s1_output0_calc.s1_output_3_2 = 0;
        hdr.s1_output0_calc.s1_output_3_3 = 0;
        hdr.s1_output0_calc.s1_output_3_4 = 0;
        hdr.s1_output0_calc.s1_output_3_5 = 0;
        hdr.s1_output0_calc.s1_output_4_0 = 0;
        hdr.s1_output0_calc.s1_output_4_1 = 0;
        hdr.s1_output0_calc.s1_output_4_2 = 0;
        hdr.s1_output0_calc.s1_output_4_3 = 0;
        hdr.s1_output0_calc.s1_output_4_4 = 0;
        hdr.s1_output0_calc.s1_output_4_5 = 0;
        hdr.s1_output0_calc.s1_output_5_0 = 0;
        hdr.s1_output0_calc.s1_output_5_1 = 0;
        hdr.s1_output0_calc.s1_output_5_2 = 0;
        hdr.s1_output0_calc.s1_output_5_3 = 0;
        hdr.s1_output0_calc.s1_output_5_4 = 0;
        hdr.s1_output0_calc.s1_output_5_5 = 0;
        hdr.s1_output0_calc.s1_output_6_0 = 0;
        hdr.s1_output0_calc.s1_output_6_1 = 0;
        hdr.s1_output0_calc.s1_output_6_2 = 0;
        hdr.s1_output0_calc.s1_output_6_3 = 0;
        hdr.s1_output0_calc.s1_output_6_4 = 0;
        hdr.s1_output0_calc.s1_output_6_5 = 0;
        hdr.s1_output0_calc.s1_output_7_0 = 0;
        hdr.s1_output0_calc.s1_output_7_1 = 0;
        hdr.s1_output0_calc.s1_output_7_2 = 0;
        hdr.s1_output0_calc.s1_output_7_3 = 0;
        hdr.s1_output0_calc.s1_output_7_4 = 0;
        hdr.s1_output0_calc.s1_output_7_5 = 0;

        is_s1_output_store.write(input_msg_index, 0);
        standard_metadata.egress_spec = 3;
    }

    action operation_send_replication_1(bit<32> input_msg_index) {
       //从index读出之前存的数据
        bit<32> index = input_msg_index * 48;
        bit<32> output_0_0;
        bit<32> output_0_1;
        bit<32> output_0_2;
        bit<32> output_1_0;
        bit<32> output_1_1;
        bit<32> output_1_2;
        bit<32> output_2_0;
        bit<32> output_2_1;
        bit<32> output_2_2;
        bit<32> output_3_0;
        bit<32> output_3_1;
        bit<32> output_3_2;
        bit<32> output_4_0;
        bit<32> output_4_1;
        bit<32> output_4_2;
        bit<32> output_5_0;
        bit<32> output_5_1;
        bit<32> output_5_2;
        bit<32> output_6_0;
        bit<32> output_6_1;
        bit<32> output_6_2;
        bit<32> output_7_0;
        bit<32> output_7_1;
        bit<32> output_7_2;

        s1_ouput_store.read(output_0_0, index + 0);
        s1_ouput_store.read(output_0_1, index + 1);
        s1_ouput_store.read(output_0_2, index + 2);
        s1_ouput_store.read(output_1_0, index + 3);
        s1_ouput_store.read(output_1_1, index + 4);
        s1_ouput_store.read(output_1_2, index + 5);
        s1_ouput_store.read(output_2_0, index + 6);
        s1_ouput_store.read(output_2_1, index + 7);
        s1_ouput_store.read(output_2_2, index + 8);
        s1_ouput_store.read(output_3_0, index + 9);
        s1_ouput_store.read(output_3_1, index + 10);
        s1_ouput_store.read(output_3_2, index + 11);
        s1_ouput_store.read(output_4_0, index + 12);
        s1_ouput_store.read(output_4_1, index + 13);
        s1_ouput_store.read(output_4_2, index + 14);
        s1_ouput_store.read(output_5_0, index + 15);
        s1_ouput_store.read(output_5_1, index + 16);
        s1_ouput_store.read(output_5_2, index + 17);
        s1_ouput_store.read(output_6_0, index + 18);
        s1_ouput_store.read(output_6_1, index + 19);
        s1_ouput_store.read(output_6_2, index + 20);
        s1_ouput_store.read(output_7_0, index + 21);
        s1_ouput_store.read(output_7_1, index + 22);
        s1_ouput_store.read(output_7_2, index + 23);

        bit<32> output_0_3 = hdr.s1_output0_calc.s1_output_0_3;
        bit<32> output_0_4 = hdr.s1_output0_calc.s1_output_0_4;
        bit<32> output_0_5 = hdr.s1_output0_calc.s1_output_0_5;
        bit<32> output_1_3 = hdr.s1_output0_calc.s1_output_1_3;
        bit<32> output_1_4 = hdr.s1_output0_calc.s1_output_1_4;
        bit<32> output_1_5 = hdr.s1_output0_calc.s1_output_1_5;
        bit<32> output_2_3 = hdr.s1_output0_calc.s1_output_2_3;
        bit<32> output_2_4 = hdr.s1_output0_calc.s1_output_2_4;
        bit<32> output_2_5 = hdr.s1_output0_calc.s1_output_2_5;
        bit<32> output_3_3 = hdr.s1_output0_calc.s1_output_3_3;
        bit<32> output_3_4 = hdr.s1_output0_calc.s1_output_3_4;
        bit<32> output_3_5 = hdr.s1_output0_calc.s1_output_3_5;
        bit<32> output_4_3 = hdr.s1_output0_calc.s1_output_4_3;
        bit<32> output_4_4 = hdr.s1_output0_calc.s1_output_4_4;
        bit<32> output_4_5 = hdr.s1_output0_calc.s1_output_4_5;
        bit<32> output_5_3 = hdr.s1_output0_calc.s1_output_5_3;
        bit<32> output_5_4 = hdr.s1_output0_calc.s1_output_5_4;
        bit<32> output_5_5 = hdr.s1_output0_calc.s1_output_5_5;
        bit<32> output_6_3 = hdr.s1_output0_calc.s1_output_6_3;
        bit<32> output_6_4 = hdr.s1_output0_calc.s1_output_6_4;
        bit<32> output_6_5 = hdr.s1_output0_calc.s1_output_6_5;
        bit<32> output_7_3 = hdr.s1_output0_calc.s1_output_7_3;
        bit<32> output_7_4 = hdr.s1_output0_calc.s1_output_7_4;
        bit<32> output_7_5 = hdr.s1_output0_calc.s1_output_7_5;

        // 残差连接，结果放在hdr.s1_output0_calc里
        hdr.s0_output0_calc.s0_output_0_0 = output_0_0 + hdr.s0_output0_calc.s0_output_0_0;
        hdr.s0_output0_calc.s0_output_0_1 = output_0_1 + hdr.s0_output0_calc.s0_output_0_1;
        hdr.s0_output0_calc.s0_output_0_2 = output_0_2 + hdr.s0_output0_calc.s0_output_0_2;
        hdr.s0_output0_calc.s0_output_0_3 = output_0_3 + hdr.s0_output0_calc.s0_output_0_3;
        hdr.s0_output0_calc.s0_output_0_4 = output_0_4 + hdr.s0_output0_calc.s0_output_0_4;
        hdr.s0_output0_calc.s0_output_0_5 = output_0_5 + hdr.s0_output0_calc.s0_output_0_5;
        hdr.s0_output0_calc.s0_output_1_0 = output_1_0 + hdr.s0_output0_calc.s0_output_1_0;
        hdr.s0_output0_calc.s0_output_1_1 = output_1_1 + hdr.s0_output0_calc.s0_output_1_1;
        hdr.s0_output0_calc.s0_output_1_2 = output_1_2 + hdr.s0_output0_calc.s0_output_1_2;
        hdr.s0_output0_calc.s0_output_1_3 = output_1_3 + hdr.s0_output0_calc.s0_output_1_3;
        hdr.s0_output0_calc.s0_output_1_4 = output_1_4 + hdr.s0_output0_calc.s0_output_1_4;
        hdr.s0_output0_calc.s0_output_1_5 = output_1_5 + hdr.s0_output0_calc.s0_output_1_5;
        hdr.s0_output0_calc.s0_output_2_0 = output_2_0 + hdr.s0_output0_calc.s0_output_2_0;
        hdr.s0_output0_calc.s0_output_2_1 = output_2_1 + hdr.s0_output0_calc.s0_output_2_1;
        hdr.s0_output0_calc.s0_output_2_2 = output_2_2 + hdr.s0_output0_calc.s0_output_2_2;
        hdr.s0_output0_calc.s0_output_2_3 = output_2_3 + hdr.s0_output0_calc.s0_output_2_3;
        hdr.s0_output0_calc.s0_output_2_4 = output_2_4 + hdr.s0_output0_calc.s0_output_2_4;
        hdr.s0_output0_calc.s0_output_2_5 = output_2_5 + hdr.s0_output0_calc.s0_output_2_5;
        hdr.s0_output0_calc.s0_output_3_0 = output_3_0 + hdr.s0_output0_calc.s0_output_3_0;
        hdr.s0_output0_calc.s0_output_3_1 = output_3_1 + hdr.s0_output0_calc.s0_output_3_1;
        hdr.s0_output0_calc.s0_output_3_2 = output_3_2 + hdr.s0_output0_calc.s0_output_3_2;
        hdr.s0_output0_calc.s0_output_3_3 = output_3_3 + hdr.s0_output0_calc.s0_output_3_3;
        hdr.s0_output0_calc.s0_output_3_4 = output_3_4 + hdr.s0_output0_calc.s0_output_3_4;
        hdr.s0_output0_calc.s0_output_3_5 = output_3_5 + hdr.s0_output0_calc.s0_output_3_5;
        hdr.s0_output0_calc.s0_output_4_0 = output_4_0 + hdr.s0_output0_calc.s0_output_4_0;
        hdr.s0_output0_calc.s0_output_4_1 = output_4_1 + hdr.s0_output0_calc.s0_output_4_1;
        hdr.s0_output0_calc.s0_output_4_2 = output_4_2 + hdr.s0_output0_calc.s0_output_4_2;
        hdr.s0_output0_calc.s0_output_4_3 = output_4_3 + hdr.s0_output0_calc.s0_output_4_3;
        hdr.s0_output0_calc.s0_output_4_4 = output_4_4 + hdr.s0_output0_calc.s0_output_4_4;
        hdr.s0_output0_calc.s0_output_4_5 = output_4_5 + hdr.s0_output0_calc.s0_output_4_5;
        hdr.s0_output0_calc.s0_output_5_0 = output_5_0 + hdr.s0_output0_calc.s0_output_5_0;
        hdr.s0_output0_calc.s0_output_5_1 = output_5_1 + hdr.s0_output0_calc.s0_output_5_1;
        hdr.s0_output0_calc.s0_output_5_2 = output_5_2 + hdr.s0_output0_calc.s0_output_5_2;
        hdr.s0_output0_calc.s0_output_5_3 = output_5_3 + hdr.s0_output0_calc.s0_output_5_3;
        hdr.s0_output0_calc.s0_output_5_4 = output_5_4 + hdr.s0_output0_calc.s0_output_5_4;
        hdr.s0_output0_calc.s0_output_5_5 = output_5_5 + hdr.s0_output0_calc.s0_output_5_5;
        hdr.s0_output0_calc.s0_output_6_0 = output_6_0 + hdr.s0_output0_calc.s0_output_6_0;
        hdr.s0_output0_calc.s0_output_6_1 = output_6_1 + hdr.s0_output0_calc.s0_output_6_1;
        hdr.s0_output0_calc.s0_output_6_2 = output_6_2 + hdr.s0_output0_calc.s0_output_6_2;
        hdr.s0_output0_calc.s0_output_6_3 = output_6_3 + hdr.s0_output0_calc.s0_output_6_3;
        hdr.s0_output0_calc.s0_output_6_4 = output_6_4 + hdr.s0_output0_calc.s0_output_6_4;
        hdr.s0_output0_calc.s0_output_6_5 = output_6_5 + hdr.s0_output0_calc.s0_output_6_5;
        hdr.s0_output0_calc.s0_output_7_0 = output_7_0 + hdr.s0_output0_calc.s0_output_7_0;
        hdr.s0_output0_calc.s0_output_7_1 = output_7_1 + hdr.s0_output0_calc.s0_output_7_1;
        hdr.s0_output0_calc.s0_output_7_2 = output_7_2 + hdr.s0_output0_calc.s0_output_7_2;
        hdr.s0_output0_calc.s0_output_7_3 = output_7_3 + hdr.s0_output0_calc.s0_output_7_3;
        hdr.s0_output0_calc.s0_output_7_4 = output_7_4 + hdr.s0_output0_calc.s0_output_7_4;
        hdr.s0_output0_calc.s0_output_7_5 = output_7_5 + hdr.s0_output0_calc.s0_output_7_5;


        /*
        hdr.s1_output0_calc.s1_output_0_0 = output_0_0;
        hdr.s1_output0_calc.s1_output_0_1 = output_0_1;
        hdr.s1_output0_calc.s1_output_0_2 = output_0_2;
        hdr.s1_output0_calc.s1_output_0_3 = output_0_3;
        hdr.s1_output0_calc.s1_output_0_4 = output_0_4;
        hdr.s1_output0_calc.s1_output_0_5 = output_0_5;
        hdr.s1_output0_calc.s1_output_1_0 = output_1_0;
        hdr.s1_output0_calc.s1_output_1_1 = output_1_1;
        hdr.s1_output0_calc.s1_output_1_2 = output_1_2;
        hdr.s1_output0_calc.s1_output_1_3 = output_1_3;
        hdr.s1_output0_calc.s1_output_1_4 = output_1_4;
        hdr.s1_output0_calc.s1_output_1_5 = output_1_5;
        hdr.s1_output0_calc.s1_output_2_0 = output_2_0;
        hdr.s1_output0_calc.s1_output_2_1 = output_2_1;
        hdr.s1_output0_calc.s1_output_2_2 = output_2_2;
        hdr.s1_output0_calc.s1_output_2_3 = output_2_3;
        hdr.s1_output0_calc.s1_output_2_4 = output_2_4;
        hdr.s1_output0_calc.s1_output_2_5 = output_2_5;
        hdr.s1_output0_calc.s1_output_3_0 = output_3_0;
        hdr.s1_output0_calc.s1_output_3_1 = output_3_1;
        hdr.s1_output0_calc.s1_output_3_2 = output_3_2;
        hdr.s1_output0_calc.s1_output_3_3 = output_3_3;
        hdr.s1_output0_calc.s1_output_3_4 = output_3_4;
        hdr.s1_output0_calc.s1_output_3_5 = output_3_5;
        hdr.s1_output0_calc.s1_output_4_0 = output_4_0;
        hdr.s1_output0_calc.s1_output_4_1 = output_4_1;
        hdr.s1_output0_calc.s1_output_4_2 = output_4_2;
        hdr.s1_output0_calc.s1_output_4_3 = output_4_3;
        hdr.s1_output0_calc.s1_output_4_4 = output_4_4;
        hdr.s1_output0_calc.s1_output_4_5 = output_4_5;
        hdr.s1_output0_calc.s1_output_5_0 = output_5_0;
        hdr.s1_output0_calc.s1_output_5_1 = output_5_1;
        hdr.s1_output0_calc.s1_output_5_2 = output_5_2;
        hdr.s1_output0_calc.s1_output_5_3 = output_5_3;
        hdr.s1_output0_calc.s1_output_5_4 = output_5_4;
        hdr.s1_output0_calc.s1_output_5_5 = output_5_5;
        hdr.s1_output0_calc.s1_output_6_0 = output_6_0;
        hdr.s1_output0_calc.s1_output_6_1 = output_6_1;
        hdr.s1_output0_calc.s1_output_6_2 = output_6_2;
        hdr.s1_output0_calc.s1_output_6_3 = output_6_3;
        hdr.s1_output0_calc.s1_output_6_4 = output_6_4;
        hdr.s1_output0_calc.s1_output_6_5 = output_6_5;
        hdr.s1_output0_calc.s1_output_7_0 = output_7_0;
        hdr.s1_output0_calc.s1_output_7_1 = output_7_1;
        hdr.s1_output0_calc.s1_output_7_2 = output_7_2;
        hdr.s1_output0_calc.s1_output_7_3 = output_7_3;
        hdr.s1_output0_calc.s1_output_7_4 = output_7_4;
        hdr.s1_output0_calc.s1_output_7_5 = output_7_5;
        */

        // 对hdr.s1_output0_calc清零
        hdr.s1_output0_calc.s1_output_0_0 = 0;
        hdr.s1_output0_calc.s1_output_0_1 = 0;
        hdr.s1_output0_calc.s1_output_0_2 = 0;
        hdr.s1_output0_calc.s1_output_0_3 = 0;
        hdr.s1_output0_calc.s1_output_0_4 = 0;
        hdr.s1_output0_calc.s1_output_0_5 = 0;
        hdr.s1_output0_calc.s1_output_1_0 = 0;
        hdr.s1_output0_calc.s1_output_1_1 = 0;
        hdr.s1_output0_calc.s1_output_1_2 = 0;
        hdr.s1_output0_calc.s1_output_1_3 = 0;
        hdr.s1_output0_calc.s1_output_1_4 = 0;
        hdr.s1_output0_calc.s1_output_1_5 = 0;
        hdr.s1_output0_calc.s1_output_2_0 = 0;
        hdr.s1_output0_calc.s1_output_2_1 = 0;
        hdr.s1_output0_calc.s1_output_2_2 = 0;
        hdr.s1_output0_calc.s1_output_2_3 = 0;
        hdr.s1_output0_calc.s1_output_2_4 = 0;
        hdr.s1_output0_calc.s1_output_2_5 = 0;
        hdr.s1_output0_calc.s1_output_3_0 = 0;
        hdr.s1_output0_calc.s1_output_3_1 = 0;
        hdr.s1_output0_calc.s1_output_3_2 = 0;
        hdr.s1_output0_calc.s1_output_3_3 = 0;
        hdr.s1_output0_calc.s1_output_3_4 = 0;
        hdr.s1_output0_calc.s1_output_3_5 = 0;
        hdr.s1_output0_calc.s1_output_4_0 = 0;
        hdr.s1_output0_calc.s1_output_4_1 = 0;
        hdr.s1_output0_calc.s1_output_4_2 = 0;
        hdr.s1_output0_calc.s1_output_4_3 = 0;
        hdr.s1_output0_calc.s1_output_4_4 = 0;
        hdr.s1_output0_calc.s1_output_4_5 = 0;
        hdr.s1_output0_calc.s1_output_5_0 = 0;
        hdr.s1_output0_calc.s1_output_5_1 = 0;
        hdr.s1_output0_calc.s1_output_5_2 = 0;
        hdr.s1_output0_calc.s1_output_5_3 = 0;
        hdr.s1_output0_calc.s1_output_5_4 = 0;
        hdr.s1_output0_calc.s1_output_5_5 = 0;
        hdr.s1_output0_calc.s1_output_6_0 = 0;
        hdr.s1_output0_calc.s1_output_6_1 = 0;
        hdr.s1_output0_calc.s1_output_6_2 = 0;
        hdr.s1_output0_calc.s1_output_6_3 = 0;
        hdr.s1_output0_calc.s1_output_6_4 = 0;
        hdr.s1_output0_calc.s1_output_6_5 = 0;
        hdr.s1_output0_calc.s1_output_7_0 = 0;
        hdr.s1_output0_calc.s1_output_7_1 = 0;
        hdr.s1_output0_calc.s1_output_7_2 = 0;
        hdr.s1_output0_calc.s1_output_7_3 = 0;
        hdr.s1_output0_calc.s1_output_7_4 = 0;
        hdr.s1_output0_calc.s1_output_7_5 = 0;

        is_s1_output_store.write(input_msg_index, 0);
        standard_metadata.egress_spec = 3;
    }


    table store_output_table {
        key = {
            meta.is_s1_output_store : exact; 
            hdr.p4calc.s1_replication : exact;
            hdr.p4calc.msg_index : exact;
        }
        actions = {
            operation_store_replication_0;
            operation_store_replication_1;
            operation_send_replication_0;
            operation_send_replication_1;
            operation_drop;
        }
        default_action = operation_drop();
        entries = {
            (0x0,0x0,0x0):operation_store_replication_0(0);
            (0x0,0x0,0x1):operation_store_replication_0(1);
            (0x0,0x0,0x2):operation_store_replication_0(2);
            (0x0,0x0,0x3):operation_store_replication_0(3);
            (0x0,0x1,0x0):operation_store_replication_1(0);
            (0x0,0x1,0x1):operation_store_replication_1(1);
            (0x0,0x1,0x2):operation_store_replication_1(2);
            (0x0,0x1,0x3):operation_store_replication_1(3);
            (0x1,0x0,0x0):operation_send_replication_0(0);
            (0x1,0x0,0x1):operation_send_replication_0(1);
            (0x1,0x0,0x2):operation_send_replication_0(2);
            (0x1,0x0,0x3):operation_send_replication_0(3);
            (0x1,0x1,0x0):operation_send_replication_1(0);
            (0x1,0x1,0x1):operation_send_replication_1(1);
            (0x1,0x1,0x2):operation_send_replication_1(2);
            (0x1,0x1,0x3):operation_send_replication_1(3);
        }
    }



    apply {
        if (hdr.p4calc.isValid()) {
            operation_calc_is_s1_output_store();
            store_output_table.apply();
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