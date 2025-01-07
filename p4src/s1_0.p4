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

const bit<32> wq_0_0 = 0x4762e07f;
const bit<32> wq_0_1 = 0xd8643a16;
const bit<32> wq_0_2 = 0x5cb96c69;
const bit<32> wq_1_0 = 0xf9c8c95f;
const bit<32> wq_1_1 = 0x6d62ca8c;
const bit<32> wq_1_2 = 0x60cdcf18;
const bit<32> wq_2_0 = 0x52a30dc7;
const bit<32> wq_2_1 = 0x62c06b3;
const bit<32> wq_2_2 = 0x307e6a6e;

const bit<32> wk_0_0 = 0x5b697207;
const bit<32> wk_0_1 = 0xb11eab1c;
const bit<32> wk_0_2 = 0xd9e29730;
const bit<32> wk_1_0 = 0x454f9af3;
const bit<32> wk_1_1 = 0xbcd13fa3;
const bit<32> wk_1_2 = 0xa6e02a84;
const bit<32> wk_2_0 = 0x867ebfc8;
const bit<32> wk_2_1 = 0xa666ae3c;
const bit<32> wk_2_2 = 0xdaad9280;

const bit<32> wv_0_0 = 0x9964546f;
const bit<32> wv_0_1 = 0xa050299f;
const bit<32> wv_0_2 = 0xa4ff3e8f;
const bit<32> wv_1_0 = 0x14fe80e8;
const bit<32> wv_1_1 = 0x531ff9cd;
const bit<32> wv_1_2 = 0x2a6deb77;
const bit<32> wv_2_0 = 0xe68b01ca;
const bit<32> wv_2_1 = 0x491aa9c0;
const bit<32> wv_2_2 = 0xc918caa0;

