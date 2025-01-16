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

const bit<64> wq_0_0 = 0xffffffff71102d7e;
const bit<64> wq_0_1 = 0xffffffffcd2abb19;
const bit<64> wq_0_2 = 0x00000000d2ea0185;
const bit<64> wq_1_0 = 0xffffffff540aad93;
const bit<64> wq_1_1 = 0xffffffff69d98cfe;
const bit<64> wq_1_2 = 0xfffffffffbb7891f;
const bit<64> wq_2_0 = 0xffffffff9124f077;
const bit<64> wq_2_1 = 0x000000002a5720fd;
const bit<64> wq_2_2 = 0x00000000aa0ad62d;
const bit<64> wk_0_0 = 0xffffffff7bcb220c;
const bit<64> wk_0_1 = 0xffffffff2ace4097;
const bit<64> wk_0_2 = 0xffffffffd58acc32;
const bit<64> wk_1_0 = 0x00000000f3aec38f;
const bit<64> wk_1_1 = 0xffffffff57d03e08;
const bit<64> wk_1_2 = 0xffffffffcb530b60;
const bit<64> wk_2_0 = 0xffffffffc7c24168;
const bit<64> wk_2_1 = 0x00000000621621f8;
const bit<64> wk_2_2 = 0x00000000724d8a42;
const bit<64> wv_0_0 = 0xffffffff8e0f79e7;
const bit<64> wv_0_1 = 0x000000007da08b75;
const bit<64> wv_0_2 = 0x00000000c6914e2b;
const bit<64> wv_1_0 = 0x00000000f86fd979;
const bit<64> wv_1_1 = 0x00000000609d09b9;
const bit<64> wv_1_2 = 0x00000000a9ccb6aa;
const bit<64> wv_2_0 = 0xffffffff91618f5e;
const bit<64> wv_2_1 = 0x0000000072b7d155;
const bit<64> wv_2_2 = 0x0000000053fa3eec;

