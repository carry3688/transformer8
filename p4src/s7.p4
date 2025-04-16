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

// 第0列
const bit<32> w1_0_0 = 0xFFFFFFDD;
const bit<32> w1_0_1 = 0x00000024;
const bit<32> w1_0_2 = 0x00000042;
const bit<32> w1_0_3 = 0x0000003A;
const bit<32> w1_0_4 = 0x00000092;
const bit<32> w1_0_5 = 0x00000032;

// 第1列
const bit<32> w1_1_0 = 0x0000007A;
const bit<32> w1_1_1 = 0xFFFFFFAB;
const bit<32> w1_1_2 = 0xFFFFFF2D;
const bit<32> w1_1_3 = 0xFFFFFFE8;
const bit<32> w1_1_4 = 0xFFFFFF88;
const bit<32> w1_1_5 = 0x0000006C;

// 第2列
const bit<32> w1_2_0 = 0xFFFFFF24;
const bit<32> w1_2_1 = 0xFFFFFF7B;
const bit<32> w1_2_2 = 0x00000080;
const bit<32> w1_2_3 = 0x000000CF;
const bit<32> w1_2_4 = 0x00000015;
const bit<32> w1_2_5 = 0xFFFFFF4B;

// 第3列
const bit<32> w1_3_0 = 0x00000054;
const bit<32> w1_3_1 = 0x00000048;
const bit<32> w1_3_2 = 0xFFFFFFE5;
const bit<32> w1_3_3 = 0xFFFFFF45;
const bit<32> w1_3_4 = 0xFFFFFFCB;
const bit<32> w1_3_5 = 0x00000022;

// 第4列
const bit<32> w1_4_0 = 0xFFFFFFE0;
const bit<32> w1_4_1 = 0xFFFFFFC1;
const bit<32> w1_4_2 = 0x0000004A;
const bit<32> w1_4_3 = 0x00000073;
const bit<32> w1_4_4 = 0x00000085;
const bit<32> w1_4_5 = 0xFFFFFFBB;

// 第5列
const bit<32> w1_5_0 = 0x000000AB;
const bit<32> w1_5_1 = 0x0000006D;
const bit<32> w1_5_2 = 0xFFFFFF52;
const bit<32> w1_5_3 = 0xFFFFFF8D;
const bit<32> w1_5_4 = 0xFFFFFF48;
const bit<32> w1_5_5 = 0x00000080;

const bit<16> b1_0 = 0x0067;
const bit<16> b1_1 = 0x001B;
const bit<16> b1_2 = 0x0047;
const bit<16> b1_3 = 0x000A;
const bit<16> b1_4 = 0xFFEE;
const bit<16> b1_5 = 0x0078;

const bit<32> w2_0_0 = 0xFFFFFF6F;
const bit<32> w2_1_0 = 0x00000075;
const bit<32> w2_2_0 = 0xFFFFFF4C;
const bit<32> w2_3_0 = 0xFFFFFF6A;
const bit<32> w2_4_0 = 0xFFFFFF2B;
const bit<32> w2_5_0 = 0x00000064;

const bit<16> b_reduce = 0xFFEB;


header feature_t {
    bit<16> feature_0;
    bit<16> feature_1;
    bit<16> feature_2;
    bit<16> feature_3;
    bit<16> feature_4;
    bit<16> feature_5;
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
    bit<16> s7_before_sigmoid_0;
    bit<16> s7_before_sigmoid_1;
    bit<16> s7_before_sigmoid_2;
    bit<16> s7_before_sigmoid_3;
    bit<16> s7_before_sigmoid_4;
    bit<16> s7_before_sigmoid_5;
    bit<16> s7_before_sigmoid_6;
    bit<16> s7_before_sigmoid_7;

    bit<16> s7_output_0;
    bit<16> s7_output_1;
    bit<16> s7_output_2;
    bit<16> s7_output_3;
    bit<16> s7_output_4;
    bit<16> s7_output_5;
    bit<16> s7_output_6;
    bit<16> s7_output_7;
}

struct headers {
    ethernet_t   ethernet;
    feature_t       feature;
    p4calc_t     p4calc;
    s0_output0_calc_t s0_output0_calc;
    s1_output0_calc_t s1_output0_calc;
    s7_output0_calc_t s7_output0_calc;
}

struct ingress_metadata_t {
}

struct metadata {
    bit<16> result_0_0;
    bit<16> result_0_1;
    bit<16> result_0_2;
    bit<16> result_0_3;
    bit<16> result_0_4;
    bit<16> result_0_5;

    bit<16> result_1_0;
    bit<16> result_1_1;
    bit<16> result_1_2;
    bit<16> result_1_3;
    bit<16> result_1_4;
    bit<16> result_1_5;

    bit<16> result_2_0;
    bit<16> result_2_1;
    bit<16> result_2_2;
    bit<16> result_2_3;
    bit<16> result_2_4;
    bit<16> result_2_5;

    bit<16> result_3_0;
    bit<16> result_3_1;
    bit<16> result_3_2;
    bit<16> result_3_3;
    bit<16> result_3_4;
    bit<16> result_3_5;

    bit<16> result_4_0;
    bit<16> result_4_1;
    bit<16> result_4_2;
    bit<16> result_4_3;
    bit<16> result_4_4;
    bit<16> result_4_5;

    bit<16> result_5_0;
    bit<16> result_5_1;
    bit<16> result_5_2;
    bit<16> result_5_3;
    bit<16> result_5_4;
    bit<16> result_5_5;

    bit<16> result_6_0;
    bit<16> result_6_1;
    bit<16> result_6_2;
    bit<16> result_6_3;
    bit<16> result_6_4;
    bit<16> result_6_5;

    bit<16> result_7_0;
    bit<16> result_7_1;
    bit<16> result_7_2;
    bit<16> result_7_3;
    bit<16> result_7_4;
    bit<16> result_7_5;