const bit<32> replication = 0x00;

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
    
    bit<32> v_0_0;
    bit<32> v_0_1;
    bit<32> v_0_2;
    bit<32> v_1_0;
    bit<32> v_1_1;
    bit<32> v_1_2;
    bit<32> v_2_0;
    bit<32> v_2_1;
    bit<32> v_2_2;
    bit<32> v_3_0;
    bit<32> v_3_1;
    bit<32> v_3_2;
    bit<32> v_4_0;
    bit<32> v_4_1;
    bit<32> v_4_2;
    bit<32> v_5_0;
    bit<32> v_5_1;
    bit<32> v_5_2;
    bit<32> v_6_0;
    bit<32> v_6_1;
    bit<32> v_6_2;
    bit<32> v_7_0;
    bit<32> v_7_1;
    bit<32> v_7_2;
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
    //register<bit<32>>(96) q;
    //register<bit<32>>(96) k;
    //register<bit<32>>(96) v;

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
        

        //计算q
        bit<32> q_0_0 = x_0_0 * wq_0_0 + x_0_1 * wq_1_0 + x_0_2 * wq_2_0;
        bit<32> q_0_1 = x_0_0 * wq_0_1 + x_0_1 * wq_1_1 + x_0_2 * wq_2_1;
        bit<32> q_0_2 = x_0_0 * wq_0_2 + x_0_1 * wq_1_2 + x_0_2 * wq_2_2;
        bit<32> q_1_0 = x_1_0 * wq_0_0 + x_1_1 * wq_1_0 + x_1_2 * wq_2_0;
        bit<32> q_1_1 = x_1_0 * wq_0_1 + x_1_1 * wq_1_1 + x_1_2 * wq_2_1;
        bit<32> q_1_2 = x_1_0 * wq_0_2 + x_1_1 * wq_1_2 + x_1_2 * wq_2_2;
        bit<32> q_2_0 = x_2_0 * wq_0_0 + x_2_1 * wq_1_0 + x_2_2 * wq_2_0;
        bit<32> q_2_1 = x_2_0 * wq_0_1 + x_2_1 * wq_1_1 + x_2_2 * wq_2_1;
        bit<32> q_2_2 = x_2_0 * wq_0_2 + x_2_1 * wq_1_2 + x_2_2 * wq_2_2;
        bit<32> q_3_0 = x_3_0 * wq_0_0 + x_3_1 * wq_1_0 + x_3_2 * wq_2_0;
        bit<32> q_3_1 = x_3_0 * wq_0_1 + x_3_1 * wq_1_1 + x_3_2 * wq_2_1;
        bit<32> q_3_2 = x_3_0 * wq_0_2 + x_3_1 * wq_1_2 + x_3_2 * wq_2_2;
        bit<32> q_4_0 = x_4_0 * wq_0_0 + x_4_1 * wq_1_0 + x_4_2 * wq_2_0;
        bit<32> q_4_1 = x_4_0 * wq_0_1 + x_4_1 * wq_1_1 + x_4_2 * wq_2_1;
        bit<32> q_4_2 = x_4_0 * wq_0_2 + x_4_1 * wq_1_2 + x_4_2 * wq_2_2;
        bit<32> q_5_0 = x_5_0 * wq_0_0 + x_5_1 * wq_1_0 + x_5_2 * wq_2_0;
        bit<32> q_5_1 = x_5_0 * wq_0_1 + x_5_1 * wq_1_1 + x_5_2 * wq_2_1;
        bit<32> q_5_2 = x_5_0 * wq_0_2 + x_5_1 * wq_1_2 + x_5_2 * wq_2_2;
        bit<32> q_6_0 = x_6_0 * wq_0_0 + x_6_1 * wq_1_0 + x_6_2 * wq_2_0;
        bit<32> q_6_1 = x_6_0 * wq_0_1 + x_6_1 * wq_1_1 + x_6_2 * wq_2_1;
        bit<32> q_6_2 = x_6_0 * wq_0_2 + x_6_1 * wq_1_2 + x_6_2 * wq_2_2;
        bit<32> q_7_0 = x_7_0 * wq_0_0 + x_7_1 * wq_1_0 + x_7_2 * wq_2_0;
        bit<32> q_7_1 = x_7_0 * wq_0_1 + x_7_1 * wq_1_1 + x_7_2 * wq_2_1;
        bit<32> q_7_2 = x_7_0 * wq_0_2 + x_7_1 * wq_1_2 + x_7_2 * wq_2_2;

        // 计算k
        bit<32> k_0_0 = x_0_0 * wk_0_0 + x_0_1 * wk_1_0 + x_0_2 * wk_2_0;
        bit<32> k_0_1 = x_0_0 * wk_0_1 + x_0_1 * wk_1_1 + x_0_2 * wk_2_1;
        bit<32> k_0_2 = x_0_0 * wk_0_2 + x_0_1 * wk_1_2 + x_0_2 * wk_2_2;
        bit<32> k_1_0 = x_1_0 * wk_0_0 + x_1_1 * wk_1_0 + x_1_2 * wk_2_0;
        bit<32> k_1_1 = x_1_0 * wk_0_1 + x_1_1 * wk_1_1 + x_1_2 * wk_2_1;
        bit<32> k_1_2 = x_1_0 * wk_0_2 + x_1_1 * wk_1_2 + x_1_2 * wk_2_2;
        bit<32> k_2_0 = x_2_0 * wk_0_0 + x_2_1 * wk_1_0 + x_2_2 * wk_2_0;
        bit<32> k_2_1 = x_2_0 * wk_0_1 + x_2_1 * wk_1_1 + x_2_2 * wk_2_1;
        bit<32> k_2_2 = x_2_0 * wk_0_2 + x_2_1 * wk_1_2 + x_2_2 * wk_2_2;
        bit<32> k_3_0 = x_3_0 * wk_0_0 + x_3_1 * wk_1_0 + x_3_2 * wk_2_0;
        bit<32> k_3_1 = x_3_0 * wk_0_1 + x_3_1 * wk_1_1 + x_3_2 * wk_2_1;
        bit<32> k_3_2 = x_3_0 * wk_0_2 + x_3_1 * wk_1_2 + x_3_2 * wk_2_2;
        bit<32> k_4_0 = x_4_0 * wk_0_0 + x_4_1 * wk_1_0 + x_4_2 * wk_2_0;
        bit<32> k_4_1 = x_4_0 * wk_0_1 + x_4_1 * wk_1_1 + x_4_2 * wk_2_1;
        bit<32> k_4_2 = x_4_0 * wk_0_2 + x_4_1 * wk_1_2 + x_4_2 * wk_2_2;
        bit<32> k_5_0 = x_5_0 * wk_0_0 + x_5_1 * wk_1_0 + x_5_2 * wk_2_0;
        bit<32> k_5_1 = x_5_0 * wk_0_1 + x_5_1 * wk_1_1 + x_5_2 * wk_2_1;
        bit<32> k_5_2 = x_5_0 * wk_0_2 + x_5_1 * wk_1_2 + x_5_2 * wk_2_2;
        bit<32> k_6_0 = x_6_0 * wk_0_0 + x_6_1 * wk_1_0 + x_6_2 * wk_2_0;
        bit<32> k_6_1 = x_6_0 * wk_0_1 + x_6_1 * wk_1_1 + x_6_2 * wk_2_1;
        bit<32> k_6_2 = x_6_0 * wk_0_2 + x_6_1 * wk_1_2 + x_6_2 * wk_2_2;
        bit<32> k_7_0 = x_7_0 * wk_0_0 + x_7_1 * wk_1_0 + x_7_2 * wk_2_0;
        bit<32> k_7_1 = x_7_0 * wk_0_1 + x_7_1 * wk_1_1 + x_7_2 * wk_2_1;
        bit<32> k_7_2 = x_7_0 * wk_0_2 + x_7_1 * wk_1_2 + x_7_2 * wk_2_2;
        
        // 计算v
        meta.v_0_0 = x_0_0 * wv_0_0 + x_0_1 * wv_1_0 + x_0_2 * wv_2_0;
        meta.v_0_1 = x_0_0 * wv_0_1 + x_0_1 * wv_1_1 + x_0_2 * wv_2_1;
        meta.v_0_2 = x_0_0 * wv_0_2 + x_0_1 * wv_1_2 + x_0_2 * wv_2_2;
        meta.v_1_0 = x_1_0 * wv_0_0 + x_1_1 * wv_1_0 + x_1_2 * wv_2_0;
        meta.v_1_1 = x_1_0 * wv_0_1 + x_1_1 * wv_1_1 + x_1_2 * wv_2_1;
        meta.v_1_2 = x_1_0 * wv_0_2 + x_1_1 * wv_1_2 + x_1_2 * wv_2_2;
        meta.v_2_0 = x_2_0 * wv_0_0 + x_2_1 * wv_1_0 + x_2_2 * wv_2_0;
        meta.v_2_1 = x_2_0 * wv_0_1 + x_2_1 * wv_1_1 + x_2_2 * wv_2_1;
        meta.v_2_2 = x_2_0 * wv_0_2 + x_2_1 * wv_1_2 + x_2_2 * wv_2_2;
        meta.v_3_0 = x_3_0 * wv_0_0 + x_3_1 * wv_1_0 + x_3_2 * wv_2_0;
        meta.v_3_1 = x_3_0 * wv_0_1 + x_3_1 * wv_1_1 + x_3_2 * wv_2_1;
        meta.v_3_2 = x_3_0 * wv_0_2 + x_3_1 * wv_1_2 + x_3_2 * wv_2_2;
        meta.v_4_0 = x_4_0 * wv_0_0 + x_4_1 * wv_1_0 + x_4_2 * wv_2_0;
        meta.v_4_1 = x_4_0 * wv_0_1 + x_4_1 * wv_1_1 + x_4_2 * wv_2_1;
        meta.v_4_2 = x_4_0 * wv_0_2 + x_4_1 * wv_1_2 + x_4_2 * wv_2_2;
        meta.v_5_0 = x_5_0 * wv_0_0 + x_5_1 * wv_1_0 + x_5_2 * wv_2_0;
        meta.v_5_1 = x_5_0 * wv_0_1 + x_5_1 * wv_1_1 + x_5_2 * wv_2_1;
        meta.v_5_2 = x_5_0 * wv_0_2 + x_5_1 * wv_1_2 + x_5_2 * wv_2_2;
        meta.v_6_0 = x_6_0 * wv_0_0 + x_6_1 * wv_1_0 + x_6_2 * wv_2_0;
        meta.v_6_1 = x_6_0 * wv_0_1 + x_6_1 * wv_1_1 + x_6_2 * wv_2_1;
        meta.v_6_2 = x_6_0 * wv_0_2 + x_6_1 * wv_1_2 + x_6_2 * wv_2_2;
        meta.v_7_0 = x_7_0 * wv_0_0 + x_7_1 * wv_1_0 + x_7_2 * wv_2_0;
        meta.v_7_1 = x_7_0 * wv_0_1 + x_7_1 * wv_1_1 + x_7_2 * wv_2_1;
        meta.v_7_2 = x_7_0 * wv_0_2 + x_7_1 * wv_1_2 + x_7_2 * wv_2_2;
    
        // 计算q*k_t
        bit<32> q_mul_kt_0_0 = q_0_0 * k_0_0 + q_0_1 * k_0_1 + q_0_2 * k_0_2 ;
        bit<32> q_mul_kt_0_1 = q_0_0 * k_1_0 + q_0_1 * k_1_1 + q_0_2 * k_1_2 ;
        bit<32> q_mul_kt_0_2 = q_0_0 * k_2_0 + q_0_1 * k_2_1 + q_0_2 * k_2_2 ;
        bit<32> q_mul_kt_0_3 = q_0_0 * k_3_0 + q_0_1 * k_3_1 + q_0_2 * k_3_2 ;
        bit<32> q_mul_kt_0_4 = q_0_0 * k_4_0 + q_0_1 * k_4_1 + q_0_2 * k_4_2 ;
        bit<32> q_mul_kt_0_5 = q_0_0 * k_5_0 + q_0_1 * k_5_1 + q_0_2 * k_5_2 ;
        bit<32> q_mul_kt_0_6 = q_0_0 * k_6_0 + q_0_1 * k_6_1 + q_0_2 * k_6_2 ;
        bit<32> q_mul_kt_0_7 = q_0_0 * k_7_0 + q_0_1 * k_7_1 + q_0_2 * k_7_2 ;
        bit<32> q_mul_kt_1_0 = q_1_0 * k_0_0 + q_1_1 * k_0_1 + q_1_2 * k_0_2 ;
        bit<32> q_mul_kt_1_1 = q_1_0 * k_1_0 + q_1_1 * k_1_1 + q_1_2 * k_1_2 ;
        bit<32> q_mul_kt_1_2 = q_1_0 * k_2_0 + q_1_1 * k_2_1 + q_1_2 * k_2_2 ;
        bit<32> q_mul_kt_1_3 = q_1_0 * k_3_0 + q_1_1 * k_3_1 + q_1_2 * k_3_2 ;
        bit<32> q_mul_kt_1_4 = q_1_0 * k_4_0 + q_1_1 * k_4_1 + q_1_2 * k_4_2 ;
        bit<32> q_mul_kt_1_5 = q_1_0 * k_5_0 + q_1_1 * k_5_1 + q_1_2 * k_5_2 ;
        bit<32> q_mul_kt_1_6 = q_1_0 * k_6_0 + q_1_1 * k_6_1 + q_1_2 * k_6_2 ;
        bit<32> q_mul_kt_1_7 = q_1_0 * k_7_0 + q_1_1 * k_7_1 + q_1_2 * k_7_2 ;
        bit<32> q_mul_kt_2_0 = q_2_0 * k_0_0 + q_2_1 * k_0_1 + q_2_2 * k_0_2 ;
        bit<32> q_mul_kt_2_1 = q_2_0 * k_1_0 + q_2_1 * k_1_1 + q_2_2 * k_1_2 ;
        bit<32> q_mul_kt_2_2 = q_2_0 * k_2_0 + q_2_1 * k_2_1 + q_2_2 * k_2_2 ;
        bit<32> q_mul_kt_2_3 = q_2_0 * k_3_0 + q_2_1 * k_3_1 + q_2_2 * k_3_2 ;
        bit<32> q_mul_kt_2_4 = q_2_0 * k_4_0 + q_2_1 * k_4_1 + q_2_2 * k_4_2 ;
        bit<32> q_mul_kt_2_5 = q_2_0 * k_5_0 + q_2_1 * k_5_1 + q_2_2 * k_5_2 ;
        bit<32> q_mul_kt_2_6 = q_2_0 * k_6_0 + q_2_1 * k_6_1 + q_2_2 * k_6_2 ;
        bit<32> q_mul_kt_2_7 = q_2_0 * k_7_0 + q_2_1 * k_7_1 + q_2_2 * k_7_2 ;
        bit<32> q_mul_kt_3_0 = q_3_0 * k_0_0 + q_3_1 * k_0_1 + q_3_2 * k_0_2 ;
        bit<32> q_mul_kt_3_1 = q_3_0 * k_1_0 + q_3_1 * k_1_1 + q_3_2 * k_1_2 ;
        bit<32> q_mul_kt_3_2 = q_3_0 * k_2_0 + q_3_1 * k_2_1 + q_3_2 * k_2_2 ;
        bit<32> q_mul_kt_3_3 = q_3_0 * k_3_0 + q_3_1 * k_3_1 + q_3_2 * k_3_2 ;
        bit<32> q_mul_kt_3_4 = q_3_0 * k_4_0 + q_3_1 * k_4_1 + q_3_2 * k_4_2 ;
        bit<32> q_mul_kt_3_5 = q_3_0 * k_5_0 + q_3_1 * k_5_1 + q_3_2 * k_5_2 ;
        bit<32> q_mul_kt_3_6 = q_3_0 * k_6_0 + q_3_1 * k_6_1 + q_3_2 * k_6_2 ;
        bit<32> q_mul_kt_3_7 = q_3_0 * k_7_0 + q_3_1 * k_7_1 + q_3_2 * k_7_2 ;
        bit<32> q_mul_kt_4_0 = q_4_0 * k_0_0 + q_4_1 * k_0_1 + q_4_2 * k_0_2 ;
        bit<32> q_mul_kt_4_1 = q_4_0 * k_1_0 + q_4_1 * k_1_1 + q_4_2 * k_1_2 ;
        bit<32> q_mul_kt_4_2 = q_4_0 * k_2_0 + q_4_1 * k_2_1 + q_4_2 * k_2_2 ;
        bit<32> q_mul_kt_4_3 = q_4_0 * k_3_0 + q_4_1 * k_3_1 + q_4_2 * k_3_2 ;
        bit<32> q_mul_kt_4_4 = q_4_0 * k_4_0 + q_4_1 * k_4_1 + q_4_2 * k_4_2 ;
        bit<32> q_mul_kt_4_5 = q_4_0 * k_5_0 + q_4_1 * k_5_1 + q_4_2 * k_5_2 ;
        bit<32> q_mul_kt_4_6 = q_4_0 * k_6_0 + q_4_1 * k_6_1 + q_4_2 * k_6_2 ;
        bit<32> q_mul_kt_4_7 = q_4_0 * k_7_0 + q_4_1 * k_7_1 + q_4_2 * k_7_2 ;
        bit<32> q_mul_kt_5_0 = q_5_0 * k_0_0 + q_5_1 * k_0_1 + q_5_2 * k_0_2 ;
        bit<32> q_mul_kt_5_1 = q_5_0 * k_1_0 + q_5_1 * k_1_1 + q_5_2 * k_1_2 ;
        bit<32> q_mul_kt_5_2 = q_5_0 * k_2_0 + q_5_1 * k_2_1 + q_5_2 * k_2_2 ;
        bit<32> q_mul_kt_5_3 = q_5_0 * k_3_0 + q_5_1 * k_3_1 + q_5_2 * k_3_2 ;
        bit<32> q_mul_kt_5_4 = q_5_0 * k_4_0 + q_5_1 * k_4_1 + q_5_2 * k_4_2 ;
        bit<32> q_mul_kt_5_5 = q_5_0 * k_5_0 + q_5_1 * k_5_1 + q_5_2 * k_5_2 ;
        bit<32> q_mul_kt_5_6 = q_5_0 * k_6_0 + q_5_1 * k_6_1 + q_5_2 * k_6_2 ;
        bit<32> q_mul_kt_5_7 = q_5_0 * k_7_0 + q_5_1 * k_7_1 + q_5_2 * k_7_2 ;
        bit<32> q_mul_kt_6_0 = q_6_0 * k_0_0 + q_6_1 * k_0_1 + q_6_2 * k_0_2 ;
        bit<32> q_mul_kt_6_1 = q_6_0 * k_1_0 + q_6_1 * k_1_1 + q_6_2 * k_1_2 ;
        bit<32> q_mul_kt_6_2 = q_6_0 * k_2_0 + q_6_1 * k_2_1 + q_6_2 * k_2_2 ;
        bit<32> q_mul_kt_6_3 = q_6_0 * k_3_0 + q_6_1 * k_3_1 + q_6_2 * k_3_2 ;
        bit<32> q_mul_kt_6_4 = q_6_0 * k_4_0 + q_6_1 * k_4_1 + q_6_2 * k_4_2 ;
        bit<32> q_mul_kt_6_5 = q_6_0 * k_5_0 + q_6_1 * k_5_1 + q_6_2 * k_5_2 ;
        bit<32> q_mul_kt_6_6 = q_6_0 * k_6_0 + q_6_1 * k_6_1 + q_6_2 * k_6_2 ;
        bit<32> q_mul_kt_6_7 = q_6_0 * k_7_0 + q_6_1 * k_7_1 + q_6_2 * k_7_2 ;
        bit<32> q_mul_kt_7_0 = q_7_0 * k_0_0 + q_7_1 * k_0_1 + q_7_2 * k_0_2 ;
        bit<32> q_mul_kt_7_1 = q_7_0 * k_1_0 + q_7_1 * k_1_1 + q_7_2 * k_1_2 ;
        bit<32> q_mul_kt_7_2 = q_7_0 * k_2_0 + q_7_1 * k_2_1 + q_7_2 * k_2_2 ;
        bit<32> q_mul_kt_7_3 = q_7_0 * k_3_0 + q_7_1 * k_3_1 + q_7_2 * k_3_2 ;
        bit<32> q_mul_kt_7_4 = q_7_0 * k_4_0 + q_7_1 * k_4_1 + q_7_2 * k_4_2 ;
        bit<32> q_mul_kt_7_5 = q_7_0 * k_5_0 + q_7_1 * k_5_1 + q_7_2 * k_5_2 ;
        bit<32> q_mul_kt_7_6 = q_7_0 * k_6_0 + q_7_1 * k_6_1 + q_7_2 * k_6_2 ;
        bit<32> q_mul_kt_7_7 = q_7_0 * k_7_0 + q_7_1 * k_7_1 + q_7_2 * k_7_2 ;
    
        // 除以根号dk，用泰勒级数计算e^x
        const bit<64> k = 2479700524; // 根号dk分之一*2^32
        const bit<32> float_0_5 = 0x00000080;
        const bit<32> float_0_16 = 0x0000002A;
        
        bit<64> q_mul_kt_0_0_64 = 0;
        q_mul_kt_0_0_64[31:0] = q_mul_kt_0_0;
        bit<64> result_0_0 = q_mul_kt_0_0_64 * k;
        bit<32> result32_0_0 = result_0_0[63:32];
        meta.q_mul_kt_0_0 = 1 + result32_0_0 + result32_0_0 * result32_0_0 * float_0_5 + result32_0_0 * result32_0_0 * result32_0_0 * float_0_16;
        bit<64> q_mul_kt_0_1_64 = 0;
        q_mul_kt_0_1_64[31:0] = q_mul_kt_0_1;
        bit<64> result_0_1 = q_mul_kt_0_1_64 * k;
        bit<32> result32_0_1 = result_0_1[63:32];
        meta.q_mul_kt_0_1 = 1 + result32_0_1 + result32_0_1 * result32_0_1 * float_0_5 + result32_0_1 * result32_0_1 * result32_0_1 * float_0_16;
        bit<64> q_mul_kt_0_2_64 = 0;
        q_mul_kt_0_2_64[31:0] = q_mul_kt_0_2;
        bit<64> result_0_2 = q_mul_kt_0_2_64 * k;
        bit<32> result32_0_2 = result_0_2[63:32];
        meta.q_mul_kt_0_2 = 1 + result32_0_2 + result32_0_2 * result32_0_2 * float_0_5 + result32_0_2 * result32_0_2 * result32_0_2 * float_0_16;
        bit<64> q_mul_kt_0_3_64 = 0;
        q_mul_kt_0_3_64[31:0] = q_mul_kt_0_3;
        bit<64> result_0_3 = q_mul_kt_0_3_64 * k;
        bit<32> result32_0_3 = result_0_3[63:32];
        meta.q_mul_kt_0_3 = 1 + result32_0_3 + result32_0_3 * result32_0_3 * float_0_5 + result32_0_3 * result32_0_3 * result32_0_3 * float_0_16;
        bit<64> q_mul_kt_0_4_64 = 0;
        q_mul_kt_0_4_64[31:0] = q_mul_kt_0_4;
        bit<64> result_0_4 = q_mul_kt_0_4_64 * k;
        bit<32> result32_0_4 = result_0_4[63:32];
        meta.q_mul_kt_0_4 = 1 + result32_0_4 + result32_0_4 * result32_0_4 * float_0_5 + result32_0_4 * result32_0_4 * result32_0_4 * float_0_16;
        bit<64> q_mul_kt_0_5_64 = 0;
        q_mul_kt_0_5_64[31:0] = q_mul_kt_0_5;
        bit<64> result_0_5 = q_mul_kt_0_5_64 * k;
        bit<32> result32_0_5 = result_0_5[63:32];
        meta.q_mul_kt_0_5 = 1 + result32_0_5 + result32_0_5 * result32_0_5 * float_0_5 + result32_0_5 * result32_0_5 * result32_0_5 * float_0_16;
        bit<64> q_mul_kt_0_6_64 = 0;
        q_mul_kt_0_6_64[31:0] = q_mul_kt_0_6;
        bit<64> result_0_6 = q_mul_kt_0_6_64 * k;
        bit<32> result32_0_6 = result_0_6[63:32];
        meta.q_mul_kt_0_6 = 1 + result32_0_6 + result32_0_6 * result32_0_6 * float_0_5 + result32_0_6 * result32_0_6 * result32_0_6 * float_0_16;
        bit<64> q_mul_kt_0_7_64 = 0;
        q_mul_kt_0_7_64[31:0] = q_mul_kt_0_7;
        bit<64> result_0_7 = q_mul_kt_0_7_64 * k;
        bit<32> result32_0_7 = result_0_7[63:32];
        meta.q_mul_kt_0_7 = 1 + result32_0_7 + result32_0_7 * result32_0_7 * float_0_5 + result32_0_7 * result32_0_7 * result32_0_7 * float_0_16;
       
        bit<64> q_mul_kt_1_0_64 = 0;
        q_mul_kt_1_0_64[31:0] = q_mul_kt_1_0;
        bit<64> result_1_0 = q_mul_kt_1_0_64 * k;
        bit<32> result32_1_0 = result_1_0[63:32];
        meta.q_mul_kt_1_0 = 1 + result32_1_0 + result32_1_0 * result32_1_0 * float_0_5 + result32_1_0 * result32_1_0 * result32_1_0 * float_0_16;
        bit<64> q_mul_kt_1_1_64 = 0;
        q_mul_kt_1_1_64[31:0] = q_mul_kt_1_1;
        bit<64> result_1_1 = q_mul_kt_1_1_64 * k;
        bit<32> result32_1_1 = result_1_1[63:32];
        meta.q_mul_kt_1_1 = 1 + result32_1_1 + result32_1_1 * result32_1_1 * float_0_5 + result32_1_1 * result32_1_1 * result32_1_1 * float_0_16;
        bit<64> q_mul_kt_1_2_64 = 0;
        q_mul_kt_1_2_64[31:0] = q_mul_kt_1_2;
        bit<64> result_1_2 = q_mul_kt_1_2_64 * k;
        bit<32> result32_1_2 = result_1_2[63:32];
        meta.q_mul_kt_1_2 = 1 + result32_1_2 + result32_1_2 * result32_1_2 * float_0_5 + result32_1_2 * result32_1_2 * result32_1_2 * float_0_16;
        bit<64> q_mul_kt_1_3_64 = 0;
        q_mul_kt_1_3_64[31:0] = q_mul_kt_1_3;
        bit<64> result_1_3 = q_mul_kt_1_3_64 * k;
        bit<32> result32_1_3 = result_1_3[63:32];
        meta.q_mul_kt_1_3 = 1 + result32_1_3 + result32_1_3 * result32_1_3 * float_0_5 + result32_1_3 * result32_1_3 * result32_1_3 * float_0_16;
        bit<64> q_mul_kt_1_4_64 = 0;
        q_mul_kt_1_4_64[31:0] = q_mul_kt_1_4;
        bit<64> result_1_4 = q_mul_kt_1_4_64 * k;
        bit<32> result32_1_4 = result_1_4[63:32];
        meta.q_mul_kt_1_4 = 1 + result32_1_4 + result32_1_4 * result32_1_4 * float_0_5 + result32_1_4 * result32_1_4 * result32_1_4 * float_0_16;
        bit<64> q_mul_kt_1_5_64 = 0;
        q_mul_kt_1_5_64[31:0] = q_mul_kt_1_5;
        bit<64> result_1_5 = q_mul_kt_1_5_64 * k;
        bit<32> result32_1_5 = result_1_5[63:32];
        meta.q_mul_kt_1_5 = 1 + result32_1_5 + result32_1_5 * result32_1_5 * float_0_5 + result32_1_5 * result32_1_5 * result32_1_5 * float_0_16;
        bit<64> q_mul_kt_1_6_64 = 0;
        q_mul_kt_1_6_64[31:0] = q_mul_kt_1_6;
        bit<64> result_1_6 = q_mul_kt_1_6_64 * k;
        bit<32> result32_1_6 = result_1_6[63:32];
        meta.q_mul_kt_1_6 = 1 + result32_1_6 + result32_1_6 * result32_1_6 * float_0_5 + result32_1_6 * result32_1_6 * result32_1_6 * float_0_16;
        bit<64> q_mul_kt_1_7_64 = 0;
        q_mul_kt_1_7_64[31:0] = q_mul_kt_1_7;
        bit<64> result_1_7 = q_mul_kt_1_7_64 * k;
        bit<32> result32_1_7 = result_1_7[63:32];
        meta.q_mul_kt_1_7 = 1 + result32_1_7 + result32_1_7 * result32_1_7 * float_0_5 + result32_1_7 * result32_1_7 * result32_1_7 * float_0_16;
        bit<64> q_mul_kt_2_0_64 = 0;
        q_mul_kt_2_0_64[31:0] = q_mul_kt_2_0;
        bit<64> result_2_0 = q_mul_kt_2_0_64 * k;
        bit<32> result32_2_0 = result_2_0[63:32];
        meta.q_mul_kt_2_0 = 1 + result32_2_0 + result32_2_0 * result32_2_0 * float_0_5 + result32_2_0 * result32_2_0 * result32_2_0 * float_0_16;
        bit<64> q_mul_kt_2_1_64 = 0;
        q_mul_kt_2_1_64[31:0] = q_mul_kt_2_1;
        bit<64> result_2_1 = q_mul_kt_2_1_64 * k;
        bit<32> result32_2_1 = result_2_1[63:32];
        meta.q_mul_kt_2_1 = 1 + result32_2_1 + result32_2_1 * result32_2_1 * float_0_5 + result32_2_1 * result32_2_1 * result32_2_1 * float_0_16;
        bit<64> q_mul_kt_2_2_64 = 0;
        q_mul_kt_2_2_64[31:0] = q_mul_kt_2_2;
        bit<64> result_2_2 = q_mul_kt_2_2_64 * k;
        bit<32> result32_2_2 = result_2_2[63:32];
        meta.q_mul_kt_2_2 = 1 + result32_2_2 + result32_2_2 * result32_2_2 * float_0_5 + result32_2_2 * result32_2_2 * result32_2_2 * float_0_16;
        bit<64> q_mul_kt_2_3_64 = 0;
        q_mul_kt_2_3_64[31:0] = q_mul_kt_2_3;
        bit<64> result_2_3 = q_mul_kt_2_3_64 * k;
        bit<32> result32_2_3 = result_2_3[63:32];
        meta.q_mul_kt_2_3 = 1 + result32_2_3 + result32_2_3 * result32_2_3 * float_0_5 + result32_2_3 * result32_2_3 * result32_2_3 * float_0_16;
        bit<64> q_mul_kt_2_4_64 = 0;
        q_mul_kt_2_4_64[31:0] = q_mul_kt_2_4;
        bit<64> result_2_4 = q_mul_kt_2_4_64 * k;
        bit<32> result32_2_4 = result_2_4[63:32];
        meta.q_mul_kt_2_4 = 1 + result32_2_4 + result32_2_4 * result32_2_4 * float_0_5 + result32_2_4 * result32_2_4 * result32_2_4 * float_0_16;
        bit<64> q_mul_kt_2_5_64 = 0;
        q_mul_kt_2_5_64[31:0] = q_mul_kt_2_5;
        bit<64> result_2_5 = q_mul_kt_2_5_64 * k;
        bit<32> result32_2_5 = result_2_5[63:32];
        meta.q_mul_kt_2_5 = 1 + result32_2_5 + result32_2_5 * result32_2_5 * float_0_5 + result32_2_5 * result32_2_5 * result32_2_5 * float_0_16;
        bit<64> q_mul_kt_2_6_64 = 0;
        q_mul_kt_2_6_64[31:0] = q_mul_kt_2_6;
        bit<64> result_2_6 = q_mul_kt_2_6_64 * k;
        bit<32> result32_2_6 = result_2_6[63:32];
        meta.q_mul_kt_2_6 = 1 + result32_2_6 + result32_2_6 * result32_2_6 * float_0_5 + result32_2_6 * result32_2_6 * result32_2_6 * float_0_16;
        bit<64> q_mul_kt_2_7_64 = 0;
        q_mul_kt_2_7_64[31:0] = q_mul_kt_2_7;
        bit<64> result_2_7 = q_mul_kt_2_7_64 * k;
        bit<32> result32_2_7 = result_2_7[63:32];
        meta.q_mul_kt_2_7 = 1 + result32_2_7 + result32_2_7 * result32_2_7 * float_0_5 + result32_2_7 * result32_2_7 * result32_2_7 * float_0_16;
        bit<64> q_mul_kt_3_0_64 = 0;
        q_mul_kt_3_0_64[31:0] = q_mul_kt_3_0;
        bit<64> result_3_0 = q_mul_kt_3_0_64 * k;
        bit<32> result32_3_0 = result_3_0[63:32];
        meta.q_mul_kt_3_0 = 1 + result32_3_0 + result32_3_0 * result32_3_0 * float_0_5 + result32_3_0 * result32_3_0 * result32_3_0 * float_0_16;
        bit<64> q_mul_kt_3_1_64 = 0;
        q_mul_kt_3_1_64[31:0] = q_mul_kt_3_1;
        bit<64> result_3_1 = q_mul_kt_3_1_64 * k;
        bit<32> result32_3_1 = result_3_1[63:32];
        meta.q_mul_kt_3_1 = 1 + result32_3_1 + result32_3_1 * result32_3_1 * float_0_5 + result32_3_1 * result32_3_1 * result32_3_1 * float_0_16;
        bit<64> q_mul_kt_3_2_64 = 0;
        q_mul_kt_3_2_64[31:0] = q_mul_kt_3_2;
        bit<64> result_3_2 = q_mul_kt_3_2_64 * k;
        bit<32> result32_3_2 = result_3_2[63:32];
        meta.q_mul_kt_3_2 = 1 + result32_3_2 + result32_3_2 * result32_3_2 * float_0_5 + result32_3_2 * result32_3_2 * result32_3_2 * float_0_16;
        bit<64> q_mul_kt_3_3_64 = 0;
        q_mul_kt_3_3_64[31:0] = q_mul_kt_3_3;
        bit<64> result_3_3 = q_mul_kt_3_3_64 * k;
        bit<32> result32_3_3 = result_3_3[63:32];
        meta.q_mul_kt_3_3 = 1 + result32_3_3 + result32_3_3 * result32_3_3 * float_0_5 + result32_3_3 * result32_3_3 * result32_3_3 * float_0_16;
        bit<64> q_mul_kt_3_4_64 = 0;
        q_mul_kt_3_4_64[31:0] = q_mul_kt_3_4;
        bit<64> result_3_4 = q_mul_kt_3_4_64 * k;
        bit<32> result32_3_4 = result_3_4[63:32];
        meta.q_mul_kt_3_4 = 1 + result32_3_4 + result32_3_4 * result32_3_4 * float_0_5 + result32_3_4 * result32_3_4 * result32_3_4 * float_0_16;
        bit<64> q_mul_kt_3_5_64 = 0;
        q_mul_kt_3_5_64[31:0] = q_mul_kt_3_5;
        bit<64> result_3_5 = q_mul_kt_3_5_64 * k;
        bit<32> result32_3_5 = result_3_5[63:32];
        meta.q_mul_kt_3_5 = 1 + result32_3_5 + result32_3_5 * result32_3_5 * float_0_5 + result32_3_5 * result32_3_5 * result32_3_5 * float_0_16;
        bit<64> q_mul_kt_3_6_64 = 0;
        q_mul_kt_3_6_64[31:0] = q_mul_kt_3_6;
        bit<64> result_3_6 = q_mul_kt_3_6_64 * k;
        bit<32> result32_3_6 = result_3_6[63:32];
        meta.q_mul_kt_3_6 = 1 + result32_3_6 + result32_3_6 * result32_3_6 * float_0_5 + result32_3_6 * result32_3_6 * result32_3_6 * float_0_16;
        bit<64> q_mul_kt_3_7_64 = 0;
        q_mul_kt_3_7_64[31:0] = q_mul_kt_3_7;
        bit<64> result_3_7 = q_mul_kt_3_7_64 * k;
        bit<32> result32_3_7 = result_3_7[63:32];
        meta.q_mul_kt_3_7 = 1 + result32_3_7 + result32_3_7 * result32_3_7 * float_0_5 + result32_3_7 * result32_3_7 * result32_3_7 * float_0_16;
        bit<64> q_mul_kt_4_0_64 = 0;
        q_mul_kt_4_0_64[31:0] = q_mul_kt_4_0;
        bit<64> result_4_0 = q_mul_kt_4_0_64 * k;
        bit<32> result32_4_0 = result_4_0[63:32];
        meta.q_mul_kt_4_0 = 1 + result32_4_0 + result32_4_0 * result32_4_0 * float_0_5 + result32_4_0 * result32_4_0 * result32_4_0 * float_0_16;
        bit<64> q_mul_kt_4_1_64 = 0;
        q_mul_kt_4_1_64[31:0] = q_mul_kt_4_1;
        bit<64> result_4_1 = q_mul_kt_4_1_64 * k;
        bit<32> result32_4_1 = result_4_1[63:32];
        meta.q_mul_kt_4_1 = 1 + result32_4_1 + result32_4_1 * result32_4_1 * float_0_5 + result32_4_1 * result32_4_1 * result32_4_1 * float_0_16;
        bit<64> q_mul_kt_4_2_64 = 0;
        q_mul_kt_4_2_64[31:0] = q_mul_kt_4_2;
        bit<64> result_4_2 = q_mul_kt_4_2_64 * k;
        bit<32> result32_4_2 = result_4_2[63:32];
        meta.q_mul_kt_4_2 = 1 + result32_4_2 + result32_4_2 * result32_4_2 * float_0_5 + result32_4_2 * result32_4_2 * result32_4_2 * float_0_16;
        bit<64> q_mul_kt_4_3_64 = 0;
        q_mul_kt_4_3_64[31:0] = q_mul_kt_4_3;
        bit<64> result_4_3 = q_mul_kt_4_3_64 * k;
        bit<32> result32_4_3 = result_4_3[63:32];
        meta.q_mul_kt_4_3 = 1 + result32_4_3 + result32_4_3 * result32_4_3 * float_0_5 + result32_4_3 * result32_4_3 * result32_4_3 * float_0_16;
        bit<64> q_mul_kt_4_4_64 = 0;
        q_mul_kt_4_4_64[31:0] = q_mul_kt_4_4;
        bit<64> result_4_4 = q_mul_kt_4_4_64 * k;
        bit<32> result32_4_4 = result_4_4[63:32];
        meta.q_mul_kt_4_4 = 1 + result32_4_4 + result32_4_4 * result32_4_4 * float_0_5 + result32_4_4 * result32_4_4 * result32_4_4 * float_0_16;
        bit<64> q_mul_kt_4_5_64 = 0;
        q_mul_kt_4_5_64[31:0] = q_mul_kt_4_5;
        bit<64> result_4_5 = q_mul_kt_4_5_64 * k;
        bit<32> result32_4_5 = result_4_5[63:32];
        meta.q_mul_kt_4_5 = 1 + result32_4_5 + result32_4_5 * result32_4_5 * float_0_5 + result32_4_5 * result32_4_5 * result32_4_5 * float_0_16;
        bit<64> q_mul_kt_4_6_64 = 0;
        q_mul_kt_4_6_64[31:0] = q_mul_kt_4_6;
        bit<64> result_4_6 = q_mul_kt_4_6_64 * k;
        bit<32> result32_4_6 = result_4_6[63:32];
        meta.q_mul_kt_4_6 = 1 + result32_4_6 + result32_4_6 * result32_4_6 * float_0_5 + result32_4_6 * result32_4_6 * result32_4_6 * float_0_16;
        bit<64> q_mul_kt_4_7_64 = 0;
        q_mul_kt_4_7_64[31:0] = q_mul_kt_4_7;
        bit<64> result_4_7 = q_mul_kt_4_7_64 * k;
        bit<32> result32_4_7 = result_4_7[63:32];
        meta.q_mul_kt_4_7 = 1 + result32_4_7 + result32_4_7 * result32_4_7 * float_0_5 + result32_4_7 * result32_4_7 * result32_4_7 * float_0_16;
        bit<64> q_mul_kt_5_0_64 = 0;
        q_mul_kt_5_0_64[31:0] = q_mul_kt_5_0;
        bit<64> result_5_0 = q_mul_kt_5_0_64 * k;
        bit<32> result32_5_0 = result_5_0[63:32];
        meta.q_mul_kt_5_0 = 1 + result32_5_0 + result32_5_0 * result32_5_0 * float_0_5 + result32_5_0 * result32_5_0 * result32_5_0 * float_0_16;
        bit<64> q_mul_kt_5_1_64 = 0;
        q_mul_kt_5_1_64[31:0] = q_mul_kt_5_1;
        bit<64> result_5_1 = q_mul_kt_5_1_64 * k;
        bit<32> result32_5_1 = result_5_1[63:32];
        meta.q_mul_kt_5_1 = 1 + result32_5_1 + result32_5_1 * result32_5_1 * float_0_5 + result32_5_1 * result32_5_1 * result32_5_1 * float_0_16;
        bit<64> q_mul_kt_5_2_64 = 0;
        q_mul_kt_5_2_64[31:0] = q_mul_kt_5_2;
        bit<64> result_5_2 = q_mul_kt_5_2_64 * k;
        bit<32> result32_5_2 = result_5_2[63:32];
        meta.q_mul_kt_5_2 = 1 + result32_5_2 + result32_5_2 * result32_5_2 * float_0_5 + result32_5_2 * result32_5_2 * result32_5_2 * float_0_16;
        bit<64> q_mul_kt_5_3_64 = 0;
        q_mul_kt_5_3_64[31:0] = q_mul_kt_5_3;
        bit<64> result_5_3 = q_mul_kt_5_3_64 * k;
        bit<32> result32_5_3 = result_5_3[63:32];
        meta.q_mul_kt_5_3 = 1 + result32_5_3 + result32_5_3 * result32_5_3 * float_0_5 + result32_5_3 * result32_5_3 * result32_5_3 * float_0_16;
        bit<64> q_mul_kt_5_4_64 = 0;
        q_mul_kt_5_4_64[31:0] = q_mul_kt_5_4;
        bit<64> result_5_4 = q_mul_kt_5_4_64 * k;
        bit<32> result32_5_4 = result_5_4[63:32];
        meta.q_mul_kt_5_4 = 1 + result32_5_4 + result32_5_4 * result32_5_4 * float_0_5 + result32_5_4 * result32_5_4 * result32_5_4 * float_0_16;
        bit<64> q_mul_kt_5_5_64 = 0;
        q_mul_kt_5_5_64[31:0] = q_mul_kt_5_5;
        bit<64> result_5_5 = q_mul_kt_5_5_64 * k;
        bit<32> result32_5_5 = result_5_5[63:32];
        meta.q_mul_kt_5_5 = 1 + result32_5_5 + result32_5_5 * result32_5_5 * float_0_5 + result32_5_5 * result32_5_5 * result32_5_5 * float_0_16;
        bit<64> q_mul_kt_5_6_64 = 0;
        q_mul_kt_5_6_64[31:0] = q_mul_kt_5_6;
        bit<64> result_5_6 = q_mul_kt_5_6_64 * k;
        bit<32> result32_5_6 = result_5_6[63:32];
        meta.q_mul_kt_5_6 = 1 + result32_5_6 + result32_5_6 * result32_5_6 * float_0_5 + result32_5_6 * result32_5_6 * result32_5_6 * float_0_16;
        bit<64> q_mul_kt_5_7_64 = 0;
        q_mul_kt_5_7_64[31:0] = q_mul_kt_5_7;
        bit<64> result_5_7 = q_mul_kt_5_7_64 * k;
        bit<32> result32_5_7 = result_5_7[63:32];
        meta.q_mul_kt_5_7 = 1 + result32_5_7 + result32_5_7 * result32_5_7 * float_0_5 + result32_5_7 * result32_5_7 * result32_5_7 * float_0_16;
        bit<64> q_mul_kt_6_0_64 = 0;
        q_mul_kt_6_0_64[31:0] = q_mul_kt_6_0;
        bit<64> result_6_0 = q_mul_kt_6_0_64 * k;
        bit<32> result32_6_0 = result_6_0[63:32];
        meta.q_mul_kt_6_0 = 1 + result32_6_0 + result32_6_0 * result32_6_0 * float_0_5 + result32_6_0 * result32_6_0 * result32_6_0 * float_0_16;
        bit<64> q_mul_kt_6_1_64 = 0;
        q_mul_kt_6_1_64[31:0] = q_mul_kt_6_1;
        bit<64> result_6_1 = q_mul_kt_6_1_64 * k;
        bit<32> result32_6_1 = result_6_1[63:32];
        meta.q_mul_kt_6_1 = 1 + result32_6_1 + result32_6_1 * result32_6_1 * float_0_5 + result32_6_1 * result32_6_1 * result32_6_1 * float_0_16;
        bit<64> q_mul_kt_6_2_64 = 0;
        q_mul_kt_6_2_64[31:0] = q_mul_kt_6_2;
        bit<64> result_6_2 = q_mul_kt_6_2_64 * k;
        bit<32> result32_6_2 = result_6_2[63:32];
        meta.q_mul_kt_6_2 = 1 + result32_6_2 + result32_6_2 * result32_6_2 * float_0_5 + result32_6_2 * result32_6_2 * result32_6_2 * float_0_16;
        bit<64> q_mul_kt_6_3_64 = 0;
        q_mul_kt_6_3_64[31:0] = q_mul_kt_6_3;
        bit<64> result_6_3 = q_mul_kt_6_3_64 * k;
        bit<32> result32_6_3 = result_6_3[63:32];
        meta.q_mul_kt_6_3 = 1 + result32_6_3 + result32_6_3 * result32_6_3 * float_0_5 + result32_6_3 * result32_6_3 * result32_6_3 * float_0_16;
        bit<64> q_mul_kt_6_4_64 = 0;
        q_mul_kt_6_4_64[31:0] = q_mul_kt_6_4;
        bit<64> result_6_4 = q_mul_kt_6_4_64 * k;
        bit<32> result32_6_4 = result_6_4[63:32];
        meta.q_mul_kt_6_4 = 1 + result32_6_4 + result32_6_4 * result32_6_4 * float_0_5 + result32_6_4 * result32_6_4 * result32_6_4 * float_0_16;
        bit<64> q_mul_kt_6_5_64 = 0;
        q_mul_kt_6_5_64[31:0] = q_mul_kt_6_5;
        bit<64> result_6_5 = q_mul_kt_6_5_64 * k;
        bit<32> result32_6_5 = result_6_5[63:32];
        meta.q_mul_kt_6_5 = 1 + result32_6_5 + result32_6_5 * result32_6_5 * float_0_5 + result32_6_5 * result32_6_5 * result32_6_5 * float_0_16;
        bit<64> q_mul_kt_6_6_64 = 0;
        q_mul_kt_6_6_64[31:0] = q_mul_kt_6_6;
        bit<64> result_6_6 = q_mul_kt_6_6_64 * k;
        bit<32> result32_6_6 = result_6_6[63:32];
        meta.q_mul_kt_6_6 = 1 + result32_6_6 + result32_6_6 * result32_6_6 * float_0_5 + result32_6_6 * result32_6_6 * result32_6_6 * float_0_16;
        bit<64> q_mul_kt_6_7_64 = 0;
        q_mul_kt_6_7_64[31:0] = q_mul_kt_6_7;
        bit<64> result_6_7 = q_mul_kt_6_7_64 * k;
        bit<32> result32_6_7 = result_6_7[63:32];
        meta.q_mul_kt_6_7 = 1 + result32_6_7 + result32_6_7 * result32_6_7 * float_0_5 + result32_6_7 * result32_6_7 * result32_6_7 * float_0_16;
        bit<64> q_mul_kt_7_0_64 = 0;
        q_mul_kt_7_0_64[31:0] = q_mul_kt_7_0;
        bit<64> result_7_0 = q_mul_kt_7_0_64 * k;
        bit<32> result32_7_0 = result_7_0[63:32];
        meta.q_mul_kt_7_0 = 1 + result32_7_0 + result32_7_0 * result32_7_0 * float_0_5 + result32_7_0 * result32_7_0 * result32_7_0 * float_0_16;
        bit<64> q_mul_kt_7_1_64 = 0;
        q_mul_kt_7_1_64[31:0] = q_mul_kt_7_1;
        bit<64> result_7_1 = q_mul_kt_7_1_64 * k;
        bit<32> result32_7_1 = result_7_1[63:32];
        meta.q_mul_kt_7_1 = 1 + result32_7_1 + result32_7_1 * result32_7_1 * float_0_5 + result32_7_1 * result32_7_1 * result32_7_1 * float_0_16;
        bit<64> q_mul_kt_7_2_64 = 0;
        q_mul_kt_7_2_64[31:0] = q_mul_kt_7_2;
        bit<64> result_7_2 = q_mul_kt_7_2_64 * k;
        bit<32> result32_7_2 = result_7_2[63:32];
        meta.q_mul_kt_7_2 = 1 + result32_7_2 + result32_7_2 * result32_7_2 * float_0_5 + result32_7_2 * result32_7_2 * result32_7_2 * float_0_16;
        bit<64> q_mul_kt_7_3_64 = 0;
        q_mul_kt_7_3_64[31:0] = q_mul_kt_7_3;
        bit<64> result_7_3 = q_mul_kt_7_3_64 * k;
        bit<32> result32_7_3 = result_7_3[63:32];
        meta.q_mul_kt_7_3 = 1 + result32_7_3 + result32_7_3 * result32_7_3 * float_0_5 + result32_7_3 * result32_7_3 * result32_7_3 * float_0_16;
        bit<64> q_mul_kt_7_4_64 = 0;
        q_mul_kt_7_4_64[31:0] = q_mul_kt_7_4;
        bit<64> result_7_4 = q_mul_kt_7_4_64 * k;
        bit<32> result32_7_4 = result_7_4[63:32];
        meta.q_mul_kt_7_4 = 1 + result32_7_4 + result32_7_4 * result32_7_4 * float_0_5 + result32_7_4 * result32_7_4 * result32_7_4 * float_0_16;
        bit<64> q_mul_kt_7_5_64 = 0;
        q_mul_kt_7_5_64[31:0] = q_mul_kt_7_5;
        bit<64> result_7_5 = q_mul_kt_7_5_64 * k;
        bit<32> result32_7_5 = result_7_5[63:32];
        meta.q_mul_kt_7_5 = 1 + result32_7_5 + result32_7_5 * result32_7_5 * float_0_5 + result32_7_5 * result32_7_5 * result32_7_5 * float_0_16;
        bit<64> q_mul_kt_7_6_64 = 0;
        q_mul_kt_7_6_64[31:0] = q_mul_kt_7_6;
        bit<64> result_7_6 = q_mul_kt_7_6_64 * k;
        bit<32> result32_7_6 = result_7_6[63:32];
        meta.q_mul_kt_7_6 = 1 + result32_7_6 + result32_7_6 * result32_7_6 * float_0_5 + result32_7_6 * result32_7_6 * result32_7_6 * float_0_16;
        bit<64> q_mul_kt_7_7_64 = 0;
        q_mul_kt_7_7_64[31:0] = q_mul_kt_7_7;
        bit<64> result_7_7 = q_mul_kt_7_7_64 * k;
        bit<32> result32_7_7 = result_7_7[63:32];
        meta.q_mul_kt_7_7 = 1 + result32_7_7 + result32_7_7 * result32_7_7 * float_0_5 + result32_7_7 * result32_7_7 * result32_7_7 * float_0_16;
       
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
        bit<32> softmax_0_0 = meta.q_mul_kt_0_0 * meta.softmax_reciprocal_0;
        bit<32> softmax_0_1 = meta.q_mul_kt_0_1 * meta.softmax_reciprocal_0;
        bit<32> softmax_0_2 = meta.q_mul_kt_0_2 * meta.softmax_reciprocal_0;
        bit<32> softmax_0_3 = meta.q_mul_kt_0_3 * meta.softmax_reciprocal_0;
        bit<32> softmax_0_4 = meta.q_mul_kt_0_4 * meta.softmax_reciprocal_0;
        bit<32> softmax_0_5 = meta.q_mul_kt_0_5 * meta.softmax_reciprocal_0;
        bit<32> softmax_0_6 = meta.q_mul_kt_0_6 * meta.softmax_reciprocal_0;
        bit<32> softmax_0_7 = meta.q_mul_kt_0_7 * meta.softmax_reciprocal_0;
        
        bit<32> softmax_1_0 = meta.q_mul_kt_1_0 * meta.softmax_reciprocal_1;
        bit<32> softmax_1_1 = meta.q_mul_kt_1_1 * meta.softmax_reciprocal_1;
        bit<32> softmax_1_2 = meta.q_mul_kt_1_2 * meta.softmax_reciprocal_1;
        bit<32> softmax_1_3 = meta.q_mul_kt_1_3 * meta.softmax_reciprocal_1;
        bit<32> softmax_1_4 = meta.q_mul_kt_1_4 * meta.softmax_reciprocal_1;
        bit<32> softmax_1_5 = meta.q_mul_kt_1_5 * meta.softmax_reciprocal_1;
        bit<32> softmax_1_6 = meta.q_mul_kt_1_6 * meta.softmax_reciprocal_1;
        bit<32> softmax_1_7 = meta.q_mul_kt_1_7 * meta.softmax_reciprocal_1;
       
        bit<32> softmax_2_0 = meta.q_mul_kt_2_0 * meta.softmax_reciprocal_2;
        bit<32> softmax_2_1 = meta.q_mul_kt_2_1 * meta.softmax_reciprocal_2;
        bit<32> softmax_2_2 = meta.q_mul_kt_2_2 * meta.softmax_reciprocal_2;
        bit<32> softmax_2_3 = meta.q_mul_kt_2_3 * meta.softmax_reciprocal_2;
        bit<32> softmax_2_4 = meta.q_mul_kt_2_4 * meta.softmax_reciprocal_2;
        bit<32> softmax_2_5 = meta.q_mul_kt_2_5 * meta.softmax_reciprocal_2;
        bit<32> softmax_2_6 = meta.q_mul_kt_2_6 * meta.softmax_reciprocal_2;
        bit<32> softmax_2_7 = meta.q_mul_kt_2_7 * meta.softmax_reciprocal_2;
        
        bit<32> softmax_3_0 = meta.q_mul_kt_3_0 * meta.softmax_reciprocal_3;
        bit<32> softmax_3_1 = meta.q_mul_kt_3_1 * meta.softmax_reciprocal_3;
        bit<32> softmax_3_2 = meta.q_mul_kt_3_2 * meta.softmax_reciprocal_3;
        bit<32> softmax_3_3 = meta.q_mul_kt_3_3 * meta.softmax_reciprocal_3;
        bit<32> softmax_3_4 = meta.q_mul_kt_3_4 * meta.softmax_reciprocal_3;
        bit<32> softmax_3_5 = meta.q_mul_kt_3_5 * meta.softmax_reciprocal_3;
        bit<32> softmax_3_6 = meta.q_mul_kt_3_6 * meta.softmax_reciprocal_3;
        bit<32> softmax_3_7 = meta.q_mul_kt_3_7 * meta.softmax_reciprocal_3;
        
        bit<32> softmax_4_0 = meta.q_mul_kt_4_0 * meta.softmax_reciprocal_4;
        bit<32> softmax_4_1 = meta.q_mul_kt_4_1 * meta.softmax_reciprocal_4;
        bit<32> softmax_4_2 = meta.q_mul_kt_4_2 * meta.softmax_reciprocal_4;
        bit<32> softmax_4_3 = meta.q_mul_kt_4_3 * meta.softmax_reciprocal_4;
        bit<32> softmax_4_4 = meta.q_mul_kt_4_4 * meta.softmax_reciprocal_4;
        bit<32> softmax_4_5 = meta.q_mul_kt_4_5 * meta.softmax_reciprocal_4;
        bit<32> softmax_4_6 = meta.q_mul_kt_4_6 * meta.softmax_reciprocal_4;
        bit<32> softmax_4_7 = meta.q_mul_kt_4_7 * meta.softmax_reciprocal_4;
     
        bit<32> softmax_5_0 = meta.q_mul_kt_5_0 * meta.softmax_reciprocal_5;
        bit<32> softmax_5_1 = meta.q_mul_kt_5_1 * meta.softmax_reciprocal_5;
        bit<32> softmax_5_2 = meta.q_mul_kt_5_2 * meta.softmax_reciprocal_5;
        bit<32> softmax_5_3 = meta.q_mul_kt_5_3 * meta.softmax_reciprocal_5;
        bit<32> softmax_5_4 = meta.q_mul_kt_5_4 * meta.softmax_reciprocal_5;
        bit<32> softmax_5_5 = meta.q_mul_kt_5_5 * meta.softmax_reciprocal_5;
        bit<32> softmax_5_6 = meta.q_mul_kt_5_6 * meta.softmax_reciprocal_5;
        bit<32> softmax_5_7 = meta.q_mul_kt_5_7 * meta.softmax_reciprocal_5;
       
        bit<32> softmax_6_0 = meta.q_mul_kt_6_0 * meta.softmax_reciprocal_6;
        bit<32> softmax_6_1 = meta.q_mul_kt_6_1 * meta.softmax_reciprocal_6;
        bit<32> softmax_6_2 = meta.q_mul_kt_6_2 * meta.softmax_reciprocal_6;
        bit<32> softmax_6_3 = meta.q_mul_kt_6_3 * meta.softmax_reciprocal_6;
        bit<32> softmax_6_4 = meta.q_mul_kt_6_4 * meta.softmax_reciprocal_6;
        bit<32> softmax_6_5 = meta.q_mul_kt_6_5 * meta.softmax_reciprocal_6;
        bit<32> softmax_6_6 = meta.q_mul_kt_6_6 * meta.softmax_reciprocal_6;
        bit<32> softmax_6_7 = meta.q_mul_kt_6_7 * meta.softmax_reciprocal_6;

        bit<32> softmax_7_0 = meta.q_mul_kt_7_0 * meta.softmax_reciprocal_7;
        bit<32> softmax_7_1 = meta.q_mul_kt_7_1 * meta.softmax_reciprocal_7;
        bit<32> softmax_7_2 = meta.q_mul_kt_7_2 * meta.softmax_reciprocal_7;
        bit<32> softmax_7_3 = meta.q_mul_kt_7_3 * meta.softmax_reciprocal_7;
        bit<32> softmax_7_4 = meta.q_mul_kt_7_4 * meta.softmax_reciprocal_7;
        bit<32> softmax_7_5 = meta.q_mul_kt_7_5 * meta.softmax_reciprocal_7;
        bit<32> softmax_7_6 = meta.q_mul_kt_7_6 * meta.softmax_reciprocal_7;
        bit<32> softmax_7_7 = meta.q_mul_kt_7_7 * meta.softmax_reciprocal_7;
        
        hdr.s1_output0_calc.s1_output_0_0 = softmax_0_0 * meta.v_0_0 + softmax_0_1 * meta.v_1_0 + softmax_0_2 * meta.v_2_0 + softmax_0_3 * meta.v_3_0 + softmax_0_4 * meta.v_4_0 + softmax_0_5 * meta.v_5_0 + softmax_0_6 * meta.v_6_0 + softmax_0_7 * meta.v_7_0;
        hdr.s1_output0_calc.s1_output_0_1 = softmax_0_0 * meta.v_0_1 + softmax_0_1 * meta.v_1_1 + softmax_0_2 * meta.v_2_1 + softmax_0_3 * meta.v_3_1 + softmax_0_4 * meta.v_4_1 + softmax_0_5 * meta.v_5_1 + softmax_0_6 * meta.v_6_1 + softmax_0_7 * meta.v_7_1;
        hdr.s1_output0_calc.s1_output_0_2 = softmax_0_0 * meta.v_0_2 + softmax_0_1 * meta.v_1_2 + softmax_0_2 * meta.v_2_2 + softmax_0_3 * meta.v_3_2 + softmax_0_4 * meta.v_4_2 + softmax_0_5 * meta.v_5_2 + softmax_0_6 * meta.v_6_2 + softmax_0_7 * meta.v_7_2;
        hdr.s1_output0_calc.s1_output_1_0 = softmax_1_0 * meta.v_0_0 + softmax_1_1 * meta.v_1_0 + softmax_1_2 * meta.v_2_0 + softmax_1_3 * meta.v_3_0 + softmax_1_4 * meta.v_4_0 + softmax_1_5 * meta.v_5_0 + softmax_1_6 * meta.v_6_0 + softmax_1_7 * meta.v_7_0;
        hdr.s1_output0_calc.s1_output_1_1 = softmax_1_0 * meta.v_0_1 + softmax_1_1 * meta.v_1_1 + softmax_1_2 * meta.v_2_1 + softmax_1_3 * meta.v_3_1 + softmax_1_4 * meta.v_4_1 + softmax_1_5 * meta.v_5_1 + softmax_1_6 * meta.v_6_1 + softmax_1_7 * meta.v_7_1;
        hdr.s1_output0_calc.s1_output_1_2 = softmax_1_0 * meta.v_0_2 + softmax_1_1 * meta.v_1_2 + softmax_1_2 * meta.v_2_2 + softmax_1_3 * meta.v_3_2 + softmax_1_4 * meta.v_4_2 + softmax_1_5 * meta.v_5_2 + softmax_1_6 * meta.v_6_2 + softmax_1_7 * meta.v_7_2;
        hdr.s1_output0_calc.s1_output_2_0 = softmax_2_0 * meta.v_0_0 + softmax_2_1 * meta.v_1_0 + softmax_2_2 * meta.v_2_0 + softmax_2_3 * meta.v_3_0 + softmax_2_4 * meta.v_4_0 + softmax_2_5 * meta.v_5_0 + softmax_2_6 * meta.v_6_0 + softmax_2_7 * meta.v_7_0;
        hdr.s1_output0_calc.s1_output_2_1 = softmax_2_0 * meta.v_0_1 + softmax_2_1 * meta.v_1_1 + softmax_2_2 * meta.v_2_1 + softmax_2_3 * meta.v_3_1 + softmax_2_4 * meta.v_4_1 + softmax_2_5 * meta.v_5_1 + softmax_2_6 * meta.v_6_1 + softmax_2_7 * meta.v_7_1;
        hdr.s1_output0_calc.s1_output_2_2 = softmax_2_0 * meta.v_0_2 + softmax_2_1 * meta.v_1_2 + softmax_2_2 * meta.v_2_2 + softmax_2_3 * meta.v_3_2 + softmax_2_4 * meta.v_4_2 + softmax_2_5 * meta.v_5_2 + softmax_2_6 * meta.v_6_2 + softmax_2_7 * meta.v_7_2;
        hdr.s1_output0_calc.s1_output_3_0 = softmax_3_0 * meta.v_0_0 + softmax_3_1 * meta.v_1_0 + softmax_3_2 * meta.v_2_0 + softmax_3_3 * meta.v_3_0 + softmax_3_4 * meta.v_4_0 + softmax_3_5 * meta.v_5_0 + softmax_3_6 * meta.v_6_0 + softmax_3_7 * meta.v_7_0;
        hdr.s1_output0_calc.s1_output_3_1 = softmax_3_0 * meta.v_0_1 + softmax_3_1 * meta.v_1_1 + softmax_3_2 * meta.v_2_1 + softmax_3_3 * meta.v_3_1 + softmax_3_4 * meta.v_4_1 + softmax_3_5 * meta.v_5_1 + softmax_3_6 * meta.v_6_1 + softmax_3_7 * meta.v_7_1;
        hdr.s1_output0_calc.s1_output_3_2 = softmax_3_0 * meta.v_0_2 + softmax_3_1 * meta.v_1_2 + softmax_3_2 * meta.v_2_2 + softmax_3_3 * meta.v_3_2 + softmax_3_4 * meta.v_4_2 + softmax_3_5 * meta.v_5_2 + softmax_3_6 * meta.v_6_2 + softmax_3_7 * meta.v_7_2;
        hdr.s1_output0_calc.s1_output_4_0 = softmax_4_0 * meta.v_0_0 + softmax_4_1 * meta.v_1_0 + softmax_4_2 * meta.v_2_0 + softmax_4_3 * meta.v_3_0 + softmax_4_4 * meta.v_4_0 + softmax_4_5 * meta.v_5_0 + softmax_4_6 * meta.v_6_0 + softmax_4_7 * meta.v_7_0;
        hdr.s1_output0_calc.s1_output_4_1 = softmax_4_0 * meta.v_0_1 + softmax_4_1 * meta.v_1_1 + softmax_4_2 * meta.v_2_1 + softmax_4_3 * meta.v_3_1 + softmax_4_4 * meta.v_4_1 + softmax_4_5 * meta.v_5_1 + softmax_4_6 * meta.v_6_1 + softmax_4_7 * meta.v_7_1;
        hdr.s1_output0_calc.s1_output_4_2 = softmax_4_0 * meta.v_0_2 + softmax_4_1 * meta.v_1_2 + softmax_4_2 * meta.v_2_2 + softmax_4_3 * meta.v_3_2 + softmax_4_4 * meta.v_4_2 + softmax_4_5 * meta.v_5_2 + softmax_4_6 * meta.v_6_2 + softmax_4_7 * meta.v_7_2;
        hdr.s1_output0_calc.s1_output_5_0 = softmax_5_0 * meta.v_0_0 + softmax_5_1 * meta.v_1_0 + softmax_5_2 * meta.v_2_0 + softmax_5_3 * meta.v_3_0 + softmax_5_4 * meta.v_4_0 + softmax_5_5 * meta.v_5_0 + softmax_5_6 * meta.v_6_0 + softmax_5_7 * meta.v_7_0;
        hdr.s1_output0_calc.s1_output_5_1 = softmax_5_0 * meta.v_0_1 + softmax_5_1 * meta.v_1_1 + softmax_5_2 * meta.v_2_1 + softmax_5_3 * meta.v_3_1 + softmax_5_4 * meta.v_4_1 + softmax_5_5 * meta.v_5_1 + softmax_5_6 * meta.v_6_1 + softmax_5_7 * meta.v_7_1;
        hdr.s1_output0_calc.s1_output_5_2 = softmax_5_0 * meta.v_0_2 + softmax_5_1 * meta.v_1_2 + softmax_5_2 * meta.v_2_2 + softmax_5_3 * meta.v_3_2 + softmax_5_4 * meta.v_4_2 + softmax_5_5 * meta.v_5_2 + softmax_5_6 * meta.v_6_2 + softmax_5_7 * meta.v_7_2;
        hdr.s1_output0_calc.s1_output_6_0 = softmax_6_0 * meta.v_0_0 + softmax_6_1 * meta.v_1_0 + softmax_6_2 * meta.v_2_0 + softmax_6_3 * meta.v_3_0 + softmax_6_4 * meta.v_4_0 + softmax_6_5 * meta.v_5_0 + softmax_6_6 * meta.v_6_0 + softmax_6_7 * meta.v_7_0;
        hdr.s1_output0_calc.s1_output_6_1 = softmax_6_0 * meta.v_0_1 + softmax_6_1 * meta.v_1_1 + softmax_6_2 * meta.v_2_1 + softmax_6_3 * meta.v_3_1 + softmax_6_4 * meta.v_4_1 + softmax_6_5 * meta.v_5_1 + softmax_6_6 * meta.v_6_1 + softmax_6_7 * meta.v_7_1;
        hdr.s1_output0_calc.s1_output_6_2 = softmax_6_0 * meta.v_0_2 + softmax_6_1 * meta.v_1_2 + softmax_6_2 * meta.v_2_2 + softmax_6_3 * meta.v_3_2 + softmax_6_4 * meta.v_4_2 + softmax_6_5 * meta.v_5_2 + softmax_6_6 * meta.v_6_2 + softmax_6_7 * meta.v_7_2;
        hdr.s1_output0_calc.s1_output_7_0 = softmax_7_0 * meta.v_0_0 + softmax_7_1 * meta.v_1_0 + softmax_7_2 * meta.v_2_0 + softmax_7_3 * meta.v_3_0 + softmax_7_4 * meta.v_4_0 + softmax_7_5 * meta.v_5_0 + softmax_7_6 * meta.v_6_0 + softmax_7_7 * meta.v_7_0;
        hdr.s1_output0_calc.s1_output_7_1 = softmax_7_0 * meta.v_0_1 + softmax_7_1 * meta.v_1_1 + softmax_7_2 * meta.v_2_1 + softmax_7_3 * meta.v_3_1 + softmax_7_4 * meta.v_4_1 + softmax_7_5 * meta.v_5_1 + softmax_7_6 * meta.v_6_1 + softmax_7_7 * meta.v_7_1;
        hdr.s1_output0_calc.s1_output_7_2 = softmax_7_0 * meta.v_0_2 + softmax_7_1 * meta.v_1_2 + softmax_7_2 * meta.v_2_2 + softmax_7_3 * meta.v_3_2 + softmax_7_4 * meta.v_4_2 + softmax_7_5 * meta.v_5_2 + softmax_7_6 * meta.v_6_2 + softmax_7_7 * meta.v_7_2;
        
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
            table_softmax_sum_reciprocal_0.apply();
            table_softmax_sum_reciprocal_1.apply();
            table_softmax_sum_reciprocal_2.apply();
            table_softmax_sum_reciprocal_3.apply();
            table_softmax_sum_reciprocal_4.apply();
            table_softmax_sum_reciprocal_5.apply();
            table_softmax_sum_reciprocal_6.apply();
            table_softmax_sum_reciprocal_7.apply();

            cal_mul_v();
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