const bit<32> replication = 0x00;

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
    bit<32> softmax_reciprocal_0;
    bit<32> softmax_reciprocal_1;
    bit<32> softmax_reciprocal_2;
    bit<32> softmax_reciprocal_3;
    bit<32> softmax_reciprocal_4;
    bit<32> softmax_reciprocal_5;
    bit<32> softmax_reciprocal_6;
    bit<32> softmax_reciprocal_7;

    bit<32> softmax_sum_0;
    bit<32> softmax_sum_1;
    bit<32> softmax_sum_2;
    bit<32> softmax_sum_3;
    bit<32> softmax_sum_4;
    bit<32> softmax_sum_5;
    bit<32> softmax_sum_6;
    bit<32> softmax_sum_7;

    bit<32> q_mul_kt_0_0;
    bit<32> q_mul_kt_0_1;
    bit<32> q_mul_kt_0_2;
    bit<32> q_mul_kt_0_3;
    bit<32> q_mul_kt_0_4;
    bit<32> q_mul_kt_0_5;
    bit<32> q_mul_kt_0_6;
    bit<32> q_mul_kt_0_7;
    bit<32> q_mul_kt_1_0;
    bit<32> q_mul_kt_1_1;
    bit<32> q_mul_kt_1_2;
    bit<32> q_mul_kt_1_3;
    bit<32> q_mul_kt_1_4;
    bit<32> q_mul_kt_1_5;
    bit<32> q_mul_kt_1_6;
    bit<32> q_mul_kt_1_7;
    bit<32> q_mul_kt_2_0;
    bit<32> q_mul_kt_2_1;
    bit<32> q_mul_kt_2_2;
    bit<32> q_mul_kt_2_3;
    bit<32> q_mul_kt_2_4;
    bit<32> q_mul_kt_2_5;
    bit<32> q_mul_kt_2_6;
    bit<32> q_mul_kt_2_7;
    bit<32> q_mul_kt_3_0;
    bit<32> q_mul_kt_3_1;
    bit<32> q_mul_kt_3_2;
    bit<32> q_mul_kt_3_3;
    bit<32> q_mul_kt_3_4;
    bit<32> q_mul_kt_3_5;
    bit<32> q_mul_kt_3_6;
    bit<32> q_mul_kt_3_7;
    bit<32> q_mul_kt_4_0;
    bit<32> q_mul_kt_4_1;
    bit<32> q_mul_kt_4_2;
    bit<32> q_mul_kt_4_3;
    bit<32> q_mul_kt_4_4;
    bit<32> q_mul_kt_4_5;
    bit<32> q_mul_kt_4_6;
    bit<32> q_mul_kt_4_7;
    bit<32> q_mul_kt_5_0;
    bit<32> q_mul_kt_5_1;
    bit<32> q_mul_kt_5_2;
    bit<32> q_mul_kt_5_3;
    bit<32> q_mul_kt_5_4;
    bit<32> q_mul_kt_5_5;
    bit<32> q_mul_kt_5_6;
    bit<32> q_mul_kt_5_7;
    bit<32> q_mul_kt_6_0;
    bit<32> q_mul_kt_6_1;
    bit<32> q_mul_kt_6_2;
    bit<32> q_mul_kt_6_3;
    bit<32> q_mul_kt_6_4;
    bit<32> q_mul_kt_6_5;
    bit<32> q_mul_kt_6_6;
    bit<32> q_mul_kt_6_7;
    bit<32> q_mul_kt_7_0;
    bit<32> q_mul_kt_7_1;
    bit<32> q_mul_kt_7_2;
    bit<32> q_mul_kt_7_3;
    bit<32> q_mul_kt_7_4;
    bit<32> q_mul_kt_7_5;
    bit<32> q_mul_kt_7_6;
    bit<32> q_mul_kt_7_7;
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
    //register<bit<32>>(96) q;
    //register<bit<32>>(96) k;
    register<bit<64>>(24) v_value;
    register<bit<64>>(64) q_mul64_kt;
    register<bit<64>>(64) softmax_value;
    
    // 计算q*k_t
    action calc_qk(){     
        bit<32> x_0_0 = hdr.s0_output0_calc.s0_output_0_0;
        bit<32> x_0_1 = hdr.s0_output0_calc.s0_output_0_1;
        bit<32> x_0_2 = hdr.s0_output0_calc.s0_output_0_2;
        bit<32> x_1_0 = hdr.s0_output0_calc.s0_output_1_0;
        bit<32> x_1_1 = hdr.s0_output0_calc.s0_output_1_1;
        bit<32> x_1_2 = hdr.s0_output0_calc.s0_output_1_2;
        bit<32> x_2_0 = hdr.s0_output0_calc.s0_output_2_0;
        bit<32> x_2_1 = hdr.s0_output0_calc.s0_output_2_1;
        bit<32> x_2_2 = hdr.s0_output0_calc.s0_output_2_2;
        bit<32> x_3_0 = hdr.s0_output0_calc.s0_output_3_0;
        bit<32> x_3_1 = hdr.s0_output0_calc.s0_output_3_1;
        bit<32> x_3_2 = hdr.s0_output0_calc.s0_output_3_2;
        bit<32> x_4_0 = hdr.s0_output0_calc.s0_output_4_0;
        bit<32> x_4_1 = hdr.s0_output0_calc.s0_output_4_1;
        bit<32> x_4_2 = hdr.s0_output0_calc.s0_output_4_2;
        bit<32> x_5_0 = hdr.s0_output0_calc.s0_output_5_0;
        bit<32> x_5_1 = hdr.s0_output0_calc.s0_output_5_1;
        bit<32> x_5_2 = hdr.s0_output0_calc.s0_output_5_2;
        bit<32> x_6_0 = hdr.s0_output0_calc.s0_output_6_0;
        bit<32> x_6_1 = hdr.s0_output0_calc.s0_output_6_1;
        bit<32> x_6_2 = hdr.s0_output0_calc.s0_output_6_2;
        bit<32> x_7_0 = hdr.s0_output0_calc.s0_output_7_0;
        bit<32> x_7_1 = hdr.s0_output0_calc.s0_output_7_1;
        bit<32> x_7_2 = hdr.s0_output0_calc.s0_output_7_2;

        // 符号扩展
        bit<64> x64_0_0 = (bit<64>) x_0_0 | (( x_0_0 & 0xF0000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> x64_0_1 = (bit<64>) x_0_1 | (( x_0_1 & 0xF0000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> x64_0_2 = (bit<64>) x_0_2 | (( x_0_2 & 0xF0000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> x64_1_0 = (bit<64>) x_1_0 | (( x_1_0 & 0xF0000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> x64_1_1 = (bit<64>) x_1_1 | (( x_1_1 & 0xF0000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> x64_1_2 = (bit<64>) x_1_2 | (( x_1_2 & 0xF0000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> x64_2_0 = (bit<64>) x_2_0 | (( x_2_0 & 0xF0000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> x64_2_1 = (bit<64>) x_2_1 | (( x_2_1 & 0xF0000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> x64_2_2 = (bit<64>) x_2_2 | (( x_2_2 & 0xF0000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> x64_3_0 = (bit<64>) x_3_0 | (( x_3_0 & 0xF0000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> x64_3_1 = (bit<64>) x_3_1 | (( x_3_1 & 0xF0000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> x64_3_2 = (bit<64>) x_3_2 | (( x_3_2 & 0xF0000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> x64_4_0 = (bit<64>) x_4_0 | (( x_4_0 & 0xF0000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> x64_4_1 = (bit<64>) x_4_1 | (( x_4_1 & 0xF0000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> x64_4_2 = (bit<64>) x_4_2 | (( x_4_2 & 0xF0000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> x64_5_0 = (bit<64>) x_5_0 | (( x_5_0 & 0xF0000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> x64_5_1 = (bit<64>) x_5_1 | (( x_5_1 & 0xF0000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> x64_5_2 = (bit<64>) x_5_2 | (( x_5_2 & 0xF0000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> x64_6_0 = (bit<64>) x_6_0 | (( x_6_0 & 0xF0000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> x64_6_1 = (bit<64>) x_6_1 | (( x_6_1 & 0xF0000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> x64_6_2 = (bit<64>) x_6_2 | (( x_6_2 & 0xF0000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> x64_7_0 = (bit<64>) x_7_0 | (( x_7_0 & 0xF0000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> x64_7_1 = (bit<64>) x_7_1 | (( x_7_1 & 0xF0000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> x64_7_2 = (bit<64>) x_7_2 | (( x_7_2 & 0xF0000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);

        //计算q
        bit<32> q_0_0 = (x64_0_0 * wq_0_0 + x64_0_1 * wq_1_0 + x64_0_2 * wq_2_0)[39:8];
        bit<32> q_0_1 = (x64_0_0 * wq_0_1 + x64_0_1 * wq_1_1 + x64_0_2 * wq_2_1)[39:8];
        bit<32> q_0_2 = (x64_0_0 * wq_0_2 + x64_0_1 * wq_1_2 + x64_0_2 * wq_2_2)[39:8];
        bit<32> q_1_0 = (x64_1_0 * wq_0_0 + x64_1_1 * wq_1_0 + x64_1_2 * wq_2_0)[39:8];
        bit<32> q_1_1 = (x64_1_0 * wq_0_1 + x64_1_1 * wq_1_1 + x64_1_2 * wq_2_1)[39:8];
        bit<32> q_1_2 = (x64_1_0 * wq_0_2 + x64_1_1 * wq_1_2 + x64_1_2 * wq_2_2)[39:8];
        bit<32> q_2_0 = (x64_2_0 * wq_0_0 + x64_2_1 * wq_1_0 + x64_2_2 * wq_2_0)[39:8];
        bit<32> q_2_1 = (x64_2_0 * wq_0_1 + x64_2_1 * wq_1_1 + x64_2_2 * wq_2_1)[39:8];
        bit<32> q_2_2 = (x64_2_0 * wq_0_2 + x64_2_1 * wq_1_2 + x64_2_2 * wq_2_2)[39:8];
        bit<32> q_3_0 = (x64_3_0 * wq_0_0 + x64_3_1 * wq_1_0 + x64_3_2 * wq_2_0)[39:8];
        bit<32> q_3_1 = (x64_3_0 * wq_0_1 + x64_3_1 * wq_1_1 + x64_3_2 * wq_2_1)[39:8];
        bit<32> q_3_2 = (x64_3_0 * wq_0_2 + x64_3_1 * wq_1_2 + x64_3_2 * wq_2_2)[39:8];
        bit<32> q_4_0 = (x64_4_0 * wq_0_0 + x64_4_1 * wq_1_0 + x64_4_2 * wq_2_0)[39:8];
        bit<32> q_4_1 = (x64_4_0 * wq_0_1 + x64_4_1 * wq_1_1 + x64_4_2 * wq_2_1)[39:8];
        bit<32> q_4_2 = (x64_4_0 * wq_0_2 + x64_4_1 * wq_1_2 + x64_4_2 * wq_2_2)[39:8];
        bit<32> q_5_0 = (x64_5_0 * wq_0_0 + x64_5_1 * wq_1_0 + x64_5_2 * wq_2_0)[39:8];
        bit<32> q_5_1 = (x64_5_0 * wq_0_1 + x64_5_1 * wq_1_1 + x64_5_2 * wq_2_1)[39:8];
        bit<32> q_5_2 = (x64_5_0 * wq_0_2 + x64_5_1 * wq_1_2 + x64_5_2 * wq_2_2)[39:8];
        bit<32> q_6_0 = (x64_6_0 * wq_0_0 + x64_6_1 * wq_1_0 + x64_6_2 * wq_2_0)[39:8];
        bit<32> q_6_1 = (x64_6_0 * wq_0_1 + x64_6_1 * wq_1_1 + x64_6_2 * wq_2_1)[39:8];
        bit<32> q_6_2 = (x64_6_0 * wq_0_2 + x64_6_1 * wq_1_2 + x64_6_2 * wq_2_2)[39:8];
        bit<32> q_7_0 = (x64_7_0 * wq_0_0 + x64_7_1 * wq_1_0 + x64_7_2 * wq_2_0)[39:8];
        bit<32> q_7_1 = (x64_7_0 * wq_0_1 + x64_7_1 * wq_1_1 + x64_7_2 * wq_2_1)[39:8];
        bit<32> q_7_2 = (x64_7_0 * wq_0_2 + x64_7_1 * wq_1_2 + x64_7_2 * wq_2_2)[39:8];

        // 计算k
        bit<32> k_0_0 = (x64_0_0 * wk_0_0 + x64_0_1 * wk_1_0 + x64_0_2 * wk_2_0)[39:8];
        bit<32> k_0_1 = (x64_0_0 * wk_0_1 + x64_0_1 * wk_1_1 + x64_0_2 * wk_2_1)[39:8];
        bit<32> k_0_2 = (x64_0_0 * wk_0_2 + x64_0_1 * wk_1_2 + x64_0_2 * wk_2_2)[39:8];
        bit<32> k_1_0 = (x64_1_0 * wk_0_0 + x64_1_1 * wk_1_0 + x64_1_2 * wk_2_0)[39:8];
        bit<32> k_1_1 = (x64_1_0 * wk_0_1 + x64_1_1 * wk_1_1 + x64_1_2 * wk_2_1)[39:8];
        bit<32> k_1_2 = (x64_1_0 * wk_0_2 + x64_1_1 * wk_1_2 + x64_1_2 * wk_2_2)[39:8];
        bit<32> k_2_0 = (x64_2_0 * wk_0_0 + x64_2_1 * wk_1_0 + x64_2_2 * wk_2_0)[39:8];
        bit<32> k_2_1 = (x64_2_0 * wk_0_1 + x64_2_1 * wk_1_1 + x64_2_2 * wk_2_1)[39:8];
        bit<32> k_2_2 = (x64_2_0 * wk_0_2 + x64_2_1 * wk_1_2 + x64_2_2 * wk_2_2)[39:8];
        bit<32> k_3_0 = (x64_3_0 * wk_0_0 + x64_3_1 * wk_1_0 + x64_3_2 * wk_2_0)[39:8];
        bit<32> k_3_1 = (x64_3_0 * wk_0_1 + x64_3_1 * wk_1_1 + x64_3_2 * wk_2_1)[39:8];
        bit<32> k_3_2 = (x64_3_0 * wk_0_2 + x64_3_1 * wk_1_2 + x64_3_2 * wk_2_2)[39:8];
        bit<32> k_4_0 = (x64_4_0 * wk_0_0 + x64_4_1 * wk_1_0 + x64_4_2 * wk_2_0)[39:8];
        bit<32> k_4_1 = (x64_4_0 * wk_0_1 + x64_4_1 * wk_1_1 + x64_4_2 * wk_2_1)[39:8];
        bit<32> k_4_2 = (x64_4_0 * wk_0_2 + x64_4_1 * wk_1_2 + x64_4_2 * wk_2_2)[39:8];
        bit<32> k_5_0 = (x64_5_0 * wk_0_0 + x64_5_1 * wk_1_0 + x64_5_2 * wk_2_0)[39:8];
        bit<32> k_5_1 = (x64_5_0 * wk_0_1 + x64_5_1 * wk_1_1 + x64_5_2 * wk_2_1)[39:8];
        bit<32> k_5_2 = (x64_5_0 * wk_0_2 + x64_5_1 * wk_1_2 + x64_5_2 * wk_2_2)[39:8];
        bit<32> k_6_0 = (x64_6_0 * wk_0_0 + x64_6_1 * wk_1_0 + x64_6_2 * wk_2_0)[39:8];
        bit<32> k_6_1 = (x64_6_0 * wk_0_1 + x64_6_1 * wk_1_1 + x64_6_2 * wk_2_1)[39:8];
        bit<32> k_6_2 = (x64_6_0 * wk_0_2 + x64_6_1 * wk_1_2 + x64_6_2 * wk_2_2)[39:8];
        bit<32> k_7_0 = (x64_7_0 * wk_0_0 + x64_7_1 * wk_1_0 + x64_7_2 * wk_2_0)[39:8];
        bit<32> k_7_1 = (x64_7_0 * wk_0_1 + x64_7_1 * wk_1_1 + x64_7_2 * wk_2_1)[39:8];
        bit<32> k_7_2 = (x64_7_0 * wk_0_2 + x64_7_1 * wk_1_2 + x64_7_2 * wk_2_2)[39:8];
        
        // 计算v
        bit<64> v64_0_0 = x64_0_0 * wv_0_0 + x64_0_1 * wv_1_0 + x64_0_2 * wv_2_0;
        bit<64> v64_0_1 = x64_0_0 * wv_0_1 + x64_0_1 * wv_1_1 + x64_0_2 * wv_2_1;
        bit<64> v64_0_2 = x64_0_0 * wv_0_2 + x64_0_1 * wv_1_2 + x64_0_2 * wv_2_2;
        bit<64> v64_1_0 = x64_1_0 * wv_0_0 + x64_1_1 * wv_1_0 + x64_1_2 * wv_2_0;
        bit<64> v64_1_1 = x64_1_0 * wv_0_1 + x64_1_1 * wv_1_1 + x64_1_2 * wv_2_1;
        bit<64> v64_1_2 = x64_1_0 * wv_0_2 + x64_1_1 * wv_1_2 + x64_1_2 * wv_2_2;
        bit<64> v64_2_0 = x64_2_0 * wv_0_0 + x64_2_1 * wv_1_0 + x64_2_2 * wv_2_0;
        bit<64> v64_2_1 = x64_2_0 * wv_0_1 + x64_2_1 * wv_1_1 + x64_2_2 * wv_2_1;
        bit<64> v64_2_2 = x64_2_0 * wv_0_2 + x64_2_1 * wv_1_2 + x64_2_2 * wv_2_2;
        bit<64> v64_3_0 = x64_3_0 * wv_0_0 + x64_3_1 * wv_1_0 + x64_3_2 * wv_2_0;
        bit<64> v64_3_1 = x64_3_0 * wv_0_1 + x64_3_1 * wv_1_1 + x64_3_2 * wv_2_1;
        bit<64> v64_3_2 = x64_3_0 * wv_0_2 + x64_3_1 * wv_1_2 + x64_3_2 * wv_2_2;
        bit<64> v64_4_0 = x64_4_0 * wv_0_0 + x64_4_1 * wv_1_0 + x64_4_2 * wv_2_0;
        bit<64> v64_4_1 = x64_4_0 * wv_0_1 + x64_4_1 * wv_1_1 + x64_4_2 * wv_2_1;
        bit<64> v64_4_2 = x64_4_0 * wv_0_2 + x64_4_1 * wv_1_2 + x64_4_2 * wv_2_2;
        bit<64> v64_5_0 = x64_5_0 * wv_0_0 + x64_5_1 * wv_1_0 + x64_5_2 * wv_2_0;
        bit<64> v64_5_1 = x64_5_0 * wv_0_1 + x64_5_1 * wv_1_1 + x64_5_2 * wv_2_1;
        bit<64> v64_5_2 = x64_5_0 * wv_0_2 + x64_5_1 * wv_1_2 + x64_5_2 * wv_2_2;
        bit<64> v64_6_0 = x64_6_0 * wv_0_0 + x64_6_1 * wv_1_0 + x64_6_2 * wv_2_0;
        bit<64> v64_6_1 = x64_6_0 * wv_0_1 + x64_6_1 * wv_1_1 + x64_6_2 * wv_2_1;
        bit<64> v64_6_2 = x64_6_0 * wv_0_2 + x64_6_1 * wv_1_2 + x64_6_2 * wv_2_2;
        bit<64> v64_7_0 = x64_7_0 * wv_0_0 + x64_7_1 * wv_1_0 + x64_7_2 * wv_2_0;
        bit<64> v64_7_1 = x64_7_0 * wv_0_1 + x64_7_1 * wv_1_1 + x64_7_2 * wv_2_1;
        bit<64> v64_7_2 = x64_7_0 * wv_0_2 + x64_7_1 * wv_1_2 + x64_7_2 * wv_2_2;


        bit<64> v_0_0 = (bit<64>) v64_0_0[63:8] | (((v64_0_0[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> v_0_1 = (bit<64>) v64_0_1[63:8] | (((v64_0_1[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> v_0_2 = (bit<64>) v64_0_2[63:8] | (((v64_0_2[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> v_1_0 = (bit<64>) v64_1_0[63:8] | (((v64_1_0[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> v_1_1 = (bit<64>) v64_1_1[63:8] | (((v64_1_1[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> v_1_2 = (bit<64>) v64_1_2[63:8] | (((v64_1_2[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> v_2_0 = (bit<64>) v64_2_0[63:8] | (((v64_2_0[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> v_2_1 = (bit<64>) v64_2_1[63:8] | (((v64_2_1[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> v_2_2 = (bit<64>) v64_2_2[63:8] | (((v64_2_2[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> v_3_0 = (bit<64>) v64_3_0[63:8] | (((v64_3_0[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> v_3_1 = (bit<64>) v64_3_1[63:8] | (((v64_3_1[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> v_3_2 = (bit<64>) v64_3_2[63:8] | (((v64_3_2[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> v_4_0 = (bit<64>) v64_4_0[63:8] | (((v64_4_0[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> v_4_1 = (bit<64>) v64_4_1[63:8] | (((v64_4_1[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> v_4_2 = (bit<64>) v64_4_2[63:8] | (((v64_4_2[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> v_5_0 = (bit<64>) v64_5_0[63:8] | (((v64_5_0[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> v_5_1 = (bit<64>) v64_5_1[63:8] | (((v64_5_1[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> v_5_2 = (bit<64>) v64_5_2[63:8] | (((v64_5_2[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> v_6_0 = (bit<64>) v64_6_0[63:8] | (((v64_6_0[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> v_6_1 = (bit<64>) v64_6_1[63:8] | (((v64_6_1[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> v_6_2 = (bit<64>) v64_6_2[63:8] | (((v64_6_2[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> v_7_0 = (bit<64>) v64_7_0[63:8] | (((v64_7_0[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> v_7_1 = (bit<64>) v64_7_1[63:8] | (((v64_7_1[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> v_7_2 = (bit<64>) v64_7_2[63:8] | (((v64_7_2[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);


        v_value.write(0,v_0_0);
        v_value.write(1,v_0_1);
        v_value.write(2,v_0_2);
        v_value.write(3,v_1_0);
        v_value.write(4,v_1_1);
        v_value.write(5,v_1_2);
        v_value.write(6,v_2_0);
        v_value.write(7,v_2_1);
        v_value.write(8,v_2_2);
        v_value.write(9,v_3_0);
        v_value.write(10,v_3_1);
        v_value.write(11,v_3_2);
        v_value.write(12,v_4_0);
        v_value.write(13,v_4_1);
        v_value.write(14,v_4_2);
        v_value.write(15,v_5_0);
        v_value.write(16,v_5_1);
        v_value.write(17,v_5_2);
        v_value.write(18,v_6_0);
        v_value.write(19,v_6_1);
        v_value.write(20,v_6_2);
        v_value.write(21,v_7_0);
        v_value.write(22,v_7_1);
        v_value.write(23,v_7_2);

        // q,k符号扩展到64位
        bit<64> q64_0_0 = (bit<64>) q_0_0 | (( q_0_0 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> q64_0_1 = (bit<64>) q_0_1 | (( q_0_1 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> q64_0_2 = (bit<64>) q_0_2 | (( q_0_2 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> q64_1_0 = (bit<64>) q_1_0 | (( q_1_0 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> q64_1_1 = (bit<64>) q_1_1 | (( q_1_1 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> q64_1_2 = (bit<64>) q_1_2 | (( q_1_2 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> q64_2_0 = (bit<64>) q_2_0 | (( q_2_0 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> q64_2_1 = (bit<64>) q_2_1 | (( q_2_1 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> q64_2_2 = (bit<64>) q_2_2 | (( q_2_2 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> q64_3_0 = (bit<64>) q_3_0 | (( q_3_0 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> q64_3_1 = (bit<64>) q_3_1 | (( q_3_1 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> q64_3_2 = (bit<64>) q_3_2 | (( q_3_2 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> q64_4_0 = (bit<64>) q_4_0 | (( q_4_0 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> q64_4_1 = (bit<64>) q_4_1 | (( q_4_1 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> q64_4_2 = (bit<64>) q_4_2 | (( q_4_2 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> q64_5_0 = (bit<64>) q_5_0 | (( q_5_0 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> q64_5_1 = (bit<64>) q_5_1 | (( q_5_1 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> q64_5_2 = (bit<64>) q_5_2 | (( q_5_2 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> q64_6_0 = (bit<64>) q_6_0 | (( q_6_0 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> q64_6_1 = (bit<64>) q_6_1 | (( q_6_1 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> q64_6_2 = (bit<64>) q_6_2 | (( q_6_2 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> q64_7_0 = (bit<64>) q_7_0 | (( q_7_0 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> q64_7_1 = (bit<64>) q_7_1 | (( q_7_1 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> q64_7_2 = (bit<64>) q_7_2 | (( q_7_2 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);

        bit<64> k64_0_0 = (bit<64>) k_0_0 | (( k_0_0 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> k64_0_1 = (bit<64>) k_0_1 | (( k_0_1 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> k64_0_2 = (bit<64>) k_0_2 | (( k_0_2 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> k64_1_0 = (bit<64>) k_1_0 | (( k_1_0 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> k64_1_1 = (bit<64>) k_1_1 | (( k_1_1 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> k64_1_2 = (bit<64>) k_1_2 | (( k_1_2 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> k64_2_0 = (bit<64>) k_2_0 | (( k_2_0 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> k64_2_1 = (bit<64>) k_2_1 | (( k_2_1 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> k64_2_2 = (bit<64>) k_2_2 | (( k_2_2 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> k64_3_0 = (bit<64>) k_3_0 | (( k_3_0 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> k64_3_1 = (bit<64>) k_3_1 | (( k_3_1 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> k64_3_2 = (bit<64>) k_3_2 | (( k_3_2 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> k64_4_0 = (bit<64>) k_4_0 | (( k_4_0 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> k64_4_1 = (bit<64>) k_4_1 | (( k_4_1 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> k64_4_2 = (bit<64>) k_4_2 | (( k_4_2 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> k64_5_0 = (bit<64>) k_5_0 | (( k_5_0 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> k64_5_1 = (bit<64>) k_5_1 | (( k_5_1 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> k64_5_2 = (bit<64>) k_5_2 | (( k_5_2 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> k64_6_0 = (bit<64>) k_6_0 | (( k_6_0 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> k64_6_1 = (bit<64>) k_6_1 | (( k_6_1 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> k64_6_2 = (bit<64>) k_6_2 | (( k_6_2 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> k64_7_0 = (bit<64>) k_7_0 | (( k_7_0 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> k64_7_1 = (bit<64>) k_7_1 | (( k_7_1 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);
        bit<64> k64_7_2 = (bit<64>) k_7_2 | (( k_7_2 & 0x80000000) != 0 ? 64w0xFFFFFFFF00000000 : 64w0x0000000000000000);


    
        // 计算q*k_t，这里是没有右移8位的
        bit<64> q_mul64_kt_0_0 = q64_0_0 * k64_0_0 + q64_0_1 * k64_0_1 + q64_0_2 * k64_0_2 ;
        bit<64> q_mul64_kt_0_1 = q64_0_0 * k64_1_0 + q64_0_1 * k64_1_1 + q64_0_2 * k64_1_2 ;
        bit<64> q_mul64_kt_0_2 = q64_0_0 * k64_2_0 + q64_0_1 * k64_2_1 + q64_0_2 * k64_2_2 ;
        bit<64> q_mul64_kt_0_3 = q64_0_0 * k64_3_0 + q64_0_1 * k64_3_1 + q64_0_2 * k64_3_2 ;
        bit<64> q_mul64_kt_0_4 = q64_0_0 * k64_4_0 + q64_0_1 * k64_4_1 + q64_0_2 * k64_4_2 ;
        bit<64> q_mul64_kt_0_5 = q64_0_0 * k64_5_0 + q64_0_1 * k64_5_1 + q64_0_2 * k64_5_2 ;
        bit<64> q_mul64_kt_0_6 = q64_0_0 * k64_6_0 + q64_0_1 * k64_6_1 + q64_0_2 * k64_6_2 ;
        bit<64> q_mul64_kt_0_7 = q64_0_0 * k64_7_0 + q64_0_1 * k64_7_1 + q64_0_2 * k64_7_2 ;
        bit<64> q_mul64_kt_1_0 = q64_1_0 * k64_0_0 + q64_1_1 * k64_0_1 + q64_1_2 * k64_0_2 ;
        bit<64> q_mul64_kt_1_1 = q64_1_0 * k64_1_0 + q64_1_1 * k64_1_1 + q64_1_2 * k64_1_2 ;
        bit<64> q_mul64_kt_1_2 = q64_1_0 * k64_2_0 + q64_1_1 * k64_2_1 + q64_1_2 * k64_2_2 ;
        bit<64> q_mul64_kt_1_3 = q64_1_0 * k64_3_0 + q64_1_1 * k64_3_1 + q64_1_2 * k64_3_2 ;
        bit<64> q_mul64_kt_1_4 = q64_1_0 * k64_4_0 + q64_1_1 * k64_4_1 + q64_1_2 * k64_4_2 ;
        bit<64> q_mul64_kt_1_5 = q64_1_0 * k64_5_0 + q64_1_1 * k64_5_1 + q64_1_2 * k64_5_2 ;
        bit<64> q_mul64_kt_1_6 = q64_1_0 * k64_6_0 + q64_1_1 * k64_6_1 + q64_1_2 * k64_6_2 ;
        bit<64> q_mul64_kt_1_7 = q64_1_0 * k64_7_0 + q64_1_1 * k64_7_1 + q64_1_2 * k64_7_2 ;
        bit<64> q_mul64_kt_2_0 = q64_2_0 * k64_0_0 + q64_2_1 * k64_0_1 + q64_2_2 * k64_0_2 ;
        bit<64> q_mul64_kt_2_1 = q64_2_0 * k64_1_0 + q64_2_1 * k64_1_1 + q64_2_2 * k64_1_2 ;
        bit<64> q_mul64_kt_2_2 = q64_2_0 * k64_2_0 + q64_2_1 * k64_2_1 + q64_2_2 * k64_2_2 ;
        bit<64> q_mul64_kt_2_3 = q64_2_0 * k64_3_0 + q64_2_1 * k64_3_1 + q64_2_2 * k64_3_2 ;
        bit<64> q_mul64_kt_2_4 = q64_2_0 * k64_4_0 + q64_2_1 * k64_4_1 + q64_2_2 * k64_4_2 ;
        bit<64> q_mul64_kt_2_5 = q64_2_0 * k64_5_0 + q64_2_1 * k64_5_1 + q64_2_2 * k64_5_2 ;
        bit<64> q_mul64_kt_2_6 = q64_2_0 * k64_6_0 + q64_2_1 * k64_6_1 + q64_2_2 * k64_6_2 ;
        bit<64> q_mul64_kt_2_7 = q64_2_0 * k64_7_0 + q64_2_1 * k64_7_1 + q64_2_2 * k64_7_2 ;
        bit<64> q_mul64_kt_3_0 = q64_3_0 * k64_0_0 + q64_3_1 * k64_0_1 + q64_3_2 * k64_0_2 ;
        bit<64> q_mul64_kt_3_1 = q64_3_0 * k64_1_0 + q64_3_1 * k64_1_1 + q64_3_2 * k64_1_2 ;
        bit<64> q_mul64_kt_3_2 = q64_3_0 * k64_2_0 + q64_3_1 * k64_2_1 + q64_3_2 * k64_2_2 ;
        bit<64> q_mul64_kt_3_3 = q64_3_0 * k64_3_0 + q64_3_1 * k64_3_1 + q64_3_2 * k64_3_2 ;
        bit<64> q_mul64_kt_3_4 = q64_3_0 * k64_4_0 + q64_3_1 * k64_4_1 + q64_3_2 * k64_4_2 ;
        bit<64> q_mul64_kt_3_5 = q64_3_0 * k64_5_0 + q64_3_1 * k64_5_1 + q64_3_2 * k64_5_2 ;
        bit<64> q_mul64_kt_3_6 = q64_3_0 * k64_6_0 + q64_3_1 * k64_6_1 + q64_3_2 * k64_6_2 ;
        bit<64> q_mul64_kt_3_7 = q64_3_0 * k64_7_0 + q64_3_1 * k64_7_1 + q64_3_2 * k64_7_2 ;
        bit<64> q_mul64_kt_4_0 = q64_4_0 * k64_0_0 + q64_4_1 * k64_0_1 + q64_4_2 * k64_0_2 ;
        bit<64> q_mul64_kt_4_1 = q64_4_0 * k64_1_0 + q64_4_1 * k64_1_1 + q64_4_2 * k64_1_2 ;
        bit<64> q_mul64_kt_4_2 = q64_4_0 * k64_2_0 + q64_4_1 * k64_2_1 + q64_4_2 * k64_2_2 ;
        bit<64> q_mul64_kt_4_3 = q64_4_0 * k64_3_0 + q64_4_1 * k64_3_1 + q64_4_2 * k64_3_2 ;
        bit<64> q_mul64_kt_4_4 = q64_4_0 * k64_4_0 + q64_4_1 * k64_4_1 + q64_4_2 * k64_4_2 ;
        bit<64> q_mul64_kt_4_5 = q64_4_0 * k64_5_0 + q64_4_1 * k64_5_1 + q64_4_2 * k64_5_2 ;
        bit<64> q_mul64_kt_4_6 = q64_4_0 * k64_6_0 + q64_4_1 * k64_6_1 + q64_4_2 * k64_6_2 ;
        bit<64> q_mul64_kt_4_7 = q64_4_0 * k64_7_0 + q64_4_1 * k64_7_1 + q64_4_2 * k64_7_2 ;
        bit<64> q_mul64_kt_5_0 = q64_5_0 * k64_0_0 + q64_5_1 * k64_0_1 + q64_5_2 * k64_0_2 ;
        bit<64> q_mul64_kt_5_1 = q64_5_0 * k64_1_0 + q64_5_1 * k64_1_1 + q64_5_2 * k64_1_2 ;
        bit<64> q_mul64_kt_5_2 = q64_5_0 * k64_2_0 + q64_5_1 * k64_2_1 + q64_5_2 * k64_2_2 ;
        bit<64> q_mul64_kt_5_3 = q64_5_0 * k64_3_0 + q64_5_1 * k64_3_1 + q64_5_2 * k64_3_2 ;
        bit<64> q_mul64_kt_5_4 = q64_5_0 * k64_4_0 + q64_5_1 * k64_4_1 + q64_5_2 * k64_4_2 ;
        bit<64> q_mul64_kt_5_5 = q64_5_0 * k64_5_0 + q64_5_1 * k64_5_1 + q64_5_2 * k64_5_2 ;
        bit<64> q_mul64_kt_5_6 = q64_5_0 * k64_6_0 + q64_5_1 * k64_6_1 + q64_5_2 * k64_6_2 ;
        bit<64> q_mul64_kt_5_7 = q64_5_0 * k64_7_0 + q64_5_1 * k64_7_1 + q64_5_2 * k64_7_2 ;
        bit<64> q_mul64_kt_6_0 = q64_6_0 * k64_0_0 + q64_6_1 * k64_0_1 + q64_6_2 * k64_0_2 ;
        bit<64> q_mul64_kt_6_1 = q64_6_0 * k64_1_0 + q64_6_1 * k64_1_1 + q64_6_2 * k64_1_2 ;
        bit<64> q_mul64_kt_6_2 = q64_6_0 * k64_2_0 + q64_6_1 * k64_2_1 + q64_6_2 * k64_2_2 ;
        bit<64> q_mul64_kt_6_3 = q64_6_0 * k64_3_0 + q64_6_1 * k64_3_1 + q64_6_2 * k64_3_2 ;
        bit<64> q_mul64_kt_6_4 = q64_6_0 * k64_4_0 + q64_6_1 * k64_4_1 + q64_6_2 * k64_4_2 ;
        bit<64> q_mul64_kt_6_5 = q64_6_0 * k64_5_0 + q64_6_1 * k64_5_1 + q64_6_2 * k64_5_2 ;
        bit<64> q_mul64_kt_6_6 = q64_6_0 * k64_6_0 + q64_6_1 * k64_6_1 + q64_6_2 * k64_6_2 ;
        bit<64> q_mul64_kt_6_7 = q64_6_0 * k64_7_0 + q64_6_1 * k64_7_1 + q64_6_2 * k64_7_2 ;
        bit<64> q_mul64_kt_7_0 = q64_7_0 * k64_0_0 + q64_7_1 * k64_0_1 + q64_7_2 * k64_0_2 ;
        bit<64> q_mul64_kt_7_1 = q64_7_0 * k64_1_0 + q64_7_1 * k64_1_1 + q64_7_2 * k64_1_2 ;
        bit<64> q_mul64_kt_7_2 = q64_7_0 * k64_2_0 + q64_7_1 * k64_2_1 + q64_7_2 * k64_2_2 ;
        bit<64> q_mul64_kt_7_3 = q64_7_0 * k64_3_0 + q64_7_1 * k64_3_1 + q64_7_2 * k64_3_2 ;
        bit<64> q_mul64_kt_7_4 = q64_7_0 * k64_4_0 + q64_7_1 * k64_4_1 + q64_7_2 * k64_4_2 ;
        bit<64> q_mul64_kt_7_5 = q64_7_0 * k64_5_0 + q64_7_1 * k64_5_1 + q64_7_2 * k64_5_2 ;
        bit<64> q_mul64_kt_7_6 = q64_7_0 * k64_6_0 + q64_7_1 * k64_6_1 + q64_7_2 * k64_6_2 ;
        bit<64> q_mul64_kt_7_7 = q64_7_0 * k64_7_0 + q64_7_1 * k64_7_1 + q64_7_2 * k64_7_2 ;

        q_mul64_kt.write(0,q_mul64_kt_0_0);
        q_mul64_kt.write(1,q_mul64_kt_0_1);
        q_mul64_kt.write(2,q_mul64_kt_0_2);
        q_mul64_kt.write(3,q_mul64_kt_0_3);
        q_mul64_kt.write(4,q_mul64_kt_0_4);
        q_mul64_kt.write(5,q_mul64_kt_0_5);
        q_mul64_kt.write(6,q_mul64_kt_0_6);
        q_mul64_kt.write(7,q_mul64_kt_0_7);
        q_mul64_kt.write(8,q_mul64_kt_1_0);
        q_mul64_kt.write(9,q_mul64_kt_1_1);
        q_mul64_kt.write(10,q_mul64_kt_1_2);
        q_mul64_kt.write(11,q_mul64_kt_1_3);
        q_mul64_kt.write(12,q_mul64_kt_1_4);
        q_mul64_kt.write(13,q_mul64_kt_1_5);
        q_mul64_kt.write(14,q_mul64_kt_1_6);
        q_mul64_kt.write(15,q_mul64_kt_1_7);
        q_mul64_kt.write(16,q_mul64_kt_2_0);
        q_mul64_kt.write(17,q_mul64_kt_2_1);
        q_mul64_kt.write(18,q_mul64_kt_2_2);
        q_mul64_kt.write(19,q_mul64_kt_2_3);
        q_mul64_kt.write(20,q_mul64_kt_2_4);
        q_mul64_kt.write(21,q_mul64_kt_2_5);
        q_mul64_kt.write(22,q_mul64_kt_2_6);
        q_mul64_kt.write(23,q_mul64_kt_2_7);
        q_mul64_kt.write(24,q_mul64_kt_3_0);
        q_mul64_kt.write(25,q_mul64_kt_3_1);
        q_mul64_kt.write(26,q_mul64_kt_3_2);
        q_mul64_kt.write(27,q_mul64_kt_3_3);
        q_mul64_kt.write(28,q_mul64_kt_3_4);
        q_mul64_kt.write(29,q_mul64_kt_3_5);
        q_mul64_kt.write(30,q_mul64_kt_3_6);
        q_mul64_kt.write(31,q_mul64_kt_3_7);
        q_mul64_kt.write(32,q_mul64_kt_4_0);
        q_mul64_kt.write(33,q_mul64_kt_4_1);
        q_mul64_kt.write(34,q_mul64_kt_4_2);
        q_mul64_kt.write(35,q_mul64_kt_4_3);
        q_mul64_kt.write(36,q_mul64_kt_4_4);
        q_mul64_kt.write(37,q_mul64_kt_4_5);
        q_mul64_kt.write(38,q_mul64_kt_4_6);
        q_mul64_kt.write(39,q_mul64_kt_4_7);
        q_mul64_kt.write(40,q_mul64_kt_5_0);
        q_mul64_kt.write(41,q_mul64_kt_5_1);
        q_mul64_kt.write(42,q_mul64_kt_5_2);
        q_mul64_kt.write(43,q_mul64_kt_5_3);
        q_mul64_kt.write(44,q_mul64_kt_5_4);
        q_mul64_kt.write(45,q_mul64_kt_5_5);
        q_mul64_kt.write(46,q_mul64_kt_5_6);
        q_mul64_kt.write(47,q_mul64_kt_5_7);
        q_mul64_kt.write(48,q_mul64_kt_6_0);
        q_mul64_kt.write(49,q_mul64_kt_6_1);
        q_mul64_kt.write(50,q_mul64_kt_6_2);
        q_mul64_kt.write(51,q_mul64_kt_6_3);
        q_mul64_kt.write(52,q_mul64_kt_6_4);
        q_mul64_kt.write(53,q_mul64_kt_6_5);
        q_mul64_kt.write(54,q_mul64_kt_6_6);
        q_mul64_kt.write(55,q_mul64_kt_6_7);
        q_mul64_kt.write(56,q_mul64_kt_7_0);
        q_mul64_kt.write(57,q_mul64_kt_7_1);
        q_mul64_kt.write(58,q_mul64_kt_7_2);
        q_mul64_kt.write(59,q_mul64_kt_7_3);
        q_mul64_kt.write(60,q_mul64_kt_7_4);
        q_mul64_kt.write(61,q_mul64_kt_7_5);
        q_mul64_kt.write(62,q_mul64_kt_7_6);
        q_mul64_kt.write(63,q_mul64_kt_7_7);
    }

    action cal_softmax(){
        bit<64> q_mul64_kt_0_0;
        bit<64> q_mul64_kt_0_1;
        bit<64> q_mul64_kt_0_2;
        bit<64> q_mul64_kt_0_3;
        bit<64> q_mul64_kt_0_4;
        bit<64> q_mul64_kt_0_5;
        bit<64> q_mul64_kt_0_6;
        bit<64> q_mul64_kt_0_7;
        bit<64> q_mul64_kt_1_0;
        bit<64> q_mul64_kt_1_1;
        bit<64> q_mul64_kt_1_2;
        bit<64> q_mul64_kt_1_3;
        bit<64> q_mul64_kt_1_4;
        bit<64> q_mul64_kt_1_5;
        bit<64> q_mul64_kt_1_6;
        bit<64> q_mul64_kt_1_7;
        bit<64> q_mul64_kt_2_0;
        bit<64> q_mul64_kt_2_1;
        bit<64> q_mul64_kt_2_2;
        bit<64> q_mul64_kt_2_3;
        bit<64> q_mul64_kt_2_4;
        bit<64> q_mul64_kt_2_5;
        bit<64> q_mul64_kt_2_6;
        bit<64> q_mul64_kt_2_7;
        bit<64> q_mul64_kt_3_0;
        bit<64> q_mul64_kt_3_1;
        bit<64> q_mul64_kt_3_2;
        bit<64> q_mul64_kt_3_3;
        bit<64> q_mul64_kt_3_4;
        bit<64> q_mul64_kt_3_5;
        bit<64> q_mul64_kt_3_6;
        bit<64> q_mul64_kt_3_7;
        bit<64> q_mul64_kt_4_0;
        bit<64> q_mul64_kt_4_1;
        bit<64> q_mul64_kt_4_2;
        bit<64> q_mul64_kt_4_3;
        bit<64> q_mul64_kt_4_4;
        bit<64> q_mul64_kt_4_5;
        bit<64> q_mul64_kt_4_6;
        bit<64> q_mul64_kt_4_7;
        bit<64> q_mul64_kt_5_0;
        bit<64> q_mul64_kt_5_1;
        bit<64> q_mul64_kt_5_2;
        bit<64> q_mul64_kt_5_3;
        bit<64> q_mul64_kt_5_4;
        bit<64> q_mul64_kt_5_5;
        bit<64> q_mul64_kt_5_6;
        bit<64> q_mul64_kt_5_7;
        bit<64> q_mul64_kt_6_0;
        bit<64> q_mul64_kt_6_1;
        bit<64> q_mul64_kt_6_2;
        bit<64> q_mul64_kt_6_3;
        bit<64> q_mul64_kt_6_4;
        bit<64> q_mul64_kt_6_5;
        bit<64> q_mul64_kt_6_6;
        bit<64> q_mul64_kt_6_7;
        bit<64> q_mul64_kt_7_0;
        bit<64> q_mul64_kt_7_1;
        bit<64> q_mul64_kt_7_2;
        bit<64> q_mul64_kt_7_3;
        bit<64> q_mul64_kt_7_4;
        bit<64> q_mul64_kt_7_5;
        bit<64> q_mul64_kt_7_6;
        bit<64> q_mul64_kt_7_7;

        q_mul64_kt.read(q_mul64_kt_0_0 , 0);
        q_mul64_kt.read(q_mul64_kt_0_1 , 1);
        q_mul64_kt.read(q_mul64_kt_0_2 , 2);
        q_mul64_kt.read(q_mul64_kt_0_3 , 3);
        q_mul64_kt.read(q_mul64_kt_0_4 , 4);
        q_mul64_kt.read(q_mul64_kt_0_5 , 5);
        q_mul64_kt.read(q_mul64_kt_0_6 , 6);
        q_mul64_kt.read(q_mul64_kt_0_7 , 7);
        q_mul64_kt.read(q_mul64_kt_1_0 , 8);
        q_mul64_kt.read(q_mul64_kt_1_1 , 9);
        q_mul64_kt.read(q_mul64_kt_1_2 , 10);
        q_mul64_kt.read(q_mul64_kt_1_3 , 11);
        q_mul64_kt.read(q_mul64_kt_1_4 , 12);
        q_mul64_kt.read(q_mul64_kt_1_5 , 13);
        q_mul64_kt.read(q_mul64_kt_1_6 , 14);
        q_mul64_kt.read(q_mul64_kt_1_7 , 15);
        q_mul64_kt.read(q_mul64_kt_2_0 , 16);
        q_mul64_kt.read(q_mul64_kt_2_1 , 17);
        q_mul64_kt.read(q_mul64_kt_2_2 , 18);
        q_mul64_kt.read(q_mul64_kt_2_3 , 19);
        q_mul64_kt.read(q_mul64_kt_2_4 , 20);
        q_mul64_kt.read(q_mul64_kt_2_5 , 21);
        q_mul64_kt.read(q_mul64_kt_2_6 , 22);
        q_mul64_kt.read(q_mul64_kt_2_7 , 23);
        q_mul64_kt.read(q_mul64_kt_3_0 , 24);
        q_mul64_kt.read(q_mul64_kt_3_1 , 25);
        q_mul64_kt.read(q_mul64_kt_3_2 , 26);
        q_mul64_kt.read(q_mul64_kt_3_3 , 27);
        q_mul64_kt.read(q_mul64_kt_3_4 , 28);
        q_mul64_kt.read(q_mul64_kt_3_5 , 29);
        q_mul64_kt.read(q_mul64_kt_3_6 , 30);
        q_mul64_kt.read(q_mul64_kt_3_7 , 31);
        q_mul64_kt.read(q_mul64_kt_4_0 , 32);
        q_mul64_kt.read(q_mul64_kt_4_1 , 33);
        q_mul64_kt.read(q_mul64_kt_4_2 , 34);
        q_mul64_kt.read(q_mul64_kt_4_3 , 35);
        q_mul64_kt.read(q_mul64_kt_4_4 , 36);
        q_mul64_kt.read(q_mul64_kt_4_5 , 37);
        q_mul64_kt.read(q_mul64_kt_4_6 , 38);
        q_mul64_kt.read(q_mul64_kt_4_7 , 39);
        q_mul64_kt.read(q_mul64_kt_5_0 , 40);
        q_mul64_kt.read(q_mul64_kt_5_1 , 41);
        q_mul64_kt.read(q_mul64_kt_5_2 , 42);
        q_mul64_kt.read(q_mul64_kt_5_3 , 43);
        q_mul64_kt.read(q_mul64_kt_5_4 , 44);
        q_mul64_kt.read(q_mul64_kt_5_5 , 45);
        q_mul64_kt.read(q_mul64_kt_5_6 , 46);
        q_mul64_kt.read(q_mul64_kt_5_7 , 47);
        q_mul64_kt.read(q_mul64_kt_6_0 , 48);
        q_mul64_kt.read(q_mul64_kt_6_1 , 49);
        q_mul64_kt.read(q_mul64_kt_6_2 , 50);
        q_mul64_kt.read(q_mul64_kt_6_3 , 51);
        q_mul64_kt.read(q_mul64_kt_6_4 , 52);
        q_mul64_kt.read(q_mul64_kt_6_5 , 53);
        q_mul64_kt.read(q_mul64_kt_6_6 , 54);
        q_mul64_kt.read(q_mul64_kt_6_7 , 55);
        q_mul64_kt.read(q_mul64_kt_7_0 , 56);
        q_mul64_kt.read(q_mul64_kt_7_1 , 57);
        q_mul64_kt.read(q_mul64_kt_7_2 , 58);
        q_mul64_kt.read(q_mul64_kt_7_3 , 59);
        q_mul64_kt.read(q_mul64_kt_7_4 , 60);
        q_mul64_kt.read(q_mul64_kt_7_5 , 61);
        q_mul64_kt.read(q_mul64_kt_7_6 , 62);
        q_mul64_kt.read(q_mul64_kt_7_7 , 63);

    
         // 除以根号dk，用泰勒级数计算e^x
        const bit<64> k = 0xB504F3; // 根号dk分之一*2^16的Q24.8形式，具体实际的值是1 / math.sqrt(2) * (2**16)，但是是Q24.8形式的2**8倍
        const bit<64> float_1_5 = 0x00000080;
        const bit<64> float_1_16 = 0x0000002B;
        
        bit<64> q_mul_kt_0_0 = (bit<64>) q_mul64_kt_0_0[63:8] | (((q_mul64_kt_0_0[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_0_0 = (q_mul_kt_0_0 * k)[47:16];
        bit<32> result_square_0_0 = (q_mul_kt_0_0 * q_mul_kt_0_0 * float_1_5)[55:24];
        bit<32> result_cube_0_0 = (q_mul_kt_0_0 * q_mul_kt_0_0 * q_mul_kt_0_0 * float_1_16)[63:32];
        meta.q_mul_kt_0_0 = 1 + result_linear_0_0 + result_square_0_0 + result_cube_0_0;
        bit<64> q_mul_kt_0_1 = (bit<64>) q_mul64_kt_0_1[63:8] | (((q_mul64_kt_0_1[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_0_1 = (q_mul_kt_0_1 * k)[47:16];
        bit<32> result_square_0_1 = (q_mul_kt_0_1 * q_mul_kt_0_1 * float_1_5)[55:24];
        bit<32> result_cube_0_1 = (q_mul_kt_0_1 * q_mul_kt_0_1 * q_mul_kt_0_1 * float_1_16)[63:32];
        meta.q_mul_kt_0_1 = 1 + result_linear_0_1 + result_square_0_1 + result_cube_0_1;
        bit<64> q_mul_kt_0_2 = (bit<64>) q_mul64_kt_0_2[63:8] | (((q_mul64_kt_0_2[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_0_2 = (q_mul_kt_0_2 * k)[47:16];
        bit<32> result_square_0_2 = (q_mul_kt_0_2 * q_mul_kt_0_2 * float_1_5)[55:24];
        bit<32> result_cube_0_2 = (q_mul_kt_0_2 * q_mul_kt_0_2 * q_mul_kt_0_2 * float_1_16)[63:32];
        meta.q_mul_kt_0_2 = 1 + result_linear_0_2 + result_square_0_2 + result_cube_0_2;
        bit<64> q_mul_kt_0_3 = (bit<64>) q_mul64_kt_0_3[63:8] | (((q_mul64_kt_0_3[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_0_3 = (q_mul_kt_0_3 * k)[47:16];
        bit<32> result_square_0_3 = (q_mul_kt_0_3 * q_mul_kt_0_3 * float_1_5)[55:24];
        bit<32> result_cube_0_3 = (q_mul_kt_0_3 * q_mul_kt_0_3 * q_mul_kt_0_3 * float_1_16)[63:32];
        meta.q_mul_kt_0_3 = 1 + result_linear_0_3 + result_square_0_3 + result_cube_0_3;
        bit<64> q_mul_kt_0_4 = (bit<64>) q_mul64_kt_0_4[63:8] | (((q_mul64_kt_0_4[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_0_4 = (q_mul_kt_0_4 * k)[47:16];
        bit<32> result_square_0_4 = (q_mul_kt_0_4 * q_mul_kt_0_4 * float_1_5)[55:24];
        bit<32> result_cube_0_4 = (q_mul_kt_0_4 * q_mul_kt_0_4 * q_mul_kt_0_4 * float_1_16)[63:32];
        meta.q_mul_kt_0_4 = 1 + result_linear_0_4 + result_square_0_4 + result_cube_0_4;
        bit<64> q_mul_kt_0_5 = (bit<64>) q_mul64_kt_0_5[63:8] | (((q_mul64_kt_0_5[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_0_5 = (q_mul_kt_0_5 * k)[47:16];
        bit<32> result_square_0_5 = (q_mul_kt_0_5 * q_mul_kt_0_5 * float_1_5)[55:24];
        bit<32> result_cube_0_5 = (q_mul_kt_0_5 * q_mul_kt_0_5 * q_mul_kt_0_5 * float_1_16)[63:32];
        meta.q_mul_kt_0_5 = 1 + result_linear_0_5 + result_square_0_5 + result_cube_0_5;
        bit<64> q_mul_kt_0_6 = (bit<64>) q_mul64_kt_0_6[63:8] | (((q_mul64_kt_0_6[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_0_6 = (q_mul_kt_0_6 * k)[47:16];
        bit<32> result_square_0_6 = (q_mul_kt_0_6 * q_mul_kt_0_6 * float_1_5)[55:24];
        bit<32> result_cube_0_6 = (q_mul_kt_0_6 * q_mul_kt_0_6 * q_mul_kt_0_6 * float_1_16)[63:32];
        meta.q_mul_kt_0_6 = 1 + result_linear_0_6 + result_square_0_6 + result_cube_0_6;
        bit<64> q_mul_kt_0_7 = (bit<64>) q_mul64_kt_0_7[63:8] | (((q_mul64_kt_0_7[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_0_7 = (q_mul_kt_0_7 * k)[47:16];
        bit<32> result_square_0_7 = (q_mul_kt_0_7 * q_mul_kt_0_7 * float_1_5)[55:24];
        bit<32> result_cube_0_7 = (q_mul_kt_0_7 * q_mul_kt_0_7 * q_mul_kt_0_7 * float_1_16)[63:32];
        meta.q_mul_kt_0_7 = 1 + result_linear_0_7 + result_square_0_7 + result_cube_0_7;
        bit<64> q_mul_kt_1_0 = (bit<64>) q_mul64_kt_1_0[63:8] | (((q_mul64_kt_1_0[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_1_0 = (q_mul_kt_1_0 * k)[47:16];
        bit<32> result_square_1_0 = (q_mul_kt_1_0 * q_mul_kt_1_0 * float_1_5)[55:24];
        bit<32> result_cube_1_0 = (q_mul_kt_1_0 * q_mul_kt_1_0 * q_mul_kt_1_0 * float_1_16)[63:32];
        meta.q_mul_kt_1_0 = 1 + result_linear_1_0 + result_square_1_0 + result_cube_1_0;
        bit<64> q_mul_kt_1_1 = (bit<64>) q_mul64_kt_1_1[63:8] | (((q_mul64_kt_1_1[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_1_1 = (q_mul_kt_1_1 * k)[47:16];
        bit<32> result_square_1_1 = (q_mul_kt_1_1 * q_mul_kt_1_1 * float_1_5)[55:24];
        bit<32> result_cube_1_1 = (q_mul_kt_1_1 * q_mul_kt_1_1 * q_mul_kt_1_1 * float_1_16)[63:32];
        meta.q_mul_kt_1_1 = 1 + result_linear_1_1 + result_square_1_1 + result_cube_1_1;
        bit<64> q_mul_kt_1_2 = (bit<64>) q_mul64_kt_1_2[63:8] | (((q_mul64_kt_1_2[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_1_2 = (q_mul_kt_1_2 * k)[47:16];
        bit<32> result_square_1_2 = (q_mul_kt_1_2 * q_mul_kt_1_2 * float_1_5)[55:24];
        bit<32> result_cube_1_2 = (q_mul_kt_1_2 * q_mul_kt_1_2 * q_mul_kt_1_2 * float_1_16)[63:32];
        meta.q_mul_kt_1_2 = 1 + result_linear_1_2 + result_square_1_2 + result_cube_1_2;
        bit<64> q_mul_kt_1_3 = (bit<64>) q_mul64_kt_1_3[63:8] | (((q_mul64_kt_1_3[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_1_3 = (q_mul_kt_1_3 * k)[47:16];
        bit<32> result_square_1_3 = (q_mul_kt_1_3 * q_mul_kt_1_3 * float_1_5)[55:24];
        bit<32> result_cube_1_3 = (q_mul_kt_1_3 * q_mul_kt_1_3 * q_mul_kt_1_3 * float_1_16)[63:32];
        meta.q_mul_kt_1_3 = 1 + result_linear_1_3 + result_square_1_3 + result_cube_1_3;
        bit<64> q_mul_kt_1_4 = (bit<64>) q_mul64_kt_1_4[63:8] | (((q_mul64_kt_1_4[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_1_4 = (q_mul_kt_1_4 * k)[47:16];
        bit<32> result_square_1_4 = (q_mul_kt_1_4 * q_mul_kt_1_4 * float_1_5)[55:24];
        bit<32> result_cube_1_4 = (q_mul_kt_1_4 * q_mul_kt_1_4 * q_mul_kt_1_4 * float_1_16)[63:32];
        meta.q_mul_kt_1_4 = 1 + result_linear_1_4 + result_square_1_4 + result_cube_1_4;
        bit<64> q_mul_kt_1_5 = (bit<64>) q_mul64_kt_1_5[63:8] | (((q_mul64_kt_1_5[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_1_5 = (q_mul_kt_1_5 * k)[47:16];
        bit<32> result_square_1_5 = (q_mul_kt_1_5 * q_mul_kt_1_5 * float_1_5)[55:24];
        bit<32> result_cube_1_5 = (q_mul_kt_1_5 * q_mul_kt_1_5 * q_mul_kt_1_5 * float_1_16)[63:32];
        meta.q_mul_kt_1_5 = 1 + result_linear_1_5 + result_square_1_5 + result_cube_1_5;
        bit<64> q_mul_kt_1_6 = (bit<64>) q_mul64_kt_1_6[63:8] | (((q_mul64_kt_1_6[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_1_6 = (q_mul_kt_1_6 * k)[47:16];
        bit<32> result_square_1_6 = (q_mul_kt_1_6 * q_mul_kt_1_6 * float_1_5)[55:24];
        bit<32> result_cube_1_6 = (q_mul_kt_1_6 * q_mul_kt_1_6 * q_mul_kt_1_6 * float_1_16)[63:32];
        meta.q_mul_kt_1_6 = 1 + result_linear_1_6 + result_square_1_6 + result_cube_1_6;
        bit<64> q_mul_kt_1_7 = (bit<64>) q_mul64_kt_1_7[63:8] | (((q_mul64_kt_1_7[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_1_7 = (q_mul_kt_1_7 * k)[47:16];
        bit<32> result_square_1_7 = (q_mul_kt_1_7 * q_mul_kt_1_7 * float_1_5)[55:24];
        bit<32> result_cube_1_7 = (q_mul_kt_1_7 * q_mul_kt_1_7 * q_mul_kt_1_7 * float_1_16)[63:32];
        meta.q_mul_kt_1_7 = 1 + result_linear_1_7 + result_square_1_7 + result_cube_1_7;
        bit<64> q_mul_kt_2_0 = (bit<64>) q_mul64_kt_2_0[63:8] | (((q_mul64_kt_2_0[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_2_0 = (q_mul_kt_2_0 * k)[47:16];
        bit<32> result_square_2_0 = (q_mul_kt_2_0 * q_mul_kt_2_0 * float_1_5)[55:24];
        bit<32> result_cube_2_0 = (q_mul_kt_2_0 * q_mul_kt_2_0 * q_mul_kt_2_0 * float_1_16)[63:32];
        meta.q_mul_kt_2_0 = 1 + result_linear_2_0 + result_square_2_0 + result_cube_2_0;
        bit<64> q_mul_kt_2_1 = (bit<64>) q_mul64_kt_2_1[63:8] | (((q_mul64_kt_2_1[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_2_1 = (q_mul_kt_2_1 * k)[47:16];
        bit<32> result_square_2_1 = (q_mul_kt_2_1 * q_mul_kt_2_1 * float_1_5)[55:24];
        bit<32> result_cube_2_1 = (q_mul_kt_2_1 * q_mul_kt_2_1 * q_mul_kt_2_1 * float_1_16)[63:32];
        meta.q_mul_kt_2_1 = 1 + result_linear_2_1 + result_square_2_1 + result_cube_2_1;
        bit<64> q_mul_kt_2_2 = (bit<64>) q_mul64_kt_2_2[63:8] | (((q_mul64_kt_2_2[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_2_2 = (q_mul_kt_2_2 * k)[47:16];
        bit<32> result_square_2_2 = (q_mul_kt_2_2 * q_mul_kt_2_2 * float_1_5)[55:24];
        bit<32> result_cube_2_2 = (q_mul_kt_2_2 * q_mul_kt_2_2 * q_mul_kt_2_2 * float_1_16)[63:32];
        meta.q_mul_kt_2_2 = 1 + result_linear_2_2 + result_square_2_2 + result_cube_2_2;
        bit<64> q_mul_kt_2_3 = (bit<64>) q_mul64_kt_2_3[63:8] | (((q_mul64_kt_2_3[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_2_3 = (q_mul_kt_2_3 * k)[47:16];
        bit<32> result_square_2_3 = (q_mul_kt_2_3 * q_mul_kt_2_3 * float_1_5)[55:24];
        bit<32> result_cube_2_3 = (q_mul_kt_2_3 * q_mul_kt_2_3 * q_mul_kt_2_3 * float_1_16)[63:32];
        meta.q_mul_kt_2_3 = 1 + result_linear_2_3 + result_square_2_3 + result_cube_2_3;
        bit<64> q_mul_kt_2_4 = (bit<64>) q_mul64_kt_2_4[63:8] | (((q_mul64_kt_2_4[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_2_4 = (q_mul_kt_2_4 * k)[47:16];
        bit<32> result_square_2_4 = (q_mul_kt_2_4 * q_mul_kt_2_4 * float_1_5)[55:24];
        bit<32> result_cube_2_4 = (q_mul_kt_2_4 * q_mul_kt_2_4 * q_mul_kt_2_4 * float_1_16)[63:32];
        meta.q_mul_kt_2_4 = 1 + result_linear_2_4 + result_square_2_4 + result_cube_2_4;
        bit<64> q_mul_kt_2_5 = (bit<64>) q_mul64_kt_2_5[63:8] | (((q_mul64_kt_2_5[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_2_5 = (q_mul_kt_2_5 * k)[47:16];
        bit<32> result_square_2_5 = (q_mul_kt_2_5 * q_mul_kt_2_5 * float_1_5)[55:24];
        bit<32> result_cube_2_5 = (q_mul_kt_2_5 * q_mul_kt_2_5 * q_mul_kt_2_5 * float_1_16)[63:32];
        meta.q_mul_kt_2_5 = 1 + result_linear_2_5 + result_square_2_5 + result_cube_2_5;
        bit<64> q_mul_kt_2_6 = (bit<64>) q_mul64_kt_2_6[63:8] | (((q_mul64_kt_2_6[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_2_6 = (q_mul_kt_2_6 * k)[47:16];
        bit<32> result_square_2_6 = (q_mul_kt_2_6 * q_mul_kt_2_6 * float_1_5)[55:24];
        bit<32> result_cube_2_6 = (q_mul_kt_2_6 * q_mul_kt_2_6 * q_mul_kt_2_6 * float_1_16)[63:32];
        meta.q_mul_kt_2_6 = 1 + result_linear_2_6 + result_square_2_6 + result_cube_2_6;
        bit<64> q_mul_kt_2_7 = (bit<64>) q_mul64_kt_2_7[63:8] | (((q_mul64_kt_2_7[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_2_7 = (q_mul_kt_2_7 * k)[47:16];
        bit<32> result_square_2_7 = (q_mul_kt_2_7 * q_mul_kt_2_7 * float_1_5)[55:24];
        bit<32> result_cube_2_7 = (q_mul_kt_2_7 * q_mul_kt_2_7 * q_mul_kt_2_7 * float_1_16)[63:32];
        meta.q_mul_kt_2_7 = 1 + result_linear_2_7 + result_square_2_7 + result_cube_2_7;
        bit<64> q_mul_kt_3_0 = (bit<64>) q_mul64_kt_3_0[63:8] | (((q_mul64_kt_3_0[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_3_0 = (q_mul_kt_3_0 * k)[47:16];
        bit<32> result_square_3_0 = (q_mul_kt_3_0 * q_mul_kt_3_0 * float_1_5)[55:24];
        bit<32> result_cube_3_0 = (q_mul_kt_3_0 * q_mul_kt_3_0 * q_mul_kt_3_0 * float_1_16)[63:32];
        meta.q_mul_kt_3_0 = 1 + result_linear_3_0 + result_square_3_0 + result_cube_3_0;
        bit<64> q_mul_kt_3_1 = (bit<64>) q_mul64_kt_3_1[63:8] | (((q_mul64_kt_3_1[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_3_1 = (q_mul_kt_3_1 * k)[47:16];
        bit<32> result_square_3_1 = (q_mul_kt_3_1 * q_mul_kt_3_1 * float_1_5)[55:24];
        bit<32> result_cube_3_1 = (q_mul_kt_3_1 * q_mul_kt_3_1 * q_mul_kt_3_1 * float_1_16)[63:32];
        meta.q_mul_kt_3_1 = 1 + result_linear_3_1 + result_square_3_1 + result_cube_3_1;
        bit<64> q_mul_kt_3_2 = (bit<64>) q_mul64_kt_3_2[63:8] | (((q_mul64_kt_3_2[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_3_2 = (q_mul_kt_3_2 * k)[47:16];
        bit<32> result_square_3_2 = (q_mul_kt_3_2 * q_mul_kt_3_2 * float_1_5)[55:24];
        bit<32> result_cube_3_2 = (q_mul_kt_3_2 * q_mul_kt_3_2 * q_mul_kt_3_2 * float_1_16)[63:32];
        meta.q_mul_kt_3_2 = 1 + result_linear_3_2 + result_square_3_2 + result_cube_3_2;
        bit<64> q_mul_kt_3_3 = (bit<64>) q_mul64_kt_3_3[63:8] | (((q_mul64_kt_3_3[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_3_3 = (q_mul_kt_3_3 * k)[47:16];
        bit<32> result_square_3_3 = (q_mul_kt_3_3 * q_mul_kt_3_3 * float_1_5)[55:24];
        bit<32> result_cube_3_3 = (q_mul_kt_3_3 * q_mul_kt_3_3 * q_mul_kt_3_3 * float_1_16)[63:32];
        meta.q_mul_kt_3_3 = 1 + result_linear_3_3 + result_square_3_3 + result_cube_3_3;
        bit<64> q_mul_kt_3_4 = (bit<64>) q_mul64_kt_3_4[63:8] | (((q_mul64_kt_3_4[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_3_4 = (q_mul_kt_3_4 * k)[47:16];
        bit<32> result_square_3_4 = (q_mul_kt_3_4 * q_mul_kt_3_4 * float_1_5)[55:24];
        bit<32> result_cube_3_4 = (q_mul_kt_3_4 * q_mul_kt_3_4 * q_mul_kt_3_4 * float_1_16)[63:32];
        meta.q_mul_kt_3_4 = 1 + result_linear_3_4 + result_square_3_4 + result_cube_3_4;
        bit<64> q_mul_kt_3_5 = (bit<64>) q_mul64_kt_3_5[63:8] | (((q_mul64_kt_3_5[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_3_5 = (q_mul_kt_3_5 * k)[47:16];
        bit<32> result_square_3_5 = (q_mul_kt_3_5 * q_mul_kt_3_5 * float_1_5)[55:24];
        bit<32> result_cube_3_5 = (q_mul_kt_3_5 * q_mul_kt_3_5 * q_mul_kt_3_5 * float_1_16)[63:32];
        meta.q_mul_kt_3_5 = 1 + result_linear_3_5 + result_square_3_5 + result_cube_3_5;
        bit<64> q_mul_kt_3_6 = (bit<64>) q_mul64_kt_3_6[63:8] | (((q_mul64_kt_3_6[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_3_6 = (q_mul_kt_3_6 * k)[47:16];
        bit<32> result_square_3_6 = (q_mul_kt_3_6 * q_mul_kt_3_6 * float_1_5)[55:24];
        bit<32> result_cube_3_6 = (q_mul_kt_3_6 * q_mul_kt_3_6 * q_mul_kt_3_6 * float_1_16)[63:32];
        meta.q_mul_kt_3_6 = 1 + result_linear_3_6 + result_square_3_6 + result_cube_3_6;
        bit<64> q_mul_kt_3_7 = (bit<64>) q_mul64_kt_3_7[63:8] | (((q_mul64_kt_3_7[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_3_7 = (q_mul_kt_3_7 * k)[47:16];
        bit<32> result_square_3_7 = (q_mul_kt_3_7 * q_mul_kt_3_7 * float_1_5)[55:24];
        bit<32> result_cube_3_7 = (q_mul_kt_3_7 * q_mul_kt_3_7 * q_mul_kt_3_7 * float_1_16)[63:32];
        meta.q_mul_kt_3_7 = 1 + result_linear_3_7 + result_square_3_7 + result_cube_3_7;
        bit<64> q_mul_kt_4_0 = (bit<64>) q_mul64_kt_4_0[63:8] | (((q_mul64_kt_4_0[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_4_0 = (q_mul_kt_4_0 * k)[47:16];
        bit<32> result_square_4_0 = (q_mul_kt_4_0 * q_mul_kt_4_0 * float_1_5)[55:24];
        bit<32> result_cube_4_0 = (q_mul_kt_4_0 * q_mul_kt_4_0 * q_mul_kt_4_0 * float_1_16)[63:32];
        meta.q_mul_kt_4_0 = 1 + result_linear_4_0 + result_square_4_0 + result_cube_4_0;
        bit<64> q_mul_kt_4_1 = (bit<64>) q_mul64_kt_4_1[63:8] | (((q_mul64_kt_4_1[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_4_1 = (q_mul_kt_4_1 * k)[47:16];
        bit<32> result_square_4_1 = (q_mul_kt_4_1 * q_mul_kt_4_1 * float_1_5)[55:24];
        bit<32> result_cube_4_1 = (q_mul_kt_4_1 * q_mul_kt_4_1 * q_mul_kt_4_1 * float_1_16)[63:32];
        meta.q_mul_kt_4_1 = 1 + result_linear_4_1 + result_square_4_1 + result_cube_4_1;
        bit<64> q_mul_kt_4_2 = (bit<64>) q_mul64_kt_4_2[63:8] | (((q_mul64_kt_4_2[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_4_2 = (q_mul_kt_4_2 * k)[47:16];
        bit<32> result_square_4_2 = (q_mul_kt_4_2 * q_mul_kt_4_2 * float_1_5)[55:24];
        bit<32> result_cube_4_2 = (q_mul_kt_4_2 * q_mul_kt_4_2 * q_mul_kt_4_2 * float_1_16)[63:32];
        meta.q_mul_kt_4_2 = 1 + result_linear_4_2 + result_square_4_2 + result_cube_4_2;
        bit<64> q_mul_kt_4_3 = (bit<64>) q_mul64_kt_4_3[63:8] | (((q_mul64_kt_4_3[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_4_3 = (q_mul_kt_4_3 * k)[47:16];
        bit<32> result_square_4_3 = (q_mul_kt_4_3 * q_mul_kt_4_3 * float_1_5)[55:24];
        bit<32> result_cube_4_3 = (q_mul_kt_4_3 * q_mul_kt_4_3 * q_mul_kt_4_3 * float_1_16)[63:32];
        meta.q_mul_kt_4_3 = 1 + result_linear_4_3 + result_square_4_3 + result_cube_4_3;
        bit<64> q_mul_kt_4_4 = (bit<64>) q_mul64_kt_4_4[63:8] | (((q_mul64_kt_4_4[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_4_4 = (q_mul_kt_4_4 * k)[47:16];
        bit<32> result_square_4_4 = (q_mul_kt_4_4 * q_mul_kt_4_4 * float_1_5)[55:24];
        bit<32> result_cube_4_4 = (q_mul_kt_4_4 * q_mul_kt_4_4 * q_mul_kt_4_4 * float_1_16)[63:32];
        meta.q_mul_kt_4_4 = 1 + result_linear_4_4 + result_square_4_4 + result_cube_4_4;
        bit<64> q_mul_kt_4_5 = (bit<64>) q_mul64_kt_4_5[63:8] | (((q_mul64_kt_4_5[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_4_5 = (q_mul_kt_4_5 * k)[47:16];
        bit<32> result_square_4_5 = (q_mul_kt_4_5 * q_mul_kt_4_5 * float_1_5)[55:24];
        bit<32> result_cube_4_5 = (q_mul_kt_4_5 * q_mul_kt_4_5 * q_mul_kt_4_5 * float_1_16)[63:32];
        meta.q_mul_kt_4_5 = 1 + result_linear_4_5 + result_square_4_5 + result_cube_4_5;
        bit<64> q_mul_kt_4_6 = (bit<64>) q_mul64_kt_4_6[63:8] | (((q_mul64_kt_4_6[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_4_6 = (q_mul_kt_4_6 * k)[47:16];
        bit<32> result_square_4_6 = (q_mul_kt_4_6 * q_mul_kt_4_6 * float_1_5)[55:24];
        bit<32> result_cube_4_6 = (q_mul_kt_4_6 * q_mul_kt_4_6 * q_mul_kt_4_6 * float_1_16)[63:32];
        meta.q_mul_kt_4_6 = 1 + result_linear_4_6 + result_square_4_6 + result_cube_4_6;
        bit<64> q_mul_kt_4_7 = (bit<64>) q_mul64_kt_4_7[63:8] | (((q_mul64_kt_4_7[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_4_7 = (q_mul_kt_4_7 * k)[47:16];
        bit<32> result_square_4_7 = (q_mul_kt_4_7 * q_mul_kt_4_7 * float_1_5)[55:24];
        bit<32> result_cube_4_7 = (q_mul_kt_4_7 * q_mul_kt_4_7 * q_mul_kt_4_7 * float_1_16)[63:32];
        meta.q_mul_kt_4_7 = 1 + result_linear_4_7 + result_square_4_7 + result_cube_4_7;
        bit<64> q_mul_kt_5_0 = (bit<64>) q_mul64_kt_5_0[63:8] | (((q_mul64_kt_5_0[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_5_0 = (q_mul_kt_5_0 * k)[47:16];
        bit<32> result_square_5_0 = (q_mul_kt_5_0 * q_mul_kt_5_0 * float_1_5)[55:24];
        bit<32> result_cube_5_0 = (q_mul_kt_5_0 * q_mul_kt_5_0 * q_mul_kt_5_0 * float_1_16)[63:32];
        meta.q_mul_kt_5_0 = 1 + result_linear_5_0 + result_square_5_0 + result_cube_5_0;
        bit<64> q_mul_kt_5_1 = (bit<64>) q_mul64_kt_5_1[63:8] | (((q_mul64_kt_5_1[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_5_1 = (q_mul_kt_5_1 * k)[47:16];
        bit<32> result_square_5_1 = (q_mul_kt_5_1 * q_mul_kt_5_1 * float_1_5)[55:24];
        bit<32> result_cube_5_1 = (q_mul_kt_5_1 * q_mul_kt_5_1 * q_mul_kt_5_1 * float_1_16)[63:32];
        meta.q_mul_kt_5_1 = 1 + result_linear_5_1 + result_square_5_1 + result_cube_5_1;
        bit<64> q_mul_kt_5_2 = (bit<64>) q_mul64_kt_5_2[63:8] | (((q_mul64_kt_5_2[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_5_2 = (q_mul_kt_5_2 * k)[47:16];
        bit<32> result_square_5_2 = (q_mul_kt_5_2 * q_mul_kt_5_2 * float_1_5)[55:24];
        bit<32> result_cube_5_2 = (q_mul_kt_5_2 * q_mul_kt_5_2 * q_mul_kt_5_2 * float_1_16)[63:32];
        meta.q_mul_kt_5_2 = 1 + result_linear_5_2 + result_square_5_2 + result_cube_5_2;
        bit<64> q_mul_kt_5_3 = (bit<64>) q_mul64_kt_5_3[63:8] | (((q_mul64_kt_5_3[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_5_3 = (q_mul_kt_5_3 * k)[47:16];
        bit<32> result_square_5_3 = (q_mul_kt_5_3 * q_mul_kt_5_3 * float_1_5)[55:24];
        bit<32> result_cube_5_3 = (q_mul_kt_5_3 * q_mul_kt_5_3 * q_mul_kt_5_3 * float_1_16)[63:32];
        meta.q_mul_kt_5_3 = 1 + result_linear_5_3 + result_square_5_3 + result_cube_5_3;
        bit<64> q_mul_kt_5_4 = (bit<64>) q_mul64_kt_5_4[63:8] | (((q_mul64_kt_5_4[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_5_4 = (q_mul_kt_5_4 * k)[47:16];
        bit<32> result_square_5_4 = (q_mul_kt_5_4 * q_mul_kt_5_4 * float_1_5)[55:24];
        bit<32> result_cube_5_4 = (q_mul_kt_5_4 * q_mul_kt_5_4 * q_mul_kt_5_4 * float_1_16)[63:32];
        meta.q_mul_kt_5_4 = 1 + result_linear_5_4 + result_square_5_4 + result_cube_5_4;
        bit<64> q_mul_kt_5_5 = (bit<64>) q_mul64_kt_5_5[63:8] | (((q_mul64_kt_5_5[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_5_5 = (q_mul_kt_5_5 * k)[47:16];
        bit<32> result_square_5_5 = (q_mul_kt_5_5 * q_mul_kt_5_5 * float_1_5)[55:24];
        bit<32> result_cube_5_5 = (q_mul_kt_5_5 * q_mul_kt_5_5 * q_mul_kt_5_5 * float_1_16)[63:32];
        meta.q_mul_kt_5_5 = 1 + result_linear_5_5 + result_square_5_5 + result_cube_5_5;
        bit<64> q_mul_kt_5_6 = (bit<64>) q_mul64_kt_5_6[63:8] | (((q_mul64_kt_5_6[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_5_6 = (q_mul_kt_5_6 * k)[47:16];
        bit<32> result_square_5_6 = (q_mul_kt_5_6 * q_mul_kt_5_6 * float_1_5)[55:24];
        bit<32> result_cube_5_6 = (q_mul_kt_5_6 * q_mul_kt_5_6 * q_mul_kt_5_6 * float_1_16)[63:32];
        meta.q_mul_kt_5_6 = 1 + result_linear_5_6 + result_square_5_6 + result_cube_5_6;
        bit<64> q_mul_kt_5_7 = (bit<64>) q_mul64_kt_5_7[63:8] | (((q_mul64_kt_5_7[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_5_7 = (q_mul_kt_5_7 * k)[47:16];
        bit<32> result_square_5_7 = (q_mul_kt_5_7 * q_mul_kt_5_7 * float_1_5)[55:24];
        bit<32> result_cube_5_7 = (q_mul_kt_5_7 * q_mul_kt_5_7 * q_mul_kt_5_7 * float_1_16)[63:32];
        meta.q_mul_kt_5_7 = 1 + result_linear_5_7 + result_square_5_7 + result_cube_5_7;
        bit<64> q_mul_kt_6_0 = (bit<64>) q_mul64_kt_6_0[63:8] | (((q_mul64_kt_6_0[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_6_0 = (q_mul_kt_6_0 * k)[47:16];
        bit<32> result_square_6_0 = (q_mul_kt_6_0 * q_mul_kt_6_0 * float_1_5)[55:24];
        bit<32> result_cube_6_0 = (q_mul_kt_6_0 * q_mul_kt_6_0 * q_mul_kt_6_0 * float_1_16)[63:32];
        meta.q_mul_kt_6_0 = 1 + result_linear_6_0 + result_square_6_0 + result_cube_6_0;
        bit<64> q_mul_kt_6_1 = (bit<64>) q_mul64_kt_6_1[63:8] | (((q_mul64_kt_6_1[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_6_1 = (q_mul_kt_6_1 * k)[47:16];
        bit<32> result_square_6_1 = (q_mul_kt_6_1 * q_mul_kt_6_1 * float_1_5)[55:24];
        bit<32> result_cube_6_1 = (q_mul_kt_6_1 * q_mul_kt_6_1 * q_mul_kt_6_1 * float_1_16)[63:32];
        meta.q_mul_kt_6_1 = 1 + result_linear_6_1 + result_square_6_1 + result_cube_6_1;
        bit<64> q_mul_kt_6_2 = (bit<64>) q_mul64_kt_6_2[63:8] | (((q_mul64_kt_6_2[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_6_2 = (q_mul_kt_6_2 * k)[47:16];
        bit<32> result_square_6_2 = (q_mul_kt_6_2 * q_mul_kt_6_2 * float_1_5)[55:24];
        bit<32> result_cube_6_2 = (q_mul_kt_6_2 * q_mul_kt_6_2 * q_mul_kt_6_2 * float_1_16)[63:32];
        meta.q_mul_kt_6_2 = 1 + result_linear_6_2 + result_square_6_2 + result_cube_6_2;
        bit<64> q_mul_kt_6_3 = (bit<64>) q_mul64_kt_6_3[63:8] | (((q_mul64_kt_6_3[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_6_3 = (q_mul_kt_6_3 * k)[47:16];
        bit<32> result_square_6_3 = (q_mul_kt_6_3 * q_mul_kt_6_3 * float_1_5)[55:24];
        bit<32> result_cube_6_3 = (q_mul_kt_6_3 * q_mul_kt_6_3 * q_mul_kt_6_3 * float_1_16)[63:32];
        meta.q_mul_kt_6_3 = 1 + result_linear_6_3 + result_square_6_3 + result_cube_6_3;
        bit<64> q_mul_kt_6_4 = (bit<64>) q_mul64_kt_6_4[63:8] | (((q_mul64_kt_6_4[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_6_4 = (q_mul_kt_6_4 * k)[47:16];
        bit<32> result_square_6_4 = (q_mul_kt_6_4 * q_mul_kt_6_4 * float_1_5)[55:24];
        bit<32> result_cube_6_4 = (q_mul_kt_6_4 * q_mul_kt_6_4 * q_mul_kt_6_4 * float_1_16)[63:32];
        meta.q_mul_kt_6_4 = 1 + result_linear_6_4 + result_square_6_4 + result_cube_6_4;
        bit<64> q_mul_kt_6_5 = (bit<64>) q_mul64_kt_6_5[63:8] | (((q_mul64_kt_6_5[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_6_5 = (q_mul_kt_6_5 * k)[47:16];
        bit<32> result_square_6_5 = (q_mul_kt_6_5 * q_mul_kt_6_5 * float_1_5)[55:24];
        bit<32> result_cube_6_5 = (q_mul_kt_6_5 * q_mul_kt_6_5 * q_mul_kt_6_5 * float_1_16)[63:32];
        meta.q_mul_kt_6_5 = 1 + result_linear_6_5 + result_square_6_5 + result_cube_6_5;
        bit<64> q_mul_kt_6_6 = (bit<64>) q_mul64_kt_6_6[63:8] | (((q_mul64_kt_6_6[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_6_6 = (q_mul_kt_6_6 * k)[47:16];
        bit<32> result_square_6_6 = (q_mul_kt_6_6 * q_mul_kt_6_6 * float_1_5)[55:24];
        bit<32> result_cube_6_6 = (q_mul_kt_6_6 * q_mul_kt_6_6 * q_mul_kt_6_6 * float_1_16)[63:32];
        meta.q_mul_kt_6_6 = 1 + result_linear_6_6 + result_square_6_6 + result_cube_6_6;
        bit<64> q_mul_kt_6_7 = (bit<64>) q_mul64_kt_6_7[63:8] | (((q_mul64_kt_6_7[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_6_7 = (q_mul_kt_6_7 * k)[47:16];
        bit<32> result_square_6_7 = (q_mul_kt_6_7 * q_mul_kt_6_7 * float_1_5)[55:24];
        bit<32> result_cube_6_7 = (q_mul_kt_6_7 * q_mul_kt_6_7 * q_mul_kt_6_7 * float_1_16)[63:32];
        meta.q_mul_kt_6_7 = 1 + result_linear_6_7 + result_square_6_7 + result_cube_6_7;
        bit<64> q_mul_kt_7_0 = (bit<64>) q_mul64_kt_7_0[63:8] | (((q_mul64_kt_7_0[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_7_0 = (q_mul_kt_7_0 * k)[47:16];
        bit<32> result_square_7_0 = (q_mul_kt_7_0 * q_mul_kt_7_0 * float_1_5)[55:24];
        bit<32> result_cube_7_0 = (q_mul_kt_7_0 * q_mul_kt_7_0 * q_mul_kt_7_0 * float_1_16)[63:32];
        meta.q_mul_kt_7_0 = 1 + result_linear_7_0 + result_square_7_0 + result_cube_7_0;
        bit<64> q_mul_kt_7_1 = (bit<64>) q_mul64_kt_7_1[63:8] | (((q_mul64_kt_7_1[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_7_1 = (q_mul_kt_7_1 * k)[47:16];
        bit<32> result_square_7_1 = (q_mul_kt_7_1 * q_mul_kt_7_1 * float_1_5)[55:24];
        bit<32> result_cube_7_1 = (q_mul_kt_7_1 * q_mul_kt_7_1 * q_mul_kt_7_1 * float_1_16)[63:32];
        meta.q_mul_kt_7_1 = 1 + result_linear_7_1 + result_square_7_1 + result_cube_7_1;
        bit<64> q_mul_kt_7_2 = (bit<64>) q_mul64_kt_7_2[63:8] | (((q_mul64_kt_7_2[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_7_2 = (q_mul_kt_7_2 * k)[47:16];
        bit<32> result_square_7_2 = (q_mul_kt_7_2 * q_mul_kt_7_2 * float_1_5)[55:24];
        bit<32> result_cube_7_2 = (q_mul_kt_7_2 * q_mul_kt_7_2 * q_mul_kt_7_2 * float_1_16)[63:32];
        meta.q_mul_kt_7_2 = 1 + result_linear_7_2 + result_square_7_2 + result_cube_7_2;
        bit<64> q_mul_kt_7_3 = (bit<64>) q_mul64_kt_7_3[63:8] | (((q_mul64_kt_7_3[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_7_3 = (q_mul_kt_7_3 * k)[47:16];
        bit<32> result_square_7_3 = (q_mul_kt_7_3 * q_mul_kt_7_3 * float_1_5)[55:24];
        bit<32> result_cube_7_3 = (q_mul_kt_7_3 * q_mul_kt_7_3 * q_mul_kt_7_3 * float_1_16)[63:32];
        meta.q_mul_kt_7_3 = 1 + result_linear_7_3 + result_square_7_3 + result_cube_7_3;
        bit<64> q_mul_kt_7_4 = (bit<64>) q_mul64_kt_7_4[63:8] | (((q_mul64_kt_7_4[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_7_4 = (q_mul_kt_7_4 * k)[47:16];
        bit<32> result_square_7_4 = (q_mul_kt_7_4 * q_mul_kt_7_4 * float_1_5)[55:24];
        bit<32> result_cube_7_4 = (q_mul_kt_7_4 * q_mul_kt_7_4 * q_mul_kt_7_4 * float_1_16)[63:32];
        meta.q_mul_kt_7_4 = 1 + result_linear_7_4 + result_square_7_4 + result_cube_7_4;
        bit<64> q_mul_kt_7_5 = (bit<64>) q_mul64_kt_7_5[63:8] | (((q_mul64_kt_7_5[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_7_5 = (q_mul_kt_7_5 * k)[47:16];
        bit<32> result_square_7_5 = (q_mul_kt_7_5 * q_mul_kt_7_5 * float_1_5)[55:24];
        bit<32> result_cube_7_5 = (q_mul_kt_7_5 * q_mul_kt_7_5 * q_mul_kt_7_5 * float_1_16)[63:32];
        meta.q_mul_kt_7_5 = 1 + result_linear_7_5 + result_square_7_5 + result_cube_7_5;
        bit<64> q_mul_kt_7_6 = (bit<64>) q_mul64_kt_7_6[63:8] | (((q_mul64_kt_7_6[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_7_6 = (q_mul_kt_7_6 * k)[47:16];
        bit<32> result_square_7_6 = (q_mul_kt_7_6 * q_mul_kt_7_6 * float_1_5)[55:24];
        bit<32> result_cube_7_6 = (q_mul_kt_7_6 * q_mul_kt_7_6 * q_mul_kt_7_6 * float_1_16)[63:32];
        meta.q_mul_kt_7_6 = 1 + result_linear_7_6 + result_square_7_6 + result_cube_7_6;
        bit<64> q_mul_kt_7_7 = (bit<64>) q_mul64_kt_7_7[63:8] | (((q_mul64_kt_7_7[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<32> result_linear_7_7 = (q_mul_kt_7_7 * k)[47:16];
        bit<32> result_square_7_7 = (q_mul_kt_7_7 * q_mul_kt_7_7 * float_1_5)[55:24];
        bit<32> result_cube_7_7 = (q_mul_kt_7_7 * q_mul_kt_7_7 * q_mul_kt_7_7 * float_1_16)[63:32];
        meta.q_mul_kt_7_7 = 1 + result_linear_7_7 + result_square_7_7 + result_cube_7_7;

                // softmax前求每一行总和
        meta.softmax_sum_0 = meta.q_mul_kt_0_0 + meta.q_mul_kt_0_1 + meta.q_mul_kt_0_2 + meta.q_mul_kt_0_3 + meta.q_mul_kt_0_4 + meta.q_mul_kt_0_5 + meta.q_mul_kt_0_6 + meta.q_mul_kt_0_7;
        meta.softmax_sum_1 = meta.q_mul_kt_1_0 + meta.q_mul_kt_1_1 + meta.q_mul_kt_1_2 + meta.q_mul_kt_1_3 + meta.q_mul_kt_1_4 + meta.q_mul_kt_1_5 + meta.q_mul_kt_1_6 + meta.q_mul_kt_1_7;
        meta.softmax_sum_2 = meta.q_mul_kt_2_0 + meta.q_mul_kt_2_1 + meta.q_mul_kt_2_2 + meta.q_mul_kt_2_3 + meta.q_mul_kt_2_4 + meta.q_mul_kt_2_5 + meta.q_mul_kt_2_6 + meta.q_mul_kt_2_7;
        meta.softmax_sum_3 = meta.q_mul_kt_3_0 + meta.q_mul_kt_3_1 + meta.q_mul_kt_3_2 + meta.q_mul_kt_3_3 + meta.q_mul_kt_3_4 + meta.q_mul_kt_3_5 + meta.q_mul_kt_3_6 + meta.q_mul_kt_3_7;
        meta.softmax_sum_4 = meta.q_mul_kt_4_0 + meta.q_mul_kt_4_1 + meta.q_mul_kt_4_2 + meta.q_mul_kt_4_3 + meta.q_mul_kt_4_4 + meta.q_mul_kt_4_5 + meta.q_mul_kt_4_6 + meta.q_mul_kt_4_7;
        meta.softmax_sum_5 = meta.q_mul_kt_5_0 + meta.q_mul_kt_5_1 + meta.q_mul_kt_5_2 + meta.q_mul_kt_5_3 + meta.q_mul_kt_5_4 + meta.q_mul_kt_5_5 + meta.q_mul_kt_5_6 + meta.q_mul_kt_5_7;
        meta.softmax_sum_6 = meta.q_mul_kt_6_0 + meta.q_mul_kt_6_1 + meta.q_mul_kt_6_2 + meta.q_mul_kt_6_3 + meta.q_mul_kt_6_4 + meta.q_mul_kt_6_5 + meta.q_mul_kt_6_6 + meta.q_mul_kt_6_7;
        meta.softmax_sum_7 = meta.q_mul_kt_7_0 + meta.q_mul_kt_7_1 + meta.q_mul_kt_7_2 + meta.q_mul_kt_7_3 + meta.q_mul_kt_7_4 + meta.q_mul_kt_7_5 + meta.q_mul_kt_7_6 + meta.q_mul_kt_7_7;
    }

    action cal_mul_v() {
bit<64> q_mul_kt_0_0 = (bit<64>) meta.q_mul_kt_0_0 | (((meta.q_mul_kt_0_0 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_0_1 = (bit<64>) meta.q_mul_kt_0_1 | (((meta.q_mul_kt_0_1 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_0_2 = (bit<64>) meta.q_mul_kt_0_2 | (((meta.q_mul_kt_0_2 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_0_3 = (bit<64>) meta.q_mul_kt_0_3 | (((meta.q_mul_kt_0_3 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_0_4 = (bit<64>) meta.q_mul_kt_0_4 | (((meta.q_mul_kt_0_4 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_0_5 = (bit<64>) meta.q_mul_kt_0_5 | (((meta.q_mul_kt_0_5 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_0_6 = (bit<64>) meta.q_mul_kt_0_6 | (((meta.q_mul_kt_0_6 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_0_7 = (bit<64>) meta.q_mul_kt_0_7 | (((meta.q_mul_kt_0_7 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_1_0 = (bit<64>) meta.q_mul_kt_1_0 | (((meta.q_mul_kt_1_0 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_1_1 = (bit<64>) meta.q_mul_kt_1_1 | (((meta.q_mul_kt_1_1 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_1_2 = (bit<64>) meta.q_mul_kt_1_2 | (((meta.q_mul_kt_1_2 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_1_3 = (bit<64>) meta.q_mul_kt_1_3 | (((meta.q_mul_kt_1_3 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_1_4 = (bit<64>) meta.q_mul_kt_1_4 | (((meta.q_mul_kt_1_4 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_1_5 = (bit<64>) meta.q_mul_kt_1_5 | (((meta.q_mul_kt_1_5 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_1_6 = (bit<64>) meta.q_mul_kt_1_6 | (((meta.q_mul_kt_1_6 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_1_7 = (bit<64>) meta.q_mul_kt_1_7 | (((meta.q_mul_kt_1_7 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_2_0 = (bit<64>) meta.q_mul_kt_2_0 | (((meta.q_mul_kt_2_0 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_2_1 = (bit<64>) meta.q_mul_kt_2_1 | (((meta.q_mul_kt_2_1 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_2_2 = (bit<64>) meta.q_mul_kt_2_2 | (((meta.q_mul_kt_2_2 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_2_3 = (bit<64>) meta.q_mul_kt_2_3 | (((meta.q_mul_kt_2_3 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_2_4 = (bit<64>) meta.q_mul_kt_2_4 | (((meta.q_mul_kt_2_4 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_2_5 = (bit<64>) meta.q_mul_kt_2_5 | (((meta.q_mul_kt_2_5 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_2_6 = (bit<64>) meta.q_mul_kt_2_6 | (((meta.q_mul_kt_2_6 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_2_7 = (bit<64>) meta.q_mul_kt_2_7 | (((meta.q_mul_kt_2_7 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_3_0 = (bit<64>) meta.q_mul_kt_3_0 | (((meta.q_mul_kt_3_0 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_3_1 = (bit<64>) meta.q_mul_kt_3_1 | (((meta.q_mul_kt_3_1 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_3_2 = (bit<64>) meta.q_mul_kt_3_2 | (((meta.q_mul_kt_3_2 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_3_3 = (bit<64>) meta.q_mul_kt_3_3 | (((meta.q_mul_kt_3_3 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_3_4 = (bit<64>) meta.q_mul_kt_3_4 | (((meta.q_mul_kt_3_4 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_3_5 = (bit<64>) meta.q_mul_kt_3_5 | (((meta.q_mul_kt_3_5 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_3_6 = (bit<64>) meta.q_mul_kt_3_6 | (((meta.q_mul_kt_3_6 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_3_7 = (bit<64>) meta.q_mul_kt_3_7 | (((meta.q_mul_kt_3_7 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_4_0 = (bit<64>) meta.q_mul_kt_4_0 | (((meta.q_mul_kt_4_0 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_4_1 = (bit<64>) meta.q_mul_kt_4_1 | (((meta.q_mul_kt_4_1 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_4_2 = (bit<64>) meta.q_mul_kt_4_2 | (((meta.q_mul_kt_4_2 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_4_3 = (bit<64>) meta.q_mul_kt_4_3 | (((meta.q_mul_kt_4_3 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_4_4 = (bit<64>) meta.q_mul_kt_4_4 | (((meta.q_mul_kt_4_4 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_4_5 = (bit<64>) meta.q_mul_kt_4_5 | (((meta.q_mul_kt_4_5 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_4_6 = (bit<64>) meta.q_mul_kt_4_6 | (((meta.q_mul_kt_4_6 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_4_7 = (bit<64>) meta.q_mul_kt_4_7 | (((meta.q_mul_kt_4_7 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_5_0 = (bit<64>) meta.q_mul_kt_5_0 | (((meta.q_mul_kt_5_0 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_5_1 = (bit<64>) meta.q_mul_kt_5_1 | (((meta.q_mul_kt_5_1 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_5_2 = (bit<64>) meta.q_mul_kt_5_2 | (((meta.q_mul_kt_5_2 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_5_3 = (bit<64>) meta.q_mul_kt_5_3 | (((meta.q_mul_kt_5_3 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_5_4 = (bit<64>) meta.q_mul_kt_5_4 | (((meta.q_mul_kt_5_4 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_5_5 = (bit<64>) meta.q_mul_kt_5_5 | (((meta.q_mul_kt_5_5 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_5_6 = (bit<64>) meta.q_mul_kt_5_6 | (((meta.q_mul_kt_5_6 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_5_7 = (bit<64>) meta.q_mul_kt_5_7 | (((meta.q_mul_kt_5_7 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_6_0 = (bit<64>) meta.q_mul_kt_6_0 | (((meta.q_mul_kt_6_0 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_6_1 = (bit<64>) meta.q_mul_kt_6_1 | (((meta.q_mul_kt_6_1 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_6_2 = (bit<64>) meta.q_mul_kt_6_2 | (((meta.q_mul_kt_6_2 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_6_3 = (bit<64>) meta.q_mul_kt_6_3 | (((meta.q_mul_kt_6_3 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_6_4 = (bit<64>) meta.q_mul_kt_6_4 | (((meta.q_mul_kt_6_4 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_6_5 = (bit<64>) meta.q_mul_kt_6_5 | (((meta.q_mul_kt_6_5 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_6_6 = (bit<64>) meta.q_mul_kt_6_6 | (((meta.q_mul_kt_6_6 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_6_7 = (bit<64>) meta.q_mul_kt_6_7 | (((meta.q_mul_kt_6_7 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_7_0 = (bit<64>) meta.q_mul_kt_7_0 | (((meta.q_mul_kt_7_0 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_7_1 = (bit<64>) meta.q_mul_kt_7_1 | (((meta.q_mul_kt_7_1 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_7_2 = (bit<64>) meta.q_mul_kt_7_2 | (((meta.q_mul_kt_7_2 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_7_3 = (bit<64>) meta.q_mul_kt_7_3 | (((meta.q_mul_kt_7_3 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_7_4 = (bit<64>) meta.q_mul_kt_7_4 | (((meta.q_mul_kt_7_4 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_7_5 = (bit<64>) meta.q_mul_kt_7_5 | (((meta.q_mul_kt_7_5 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_7_6 = (bit<64>) meta.q_mul_kt_7_6 | (((meta.q_mul_kt_7_6 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
bit<64> q_mul_kt_7_7 = (bit<64>) meta.q_mul_kt_7_7 | (((meta.q_mul_kt_7_7 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);

        bit<64> softmax_reciprocal_0 = (bit<64>) meta.softmax_reciprocal_0 | (((meta.softmax_reciprocal_0 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> softmax_reciprocal_1 = (bit<64>) meta.softmax_reciprocal_1 | (((meta.softmax_reciprocal_1 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> softmax_reciprocal_2 = (bit<64>) meta.softmax_reciprocal_2 | (((meta.softmax_reciprocal_2 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> softmax_reciprocal_3 = (bit<64>) meta.softmax_reciprocal_3 | (((meta.softmax_reciprocal_3 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> softmax_reciprocal_4 = (bit<64>) meta.softmax_reciprocal_4 | (((meta.softmax_reciprocal_4 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> softmax_reciprocal_5 = (bit<64>) meta.softmax_reciprocal_5 | (((meta.softmax_reciprocal_5 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> softmax_reciprocal_6 = (bit<64>) meta.softmax_reciprocal_6 | (((meta.softmax_reciprocal_6 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> softmax_reciprocal_7 = (bit<64>) meta.softmax_reciprocal_7 | (((meta.softmax_reciprocal_7 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);

        bit<64> softmax64_0_0 = q_mul_kt_0_0 * softmax_reciprocal_0;
        bit<64> softmax64_0_1 = q_mul_kt_0_1 * softmax_reciprocal_0;
        bit<64> softmax64_0_2 = q_mul_kt_0_2 * softmax_reciprocal_0;
        bit<64> softmax64_0_3 = q_mul_kt_0_3 * softmax_reciprocal_0;
        bit<64> softmax64_0_4 = q_mul_kt_0_4 * softmax_reciprocal_0;
        bit<64> softmax64_0_5 = q_mul_kt_0_5 * softmax_reciprocal_0;
        bit<64> softmax64_0_6 = q_mul_kt_0_6 * softmax_reciprocal_0;
        bit<64> softmax64_0_7 = q_mul_kt_0_7 * softmax_reciprocal_0;
        bit<64> softmax64_1_0 = q_mul_kt_1_0 * softmax_reciprocal_1;
        bit<64> softmax64_1_1 = q_mul_kt_1_1 * softmax_reciprocal_1;
        bit<64> softmax64_1_2 = q_mul_kt_1_2 * softmax_reciprocal_1;
        bit<64> softmax64_1_3 = q_mul_kt_1_3 * softmax_reciprocal_1;
        bit<64> softmax64_1_4 = q_mul_kt_1_4 * softmax_reciprocal_1;
        bit<64> softmax64_1_5 = q_mul_kt_1_5 * softmax_reciprocal_1;
        bit<64> softmax64_1_6 = q_mul_kt_1_6 * softmax_reciprocal_1;
        bit<64> softmax64_1_7 = q_mul_kt_1_7 * softmax_reciprocal_1;
        bit<64> softmax64_2_0 = q_mul_kt_2_0 * softmax_reciprocal_2;
        bit<64> softmax64_2_1 = q_mul_kt_2_1 * softmax_reciprocal_2;
        bit<64> softmax64_2_2 = q_mul_kt_2_2 * softmax_reciprocal_2;
        bit<64> softmax64_2_3 = q_mul_kt_2_3 * softmax_reciprocal_2;
        bit<64> softmax64_2_4 = q_mul_kt_2_4 * softmax_reciprocal_2;
        bit<64> softmax64_2_5 = q_mul_kt_2_5 * softmax_reciprocal_2;
        bit<64> softmax64_2_6 = q_mul_kt_2_6 * softmax_reciprocal_2;
        bit<64> softmax64_2_7 = q_mul_kt_2_7 * softmax_reciprocal_2;
        bit<64> softmax64_3_0 = q_mul_kt_3_0 * softmax_reciprocal_3;
        bit<64> softmax64_3_1 = q_mul_kt_3_1 * softmax_reciprocal_3;
        bit<64> softmax64_3_2 = q_mul_kt_3_2 * softmax_reciprocal_3;
        bit<64> softmax64_3_3 = q_mul_kt_3_3 * softmax_reciprocal_3;
        bit<64> softmax64_3_4 = q_mul_kt_3_4 * softmax_reciprocal_3;
        bit<64> softmax64_3_5 = q_mul_kt_3_5 * softmax_reciprocal_3;
        bit<64> softmax64_3_6 = q_mul_kt_3_6 * softmax_reciprocal_3;
        bit<64> softmax64_3_7 = q_mul_kt_3_7 * softmax_reciprocal_3;
        bit<64> softmax64_4_0 = q_mul_kt_4_0 * softmax_reciprocal_4;
        bit<64> softmax64_4_1 = q_mul_kt_4_1 * softmax_reciprocal_4;
        bit<64> softmax64_4_2 = q_mul_kt_4_2 * softmax_reciprocal_4;
        bit<64> softmax64_4_3 = q_mul_kt_4_3 * softmax_reciprocal_4;
        bit<64> softmax64_4_4 = q_mul_kt_4_4 * softmax_reciprocal_4;
        bit<64> softmax64_4_5 = q_mul_kt_4_5 * softmax_reciprocal_4;
        bit<64> softmax64_4_6 = q_mul_kt_4_6 * softmax_reciprocal_4;
        bit<64> softmax64_4_7 = q_mul_kt_4_7 * softmax_reciprocal_4;
        bit<64> softmax64_5_0 = q_mul_kt_5_0 * softmax_reciprocal_5;
        bit<64> softmax64_5_1 = q_mul_kt_5_1 * softmax_reciprocal_5;
        bit<64> softmax64_5_2 = q_mul_kt_5_2 * softmax_reciprocal_5;
        bit<64> softmax64_5_3 = q_mul_kt_5_3 * softmax_reciprocal_5;
        bit<64> softmax64_5_4 = q_mul_kt_5_4 * softmax_reciprocal_5;
        bit<64> softmax64_5_5 = q_mul_kt_5_5 * softmax_reciprocal_5;
        bit<64> softmax64_5_6 = q_mul_kt_5_6 * softmax_reciprocal_5;
        bit<64> softmax64_5_7 = q_mul_kt_5_7 * softmax_reciprocal_5;
        bit<64> softmax64_6_0 = q_mul_kt_6_0 * softmax_reciprocal_6;
        bit<64> softmax64_6_1 = q_mul_kt_6_1 * softmax_reciprocal_6;
        bit<64> softmax64_6_2 = q_mul_kt_6_2 * softmax_reciprocal_6;
        bit<64> softmax64_6_3 = q_mul_kt_6_3 * softmax_reciprocal_6;
        bit<64> softmax64_6_4 = q_mul_kt_6_4 * softmax_reciprocal_6;
        bit<64> softmax64_6_5 = q_mul_kt_6_5 * softmax_reciprocal_6;
        bit<64> softmax64_6_6 = q_mul_kt_6_6 * softmax_reciprocal_6;
        bit<64> softmax64_6_7 = q_mul_kt_6_7 * softmax_reciprocal_6;
        bit<64> softmax64_7_0 = q_mul_kt_7_0 * softmax_reciprocal_7;
        bit<64> softmax64_7_1 = q_mul_kt_7_1 * softmax_reciprocal_7;
        bit<64> softmax64_7_2 = q_mul_kt_7_2 * softmax_reciprocal_7;
        bit<64> softmax64_7_3 = q_mul_kt_7_3 * softmax_reciprocal_7;
        bit<64> softmax64_7_4 = q_mul_kt_7_4 * softmax_reciprocal_7;
        bit<64> softmax64_7_5 = q_mul_kt_7_5 * softmax_reciprocal_7;
        bit<64> softmax64_7_6 = q_mul_kt_7_6 * softmax_reciprocal_7;
        bit<64> softmax64_7_7 = q_mul_kt_7_7 * softmax_reciprocal_7;

        bit<64> softmax_0_0 = (bit<64>) softmax64_0_0[63:8] | (((softmax64_0_0[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_0_1 = (bit<64>) softmax64_0_1[63:8] | (((softmax64_0_1[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_0_2 = (bit<64>) softmax64_0_2[63:8] | (((softmax64_0_2[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_0_3 = (bit<64>) softmax64_0_3[63:8] | (((softmax64_0_3[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_0_4 = (bit<64>) softmax64_0_4[63:8] | (((softmax64_0_4[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_0_5 = (bit<64>) softmax64_0_5[63:8] | (((softmax64_0_5[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_0_6 = (bit<64>) softmax64_0_6[63:8] | (((softmax64_0_6[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_0_7 = (bit<64>) softmax64_0_7[63:8] | (((softmax64_0_7[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_1_0 = (bit<64>) softmax64_1_0[63:8] | (((softmax64_1_0[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_1_1 = (bit<64>) softmax64_1_1[63:8] | (((softmax64_1_1[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_1_2 = (bit<64>) softmax64_1_2[63:8] | (((softmax64_1_2[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_1_3 = (bit<64>) softmax64_1_3[63:8] | (((softmax64_1_3[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_1_4 = (bit<64>) softmax64_1_4[63:8] | (((softmax64_1_4[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_1_5 = (bit<64>) softmax64_1_5[63:8] | (((softmax64_1_5[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_1_6 = (bit<64>) softmax64_1_6[63:8] | (((softmax64_1_6[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_1_7 = (bit<64>) softmax64_1_7[63:8] | (((softmax64_1_7[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_2_0 = (bit<64>) softmax64_2_0[63:8] | (((softmax64_2_0[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_2_1 = (bit<64>) softmax64_2_1[63:8] | (((softmax64_2_1[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_2_2 = (bit<64>) softmax64_2_2[63:8] | (((softmax64_2_2[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_2_3 = (bit<64>) softmax64_2_3[63:8] | (((softmax64_2_3[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_2_4 = (bit<64>) softmax64_2_4[63:8] | (((softmax64_2_4[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_2_5 = (bit<64>) softmax64_2_5[63:8] | (((softmax64_2_5[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_2_6 = (bit<64>) softmax64_2_6[63:8] | (((softmax64_2_6[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_2_7 = (bit<64>) softmax64_2_7[63:8] | (((softmax64_2_7[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_3_0 = (bit<64>) softmax64_3_0[63:8] | (((softmax64_3_0[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_3_1 = (bit<64>) softmax64_3_1[63:8] | (((softmax64_3_1[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_3_2 = (bit<64>) softmax64_3_2[63:8] | (((softmax64_3_2[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_3_3 = (bit<64>) softmax64_3_3[63:8] | (((softmax64_3_3[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_3_4 = (bit<64>) softmax64_3_4[63:8] | (((softmax64_3_4[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_3_5 = (bit<64>) softmax64_3_5[63:8] | (((softmax64_3_5[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_3_6 = (bit<64>) softmax64_3_6[63:8] | (((softmax64_3_6[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_3_7 = (bit<64>) softmax64_3_7[63:8] | (((softmax64_3_7[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_4_0 = (bit<64>) softmax64_4_0[63:8] | (((softmax64_4_0[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_4_1 = (bit<64>) softmax64_4_1[63:8] | (((softmax64_4_1[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_4_2 = (bit<64>) softmax64_4_2[63:8] | (((softmax64_4_2[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_4_3 = (bit<64>) softmax64_4_3[63:8] | (((softmax64_4_3[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_4_4 = (bit<64>) softmax64_4_4[63:8] | (((softmax64_4_4[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_4_5 = (bit<64>) softmax64_4_5[63:8] | (((softmax64_4_5[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_4_6 = (bit<64>) softmax64_4_6[63:8] | (((softmax64_4_6[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_4_7 = (bit<64>) softmax64_4_7[63:8] | (((softmax64_4_7[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_5_0 = (bit<64>) softmax64_5_0[63:8] | (((softmax64_5_0[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_5_1 = (bit<64>) softmax64_5_1[63:8] | (((softmax64_5_1[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_5_2 = (bit<64>) softmax64_5_2[63:8] | (((softmax64_5_2[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_5_3 = (bit<64>) softmax64_5_3[63:8] | (((softmax64_5_3[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_5_4 = (bit<64>) softmax64_5_4[63:8] | (((softmax64_5_4[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_5_5 = (bit<64>) softmax64_5_5[63:8] | (((softmax64_5_5[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_5_6 = (bit<64>) softmax64_5_6[63:8] | (((softmax64_5_6[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_5_7 = (bit<64>) softmax64_5_7[63:8] | (((softmax64_5_7[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_6_0 = (bit<64>) softmax64_6_0[63:8] | (((softmax64_6_0[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_6_1 = (bit<64>) softmax64_6_1[63:8] | (((softmax64_6_1[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_6_2 = (bit<64>) softmax64_6_2[63:8] | (((softmax64_6_2[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_6_3 = (bit<64>) softmax64_6_3[63:8] | (((softmax64_6_3[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_6_4 = (bit<64>) softmax64_6_4[63:8] | (((softmax64_6_4[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_6_5 = (bit<64>) softmax64_6_5[63:8] | (((softmax64_6_5[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_6_6 = (bit<64>) softmax64_6_6[63:8] | (((softmax64_6_6[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_6_7 = (bit<64>) softmax64_6_7[63:8] | (((softmax64_6_7[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_7_0 = (bit<64>) softmax64_7_0[63:8] | (((softmax64_7_0[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_7_1 = (bit<64>) softmax64_7_1[63:8] | (((softmax64_7_1[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_7_2 = (bit<64>) softmax64_7_2[63:8] | (((softmax64_7_2[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_7_3 = (bit<64>) softmax64_7_3[63:8] | (((softmax64_7_3[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_7_4 = (bit<64>) softmax64_7_4[63:8] | (((softmax64_7_4[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_7_5 = (bit<64>) softmax64_7_5[63:8] | (((softmax64_7_5[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_7_6 = (bit<64>) softmax64_7_6[63:8] | (((softmax64_7_6[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);
        bit<64> softmax_7_7 = (bit<64>) softmax64_7_7[63:8] | (((softmax64_7_7[63:8] & 0x80000000000000) != 0) ? 64w0xFF00000000000000 : 0);

        softmax_value.write(0,softmax_0_0);
        softmax_value.write(1,softmax_0_1);
        softmax_value.write(2,softmax_0_2);
        softmax_value.write(3,softmax_0_3);
        softmax_value.write(4,softmax_0_4);
        softmax_value.write(5,softmax_0_5);
        softmax_value.write(6,softmax_0_6);
        softmax_value.write(7,softmax_0_7);
        softmax_value.write(8,softmax_1_0);
        softmax_value.write(9,softmax_1_1);
        softmax_value.write(10,softmax_1_2);
        softmax_value.write(11,softmax_1_3);
        softmax_value.write(12,softmax_1_4);
        softmax_value.write(13,softmax_1_5);
        softmax_value.write(14,softmax_1_6);
        softmax_value.write(15,softmax_1_7);
        softmax_value.write(16,softmax_2_0);
        softmax_value.write(17,softmax_2_1);
        softmax_value.write(18,softmax_2_2);
        softmax_value.write(19,softmax_2_3);
        softmax_value.write(20,softmax_2_4);
        softmax_value.write(21,softmax_2_5);
        softmax_value.write(22,softmax_2_6);
        softmax_value.write(23,softmax_2_7);
        softmax_value.write(24,softmax_3_0);
        softmax_value.write(25,softmax_3_1);
        softmax_value.write(26,softmax_3_2);
        softmax_value.write(27,softmax_3_3);
        softmax_value.write(28,softmax_3_4);
        softmax_value.write(29,softmax_3_5);
        softmax_value.write(30,softmax_3_6);
        softmax_value.write(31,softmax_3_7);
        softmax_value.write(32,softmax_4_0);
        softmax_value.write(33,softmax_4_1);
        softmax_value.write(34,softmax_4_2);
        softmax_value.write(35,softmax_4_3);
        softmax_value.write(36,softmax_4_4);
        softmax_value.write(37,softmax_4_5);
        softmax_value.write(38,softmax_4_6);
        softmax_value.write(39,softmax_4_7);
        softmax_value.write(40,softmax_5_0);
        softmax_value.write(41,softmax_5_1);
        softmax_value.write(42,softmax_5_2);
        softmax_value.write(43,softmax_5_3);
        softmax_value.write(44,softmax_5_4);
        softmax_value.write(45,softmax_5_5);
        softmax_value.write(46,softmax_5_6);
        softmax_value.write(47,softmax_5_7);
        softmax_value.write(48,softmax_6_0);
        softmax_value.write(49,softmax_6_1);
        softmax_value.write(50,softmax_6_2);
        softmax_value.write(51,softmax_6_3);
        softmax_value.write(52,softmax_6_4);
        softmax_value.write(53,softmax_6_5);
        softmax_value.write(54,softmax_6_6);
        softmax_value.write(55,softmax_6_7);
        softmax_value.write(56,softmax_7_0);
        softmax_value.write(57,softmax_7_1);
        softmax_value.write(58,softmax_7_2);
        softmax_value.write(59,softmax_7_3);
        softmax_value.write(60,softmax_7_4);
        softmax_value.write(61,softmax_7_5);
        softmax_value.write(62,softmax_7_6);
        softmax_value.write(63,softmax_7_7);
    }

    action operation_send(){

        bit<64> softmax_0_0;
        bit<64> softmax_0_1;
        bit<64> softmax_0_2;
        bit<64> softmax_0_3;
        bit<64> softmax_0_4;
        bit<64> softmax_0_5;
        bit<64> softmax_0_6;
        bit<64> softmax_0_7;
        bit<64> softmax_1_0;
        bit<64> softmax_1_1;
        bit<64> softmax_1_2;
        bit<64> softmax_1_3;
        bit<64> softmax_1_4;
        bit<64> softmax_1_5;
        bit<64> softmax_1_6;
        bit<64> softmax_1_7;
        bit<64> softmax_2_0;
        bit<64> softmax_2_1;
        bit<64> softmax_2_2;
        bit<64> softmax_2_3;
        bit<64> softmax_2_4;
        bit<64> softmax_2_5;
        bit<64> softmax_2_6;
        bit<64> softmax_2_7;
        bit<64> softmax_3_0;
        bit<64> softmax_3_1;
        bit<64> softmax_3_2;
        bit<64> softmax_3_3;
        bit<64> softmax_3_4;
        bit<64> softmax_3_5;
        bit<64> softmax_3_6;
        bit<64> softmax_3_7;
        bit<64> softmax_4_0;
        bit<64> softmax_4_1;
        bit<64> softmax_4_2;
        bit<64> softmax_4_3;
        bit<64> softmax_4_4;
        bit<64> softmax_4_5;
        bit<64> softmax_4_6;
        bit<64> softmax_4_7;
        bit<64> softmax_5_0;
        bit<64> softmax_5_1;
        bit<64> softmax_5_2;
        bit<64> softmax_5_3;
        bit<64> softmax_5_4;
        bit<64> softmax_5_5;
        bit<64> softmax_5_6;
        bit<64> softmax_5_7;
        bit<64> softmax_6_0;
        bit<64> softmax_6_1;
        bit<64> softmax_6_2;
        bit<64> softmax_6_3;
        bit<64> softmax_6_4;
        bit<64> softmax_6_5;
        bit<64> softmax_6_6;
        bit<64> softmax_6_7;
        bit<64> softmax_7_0;
        bit<64> softmax_7_1;
        bit<64> softmax_7_2;
        bit<64> softmax_7_3;
        bit<64> softmax_7_4;
        bit<64> softmax_7_5;
        bit<64> softmax_7_6;
        bit<64> softmax_7_7;

        bit<64> v_0_0;
        bit<64> v_0_1;
        bit<64> v_0_2;
        bit<64> v_1_0;
        bit<64> v_1_1;
        bit<64> v_1_2;
        bit<64> v_2_0;
        bit<64> v_2_1;
        bit<64> v_2_2;
        bit<64> v_3_0;
        bit<64> v_3_1;
        bit<64> v_3_2;
        bit<64> v_4_0;
        bit<64> v_4_1;
        bit<64> v_4_2;
        bit<64> v_5_0;
        bit<64> v_5_1;
        bit<64> v_5_2;
        bit<64> v_6_0;
        bit<64> v_6_1;
        bit<64> v_6_2;
        bit<64> v_7_0;
        bit<64> v_7_1;
        bit<64> v_7_2;

        softmax_value.read(softmax_0_0 , 0);
        softmax_value.read(softmax_0_1 , 1);
        softmax_value.read(softmax_0_2 , 2);
        softmax_value.read(softmax_0_3 , 3);
        softmax_value.read(softmax_0_4 , 4);
        softmax_value.read(softmax_0_5 , 5);
        softmax_value.read(softmax_0_6 , 6);
        softmax_value.read(softmax_0_7 , 7);
        softmax_value.read(softmax_1_0 , 8);
        softmax_value.read(softmax_1_1 , 9);
        softmax_value.read(softmax_1_2 , 10);
        softmax_value.read(softmax_1_3 , 11);
        softmax_value.read(softmax_1_4 , 12);
        softmax_value.read(softmax_1_5 , 13);
        softmax_value.read(softmax_1_6 , 14);
        softmax_value.read(softmax_1_7 , 15);
        softmax_value.read(softmax_2_0 , 16);
        softmax_value.read(softmax_2_1 , 17);
        softmax_value.read(softmax_2_2 , 18);
        softmax_value.read(softmax_2_3 , 19);
        softmax_value.read(softmax_2_4 , 20);
        softmax_value.read(softmax_2_5 , 21);
        softmax_value.read(softmax_2_6 , 22);
        softmax_value.read(softmax_2_7 , 23);
        softmax_value.read(softmax_3_0 , 24);
        softmax_value.read(softmax_3_1 , 25);
        softmax_value.read(softmax_3_2 , 26);
        softmax_value.read(softmax_3_3 , 27);
        softmax_value.read(softmax_3_4 , 28);
        softmax_value.read(softmax_3_5 , 29);
        softmax_value.read(softmax_3_6 , 30);
        softmax_value.read(softmax_3_7 , 31);
        softmax_value.read(softmax_4_0 , 32);
        softmax_value.read(softmax_4_1 , 33);
        softmax_value.read(softmax_4_2 , 34);
        softmax_value.read(softmax_4_3 , 35);
        softmax_value.read(softmax_4_4 , 36);
        softmax_value.read(softmax_4_5 , 37);
        softmax_value.read(softmax_4_6 , 38);
        softmax_value.read(softmax_4_7 , 39);
        softmax_value.read(softmax_5_0 , 40);
        softmax_value.read(softmax_5_1 , 41);
        softmax_value.read(softmax_5_2 , 42);
        softmax_value.read(softmax_5_3 , 43);
        softmax_value.read(softmax_5_4 , 44);
        softmax_value.read(softmax_5_5 , 45);
        softmax_value.read(softmax_5_6 , 46);
        softmax_value.read(softmax_5_7 , 47);
        softmax_value.read(softmax_6_0 , 48);
        softmax_value.read(softmax_6_1 , 49);
        softmax_value.read(softmax_6_2 , 50);
        softmax_value.read(softmax_6_3 , 51);
        softmax_value.read(softmax_6_4 , 52);
        softmax_value.read(softmax_6_5 , 53);
        softmax_value.read(softmax_6_6 , 54);
        softmax_value.read(softmax_6_7 , 55);
        softmax_value.read(softmax_7_0 , 56);
        softmax_value.read(softmax_7_1 , 57);
        softmax_value.read(softmax_7_2 , 58);
        softmax_value.read(softmax_7_3 , 59);
        softmax_value.read(softmax_7_4 , 60);
        softmax_value.read(softmax_7_5 , 61);
        softmax_value.read(softmax_7_6 , 62);
        softmax_value.read(softmax_7_7 , 63);

        v_value.read(v_0_0, 0);
        v_value.read(v_0_1, 1);
        v_value.read(v_0_2, 2);
        v_value.read(v_1_0, 3);
        v_value.read(v_1_1, 4);
        v_value.read(v_1_2, 5);
        v_value.read(v_2_0, 6);
        v_value.read(v_2_1, 7);
        v_value.read(v_2_2, 8);
        v_value.read(v_3_0, 9);
        v_value.read(v_3_1, 10);
        v_value.read(v_3_2, 11);
        v_value.read(v_4_0, 12);
        v_value.read(v_4_1, 13);
        v_value.read(v_4_2, 14);
        v_value.read(v_5_0, 15);
        v_value.read(v_5_1, 16);
        v_value.read(v_5_2, 17);
        v_value.read(v_6_0, 18);
        v_value.read(v_6_1, 19);
        v_value.read(v_6_2, 20);
        v_value.read(v_7_0, 21);
        v_value.read(v_7_1, 22);
        v_value.read(v_7_2, 23);



        
        hdr.s1_output0_calc.s1_output_0_0 = (softmax_0_0 * v_0_0 + softmax_0_1 * v_1_0 + softmax_0_2 * v_2_0 + softmax_0_3 * v_3_0 + softmax_0_4 * v_4_0 + softmax_0_5 * v_5_0 + softmax_0_6 * v_6_0 + softmax_0_7 * v_7_0)[39:8];
        hdr.s1_output0_calc.s1_output_0_1 = (softmax_0_0 * v_0_1 + softmax_0_1 * v_1_1 + softmax_0_2 * v_2_1 + softmax_0_3 * v_3_1 + softmax_0_4 * v_4_1 + softmax_0_5 * v_5_1 + softmax_0_6 * v_6_1 + softmax_0_7 * v_7_1)[39:8];
        hdr.s1_output0_calc.s1_output_0_2 = (softmax_0_0 * v_0_2 + softmax_0_1 * v_1_2 + softmax_0_2 * v_2_2 + softmax_0_3 * v_3_2 + softmax_0_4 * v_4_2 + softmax_0_5 * v_5_2 + softmax_0_6 * v_6_2 + softmax_0_7 * v_7_2)[39:8];
        hdr.s1_output0_calc.s1_output_1_0 = (softmax_1_0 * v_0_0 + softmax_1_1 * v_1_0 + softmax_1_2 * v_2_0 + softmax_1_3 * v_3_0 + softmax_1_4 * v_4_0 + softmax_1_5 * v_5_0 + softmax_1_6 * v_6_0 + softmax_1_7 * v_7_0)[39:8];
        hdr.s1_output0_calc.s1_output_1_1 = (softmax_1_0 * v_0_1 + softmax_1_1 * v_1_1 + softmax_1_2 * v_2_1 + softmax_1_3 * v_3_1 + softmax_1_4 * v_4_1 + softmax_1_5 * v_5_1 + softmax_1_6 * v_6_1 + softmax_1_7 * v_7_1)[39:8];
        hdr.s1_output0_calc.s1_output_1_2 = (softmax_1_0 * v_0_2 + softmax_1_1 * v_1_2 + softmax_1_2 * v_2_2 + softmax_1_3 * v_3_2 + softmax_1_4 * v_4_2 + softmax_1_5 * v_5_2 + softmax_1_6 * v_6_2 + softmax_1_7 * v_7_2)[39:8];
        hdr.s1_output0_calc.s1_output_2_0 = (softmax_2_0 * v_0_0 + softmax_2_1 * v_1_0 + softmax_2_2 * v_2_0 + softmax_2_3 * v_3_0 + softmax_2_4 * v_4_0 + softmax_2_5 * v_5_0 + softmax_2_6 * v_6_0 + softmax_2_7 * v_7_0)[39:8];
        hdr.s1_output0_calc.s1_output_2_1 = (softmax_2_0 * v_0_1 + softmax_2_1 * v_1_1 + softmax_2_2 * v_2_1 + softmax_2_3 * v_3_1 + softmax_2_4 * v_4_1 + softmax_2_5 * v_5_1 + softmax_2_6 * v_6_1 + softmax_2_7 * v_7_1)[39:8];
        hdr.s1_output0_calc.s1_output_2_2 = (softmax_2_0 * v_0_2 + softmax_2_1 * v_1_2 + softmax_2_2 * v_2_2 + softmax_2_3 * v_3_2 + softmax_2_4 * v_4_2 + softmax_2_5 * v_5_2 + softmax_2_6 * v_6_2 + softmax_2_7 * v_7_2)[39:8];
        hdr.s1_output0_calc.s1_output_3_0 = (softmax_3_0 * v_0_0 + softmax_3_1 * v_1_0 + softmax_3_2 * v_2_0 + softmax_3_3 * v_3_0 + softmax_3_4 * v_4_0 + softmax_3_5 * v_5_0 + softmax_3_6 * v_6_0 + softmax_3_7 * v_7_0)[39:8];
        hdr.s1_output0_calc.s1_output_3_1 = (softmax_3_0 * v_0_1 + softmax_3_1 * v_1_1 + softmax_3_2 * v_2_1 + softmax_3_3 * v_3_1 + softmax_3_4 * v_4_1 + softmax_3_5 * v_5_1 + softmax_3_6 * v_6_1 + softmax_3_7 * v_7_1)[39:8];
        hdr.s1_output0_calc.s1_output_3_2 = (softmax_3_0 * v_0_2 + softmax_3_1 * v_1_2 + softmax_3_2 * v_2_2 + softmax_3_3 * v_3_2 + softmax_3_4 * v_4_2 + softmax_3_5 * v_5_2 + softmax_3_6 * v_6_2 + softmax_3_7 * v_7_2)[39:8];
        hdr.s1_output0_calc.s1_output_4_0 = (softmax_4_0 * v_0_0 + softmax_4_1 * v_1_0 + softmax_4_2 * v_2_0 + softmax_4_3 * v_3_0 + softmax_4_4 * v_4_0 + softmax_4_5 * v_5_0 + softmax_4_6 * v_6_0 + softmax_4_7 * v_7_0)[39:8];
        hdr.s1_output0_calc.s1_output_4_1 = (softmax_4_0 * v_0_1 + softmax_4_1 * v_1_1 + softmax_4_2 * v_2_1 + softmax_4_3 * v_3_1 + softmax_4_4 * v_4_1 + softmax_4_5 * v_5_1 + softmax_4_6 * v_6_1 + softmax_4_7 * v_7_1)[39:8];
        hdr.s1_output0_calc.s1_output_4_2 = (softmax_4_0 * v_0_2 + softmax_4_1 * v_1_2 + softmax_4_2 * v_2_2 + softmax_4_3 * v_3_2 + softmax_4_4 * v_4_2 + softmax_4_5 * v_5_2 + softmax_4_6 * v_6_2 + softmax_4_7 * v_7_2)[39:8];
        hdr.s1_output0_calc.s1_output_5_0 = (softmax_5_0 * v_0_0 + softmax_5_1 * v_1_0 + softmax_5_2 * v_2_0 + softmax_5_3 * v_3_0 + softmax_5_4 * v_4_0 + softmax_5_5 * v_5_0 + softmax_5_6 * v_6_0 + softmax_5_7 * v_7_0)[39:8];
        hdr.s1_output0_calc.s1_output_5_1 = (softmax_5_0 * v_0_1 + softmax_5_1 * v_1_1 + softmax_5_2 * v_2_1 + softmax_5_3 * v_3_1 + softmax_5_4 * v_4_1 + softmax_5_5 * v_5_1 + softmax_5_6 * v_6_1 + softmax_5_7 * v_7_1)[39:8];
        hdr.s1_output0_calc.s1_output_5_2 = (softmax_5_0 * v_0_2 + softmax_5_1 * v_1_2 + softmax_5_2 * v_2_2 + softmax_5_3 * v_3_2 + softmax_5_4 * v_4_2 + softmax_5_5 * v_5_2 + softmax_5_6 * v_6_2 + softmax_5_7 * v_7_2)[39:8];
        hdr.s1_output0_calc.s1_output_6_0 = (softmax_6_0 * v_0_0 + softmax_6_1 * v_1_0 + softmax_6_2 * v_2_0 + softmax_6_3 * v_3_0 + softmax_6_4 * v_4_0 + softmax_6_5 * v_5_0 + softmax_6_6 * v_6_0 + softmax_6_7 * v_7_0)[39:8];
        hdr.s1_output0_calc.s1_output_6_1 = (softmax_6_0 * v_0_1 + softmax_6_1 * v_1_1 + softmax_6_2 * v_2_1 + softmax_6_3 * v_3_1 + softmax_6_4 * v_4_1 + softmax_6_5 * v_5_1 + softmax_6_6 * v_6_1 + softmax_6_7 * v_7_1)[39:8];
        hdr.s1_output0_calc.s1_output_6_2 = (softmax_6_0 * v_0_2 + softmax_6_1 * v_1_2 + softmax_6_2 * v_2_2 + softmax_6_3 * v_3_2 + softmax_6_4 * v_4_2 + softmax_6_5 * v_5_2 + softmax_6_6 * v_6_2 + softmax_6_7 * v_7_2)[39:8];
        hdr.s1_output0_calc.s1_output_7_0 = (softmax_7_0 * v_0_0 + softmax_7_1 * v_1_0 + softmax_7_2 * v_2_0 + softmax_7_3 * v_3_0 + softmax_7_4 * v_4_0 + softmax_7_5 * v_5_0 + softmax_7_6 * v_6_0 + softmax_7_7 * v_7_0)[39:8];
        hdr.s1_output0_calc.s1_output_7_1 = (softmax_7_0 * v_0_1 + softmax_7_1 * v_1_1 + softmax_7_2 * v_2_1 + softmax_7_3 * v_3_1 + softmax_7_4 * v_4_1 + softmax_7_5 * v_5_1 + softmax_7_6 * v_6_1 + softmax_7_7 * v_7_1)[39:8];
        hdr.s1_output0_calc.s1_output_7_2 = (softmax_7_0 * v_0_2 + softmax_7_1 * v_1_2 + softmax_7_2 * v_2_2 + softmax_7_3 * v_3_2 + softmax_7_4 * v_4_2 + softmax_7_5 * v_5_2 + softmax_7_6 * v_6_2 + softmax_7_7 * v_7_2)[39:8];
                
        hdr.s1_output0_calc.s1_output_0_3 = 0;
        hdr.s1_output0_calc.s1_output_0_4 = 0;
        hdr.s1_output0_calc.s1_output_0_5 = 0;
        hdr.s1_output0_calc.s1_output_1_3 = 0;
        hdr.s1_output0_calc.s1_output_1_4 = 0;
        hdr.s1_output0_calc.s1_output_1_5 = 0;
        hdr.s1_output0_calc.s1_output_2_3 = 0;
        hdr.s1_output0_calc.s1_output_2_4 = 0;
        hdr.s1_output0_calc.s1_output_2_5 = 0;
        hdr.s1_output0_calc.s1_output_3_3 = 0;
        hdr.s1_output0_calc.s1_output_3_4 = 0;
        hdr.s1_output0_calc.s1_output_3_5 = 0;
        hdr.s1_output0_calc.s1_output_4_3 = 0;
        hdr.s1_output0_calc.s1_output_4_4 = 0;
        hdr.s1_output0_calc.s1_output_4_5 = 0;
        hdr.s1_output0_calc.s1_output_5_3 = 0;
        hdr.s1_output0_calc.s1_output_5_4 = 0;
        hdr.s1_output0_calc.s1_output_5_5 = 0;
        hdr.s1_output0_calc.s1_output_6_3 = 0;
        hdr.s1_output0_calc.s1_output_6_4 = 0;
        hdr.s1_output0_calc.s1_output_6_5 = 0;
        hdr.s1_output0_calc.s1_output_7_3 = 0;
        hdr.s1_output0_calc.s1_output_7_4 = 0;
        hdr.s1_output0_calc.s1_output_7_5 = 0;
       
        hdr.p4calc.s1_replication = replication;
        standard_metadata.egress_spec = 2;
    }

    // 丢弃
    action operation_drop() {
        mark_to_drop(standard_metadata);
    }

    // 下面8个表求倒数
    action operation_cal_softmax_sum_reciprocal_0(bit<32> softmax_reciprocal_0) {
        meta.softmax_reciprocal_0 = softmax_reciprocal_0;
    }

    table table_softmax_sum_reciprocal_0 {
        key = {
            meta.softmax_sum_0 : ternary; 
        }
        actions = {
            operation_drop;
            operation_cal_softmax_sum_reciprocal_0;
        }
        default_action = operation_drop();
        size = 256;
    }

    action operation_cal_softmax_sum_reciprocal_1(bit<32> softmax_reciprocal_1) {
        meta.softmax_reciprocal_1 = softmax_reciprocal_1;
    }

    table table_softmax_sum_reciprocal_1 {
        key = {
            meta.softmax_sum_1 : ternary; 
        }
        actions = {
            operation_drop;
            operation_cal_softmax_sum_reciprocal_1;
        }
        default_action = operation_drop();
        size = 256;
    }

    action operation_cal_softmax_sum_reciprocal_2(bit<32> softmax_reciprocal_2) {
        meta.softmax_reciprocal_2 = softmax_reciprocal_2;
    }

    table table_softmax_sum_reciprocal_2 {
        key = {
            meta.softmax_sum_2 : ternary; 
        }
        actions = {
            operation_drop;
            operation_cal_softmax_sum_reciprocal_2;
        }
        default_action = operation_drop();
        size = 256;
    }

    action operation_cal_softmax_sum_reciprocal_3(bit<32> softmax_reciprocal_3) {
        meta.softmax_reciprocal_3 = softmax_reciprocal_3;
    }

    table table_softmax_sum_reciprocal_3 {
        key = {
            meta.softmax_sum_3 : ternary; 
        }
        actions = {
            operation_drop;
            operation_cal_softmax_sum_reciprocal_3;
        }
        default_action = operation_drop();
        size = 256;
    }

    action operation_cal_softmax_sum_reciprocal_4(bit<32> softmax_reciprocal_4) {
        meta.softmax_reciprocal_4 = softmax_reciprocal_4;
    }

    table table_softmax_sum_reciprocal_4 {
        key = {
            meta.softmax_sum_4 : ternary; 
        }
        actions = {
            operation_drop;
            operation_cal_softmax_sum_reciprocal_4;
        }
        default_action = operation_drop();
        size = 256;
    }

    action operation_cal_softmax_sum_reciprocal_5(bit<32> softmax_reciprocal_5) {
        meta.softmax_reciprocal_5 = softmax_reciprocal_5;
    }

    table table_softmax_sum_reciprocal_5 {
        key = {
            meta.softmax_sum_5 : ternary; 
        }
        actions = {
            operation_drop;
            operation_cal_softmax_sum_reciprocal_5;
        }
        default_action = operation_drop();
        size = 256;
    }

    action operation_cal_softmax_sum_reciprocal_6(bit<32> softmax_reciprocal_6) {
        meta.softmax_reciprocal_6 = softmax_reciprocal_6;
    }

    table table_softmax_sum_reciprocal_6 {
        key = {
            meta.softmax_sum_6 : ternary; 
        }
        actions = {
            operation_drop;
            operation_cal_softmax_sum_reciprocal_6;
        }
        default_action = operation_drop();
        size = 256;
    }

    action operation_cal_softmax_sum_reciprocal_7(bit<32> softmax_reciprocal_7) {
        meta.softmax_reciprocal_7 = softmax_reciprocal_7;
    }

    table table_softmax_sum_reciprocal_7 {
        key = {
            meta.softmax_sum_7 : ternary; 
        }
        actions = {
            operation_drop;
            operation_cal_softmax_sum_reciprocal_7;
        }
        default_action = operation_drop();
        size = 256;
    }

    apply {
        if (hdr.p4calc.isValid()) {
            calc_qk();
            cal_softmax();
            table_softmax_sum_reciprocal_0.apply();
            table_softmax_sum_reciprocal_1.apply();
            table_softmax_sum_reciprocal_2.apply();
            table_softmax_sum_reciprocal_3.apply();
            table_softmax_sum_reciprocal_4.apply();
            table_softmax_sum_reciprocal_5.apply();
            table_softmax_sum_reciprocal_6.apply();
            table_softmax_sum_reciprocal_7.apply();

            cal_mul_v();
            operation_send();
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