    // 存储sigmoid函数前的输入
    bit<16> result16_0;
    bit<16> result16_1;
    bit<16> result16_2;
    bit<16> result16_3;
    bit<16> result16_4;
    bit<16> result16_5;
    bit<16> result16_6;
    bit<16> result16_7;
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
            P4CALC_ETYPE : parse_feature;
            default      : accept;
        }
    }

    state parse_feature {
        packet.extract(hdr.feature);
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

    // 丢弃
    action operation_drop() {
        mark_to_drop(standard_metadata);
    }

    // 全连接层1，8*6先flatten成1*48，线性变换变成1*32并做relu激活
    action operation_linear1() {
        bit<32> s6_output_0_0 = (bit<32>) hdr.s0_output0_calc.s0_output_0_0 | (((hdr.s0_output0_calc.s0_output_0_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_0_1 = (bit<32>) hdr.s0_output0_calc.s0_output_0_1 | (((hdr.s0_output0_calc.s0_output_0_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_0_2 = (bit<32>) hdr.s0_output0_calc.s0_output_0_2 | (((hdr.s0_output0_calc.s0_output_0_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_0_3 = (bit<32>) hdr.s0_output0_calc.s0_output_0_3 | (((hdr.s0_output0_calc.s0_output_0_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_0_4 = (bit<32>) hdr.s0_output0_calc.s0_output_0_4 | (((hdr.s0_output0_calc.s0_output_0_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_0_5 = (bit<32>) hdr.s0_output0_calc.s0_output_0_5 | (((hdr.s0_output0_calc.s0_output_0_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_1_0 = (bit<32>) hdr.s0_output0_calc.s0_output_1_0 | (((hdr.s0_output0_calc.s0_output_1_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_1_1 = (bit<32>) hdr.s0_output0_calc.s0_output_1_1 | (((hdr.s0_output0_calc.s0_output_1_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_1_2 = (bit<32>) hdr.s0_output0_calc.s0_output_1_2 | (((hdr.s0_output0_calc.s0_output_1_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_1_3 = (bit<32>) hdr.s0_output0_calc.s0_output_1_3 | (((hdr.s0_output0_calc.s0_output_1_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_1_4 = (bit<32>) hdr.s0_output0_calc.s0_output_1_4 | (((hdr.s0_output0_calc.s0_output_1_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_1_5 = (bit<32>) hdr.s0_output0_calc.s0_output_1_5 | (((hdr.s0_output0_calc.s0_output_1_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_2_0 = (bit<32>) hdr.s0_output0_calc.s0_output_2_0 | (((hdr.s0_output0_calc.s0_output_2_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_2_1 = (bit<32>) hdr.s0_output0_calc.s0_output_2_1 | (((hdr.s0_output0_calc.s0_output_2_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_2_2 = (bit<32>) hdr.s0_output0_calc.s0_output_2_2 | (((hdr.s0_output0_calc.s0_output_2_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_2_3 = (bit<32>) hdr.s0_output0_calc.s0_output_2_3 | (((hdr.s0_output0_calc.s0_output_2_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_2_4 = (bit<32>) hdr.s0_output0_calc.s0_output_2_4 | (((hdr.s0_output0_calc.s0_output_2_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_2_5 = (bit<32>) hdr.s0_output0_calc.s0_output_2_5 | (((hdr.s0_output0_calc.s0_output_2_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_3_0 = (bit<32>) hdr.s0_output0_calc.s0_output_3_0 | (((hdr.s0_output0_calc.s0_output_3_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_3_1 = (bit<32>) hdr.s0_output0_calc.s0_output_3_1 | (((hdr.s0_output0_calc.s0_output_3_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_3_2 = (bit<32>) hdr.s0_output0_calc.s0_output_3_2 | (((hdr.s0_output0_calc.s0_output_3_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_3_3 = (bit<32>) hdr.s0_output0_calc.s0_output_3_3 | (((hdr.s0_output0_calc.s0_output_3_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_3_4 = (bit<32>) hdr.s0_output0_calc.s0_output_3_4 | (((hdr.s0_output0_calc.s0_output_3_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_3_5 = (bit<32>) hdr.s0_output0_calc.s0_output_3_5 | (((hdr.s0_output0_calc.s0_output_3_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_4_0 = (bit<32>) hdr.s0_output0_calc.s0_output_4_0 | (((hdr.s0_output0_calc.s0_output_4_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_4_1 = (bit<32>) hdr.s0_output0_calc.s0_output_4_1 | (((hdr.s0_output0_calc.s0_output_4_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_4_2 = (bit<32>) hdr.s0_output0_calc.s0_output_4_2 | (((hdr.s0_output0_calc.s0_output_4_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_4_3 = (bit<32>) hdr.s0_output0_calc.s0_output_4_3 | (((hdr.s0_output0_calc.s0_output_4_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_4_4 = (bit<32>) hdr.s0_output0_calc.s0_output_4_4 | (((hdr.s0_output0_calc.s0_output_4_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_4_5 = (bit<32>) hdr.s0_output0_calc.s0_output_4_5 | (((hdr.s0_output0_calc.s0_output_4_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_5_0 = (bit<32>) hdr.s0_output0_calc.s0_output_5_0 | (((hdr.s0_output0_calc.s0_output_5_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_5_1 = (bit<32>) hdr.s0_output0_calc.s0_output_5_1 | (((hdr.s0_output0_calc.s0_output_5_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_5_2 = (bit<32>) hdr.s0_output0_calc.s0_output_5_2 | (((hdr.s0_output0_calc.s0_output_5_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_5_3 = (bit<32>) hdr.s0_output0_calc.s0_output_5_3 | (((hdr.s0_output0_calc.s0_output_5_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_5_4 = (bit<32>) hdr.s0_output0_calc.s0_output_5_4 | (((hdr.s0_output0_calc.s0_output_5_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_5_5 = (bit<32>) hdr.s0_output0_calc.s0_output_5_5 | (((hdr.s0_output0_calc.s0_output_5_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_6_0 = (bit<32>) hdr.s0_output0_calc.s0_output_6_0 | (((hdr.s0_output0_calc.s0_output_6_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_6_1 = (bit<32>) hdr.s0_output0_calc.s0_output_6_1 | (((hdr.s0_output0_calc.s0_output_6_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_6_2 = (bit<32>) hdr.s0_output0_calc.s0_output_6_2 | (((hdr.s0_output0_calc.s0_output_6_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_6_3 = (bit<32>) hdr.s0_output0_calc.s0_output_6_3 | (((hdr.s0_output0_calc.s0_output_6_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_6_4 = (bit<32>) hdr.s0_output0_calc.s0_output_6_4 | (((hdr.s0_output0_calc.s0_output_6_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_6_5 = (bit<32>) hdr.s0_output0_calc.s0_output_6_5 | (((hdr.s0_output0_calc.s0_output_6_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_7_0 = (bit<32>) hdr.s0_output0_calc.s0_output_7_0 | (((hdr.s0_output0_calc.s0_output_7_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_7_1 = (bit<32>) hdr.s0_output0_calc.s0_output_7_1 | (((hdr.s0_output0_calc.s0_output_7_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_7_2 = (bit<32>) hdr.s0_output0_calc.s0_output_7_2 | (((hdr.s0_output0_calc.s0_output_7_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_7_3 = (bit<32>) hdr.s0_output0_calc.s0_output_7_3 | (((hdr.s0_output0_calc.s0_output_7_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_7_4 = (bit<32>) hdr.s0_output0_calc.s0_output_7_4 | (((hdr.s0_output0_calc.s0_output_7_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s6_output_7_5 = (bit<32>) hdr.s0_output0_calc.s0_output_7_5 | (((hdr.s0_output0_calc.s0_output_7_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
                
        // 线性变换->1*32
        meta.result_0_0 = (s6_output_0_0 * w1_0_0 + s6_output_0_1 * w1_1_0 + s6_output_0_2 * w1_2_0 + s6_output_0_3 * w1_3_0 + s6_output_0_4 * w1_4_0 + s6_output_0_5 * w1_5_0)[23:8] + b1_0;
        meta.result_0_1 = (s6_output_0_0 * w1_0_1 + s6_output_0_1 * w1_1_1 + s6_output_0_2 * w1_2_1 + s6_output_0_3 * w1_3_1 + s6_output_0_4 * w1_4_1 + s6_output_0_5 * w1_5_1)[23:8] + b1_1;
        meta.result_0_2 = (s6_output_0_0 * w1_0_2 + s6_output_0_1 * w1_1_2 + s6_output_0_2 * w1_2_2 + s6_output_0_3 * w1_3_2 + s6_output_0_4 * w1_4_2 + s6_output_0_5 * w1_5_2)[23:8] + b1_2;
        meta.result_0_3 = (s6_output_0_0 * w1_0_3 + s6_output_0_1 * w1_1_3 + s6_output_0_2 * w1_2_3 + s6_output_0_3 * w1_3_3 + s6_output_0_4 * w1_4_3 + s6_output_0_5 * w1_5_3)[23:8] + b1_3;
        meta.result_0_4 = (s6_output_0_0 * w1_0_4 + s6_output_0_1 * w1_1_4 + s6_output_0_2 * w1_2_4 + s6_output_0_3 * w1_3_4 + s6_output_0_4 * w1_4_4 + s6_output_0_5 * w1_5_4)[23:8] + b1_4;
        meta.result_0_5 = (s6_output_0_0 * w1_0_5 + s6_output_0_1 * w1_1_5 + s6_output_0_2 * w1_2_5 + s6_output_0_3 * w1_3_5 + s6_output_0_4 * w1_4_5 + s6_output_0_5 * w1_5_5)[23:8] + b1_5;
        meta.result_1_0 = (s6_output_1_0 * w1_0_0 + s6_output_1_1 * w1_1_0 + s6_output_1_2 * w1_2_0 + s6_output_1_3 * w1_3_0 + s6_output_1_4 * w1_4_0 + s6_output_1_5 * w1_5_0)[23:8] + b1_0;
        meta.result_1_1 = (s6_output_1_0 * w1_0_1 + s6_output_1_1 * w1_1_1 + s6_output_1_2 * w1_2_1 + s6_output_1_3 * w1_3_1 + s6_output_1_4 * w1_4_1 + s6_output_1_5 * w1_5_1)[23:8] + b1_1;
        meta.result_1_2 = (s6_output_1_0 * w1_0_2 + s6_output_1_1 * w1_1_2 + s6_output_1_2 * w1_2_2 + s6_output_1_3 * w1_3_2 + s6_output_1_4 * w1_4_2 + s6_output_1_5 * w1_5_2)[23:8] + b1_2;
        meta.result_1_3 = (s6_output_1_0 * w1_0_3 + s6_output_1_1 * w1_1_3 + s6_output_1_2 * w1_2_3 + s6_output_1_3 * w1_3_3 + s6_output_1_4 * w1_4_3 + s6_output_1_5 * w1_5_3)[23:8] + b1_3;
        meta.result_1_4 = (s6_output_1_0 * w1_0_4 + s6_output_1_1 * w1_1_4 + s6_output_1_2 * w1_2_4 + s6_output_1_3 * w1_3_4 + s6_output_1_4 * w1_4_4 + s6_output_1_5 * w1_5_4)[23:8] + b1_4;
        meta.result_1_5 = (s6_output_1_0 * w1_0_5 + s6_output_1_1 * w1_1_5 + s6_output_1_2 * w1_2_5 + s6_output_1_3 * w1_3_5 + s6_output_1_4 * w1_4_5 + s6_output_1_5 * w1_5_5)[23:8] + b1_5;
        meta.result_2_0 = (s6_output_2_0 * w1_0_0 + s6_output_2_1 * w1_1_0 + s6_output_2_2 * w1_2_0 + s6_output_2_3 * w1_3_0 + s6_output_2_4 * w1_4_0 + s6_output_2_5 * w1_5_0)[23:8] + b1_0;
        meta.result_2_1 = (s6_output_2_0 * w1_0_1 + s6_output_2_1 * w1_1_1 + s6_output_2_2 * w1_2_1 + s6_output_2_3 * w1_3_1 + s6_output_2_4 * w1_4_1 + s6_output_2_5 * w1_5_1)[23:8] + b1_1;
        meta.result_2_2 = (s6_output_2_0 * w1_0_2 + s6_output_2_1 * w1_1_2 + s6_output_2_2 * w1_2_2 + s6_output_2_3 * w1_3_2 + s6_output_2_4 * w1_4_2 + s6_output_2_5 * w1_5_2)[23:8] + b1_2;
        meta.result_2_3 = (s6_output_2_0 * w1_0_3 + s6_output_2_1 * w1_1_3 + s6_output_2_2 * w1_2_3 + s6_output_2_3 * w1_3_3 + s6_output_2_4 * w1_4_3 + s6_output_2_5 * w1_5_3)[23:8] + b1_3;
        meta.result_2_4 = (s6_output_2_0 * w1_0_4 + s6_output_2_1 * w1_1_4 + s6_output_2_2 * w1_2_4 + s6_output_2_3 * w1_3_4 + s6_output_2_4 * w1_4_4 + s6_output_2_5 * w1_5_4)[23:8] + b1_4;
        meta.result_2_5 = (s6_output_2_0 * w1_0_5 + s6_output_2_1 * w1_1_5 + s6_output_2_2 * w1_2_5 + s6_output_2_3 * w1_3_5 + s6_output_2_4 * w1_4_5 + s6_output_2_5 * w1_5_5)[23:8] + b1_5;
        meta.result_3_0 = (s6_output_3_0 * w1_0_0 + s6_output_3_1 * w1_1_0 + s6_output_3_2 * w1_2_0 + s6_output_3_3 * w1_3_0 + s6_output_3_4 * w1_4_0 + s6_output_3_5 * w1_5_0)[23:8] + b1_0;
        meta.result_3_1 = (s6_output_3_0 * w1_0_1 + s6_output_3_1 * w1_1_1 + s6_output_3_2 * w1_2_1 + s6_output_3_3 * w1_3_1 + s6_output_3_4 * w1_4_1 + s6_output_3_5 * w1_5_1)[23:8] + b1_1;
        meta.result_3_2 = (s6_output_3_0 * w1_0_2 + s6_output_3_1 * w1_1_2 + s6_output_3_2 * w1_2_2 + s6_output_3_3 * w1_3_2 + s6_output_3_4 * w1_4_2 + s6_output_3_5 * w1_5_2)[23:8] + b1_2;
        meta.result_3_3 = (s6_output_3_0 * w1_0_3 + s6_output_3_1 * w1_1_3 + s6_output_3_2 * w1_2_3 + s6_output_3_3 * w1_3_3 + s6_output_3_4 * w1_4_3 + s6_output_3_5 * w1_5_3)[23:8] + b1_3;
        meta.result_3_4 = (s6_output_3_0 * w1_0_4 + s6_output_3_1 * w1_1_4 + s6_output_3_2 * w1_2_4 + s6_output_3_3 * w1_3_4 + s6_output_3_4 * w1_4_4 + s6_output_3_5 * w1_5_4)[23:8] + b1_4;
        meta.result_3_5 = (s6_output_3_0 * w1_0_5 + s6_output_3_1 * w1_1_5 + s6_output_3_2 * w1_2_5 + s6_output_3_3 * w1_3_5 + s6_output_3_4 * w1_4_5 + s6_output_3_5 * w1_5_5)[23:8] + b1_5;
        meta.result_4_0 = (s6_output_4_0 * w1_0_0 + s6_output_4_1 * w1_1_0 + s6_output_4_2 * w1_2_0 + s6_output_4_3 * w1_3_0 + s6_output_4_4 * w1_4_0 + s6_output_4_5 * w1_5_0)[23:8] + b1_0;
        meta.result_4_1 = (s6_output_4_0 * w1_0_1 + s6_output_4_1 * w1_1_1 + s6_output_4_2 * w1_2_1 + s6_output_4_3 * w1_3_1 + s6_output_4_4 * w1_4_1 + s6_output_4_5 * w1_5_1)[23:8] + b1_1;
        meta.result_4_2 = (s6_output_4_0 * w1_0_2 + s6_output_4_1 * w1_1_2 + s6_output_4_2 * w1_2_2 + s6_output_4_3 * w1_3_2 + s6_output_4_4 * w1_4_2 + s6_output_4_5 * w1_5_2)[23:8] + b1_2;
        meta.result_4_3 = (s6_output_4_0 * w1_0_3 + s6_output_4_1 * w1_1_3 + s6_output_4_2 * w1_2_3 + s6_output_4_3 * w1_3_3 + s6_output_4_4 * w1_4_3 + s6_output_4_5 * w1_5_3)[23:8] + b1_3;
        meta.result_4_4 = (s6_output_4_0 * w1_0_4 + s6_output_4_1 * w1_1_4 + s6_output_4_2 * w1_2_4 + s6_output_4_3 * w1_3_4 + s6_output_4_4 * w1_4_4 + s6_output_4_5 * w1_5_4)[23:8] + b1_4;
        meta.result_4_5 = (s6_output_4_0 * w1_0_5 + s6_output_4_1 * w1_1_5 + s6_output_4_2 * w1_2_5 + s6_output_4_3 * w1_3_5 + s6_output_4_4 * w1_4_5 + s6_output_4_5 * w1_5_5)[23:8] + b1_5;
        meta.result_5_0 = (s6_output_5_0 * w1_0_0 + s6_output_5_1 * w1_1_0 + s6_output_5_2 * w1_2_0 + s6_output_5_3 * w1_3_0 + s6_output_5_4 * w1_4_0 + s6_output_5_5 * w1_5_0)[23:8] + b1_0;
        meta.result_5_1 = (s6_output_5_0 * w1_0_1 + s6_output_5_1 * w1_1_1 + s6_output_5_2 * w1_2_1 + s6_output_5_3 * w1_3_1 + s6_output_5_4 * w1_4_1 + s6_output_5_5 * w1_5_1)[23:8] + b1_1;
        meta.result_5_2 = (s6_output_5_0 * w1_0_2 + s6_output_5_1 * w1_1_2 + s6_output_5_2 * w1_2_2 + s6_output_5_3 * w1_3_2 + s6_output_5_4 * w1_4_2 + s6_output_5_5 * w1_5_2)[23:8] + b1_2;
        meta.result_5_3 = (s6_output_5_0 * w1_0_3 + s6_output_5_1 * w1_1_3 + s6_output_5_2 * w1_2_3 + s6_output_5_3 * w1_3_3 + s6_output_5_4 * w1_4_3 + s6_output_5_5 * w1_5_3)[23:8] + b1_3;
        meta.result_5_4 = (s6_output_5_0 * w1_0_4 + s6_output_5_1 * w1_1_4 + s6_output_5_2 * w1_2_4 + s6_output_5_3 * w1_3_4 + s6_output_5_4 * w1_4_4 + s6_output_5_5 * w1_5_4)[23:8] + b1_4;
        meta.result_5_5 = (s6_output_5_0 * w1_0_5 + s6_output_5_1 * w1_1_5 + s6_output_5_2 * w1_2_5 + s6_output_5_3 * w1_3_5 + s6_output_5_4 * w1_4_5 + s6_output_5_5 * w1_5_5)[23:8] + b1_5;
        meta.result_6_0 = (s6_output_6_0 * w1_0_0 + s6_output_6_1 * w1_1_0 + s6_output_6_2 * w1_2_0 + s6_output_6_3 * w1_3_0 + s6_output_6_4 * w1_4_0 + s6_output_6_5 * w1_5_0)[23:8] + b1_0;
        meta.result_6_1 = (s6_output_6_0 * w1_0_1 + s6_output_6_1 * w1_1_1 + s6_output_6_2 * w1_2_1 + s6_output_6_3 * w1_3_1 + s6_output_6_4 * w1_4_1 + s6_output_6_5 * w1_5_1)[23:8] + b1_1;
        meta.result_6_2 = (s6_output_6_0 * w1_0_2 + s6_output_6_1 * w1_1_2 + s6_output_6_2 * w1_2_2 + s6_output_6_3 * w1_3_2 + s6_output_6_4 * w1_4_2 + s6_output_6_5 * w1_5_2)[23:8] + b1_2;
        meta.result_6_3 = (s6_output_6_0 * w1_0_3 + s6_output_6_1 * w1_1_3 + s6_output_6_2 * w1_2_3 + s6_output_6_3 * w1_3_3 + s6_output_6_4 * w1_4_3 + s6_output_6_5 * w1_5_3)[23:8] + b1_3;
        meta.result_6_4 = (s6_output_6_0 * w1_0_4 + s6_output_6_1 * w1_1_4 + s6_output_6_2 * w1_2_4 + s6_output_6_3 * w1_3_4 + s6_output_6_4 * w1_4_4 + s6_output_6_5 * w1_5_4)[23:8] + b1_4;
        meta.result_6_5 = (s6_output_6_0 * w1_0_5 + s6_output_6_1 * w1_1_5 + s6_output_6_2 * w1_2_5 + s6_output_6_3 * w1_3_5 + s6_output_6_4 * w1_4_5 + s6_output_6_5 * w1_5_5)[23:8] + b1_5;
        meta.result_7_0 = (s6_output_7_0 * w1_0_0 + s6_output_7_1 * w1_1_0 + s6_output_7_2 * w1_2_0 + s6_output_7_3 * w1_3_0 + s6_output_7_4 * w1_4_0 + s6_output_7_5 * w1_5_0)[23:8] + b1_0;
        meta.result_7_1 = (s6_output_7_0 * w1_0_1 + s6_output_7_1 * w1_1_1 + s6_output_7_2 * w1_2_1 + s6_output_7_3 * w1_3_1 + s6_output_7_4 * w1_4_1 + s6_output_7_5 * w1_5_1)[23:8] + b1_1;
        meta.result_7_2 = (s6_output_7_0 * w1_0_2 + s6_output_7_1 * w1_1_2 + s6_output_7_2 * w1_2_2 + s6_output_7_3 * w1_3_2 + s6_output_7_4 * w1_4_2 + s6_output_7_5 * w1_5_2)[23:8] + b1_2;
        meta.result_7_3 = (s6_output_7_0 * w1_0_3 + s6_output_7_1 * w1_1_3 + s6_output_7_2 * w1_2_3 + s6_output_7_3 * w1_3_3 + s6_output_7_4 * w1_4_3 + s6_output_7_5 * w1_5_3)[23:8] + b1_3;
        meta.result_7_4 = (s6_output_7_0 * w1_0_4 + s6_output_7_1 * w1_1_4 + s6_output_7_2 * w1_2_4 + s6_output_7_3 * w1_3_4 + s6_output_7_4 * w1_4_4 + s6_output_7_5 * w1_5_4)[23:8] + b1_4;
        meta.result_7_5 = (s6_output_7_0 * w1_0_5 + s6_output_7_1 * w1_1_5 + s6_output_7_2 * w1_2_5 + s6_output_7_3 * w1_3_5 + s6_output_7_4 * w1_4_5 + s6_output_7_5 * w1_5_5)[23:8] + b1_5;
            
       
        const bit<16> zero = 0x0;
        meta.result_0_0 = ((meta.result_0_0 & 0x8000) != 0) ? zero : meta.result_0_0;
        meta.result_0_1 = ((meta.result_0_1 & 0x8000) != 0) ? zero : meta.result_0_1;
        meta.result_0_2 = ((meta.result_0_2 & 0x8000) != 0) ? zero : meta.result_0_2;
        meta.result_0_3 = ((meta.result_0_3 & 0x8000) != 0) ? zero : meta.result_0_3;
        meta.result_0_4 = ((meta.result_0_4 & 0x8000) != 0) ? zero : meta.result_0_4;
        meta.result_0_5 = ((meta.result_0_5 & 0x8000) != 0) ? zero : meta.result_0_5;
        meta.result_1_0 = ((meta.result_1_0 & 0x8000) != 0) ? zero : meta.result_1_0;
        meta.result_1_1 = ((meta.result_1_1 & 0x8000) != 0) ? zero : meta.result_1_1;
        meta.result_1_2 = ((meta.result_1_2 & 0x8000) != 0) ? zero : meta.result_1_2;
        meta.result_1_3 = ((meta.result_1_3 & 0x8000) != 0) ? zero : meta.result_1_3;
        meta.result_1_4 = ((meta.result_1_4 & 0x8000) != 0) ? zero : meta.result_1_4;
        meta.result_1_5 = ((meta.result_1_5 & 0x8000) != 0) ? zero : meta.result_1_5;
        meta.result_2_0 = ((meta.result_2_0 & 0x8000) != 0) ? zero : meta.result_2_0;
        meta.result_2_1 = ((meta.result_2_1 & 0x8000) != 0) ? zero : meta.result_2_1;
        meta.result_2_2 = ((meta.result_2_2 & 0x8000) != 0) ? zero : meta.result_2_2;
        meta.result_2_3 = ((meta.result_2_3 & 0x8000) != 0) ? zero : meta.result_2_3;
        meta.result_2_4 = ((meta.result_2_4 & 0x8000) != 0) ? zero : meta.result_2_4;
        meta.result_2_5 = ((meta.result_2_5 & 0x8000) != 0) ? zero : meta.result_2_5;
        meta.result_3_0 = ((meta.result_3_0 & 0x8000) != 0) ? zero : meta.result_3_0;
        meta.result_3_1 = ((meta.result_3_1 & 0x8000) != 0) ? zero : meta.result_3_1;
        meta.result_3_2 = ((meta.result_3_2 & 0x8000) != 0) ? zero : meta.result_3_2;
        meta.result_3_3 = ((meta.result_3_3 & 0x8000) != 0) ? zero : meta.result_3_3;
        meta.result_3_4 = ((meta.result_3_4 & 0x8000) != 0) ? zero : meta.result_3_4;
        meta.result_3_5 = ((meta.result_3_5 & 0x8000) != 0) ? zero : meta.result_3_5;
        meta.result_4_0 = ((meta.result_4_0 & 0x8000) != 0) ? zero : meta.result_4_0;
        meta.result_4_1 = ((meta.result_4_1 & 0x8000) != 0) ? zero : meta.result_4_1;
        meta.result_4_2 = ((meta.result_4_2 & 0x8000) != 0) ? zero : meta.result_4_2;
        meta.result_4_3 = ((meta.result_4_3 & 0x8000) != 0) ? zero : meta.result_4_3;
        meta.result_4_4 = ((meta.result_4_4 & 0x8000) != 0) ? zero : meta.result_4_4;
        meta.result_4_5 = ((meta.result_4_5 & 0x8000) != 0) ? zero : meta.result_4_5;
        meta.result_5_0 = ((meta.result_5_0 & 0x8000) != 0) ? zero : meta.result_5_0;
        meta.result_5_1 = ((meta.result_5_1 & 0x8000) != 0) ? zero : meta.result_5_1;
        meta.result_5_2 = ((meta.result_5_2 & 0x8000) != 0) ? zero : meta.result_5_2;
        meta.result_5_3 = ((meta.result_5_3 & 0x8000) != 0) ? zero : meta.result_5_3;
        meta.result_5_4 = ((meta.result_5_4 & 0x8000) != 0) ? zero : meta.result_5_4;
        meta.result_5_5 = ((meta.result_5_5 & 0x8000) != 0) ? zero : meta.result_5_5;
        meta.result_6_0 = ((meta.result_6_0 & 0x8000) != 0) ? zero : meta.result_6_0;
        meta.result_6_1 = ((meta.result_6_1 & 0x8000) != 0) ? zero : meta.result_6_1;
        meta.result_6_2 = ((meta.result_6_2 & 0x8000) != 0) ? zero : meta.result_6_2;
        meta.result_6_3 = ((meta.result_6_3 & 0x8000) != 0) ? zero : meta.result_6_3;
        meta.result_6_4 = ((meta.result_6_4 & 0x8000) != 0) ? zero : meta.result_6_4;
        meta.result_6_5 = ((meta.result_6_5 & 0x8000) != 0) ? zero : meta.result_6_5;
        meta.result_7_0 = ((meta.result_7_0 & 0x8000) != 0) ? zero : meta.result_7_0;
        meta.result_7_1 = ((meta.result_7_1 & 0x8000) != 0) ? zero : meta.result_7_1;
        meta.result_7_2 = ((meta.result_7_2 & 0x8000) != 0) ? zero : meta.result_7_2;
        meta.result_7_3 = ((meta.result_7_3 & 0x8000) != 0) ? zero : meta.result_7_3;
        meta.result_7_4 = ((meta.result_7_4 & 0x8000) != 0) ? zero : meta.result_7_4;
        meta.result_7_5 = ((meta.result_7_5 & 0x8000) != 0) ? zero : meta.result_7_5;
    }


    action operation_drop_out() {
        const bit<32> probability = 50;
        const bit<16> zero = 0;
        bit<32> hash_value;

        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_0_0}, (bit<32>)250);
        meta.result_0_0 = (hash_value > probability) ? meta.result_0_0 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_0_1}, (bit<32>)250);
        meta.result_0_1 = (hash_value > probability) ? meta.result_0_1 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_0_2}, (bit<32>)250);
        meta.result_0_2 = (hash_value > probability) ? meta.result_0_2 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_0_3}, (bit<32>)250);
        meta.result_0_3 = (hash_value > probability) ? meta.result_0_3 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_0_4}, (bit<32>)250);
        meta.result_0_4 = (hash_value > probability) ? meta.result_0_4 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_0_5}, (bit<32>)250);
        meta.result_0_5 = (hash_value > probability) ? meta.result_0_5 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_1_0}, (bit<32>)250);
        meta.result_1_0 = (hash_value > probability) ? meta.result_1_0 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_1_1}, (bit<32>)250);
        meta.result_1_1 = (hash_value > probability) ? meta.result_1_1 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_1_2}, (bit<32>)250);
        meta.result_1_2 = (hash_value > probability) ? meta.result_1_2 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_1_3}, (bit<32>)250);
        meta.result_1_3 = (hash_value > probability) ? meta.result_1_3 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_1_4}, (bit<32>)250);
        meta.result_1_4 = (hash_value > probability) ? meta.result_1_4 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_1_5}, (bit<32>)250);
        meta.result_1_5 = (hash_value > probability) ? meta.result_1_5 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_2_0}, (bit<32>)250);
        meta.result_2_0 = (hash_value > probability) ? meta.result_2_0 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_2_1}, (bit<32>)250);
        meta.result_2_1 = (hash_value > probability) ? meta.result_2_1 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_2_2}, (bit<32>)250);
        meta.result_2_2 = (hash_value > probability) ? meta.result_2_2 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_2_3}, (bit<32>)250);
        meta.result_2_3 = (hash_value > probability) ? meta.result_2_3 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_2_4}, (bit<32>)250);
        meta.result_2_4 = (hash_value > probability) ? meta.result_2_4 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_2_5}, (bit<32>)250);
        meta.result_2_5 = (hash_value > probability) ? meta.result_2_5 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_3_0}, (bit<32>)250);
        meta.result_3_0 = (hash_value > probability) ? meta.result_3_0 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_3_1}, (bit<32>)250);
        meta.result_3_1 = (hash_value > probability) ? meta.result_3_1 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_3_2}, (bit<32>)250);
        meta.result_3_2 = (hash_value > probability) ? meta.result_3_2 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_3_3}, (bit<32>)250);
        meta.result_3_3 = (hash_value > probability) ? meta.result_3_3 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_3_4}, (bit<32>)250);
        meta.result_3_4 = (hash_value > probability) ? meta.result_3_4 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_3_5}, (bit<32>)250);
        meta.result_3_5 = (hash_value > probability) ? meta.result_3_5 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_4_0}, (bit<32>)250);
        meta.result_4_0 = (hash_value > probability) ? meta.result_4_0 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_4_1}, (bit<32>)250);
        meta.result_4_1 = (hash_value > probability) ? meta.result_4_1 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_4_2}, (bit<32>)250);
        meta.result_4_2 = (hash_value > probability) ? meta.result_4_2 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_4_3}, (bit<32>)250);
        meta.result_4_3 = (hash_value > probability) ? meta.result_4_3 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_4_4}, (bit<32>)250);
        meta.result_4_4 = (hash_value > probability) ? meta.result_4_4 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_4_5}, (bit<32>)250);
        meta.result_4_5 = (hash_value > probability) ? meta.result_4_5 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_5_0}, (bit<32>)250);
        meta.result_5_0 = (hash_value > probability) ? meta.result_5_0 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_5_1}, (bit<32>)250);
        meta.result_5_1 = (hash_value > probability) ? meta.result_5_1 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_5_2}, (bit<32>)250);
        meta.result_5_2 = (hash_value > probability) ? meta.result_5_2 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_5_3}, (bit<32>)250);
        meta.result_5_3 = (hash_value > probability) ? meta.result_5_3 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_5_4}, (bit<32>)250);
        meta.result_5_4 = (hash_value > probability) ? meta.result_5_4 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_5_5}, (bit<32>)250);
        meta.result_5_5 = (hash_value > probability) ? meta.result_5_5 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_6_0}, (bit<32>)250);
        meta.result_6_0 = (hash_value > probability) ? meta.result_6_0 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_6_1}, (bit<32>)250);
        meta.result_6_1 = (hash_value > probability) ? meta.result_6_1 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_6_2}, (bit<32>)250);
        meta.result_6_2 = (hash_value > probability) ? meta.result_6_2 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_6_3}, (bit<32>)250);
        meta.result_6_3 = (hash_value > probability) ? meta.result_6_3 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_6_4}, (bit<32>)250);
        meta.result_6_4 = (hash_value > probability) ? meta.result_6_4 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_6_5}, (bit<32>)250);
        meta.result_6_5 = (hash_value > probability) ? meta.result_6_5 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_7_0}, (bit<32>)250);
        meta.result_7_0 = (hash_value > probability) ? meta.result_7_0 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_7_1}, (bit<32>)250);
        meta.result_7_1 = (hash_value > probability) ? meta.result_7_1 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_7_2}, (bit<32>)250);
        meta.result_7_2 = (hash_value > probability) ? meta.result_7_2 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_7_3}, (bit<32>)250);
        meta.result_7_3 = (hash_value > probability) ? meta.result_7_3 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_7_4}, (bit<32>)250);
        meta.result_7_4 = (hash_value > probability) ? meta.result_7_4 : zero;
        hash(hash_value, HashAlgorithm.crc16, (bit<32>)0, {meta.result_7_5}, (bit<32>)250);
        meta.result_7_5 = (hash_value > probability) ? meta.result_7_5 : zero;
    }

    action operation_linear2() {
        bit<32> result_0_0 = (bit<32>) meta.result_0_0 | (((meta.result_0_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_0_1 = (bit<32>) meta.result_0_1 | (((meta.result_0_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_0_2 = (bit<32>) meta.result_0_2 | (((meta.result_0_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_0_3 = (bit<32>) meta.result_0_3 | (((meta.result_0_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_0_4 = (bit<32>) meta.result_0_4 | (((meta.result_0_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_0_5 = (bit<32>) meta.result_0_5 | (((meta.result_0_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_1_0 = (bit<32>) meta.result_1_0 | (((meta.result_1_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_1_1 = (bit<32>) meta.result_1_1 | (((meta.result_1_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_1_2 = (bit<32>) meta.result_1_2 | (((meta.result_1_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_1_3 = (bit<32>) meta.result_1_3 | (((meta.result_1_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_1_4 = (bit<32>) meta.result_1_4 | (((meta.result_1_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_1_5 = (bit<32>) meta.result_1_5 | (((meta.result_1_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_2_0 = (bit<32>) meta.result_2_0 | (((meta.result_2_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_2_1 = (bit<32>) meta.result_2_1 | (((meta.result_2_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_2_2 = (bit<32>) meta.result_2_2 | (((meta.result_2_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_2_3 = (bit<32>) meta.result_2_3 | (((meta.result_2_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_2_4 = (bit<32>) meta.result_2_4 | (((meta.result_2_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_2_5 = (bit<32>) meta.result_2_5 | (((meta.result_2_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_3_0 = (bit<32>) meta.result_3_0 | (((meta.result_3_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_3_1 = (bit<32>) meta.result_3_1 | (((meta.result_3_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_3_2 = (bit<32>) meta.result_3_2 | (((meta.result_3_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_3_3 = (bit<32>) meta.result_3_3 | (((meta.result_3_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_3_4 = (bit<32>) meta.result_3_4 | (((meta.result_3_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_3_5 = (bit<32>) meta.result_3_5 | (((meta.result_3_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_4_0 = (bit<32>) meta.result_4_0 | (((meta.result_4_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_4_1 = (bit<32>) meta.result_4_1 | (((meta.result_4_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_4_2 = (bit<32>) meta.result_4_2 | (((meta.result_4_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_4_3 = (bit<32>) meta.result_4_3 | (((meta.result_4_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_4_4 = (bit<32>) meta.result_4_4 | (((meta.result_4_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_4_5 = (bit<32>) meta.result_4_5 | (((meta.result_4_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_5_0 = (bit<32>) meta.result_5_0 | (((meta.result_5_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_5_1 = (bit<32>) meta.result_5_1 | (((meta.result_5_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_5_2 = (bit<32>) meta.result_5_2 | (((meta.result_5_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_5_3 = (bit<32>) meta.result_5_3 | (((meta.result_5_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_5_4 = (bit<32>) meta.result_5_4 | (((meta.result_5_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_5_5 = (bit<32>) meta.result_5_5 | (((meta.result_5_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_6_0 = (bit<32>) meta.result_6_0 | (((meta.result_6_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_6_1 = (bit<32>) meta.result_6_1 | (((meta.result_6_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_6_2 = (bit<32>) meta.result_6_2 | (((meta.result_6_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_6_3 = (bit<32>) meta.result_6_3 | (((meta.result_6_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_6_4 = (bit<32>) meta.result_6_4 | (((meta.result_6_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_6_5 = (bit<32>) meta.result_6_5 | (((meta.result_6_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_7_0 = (bit<32>) meta.result_7_0 | (((meta.result_7_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_7_1 = (bit<32>) meta.result_7_1 | (((meta.result_7_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_7_2 = (bit<32>) meta.result_7_2 | (((meta.result_7_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_7_3 = (bit<32>) meta.result_7_3 | (((meta.result_7_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_7_4 = (bit<32>) meta.result_7_4 | (((meta.result_7_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> result_7_5 = (bit<32>) meta.result_7_5 | (((meta.result_7_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        
        meta.result16_0 = (result_0_0 * w2_0_0 + result_0_1 * w2_1_0 + result_0_2 * w2_2_0 + result_0_3 * w2_3_0 + result_0_4 * w2_4_0 + result_0_5 * w2_5_0 )[23:8] + b_reduce;
        meta.result16_1 = (result_1_0 * w2_0_0 + result_1_1 * w2_1_0 + result_1_2 * w2_2_0 + result_1_3 * w2_3_0 + result_1_4 * w2_4_0 + result_1_5 * w2_5_0 )[23:8] + b_reduce;
        meta.result16_2 = (result_2_0 * w2_0_0 + result_2_1 * w2_1_0 + result_2_2 * w2_2_0 + result_2_3 * w2_3_0 + result_2_4 * w2_4_0 + result_2_5 * w2_5_0 )[23:8] + b_reduce;
        meta.result16_3 = (result_3_0 * w2_0_0 + result_3_1 * w2_1_0 + result_3_2 * w2_2_0 + result_3_3 * w2_3_0 + result_3_4 * w2_4_0 + result_3_5 * w2_5_0 )[23:8] + b_reduce;    
        meta.result16_4 = (result_4_0 * w2_0_0 + result_4_1 * w2_1_0 + result_4_2 * w2_2_0 + result_4_3 * w2_3_0 + result_4_4 * w2_4_0 + result_4_5 * w2_5_0 )[23:8] + b_reduce;
        meta.result16_5 = (result_5_0 * w2_0_0 + result_5_1 * w2_1_0 + result_5_2 * w2_2_0 + result_5_3 * w2_3_0 + result_5_4 * w2_4_0 + result_5_5 * w2_5_0 )[23:8] + b_reduce;
        meta.result16_6 = (result_6_0 * w2_0_0 + result_6_1 * w2_1_0 + result_6_2 * w2_2_0 + result_6_3 * w2_3_0 + result_6_4 * w2_4_0 + result_6_5 * w2_5_0 )[23:8] + b_reduce;
        meta.result16_7 = (result_7_0 * w2_0_0 + result_7_1 * w2_1_0 + result_7_2 * w2_2_0 + result_7_3 * w2_3_0 + result_7_4 * w2_4_0 + result_7_5 * w2_5_0 )[23:8] + b_reduce;
    }


    apply {
        if (hdr.p4calc.isValid()) {
            operation_linear1();
            operation_drop_out();
            operation_linear2();

            hdr.s7_output0_calc.s7_before_sigmoid_0 = meta.result16_0;
            hdr.s7_output0_calc.s7_before_sigmoid_1 = meta.result16_1;
            hdr.s7_output0_calc.s7_before_sigmoid_2 = meta.result16_2;
            hdr.s7_output0_calc.s7_before_sigmoid_3 = meta.result16_3;
            hdr.s7_output0_calc.s7_before_sigmoid_4 = meta.result16_4;
            hdr.s7_output0_calc.s7_before_sigmoid_5 = meta.result16_5;
            hdr.s7_output0_calc.s7_before_sigmoid_6 = meta.result16_6;
            hdr.s7_output0_calc.s7_before_sigmoid_7 = meta.result16_7;

            hdr.s7_output0_calc.s7_output_0 = (meta.result16_0[15:15] != 0) ? 16w0 : 16w0x1;
            hdr.s7_output0_calc.s7_output_1 = (meta.result16_1[15:15] != 0) ? 16w0 : 16w0x1;
            hdr.s7_output0_calc.s7_output_2 = (meta.result16_2[15:15] != 0) ? 16w0 : 16w0x1;
            hdr.s7_output0_calc.s7_output_3 = (meta.result16_3[15:15] != 0) ? 16w0 : 16w0x1;
            hdr.s7_output0_calc.s7_output_4 = (meta.result16_4[15:15] != 0) ? 16w0 : 16w0x1;
            hdr.s7_output0_calc.s7_output_5 = (meta.result16_5[15:15] != 0) ? 16w0 : 16w0x1;
            hdr.s7_output0_calc.s7_output_6 = (meta.result16_6[15:15] != 0) ? 16w0 : 16w0x1;
            hdr.s7_output0_calc.s7_output_7 = (meta.result16_7[15:15] != 0) ? 16w0 : 16w0x1;

            standard_metadata.egress_spec = 2;
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
        packet.emit(hdr.feature);
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