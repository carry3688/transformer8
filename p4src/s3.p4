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

//dff 暂取12，W1​(6*12),b1(12)
const bit<32> w1_0_0 = 0x00009c4c;
const bit<32> w1_0_1 = 0xffff34b5;
const bit<32> w1_0_2 = 0x00003639;
const bit<32> w1_0_3 = 0xffff7986;
const bit<32> w1_0_4 = 0xffff1226;
const bit<32> w1_0_5 = 0xffff2e25;
const bit<32> w1_0_6 = 0x000092c8;
const bit<32> w1_0_7 = 0x00000943;
const bit<32> w1_0_8 = 0xffff5e05;
const bit<32> w1_0_9 = 0x000066bd;
const bit<32> w1_0_10 = 0xffff197d;
const bit<32> w1_0_11 = 0x00003229;
const bit<32> w1_1_0 = 0x0000ae83;
const bit<32> w1_1_1 = 0x0000e843;
const bit<32> w1_1_2 = 0x0000ee3b;
const bit<32> w1_1_3 = 0xffff40be;
const bit<32> w1_1_4 = 0x00002b09;
const bit<32> w1_1_5 = 0xfffffb76;
const bit<32> w1_1_6 = 0xffffabb7;
const bit<32> w1_1_7 = 0x0000bc15;
const bit<32> w1_1_8 = 0xffff2329;
const bit<32> w1_1_9 = 0x00007f21;
const bit<32> w1_1_10 = 0x0000c7c4;
const bit<32> w1_1_11 = 0xffff5cf5;
const bit<32> w1_2_0 = 0xffff3f9c;
const bit<32> w1_2_1 = 0xffffb876;
const bit<32> w1_2_2 = 0xffffd191;
const bit<32> w1_2_3 = 0xffff0c10;
const bit<32> w1_2_4 = 0x0000294c;
const bit<32> w1_2_5 = 0x00005632;
const bit<32> w1_2_6 = 0x0000168a;
const bit<32> w1_2_7 = 0xffff37bc;
const bit<32> w1_2_8 = 0xffffa1f8;
const bit<32> w1_2_9 = 0xffff6a7b;
const bit<32> w1_2_10 = 0x0000bb65;
const bit<32> w1_2_11 = 0x00009bd1;
const bit<32> w1_3_0 = 0x0000b20e;
const bit<32> w1_3_1 = 0xffff254f;
const bit<32> w1_3_2 = 0xffff0663;
const bit<32> w1_3_3 = 0xffff3447;
const bit<32> w1_3_4 = 0xffffe2dc;
const bit<32> w1_3_5 = 0xffff8b5d;
const bit<32> w1_3_6 = 0xffff7c4a;
const bit<32> w1_3_7 = 0xffff396e;
const bit<32> w1_3_8 = 0xffff7c4c;
const bit<32> w1_3_9 = 0x0000053c;
const bit<32> w1_3_10 = 0x000050c5;
const bit<32> w1_3_11 = 0xffffd532;
const bit<32> w1_4_0 = 0xffffbc7f;
const bit<32> w1_4_1 = 0x000036dd;
const bit<32> w1_4_2 = 0xffffa54b;
const bit<32> w1_4_3 = 0x0000df2a;
const bit<32> w1_4_4 = 0xffffbac8;
const bit<32> w1_4_5 = 0xffffafa2;
const bit<32> w1_4_6 = 0xffffb9ce;
const bit<32> w1_4_7 = 0xffff96fb;
const bit<32> w1_4_8 = 0xffff7d78;
const bit<32> w1_4_9 = 0xffff9eda;
const bit<32> w1_4_10 = 0x000092f9;
const bit<32> w1_4_11 = 0xffffd6cd;
const bit<32> w1_5_0 = 0x00003683;
const bit<32> w1_5_1 = 0x000002e6;
const bit<32> w1_5_2 = 0xffff89ab;
const bit<32> w1_5_3 = 0x0000bbd0;
const bit<32> w1_5_4 = 0xffff6749;
const bit<32> w1_5_5 = 0x000055a5;
const bit<32> w1_5_6 = 0x00005975;
const bit<32> w1_5_7 = 0x00002551;
const bit<32> w1_5_8 = 0xffffbf57;
const bit<32> w1_5_9 = 0xffff2e82;
const bit<32> w1_5_10 = 0x00001e50;
const bit<32> w1_5_11 = 0xffff0db6;

const bit<32> w2_0_0 = 0x0000cfec;
const bit<32> w2_0_1 = 0x00003056;
const bit<32> w2_0_2 = 0xfffff698;
const bit<32> w2_0_3 = 0xffff4c4e;
const bit<32> w2_0_4 = 0x00005247;
const bit<32> w2_0_5 = 0x00005d2e;
const bit<32> w2_1_0 = 0x0000b173;
const bit<32> w2_1_1 = 0x000018e7;
const bit<32> w2_1_2 = 0x0000bd99;
const bit<32> w2_1_3 = 0x0000d767;
const bit<32> w2_1_4 = 0xffffda1e;
const bit<32> w2_1_5 = 0x0000138f;
const bit<32> w2_2_0 = 0x00005bcb;
const bit<32> w2_2_1 = 0xffffdf55;
const bit<32> w2_2_2 = 0xffff550a;
const bit<32> w2_2_3 = 0x0000dd2f;
const bit<32> w2_2_4 = 0x00001cd6;
const bit<32> w2_2_5 = 0x000014e8;
const bit<32> w2_3_0 = 0x0000fa5b;
const bit<32> w2_3_1 = 0xffff0a5b;
const bit<32> w2_3_2 = 0x00008a7a;
const bit<32> w2_3_3 = 0x0000632b;
const bit<32> w2_3_4 = 0xfffffb49;
const bit<32> w2_3_5 = 0x0000fb6d;
const bit<32> w2_4_0 = 0xffffafbf;
const bit<32> w2_4_1 = 0x00003fb9;
const bit<32> w2_4_2 = 0x0000c26e;
const bit<32> w2_4_3 = 0xffff5f28;
const bit<32> w2_4_4 = 0xffffea0c;
const bit<32> w2_4_5 = 0x0000cdc6;
const bit<32> w2_5_0 = 0x000022f1;
const bit<32> w2_5_1 = 0x00000237;
const bit<32> w2_5_2 = 0xffffe355;
const bit<32> w2_5_3 = 0x0000cf73;
const bit<32> w2_5_4 = 0xffffc00b;
const bit<32> w2_5_5 = 0x00000ca9;
const bit<32> w2_6_0 = 0x0000e66c;
const bit<32> w2_6_1 = 0x0000ec58;
const bit<32> w2_6_2 = 0xffff7a5c;
const bit<32> w2_6_3 = 0xffff1d59;
const bit<32> w2_6_4 = 0x0000db49;
const bit<32> w2_6_5 = 0xffffa1c8;
const bit<32> w2_7_0 = 0x000030be;
const bit<32> w2_7_1 = 0xffffcf11;
const bit<32> w2_7_2 = 0xffff34d0;
const bit<32> w2_7_3 = 0x0000a10d;
const bit<32> w2_7_4 = 0xffffb064;
const bit<32> w2_7_5 = 0x0000b1e3;
const bit<32> w2_8_0 = 0xffffd9cb;
const bit<32> w2_8_1 = 0x00006e27;
const bit<32> w2_8_2 = 0x0000ad70;
const bit<32> w2_8_3 = 0xffff5959;
const bit<32> w2_8_4 = 0x000090db;
const bit<32> w2_8_5 = 0xffff5f12;
const bit<32> w2_9_0 = 0x0000774e;
const bit<32> w2_9_1 = 0xfffff069;
const bit<32> w2_9_2 = 0x0000f6c3;
const bit<32> w2_9_3 = 0xffffa211;
const bit<32> w2_9_4 = 0xffffea70;
const bit<32> w2_9_5 = 0xffffc681;
const bit<32> w2_10_0 = 0xffff77b4;
const bit<32> w2_10_1 = 0x000047a2;
const bit<32> w2_10_2 = 0xffffcb29;
const bit<32> w2_10_3 = 0x00005d5f;
const bit<32> w2_10_4 = 0xffff0619;
const bit<32> w2_10_5 = 0xffff0e35;
const bit<32> w2_11_0 = 0xffffdc72;
const bit<32> w2_11_1 = 0xffff6a11;
const bit<32> w2_11_2 = 0xffff2ca2;
const bit<32> w2_11_3 = 0xffff94d8;
const bit<32> w2_11_4 = 0x000044c4;
const bit<32> w2_11_5 = 0x00006393;




const bit<16> b_0 = 0xEF1F;
const bit<16> b_1 = 0xBD0E;
const bit<16> b_2 = 0xE722;
const bit<16> b_3 = 0xF4ED;
const bit<16> b_4 = 0x30AA;
const bit<16> b_5 = 0x306A;
const bit<16> b_6 = 0x8496;
const bit<16> b_7 = 0x901A;
const bit<16> b_8 = 0x8135;
const bit<16> b_9 = 0x43D5;
const bit<16> b_10 = 0xE337;
const bit<16> b_11 = 0xCD3C;

const bit<16> b2_0 = 0x2E24;
const bit<16> b2_1 = 0xC7F1;
const bit<16> b2_2 = 0xE3CB;
const bit<16> b2_3 = 0x1AEF;
const bit<16> b2_4 = 0x2351;
const bit<16> b2_5 = 0x0B7E;

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
    bit<16> ff_0_0;
    bit<16> ff_0_1;
    bit<16> ff_0_2;
    bit<16> ff_0_3;
    bit<16> ff_0_4;
    bit<16> ff_0_5;
    bit<16> ff_0_6;
    bit<16> ff_0_7;
    bit<16> ff_0_8;
    bit<16> ff_0_9;
    bit<16> ff_0_10;
    bit<16> ff_0_11;
    bit<16> ff_1_0;
    bit<16> ff_1_1;
    bit<16> ff_1_2;
    bit<16> ff_1_3;
    bit<16> ff_1_4;
    bit<16> ff_1_5;
    bit<16> ff_1_6;
    bit<16> ff_1_7;
    bit<16> ff_1_8;
    bit<16> ff_1_9;
    bit<16> ff_1_10;
    bit<16> ff_1_11;
    bit<16> ff_2_0;
    bit<16> ff_2_1;
    bit<16> ff_2_2;
    bit<16> ff_2_3;
    bit<16> ff_2_4;
    bit<16> ff_2_5;
    bit<16> ff_2_6;
    bit<16> ff_2_7;
    bit<16> ff_2_8;
    bit<16> ff_2_9;
    bit<16> ff_2_10;
    bit<16> ff_2_11;
    bit<16> ff_3_0;
    bit<16> ff_3_1;
    bit<16> ff_3_2;
    bit<16> ff_3_3;
    bit<16> ff_3_4;
    bit<16> ff_3_5;
    bit<16> ff_3_6;
    bit<16> ff_3_7;
    bit<16> ff_3_8;
    bit<16> ff_3_9;
    bit<16> ff_3_10;
    bit<16> ff_3_11;
    bit<16> ff_4_0;
    bit<16> ff_4_1;
    bit<16> ff_4_2;
    bit<16> ff_4_3;
    bit<16> ff_4_4;
    bit<16> ff_4_5;
    bit<16> ff_4_6;
    bit<16> ff_4_7;
    bit<16> ff_4_8;
    bit<16> ff_4_9;
    bit<16> ff_4_10;
    bit<16> ff_4_11;
    bit<16> ff_5_0;
    bit<16> ff_5_1;
    bit<16> ff_5_2;
    bit<16> ff_5_3;
    bit<16> ff_5_4;
    bit<16> ff_5_5;
    bit<16> ff_5_6;
    bit<16> ff_5_7;
    bit<16> ff_5_8;
    bit<16> ff_5_9;
    bit<16> ff_5_10;
    bit<16> ff_5_11;
    bit<16> ff_6_0;
    bit<16> ff_6_1;
    bit<16> ff_6_2;
    bit<16> ff_6_3;
    bit<16> ff_6_4;
    bit<16> ff_6_5;
    bit<16> ff_6_6;
    bit<16> ff_6_7;
    bit<16> ff_6_8;
    bit<16> ff_6_9;
    bit<16> ff_6_10;
    bit<16> ff_6_11;
    bit<16> ff_7_0;
    bit<16> ff_7_1;
    bit<16> ff_7_2;
    bit<16> ff_7_3;
    bit<16> ff_7_4;
    bit<16> ff_7_5;
    bit<16> ff_7_6;
    bit<16> ff_7_7;
    bit<16> ff_7_8;
    bit<16> ff_7_9;
    bit<16> ff_7_10;
    bit<16> ff_7_11;

    bit<16> deviation_0_0;
    bit<16> deviation_0_1;
    bit<16> deviation_0_2;
    bit<16> deviation_0_3;
    bit<16> deviation_0_4;
    bit<16> deviation_0_5;
    bit<16> deviation_1_0;
    bit<16> deviation_1_1;
    bit<16> deviation_1_2;
    bit<16> deviation_1_3;
    bit<16> deviation_1_4;
    bit<16> deviation_1_5;
    bit<16> deviation_2_0;
    bit<16> deviation_2_1;
    bit<16> deviation_2_2;
    bit<16> deviation_2_3;
    bit<16> deviation_2_4;
    bit<16> deviation_2_5;
    bit<16> deviation_3_0;
    bit<16> deviation_3_1;
    bit<16> deviation_3_2;
    bit<16> deviation_3_3;
    bit<16> deviation_3_4;
    bit<16> deviation_3_5;
    bit<16> deviation_4_0;
    bit<16> deviation_4_1;
    bit<16> deviation_4_2;
    bit<16> deviation_4_3;
    bit<16> deviation_4_4;
    bit<16> deviation_4_5;
    bit<16> deviation_5_0;
    bit<16> deviation_5_1;
    bit<16> deviation_5_2;
    bit<16> deviation_5_3;
    bit<16> deviation_5_4;
    bit<16> deviation_5_5;
    bit<16> deviation_6_0;
    bit<16> deviation_6_1;
    bit<16> deviation_6_2;
    bit<16> deviation_6_3;
    bit<16> deviation_6_4;
    bit<16> deviation_6_5;
    bit<16> deviation_7_0;
    bit<16> deviation_7_1;
    bit<16> deviation_7_2;
    bit<16> deviation_7_3;
    bit<16> deviation_7_4;
    bit<16> deviation_7_5;

    // 求出来的方差，用作匹配表项
    bit<16> variance0;
    bit<16> variance1;
    bit<16> variance2;
    bit<16> variance3;
    bit<16> variance4;
    bit<16> variance5;
    bit<16> variance6;
    bit<16> variance7;

    // 计算出来的1/sqrt(var(x))，用作求norm值
    bit<16> inv_sqrt_var0;
    bit<16> inv_sqrt_var1;
    bit<16> inv_sqrt_var2;
    bit<16> inv_sqrt_var3;
    bit<16> inv_sqrt_var4;
    bit<16> inv_sqrt_var5;
    bit<16> inv_sqrt_var6;
    bit<16> inv_sqrt_var7;
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
    
    // register<bit<64>>(96) ff;

      // 丢弃
    action operation_drop() {
        mark_to_drop(standard_metadata);
    }

    // 全连接层1，映射成8*dff，dff暂取12 矩阵乘法为(8*6) * (6*12)
    action operation_linear1() {
        bit<32> s0_output_0_0 = (bit<32>) hdr.s0_output0_calc.s0_output_0_0 | (((hdr.s0_output0_calc.s0_output_0_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_0_1 = (bit<32>) hdr.s0_output0_calc.s0_output_0_1 | (((hdr.s0_output0_calc.s0_output_0_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_0_2 = (bit<32>) hdr.s0_output0_calc.s0_output_0_2 | (((hdr.s0_output0_calc.s0_output_0_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_0_3 = (bit<32>) hdr.s0_output0_calc.s0_output_0_3 | (((hdr.s0_output0_calc.s0_output_0_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_0_4 = (bit<32>) hdr.s0_output0_calc.s0_output_0_4 | (((hdr.s0_output0_calc.s0_output_0_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_0_5 = (bit<32>) hdr.s0_output0_calc.s0_output_0_5 | (((hdr.s0_output0_calc.s0_output_0_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_1_0 = (bit<32>) hdr.s0_output0_calc.s0_output_1_0 | (((hdr.s0_output0_calc.s0_output_1_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_1_1 = (bit<32>) hdr.s0_output0_calc.s0_output_1_1 | (((hdr.s0_output0_calc.s0_output_1_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_1_2 = (bit<32>) hdr.s0_output0_calc.s0_output_1_2 | (((hdr.s0_output0_calc.s0_output_1_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_1_3 = (bit<32>) hdr.s0_output0_calc.s0_output_1_3 | (((hdr.s0_output0_calc.s0_output_1_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_1_4 = (bit<32>) hdr.s0_output0_calc.s0_output_1_4 | (((hdr.s0_output0_calc.s0_output_1_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_1_5 = (bit<32>) hdr.s0_output0_calc.s0_output_1_5 | (((hdr.s0_output0_calc.s0_output_1_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_2_0 = (bit<32>) hdr.s0_output0_calc.s0_output_2_0 | (((hdr.s0_output0_calc.s0_output_2_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_2_1 = (bit<32>) hdr.s0_output0_calc.s0_output_2_1 | (((hdr.s0_output0_calc.s0_output_2_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_2_2 = (bit<32>) hdr.s0_output0_calc.s0_output_2_2 | (((hdr.s0_output0_calc.s0_output_2_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_2_3 = (bit<32>) hdr.s0_output0_calc.s0_output_2_3 | (((hdr.s0_output0_calc.s0_output_2_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_2_4 = (bit<32>) hdr.s0_output0_calc.s0_output_2_4 | (((hdr.s0_output0_calc.s0_output_2_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_2_5 = (bit<32>) hdr.s0_output0_calc.s0_output_2_5 | (((hdr.s0_output0_calc.s0_output_2_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_3_0 = (bit<32>) hdr.s0_output0_calc.s0_output_3_0 | (((hdr.s0_output0_calc.s0_output_3_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_3_1 = (bit<32>) hdr.s0_output0_calc.s0_output_3_1 | (((hdr.s0_output0_calc.s0_output_3_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_3_2 = (bit<32>) hdr.s0_output0_calc.s0_output_3_2 | (((hdr.s0_output0_calc.s0_output_3_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_3_3 = (bit<32>) hdr.s0_output0_calc.s0_output_3_3 | (((hdr.s0_output0_calc.s0_output_3_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_3_4 = (bit<32>) hdr.s0_output0_calc.s0_output_3_4 | (((hdr.s0_output0_calc.s0_output_3_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_3_5 = (bit<32>) hdr.s0_output0_calc.s0_output_3_5 | (((hdr.s0_output0_calc.s0_output_3_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_4_0 = (bit<32>) hdr.s0_output0_calc.s0_output_4_0 | (((hdr.s0_output0_calc.s0_output_4_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_4_1 = (bit<32>) hdr.s0_output0_calc.s0_output_4_1 | (((hdr.s0_output0_calc.s0_output_4_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_4_2 = (bit<32>) hdr.s0_output0_calc.s0_output_4_2 | (((hdr.s0_output0_calc.s0_output_4_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_4_3 = (bit<32>) hdr.s0_output0_calc.s0_output_4_3 | (((hdr.s0_output0_calc.s0_output_4_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_4_4 = (bit<32>) hdr.s0_output0_calc.s0_output_4_4 | (((hdr.s0_output0_calc.s0_output_4_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_4_5 = (bit<32>) hdr.s0_output0_calc.s0_output_4_5 | (((hdr.s0_output0_calc.s0_output_4_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_5_0 = (bit<32>) hdr.s0_output0_calc.s0_output_5_0 | (((hdr.s0_output0_calc.s0_output_5_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_5_1 = (bit<32>) hdr.s0_output0_calc.s0_output_5_1 | (((hdr.s0_output0_calc.s0_output_5_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_5_2 = (bit<32>) hdr.s0_output0_calc.s0_output_5_2 | (((hdr.s0_output0_calc.s0_output_5_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_5_3 = (bit<32>) hdr.s0_output0_calc.s0_output_5_3 | (((hdr.s0_output0_calc.s0_output_5_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_5_4 = (bit<32>) hdr.s0_output0_calc.s0_output_5_4 | (((hdr.s0_output0_calc.s0_output_5_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_5_5 = (bit<32>) hdr.s0_output0_calc.s0_output_5_5 | (((hdr.s0_output0_calc.s0_output_5_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_6_0 = (bit<32>) hdr.s0_output0_calc.s0_output_6_0 | (((hdr.s0_output0_calc.s0_output_6_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_6_1 = (bit<32>) hdr.s0_output0_calc.s0_output_6_1 | (((hdr.s0_output0_calc.s0_output_6_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_6_2 = (bit<32>) hdr.s0_output0_calc.s0_output_6_2 | (((hdr.s0_output0_calc.s0_output_6_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_6_3 = (bit<32>) hdr.s0_output0_calc.s0_output_6_3 | (((hdr.s0_output0_calc.s0_output_6_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_6_4 = (bit<32>) hdr.s0_output0_calc.s0_output_6_4 | (((hdr.s0_output0_calc.s0_output_6_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_6_5 = (bit<32>) hdr.s0_output0_calc.s0_output_6_5 | (((hdr.s0_output0_calc.s0_output_6_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_7_0 = (bit<32>) hdr.s0_output0_calc.s0_output_7_0 | (((hdr.s0_output0_calc.s0_output_7_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_7_1 = (bit<32>) hdr.s0_output0_calc.s0_output_7_1 | (((hdr.s0_output0_calc.s0_output_7_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_7_2 = (bit<32>) hdr.s0_output0_calc.s0_output_7_2 | (((hdr.s0_output0_calc.s0_output_7_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_7_3 = (bit<32>) hdr.s0_output0_calc.s0_output_7_3 | (((hdr.s0_output0_calc.s0_output_7_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_7_4 = (bit<32>) hdr.s0_output0_calc.s0_output_7_4 | (((hdr.s0_output0_calc.s0_output_7_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> s0_output_7_5 = (bit<32>) hdr.s0_output0_calc.s0_output_7_5 | (((hdr.s0_output0_calc.s0_output_7_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);

        meta.ff_0_0 = (s0_output_0_0 * w1_0_0 + s0_output_0_1 * w1_1_0 + s0_output_0_2 * w1_2_0 + s0_output_0_3 * w1_3_0 + s0_output_0_4 * w1_4_0 + s0_output_0_5 * w1_5_0)[23:8] + b_0;
        meta.ff_0_1 = (s0_output_0_0 * w1_0_1 + s0_output_0_1 * w1_1_1 + s0_output_0_2 * w1_2_1 + s0_output_0_3 * w1_3_1 + s0_output_0_4 * w1_4_1 + s0_output_0_5 * w1_5_1)[23:8] + b_1;
        meta.ff_0_2 = (s0_output_0_0 * w1_0_2 + s0_output_0_1 * w1_1_2 + s0_output_0_2 * w1_2_2 + s0_output_0_3 * w1_3_2 + s0_output_0_4 * w1_4_2 + s0_output_0_5 * w1_5_2)[23:8] + b_2;
        meta.ff_0_3 = (s0_output_0_0 * w1_0_3 + s0_output_0_1 * w1_1_3 + s0_output_0_2 * w1_2_3 + s0_output_0_3 * w1_3_3 + s0_output_0_4 * w1_4_3 + s0_output_0_5 * w1_5_3)[23:8] + b_3;
        meta.ff_0_4 = (s0_output_0_0 * w1_0_4 + s0_output_0_1 * w1_1_4 + s0_output_0_2 * w1_2_4 + s0_output_0_3 * w1_3_4 + s0_output_0_4 * w1_4_4 + s0_output_0_5 * w1_5_4)[23:8] + b_4;
        meta.ff_0_5 = (s0_output_0_0 * w1_0_5 + s0_output_0_1 * w1_1_5 + s0_output_0_2 * w1_2_5 + s0_output_0_3 * w1_3_5 + s0_output_0_4 * w1_4_5 + s0_output_0_5 * w1_5_5)[23:8] + b_5;
        meta.ff_0_6 = (s0_output_0_0 * w1_0_6 + s0_output_0_1 * w1_1_6 + s0_output_0_2 * w1_2_6 + s0_output_0_3 * w1_3_6 + s0_output_0_4 * w1_4_6 + s0_output_0_5 * w1_5_6)[23:8] + b_6;
        meta.ff_0_7 = (s0_output_0_0 * w1_0_7 + s0_output_0_1 * w1_1_7 + s0_output_0_2 * w1_2_7 + s0_output_0_3 * w1_3_7 + s0_output_0_4 * w1_4_7 + s0_output_0_5 * w1_5_7)[23:8] + b_7;
        meta.ff_0_8 = (s0_output_0_0 * w1_0_8 + s0_output_0_1 * w1_1_8 + s0_output_0_2 * w1_2_8 + s0_output_0_3 * w1_3_8 + s0_output_0_4 * w1_4_8 + s0_output_0_5 * w1_5_8)[23:8] + b_8;
        meta.ff_0_9 = (s0_output_0_0 * w1_0_9 + s0_output_0_1 * w1_1_9 + s0_output_0_2 * w1_2_9 + s0_output_0_3 * w1_3_9 + s0_output_0_4 * w1_4_9 + s0_output_0_5 * w1_5_9)[23:8] + b_9;
        meta.ff_0_10 = (s0_output_0_0 * w1_0_10 + s0_output_0_1 * w1_1_10 + s0_output_0_2 * w1_2_10 + s0_output_0_3 * w1_3_10 + s0_output_0_4 * w1_4_10 + s0_output_0_5 * w1_5_10)[23:8] + b_10;
        meta.ff_0_11 = (s0_output_0_0 * w1_0_11 + s0_output_0_1 * w1_1_11 + s0_output_0_2 * w1_2_11 + s0_output_0_3 * w1_3_11 + s0_output_0_4 * w1_4_11 + s0_output_0_5 * w1_5_11)[23:8] + b_11;
        meta.ff_1_0 = (s0_output_1_0 * w1_0_0 + s0_output_1_1 * w1_1_0 + s0_output_1_2 * w1_2_0 + s0_output_1_3 * w1_3_0 + s0_output_1_4 * w1_4_0 + s0_output_1_5 * w1_5_0)[23:8] + b_0;
        meta.ff_1_1 = (s0_output_1_0 * w1_0_1 + s0_output_1_1 * w1_1_1 + s0_output_1_2 * w1_2_1 + s0_output_1_3 * w1_3_1 + s0_output_1_4 * w1_4_1 + s0_output_1_5 * w1_5_1)[23:8] + b_1;
        meta.ff_1_2 = (s0_output_1_0 * w1_0_2 + s0_output_1_1 * w1_1_2 + s0_output_1_2 * w1_2_2 + s0_output_1_3 * w1_3_2 + s0_output_1_4 * w1_4_2 + s0_output_1_5 * w1_5_2)[23:8] + b_2;
        meta.ff_1_3 = (s0_output_1_0 * w1_0_3 + s0_output_1_1 * w1_1_3 + s0_output_1_2 * w1_2_3 + s0_output_1_3 * w1_3_3 + s0_output_1_4 * w1_4_3 + s0_output_1_5 * w1_5_3)[23:8] + b_3;
        meta.ff_1_4 = (s0_output_1_0 * w1_0_4 + s0_output_1_1 * w1_1_4 + s0_output_1_2 * w1_2_4 + s0_output_1_3 * w1_3_4 + s0_output_1_4 * w1_4_4 + s0_output_1_5 * w1_5_4)[23:8] + b_4;
        meta.ff_1_5 = (s0_output_1_0 * w1_0_5 + s0_output_1_1 * w1_1_5 + s0_output_1_2 * w1_2_5 + s0_output_1_3 * w1_3_5 + s0_output_1_4 * w1_4_5 + s0_output_1_5 * w1_5_5)[23:8] + b_5;
        meta.ff_1_6 = (s0_output_1_0 * w1_0_6 + s0_output_1_1 * w1_1_6 + s0_output_1_2 * w1_2_6 + s0_output_1_3 * w1_3_6 + s0_output_1_4 * w1_4_6 + s0_output_1_5 * w1_5_6)[23:8] + b_6;
        meta.ff_1_7 = (s0_output_1_0 * w1_0_7 + s0_output_1_1 * w1_1_7 + s0_output_1_2 * w1_2_7 + s0_output_1_3 * w1_3_7 + s0_output_1_4 * w1_4_7 + s0_output_1_5 * w1_5_7)[23:8] + b_7;
        meta.ff_1_8 = (s0_output_1_0 * w1_0_8 + s0_output_1_1 * w1_1_8 + s0_output_1_2 * w1_2_8 + s0_output_1_3 * w1_3_8 + s0_output_1_4 * w1_4_8 + s0_output_1_5 * w1_5_8)[23:8] + b_8;
        meta.ff_1_9 = (s0_output_1_0 * w1_0_9 + s0_output_1_1 * w1_1_9 + s0_output_1_2 * w1_2_9 + s0_output_1_3 * w1_3_9 + s0_output_1_4 * w1_4_9 + s0_output_1_5 * w1_5_9)[23:8] + b_9;
        meta.ff_1_10 = (s0_output_1_0 * w1_0_10 + s0_output_1_1 * w1_1_10 + s0_output_1_2 * w1_2_10 + s0_output_1_3 * w1_3_10 + s0_output_1_4 * w1_4_10 + s0_output_1_5 * w1_5_10)[23:8] + b_10;
        meta.ff_1_11 = (s0_output_1_0 * w1_0_11 + s0_output_1_1 * w1_1_11 + s0_output_1_2 * w1_2_11 + s0_output_1_3 * w1_3_11 + s0_output_1_4 * w1_4_11 + s0_output_1_5 * w1_5_11)[23:8] + b_11;
        meta.ff_2_0 = (s0_output_2_0 * w1_0_0 + s0_output_2_1 * w1_1_0 + s0_output_2_2 * w1_2_0 + s0_output_2_3 * w1_3_0 + s0_output_2_4 * w1_4_0 + s0_output_2_5 * w1_5_0)[23:8] + b_0;
        meta.ff_2_1 = (s0_output_2_0 * w1_0_1 + s0_output_2_1 * w1_1_1 + s0_output_2_2 * w1_2_1 + s0_output_2_3 * w1_3_1 + s0_output_2_4 * w1_4_1 + s0_output_2_5 * w1_5_1)[23:8] + b_1;
        meta.ff_2_2 = (s0_output_2_0 * w1_0_2 + s0_output_2_1 * w1_1_2 + s0_output_2_2 * w1_2_2 + s0_output_2_3 * w1_3_2 + s0_output_2_4 * w1_4_2 + s0_output_2_5 * w1_5_2)[23:8] + b_2;
        meta.ff_2_3 = (s0_output_2_0 * w1_0_3 + s0_output_2_1 * w1_1_3 + s0_output_2_2 * w1_2_3 + s0_output_2_3 * w1_3_3 + s0_output_2_4 * w1_4_3 + s0_output_2_5 * w1_5_3)[23:8] + b_3;
        meta.ff_2_4 = (s0_output_2_0 * w1_0_4 + s0_output_2_1 * w1_1_4 + s0_output_2_2 * w1_2_4 + s0_output_2_3 * w1_3_4 + s0_output_2_4 * w1_4_4 + s0_output_2_5 * w1_5_4)[23:8] + b_4;
        meta.ff_2_5 = (s0_output_2_0 * w1_0_5 + s0_output_2_1 * w1_1_5 + s0_output_2_2 * w1_2_5 + s0_output_2_3 * w1_3_5 + s0_output_2_4 * w1_4_5 + s0_output_2_5 * w1_5_5)[23:8] + b_5;
        meta.ff_2_6 = (s0_output_2_0 * w1_0_6 + s0_output_2_1 * w1_1_6 + s0_output_2_2 * w1_2_6 + s0_output_2_3 * w1_3_6 + s0_output_2_4 * w1_4_6 + s0_output_2_5 * w1_5_6)[23:8] + b_6;
        meta.ff_2_7 = (s0_output_2_0 * w1_0_7 + s0_output_2_1 * w1_1_7 + s0_output_2_2 * w1_2_7 + s0_output_2_3 * w1_3_7 + s0_output_2_4 * w1_4_7 + s0_output_2_5 * w1_5_7)[23:8] + b_7;
        meta.ff_2_8 = (s0_output_2_0 * w1_0_8 + s0_output_2_1 * w1_1_8 + s0_output_2_2 * w1_2_8 + s0_output_2_3 * w1_3_8 + s0_output_2_4 * w1_4_8 + s0_output_2_5 * w1_5_8)[23:8] + b_8;
        meta.ff_2_9 = (s0_output_2_0 * w1_0_9 + s0_output_2_1 * w1_1_9 + s0_output_2_2 * w1_2_9 + s0_output_2_3 * w1_3_9 + s0_output_2_4 * w1_4_9 + s0_output_2_5 * w1_5_9)[23:8] + b_9;
        meta.ff_2_10 = (s0_output_2_0 * w1_0_10 + s0_output_2_1 * w1_1_10 + s0_output_2_2 * w1_2_10 + s0_output_2_3 * w1_3_10 + s0_output_2_4 * w1_4_10 + s0_output_2_5 * w1_5_10)[23:8] + b_10;
        meta.ff_2_11 = (s0_output_2_0 * w1_0_11 + s0_output_2_1 * w1_1_11 + s0_output_2_2 * w1_2_11 + s0_output_2_3 * w1_3_11 + s0_output_2_4 * w1_4_11 + s0_output_2_5 * w1_5_11)[23:8] + b_11;
        meta.ff_3_0 = (s0_output_3_0 * w1_0_0 + s0_output_3_1 * w1_1_0 + s0_output_3_2 * w1_2_0 + s0_output_3_3 * w1_3_0 + s0_output_3_4 * w1_4_0 + s0_output_3_5 * w1_5_0)[23:8] + b_0;
        meta.ff_3_1 = (s0_output_3_0 * w1_0_1 + s0_output_3_1 * w1_1_1 + s0_output_3_2 * w1_2_1 + s0_output_3_3 * w1_3_1 + s0_output_3_4 * w1_4_1 + s0_output_3_5 * w1_5_1)[23:8] + b_1;
        meta.ff_3_2 = (s0_output_3_0 * w1_0_2 + s0_output_3_1 * w1_1_2 + s0_output_3_2 * w1_2_2 + s0_output_3_3 * w1_3_2 + s0_output_3_4 * w1_4_2 + s0_output_3_5 * w1_5_2)[23:8] + b_2;
        meta.ff_3_3 = (s0_output_3_0 * w1_0_3 + s0_output_3_1 * w1_1_3 + s0_output_3_2 * w1_2_3 + s0_output_3_3 * w1_3_3 + s0_output_3_4 * w1_4_3 + s0_output_3_5 * w1_5_3)[23:8] + b_3;
        meta.ff_3_4 = (s0_output_3_0 * w1_0_4 + s0_output_3_1 * w1_1_4 + s0_output_3_2 * w1_2_4 + s0_output_3_3 * w1_3_4 + s0_output_3_4 * w1_4_4 + s0_output_3_5 * w1_5_4)[23:8] + b_4;
        meta.ff_3_5 = (s0_output_3_0 * w1_0_5 + s0_output_3_1 * w1_1_5 + s0_output_3_2 * w1_2_5 + s0_output_3_3 * w1_3_5 + s0_output_3_4 * w1_4_5 + s0_output_3_5 * w1_5_5)[23:8] + b_5;
        meta.ff_3_6 = (s0_output_3_0 * w1_0_6 + s0_output_3_1 * w1_1_6 + s0_output_3_2 * w1_2_6 + s0_output_3_3 * w1_3_6 + s0_output_3_4 * w1_4_6 + s0_output_3_5 * w1_5_6)[23:8] + b_6;
        meta.ff_3_7 = (s0_output_3_0 * w1_0_7 + s0_output_3_1 * w1_1_7 + s0_output_3_2 * w1_2_7 + s0_output_3_3 * w1_3_7 + s0_output_3_4 * w1_4_7 + s0_output_3_5 * w1_5_7)[23:8] + b_7;
        meta.ff_3_8 = (s0_output_3_0 * w1_0_8 + s0_output_3_1 * w1_1_8 + s0_output_3_2 * w1_2_8 + s0_output_3_3 * w1_3_8 + s0_output_3_4 * w1_4_8 + s0_output_3_5 * w1_5_8)[23:8] + b_8;
        meta.ff_3_9 = (s0_output_3_0 * w1_0_9 + s0_output_3_1 * w1_1_9 + s0_output_3_2 * w1_2_9 + s0_output_3_3 * w1_3_9 + s0_output_3_4 * w1_4_9 + s0_output_3_5 * w1_5_9)[23:8] + b_9;
        meta.ff_3_10 = (s0_output_3_0 * w1_0_10 + s0_output_3_1 * w1_1_10 + s0_output_3_2 * w1_2_10 + s0_output_3_3 * w1_3_10 + s0_output_3_4 * w1_4_10 + s0_output_3_5 * w1_5_10)[23:8] + b_10;
        meta.ff_3_11 = (s0_output_3_0 * w1_0_11 + s0_output_3_1 * w1_1_11 + s0_output_3_2 * w1_2_11 + s0_output_3_3 * w1_3_11 + s0_output_3_4 * w1_4_11 + s0_output_3_5 * w1_5_11)[23:8] + b_11;
        meta.ff_4_0 = (s0_output_4_0 * w1_0_0 + s0_output_4_1 * w1_1_0 + s0_output_4_2 * w1_2_0 + s0_output_4_3 * w1_3_0 + s0_output_4_4 * w1_4_0 + s0_output_4_5 * w1_5_0)[23:8] + b_0;
        meta.ff_4_1 = (s0_output_4_0 * w1_0_1 + s0_output_4_1 * w1_1_1 + s0_output_4_2 * w1_2_1 + s0_output_4_3 * w1_3_1 + s0_output_4_4 * w1_4_1 + s0_output_4_5 * w1_5_1)[23:8] + b_1;
        meta.ff_4_2 = (s0_output_4_0 * w1_0_2 + s0_output_4_1 * w1_1_2 + s0_output_4_2 * w1_2_2 + s0_output_4_3 * w1_3_2 + s0_output_4_4 * w1_4_2 + s0_output_4_5 * w1_5_2)[23:8] + b_2;
        meta.ff_4_3 = (s0_output_4_0 * w1_0_3 + s0_output_4_1 * w1_1_3 + s0_output_4_2 * w1_2_3 + s0_output_4_3 * w1_3_3 + s0_output_4_4 * w1_4_3 + s0_output_4_5 * w1_5_3)[23:8] + b_3;
        meta.ff_4_4 = (s0_output_4_0 * w1_0_4 + s0_output_4_1 * w1_1_4 + s0_output_4_2 * w1_2_4 + s0_output_4_3 * w1_3_4 + s0_output_4_4 * w1_4_4 + s0_output_4_5 * w1_5_4)[23:8] + b_4;
        meta.ff_4_5 = (s0_output_4_0 * w1_0_5 + s0_output_4_1 * w1_1_5 + s0_output_4_2 * w1_2_5 + s0_output_4_3 * w1_3_5 + s0_output_4_4 * w1_4_5 + s0_output_4_5 * w1_5_5)[23:8] + b_5;
        meta.ff_4_6 = (s0_output_4_0 * w1_0_6 + s0_output_4_1 * w1_1_6 + s0_output_4_2 * w1_2_6 + s0_output_4_3 * w1_3_6 + s0_output_4_4 * w1_4_6 + s0_output_4_5 * w1_5_6)[23:8] + b_6;
        meta.ff_4_7 = (s0_output_4_0 * w1_0_7 + s0_output_4_1 * w1_1_7 + s0_output_4_2 * w1_2_7 + s0_output_4_3 * w1_3_7 + s0_output_4_4 * w1_4_7 + s0_output_4_5 * w1_5_7)[23:8] + b_7;
        meta.ff_4_8 = (s0_output_4_0 * w1_0_8 + s0_output_4_1 * w1_1_8 + s0_output_4_2 * w1_2_8 + s0_output_4_3 * w1_3_8 + s0_output_4_4 * w1_4_8 + s0_output_4_5 * w1_5_8)[23:8] + b_8;
        meta.ff_4_9 = (s0_output_4_0 * w1_0_9 + s0_output_4_1 * w1_1_9 + s0_output_4_2 * w1_2_9 + s0_output_4_3 * w1_3_9 + s0_output_4_4 * w1_4_9 + s0_output_4_5 * w1_5_9)[23:8] + b_9;
        meta.ff_4_10 = (s0_output_4_0 * w1_0_10 + s0_output_4_1 * w1_1_10 + s0_output_4_2 * w1_2_10 + s0_output_4_3 * w1_3_10 + s0_output_4_4 * w1_4_10 + s0_output_4_5 * w1_5_10)[23:8] + b_10;
        meta.ff_4_11 = (s0_output_4_0 * w1_0_11 + s0_output_4_1 * w1_1_11 + s0_output_4_2 * w1_2_11 + s0_output_4_3 * w1_3_11 + s0_output_4_4 * w1_4_11 + s0_output_4_5 * w1_5_11)[23:8] + b_11;
        meta.ff_5_0 = (s0_output_5_0 * w1_0_0 + s0_output_5_1 * w1_1_0 + s0_output_5_2 * w1_2_0 + s0_output_5_3 * w1_3_0 + s0_output_5_4 * w1_4_0 + s0_output_5_5 * w1_5_0)[23:8] + b_0;
        meta.ff_5_1 = (s0_output_5_0 * w1_0_1 + s0_output_5_1 * w1_1_1 + s0_output_5_2 * w1_2_1 + s0_output_5_3 * w1_3_1 + s0_output_5_4 * w1_4_1 + s0_output_5_5 * w1_5_1)[23:8] + b_1;
        meta.ff_5_2 = (s0_output_5_0 * w1_0_2 + s0_output_5_1 * w1_1_2 + s0_output_5_2 * w1_2_2 + s0_output_5_3 * w1_3_2 + s0_output_5_4 * w1_4_2 + s0_output_5_5 * w1_5_2)[23:8] + b_2;
        meta.ff_5_3 = (s0_output_5_0 * w1_0_3 + s0_output_5_1 * w1_1_3 + s0_output_5_2 * w1_2_3 + s0_output_5_3 * w1_3_3 + s0_output_5_4 * w1_4_3 + s0_output_5_5 * w1_5_3)[23:8] + b_3;
        meta.ff_5_4 = (s0_output_5_0 * w1_0_4 + s0_output_5_1 * w1_1_4 + s0_output_5_2 * w1_2_4 + s0_output_5_3 * w1_3_4 + s0_output_5_4 * w1_4_4 + s0_output_5_5 * w1_5_4)[23:8] + b_4;
        meta.ff_5_5 = (s0_output_5_0 * w1_0_5 + s0_output_5_1 * w1_1_5 + s0_output_5_2 * w1_2_5 + s0_output_5_3 * w1_3_5 + s0_output_5_4 * w1_4_5 + s0_output_5_5 * w1_5_5)[23:8] + b_5;
        meta.ff_5_6 = (s0_output_5_0 * w1_0_6 + s0_output_5_1 * w1_1_6 + s0_output_5_2 * w1_2_6 + s0_output_5_3 * w1_3_6 + s0_output_5_4 * w1_4_6 + s0_output_5_5 * w1_5_6)[23:8] + b_6;
        meta.ff_5_7 = (s0_output_5_0 * w1_0_7 + s0_output_5_1 * w1_1_7 + s0_output_5_2 * w1_2_7 + s0_output_5_3 * w1_3_7 + s0_output_5_4 * w1_4_7 + s0_output_5_5 * w1_5_7)[23:8] + b_7;
        meta.ff_5_8 = (s0_output_5_0 * w1_0_8 + s0_output_5_1 * w1_1_8 + s0_output_5_2 * w1_2_8 + s0_output_5_3 * w1_3_8 + s0_output_5_4 * w1_4_8 + s0_output_5_5 * w1_5_8)[23:8] + b_8;
        meta.ff_5_9 = (s0_output_5_0 * w1_0_9 + s0_output_5_1 * w1_1_9 + s0_output_5_2 * w1_2_9 + s0_output_5_3 * w1_3_9 + s0_output_5_4 * w1_4_9 + s0_output_5_5 * w1_5_9)[23:8] + b_9;
        meta.ff_5_10 = (s0_output_5_0 * w1_0_10 + s0_output_5_1 * w1_1_10 + s0_output_5_2 * w1_2_10 + s0_output_5_3 * w1_3_10 + s0_output_5_4 * w1_4_10 + s0_output_5_5 * w1_5_10)[23:8] + b_10;
        meta.ff_5_11 = (s0_output_5_0 * w1_0_11 + s0_output_5_1 * w1_1_11 + s0_output_5_2 * w1_2_11 + s0_output_5_3 * w1_3_11 + s0_output_5_4 * w1_4_11 + s0_output_5_5 * w1_5_11)[23:8] + b_11;
        meta.ff_6_0 = (s0_output_6_0 * w1_0_0 + s0_output_6_1 * w1_1_0 + s0_output_6_2 * w1_2_0 + s0_output_6_3 * w1_3_0 + s0_output_6_4 * w1_4_0 + s0_output_6_5 * w1_5_0)[23:8] + b_0;
        meta.ff_6_1 = (s0_output_6_0 * w1_0_1 + s0_output_6_1 * w1_1_1 + s0_output_6_2 * w1_2_1 + s0_output_6_3 * w1_3_1 + s0_output_6_4 * w1_4_1 + s0_output_6_5 * w1_5_1)[23:8] + b_1;
        meta.ff_6_2 = (s0_output_6_0 * w1_0_2 + s0_output_6_1 * w1_1_2 + s0_output_6_2 * w1_2_2 + s0_output_6_3 * w1_3_2 + s0_output_6_4 * w1_4_2 + s0_output_6_5 * w1_5_2)[23:8] + b_2;
        meta.ff_6_3 = (s0_output_6_0 * w1_0_3 + s0_output_6_1 * w1_1_3 + s0_output_6_2 * w1_2_3 + s0_output_6_3 * w1_3_3 + s0_output_6_4 * w1_4_3 + s0_output_6_5 * w1_5_3)[23:8] + b_3;
        meta.ff_6_4 = (s0_output_6_0 * w1_0_4 + s0_output_6_1 * w1_1_4 + s0_output_6_2 * w1_2_4 + s0_output_6_3 * w1_3_4 + s0_output_6_4 * w1_4_4 + s0_output_6_5 * w1_5_4)[23:8] + b_4;
        meta.ff_6_5 = (s0_output_6_0 * w1_0_5 + s0_output_6_1 * w1_1_5 + s0_output_6_2 * w1_2_5 + s0_output_6_3 * w1_3_5 + s0_output_6_4 * w1_4_5 + s0_output_6_5 * w1_5_5)[23:8] + b_5;
        meta.ff_6_6 = (s0_output_6_0 * w1_0_6 + s0_output_6_1 * w1_1_6 + s0_output_6_2 * w1_2_6 + s0_output_6_3 * w1_3_6 + s0_output_6_4 * w1_4_6 + s0_output_6_5 * w1_5_6)[23:8] + b_6;
        meta.ff_6_7 = (s0_output_6_0 * w1_0_7 + s0_output_6_1 * w1_1_7 + s0_output_6_2 * w1_2_7 + s0_output_6_3 * w1_3_7 + s0_output_6_4 * w1_4_7 + s0_output_6_5 * w1_5_7)[23:8] + b_7;
        meta.ff_6_8 = (s0_output_6_0 * w1_0_8 + s0_output_6_1 * w1_1_8 + s0_output_6_2 * w1_2_8 + s0_output_6_3 * w1_3_8 + s0_output_6_4 * w1_4_8 + s0_output_6_5 * w1_5_8)[23:8] + b_8;
        meta.ff_6_9 = (s0_output_6_0 * w1_0_9 + s0_output_6_1 * w1_1_9 + s0_output_6_2 * w1_2_9 + s0_output_6_3 * w1_3_9 + s0_output_6_4 * w1_4_9 + s0_output_6_5 * w1_5_9)[23:8] + b_9;
        meta.ff_6_10 = (s0_output_6_0 * w1_0_10 + s0_output_6_1 * w1_1_10 + s0_output_6_2 * w1_2_10 + s0_output_6_3 * w1_3_10 + s0_output_6_4 * w1_4_10 + s0_output_6_5 * w1_5_10)[23:8] + b_10;
        meta.ff_6_11 = (s0_output_6_0 * w1_0_11 + s0_output_6_1 * w1_1_11 + s0_output_6_2 * w1_2_11 + s0_output_6_3 * w1_3_11 + s0_output_6_4 * w1_4_11 + s0_output_6_5 * w1_5_11)[23:8] + b_11;
        meta.ff_7_0 = (s0_output_7_0 * w1_0_0 + s0_output_7_1 * w1_1_0 + s0_output_7_2 * w1_2_0 + s0_output_7_3 * w1_3_0 + s0_output_7_4 * w1_4_0 + s0_output_7_5 * w1_5_0)[23:8] + b_0;
        meta.ff_7_1 = (s0_output_7_0 * w1_0_1 + s0_output_7_1 * w1_1_1 + s0_output_7_2 * w1_2_1 + s0_output_7_3 * w1_3_1 + s0_output_7_4 * w1_4_1 + s0_output_7_5 * w1_5_1)[23:8] + b_1;
        meta.ff_7_2 = (s0_output_7_0 * w1_0_2 + s0_output_7_1 * w1_1_2 + s0_output_7_2 * w1_2_2 + s0_output_7_3 * w1_3_2 + s0_output_7_4 * w1_4_2 + s0_output_7_5 * w1_5_2)[23:8] + b_2;
        meta.ff_7_3 = (s0_output_7_0 * w1_0_3 + s0_output_7_1 * w1_1_3 + s0_output_7_2 * w1_2_3 + s0_output_7_3 * w1_3_3 + s0_output_7_4 * w1_4_3 + s0_output_7_5 * w1_5_3)[23:8] + b_3;
        meta.ff_7_4 = (s0_output_7_0 * w1_0_4 + s0_output_7_1 * w1_1_4 + s0_output_7_2 * w1_2_4 + s0_output_7_3 * w1_3_4 + s0_output_7_4 * w1_4_4 + s0_output_7_5 * w1_5_4)[23:8] + b_4;
        meta.ff_7_5 = (s0_output_7_0 * w1_0_5 + s0_output_7_1 * w1_1_5 + s0_output_7_2 * w1_2_5 + s0_output_7_3 * w1_3_5 + s0_output_7_4 * w1_4_5 + s0_output_7_5 * w1_5_5)[23:8] + b_5;
        meta.ff_7_6 = (s0_output_7_0 * w1_0_6 + s0_output_7_1 * w1_1_6 + s0_output_7_2 * w1_2_6 + s0_output_7_3 * w1_3_6 + s0_output_7_4 * w1_4_6 + s0_output_7_5 * w1_5_6)[23:8] + b_6;
        meta.ff_7_7 = (s0_output_7_0 * w1_0_7 + s0_output_7_1 * w1_1_7 + s0_output_7_2 * w1_2_7 + s0_output_7_3 * w1_3_7 + s0_output_7_4 * w1_4_7 + s0_output_7_5 * w1_5_7)[23:8] + b_7;
        meta.ff_7_8 = (s0_output_7_0 * w1_0_8 + s0_output_7_1 * w1_1_8 + s0_output_7_2 * w1_2_8 + s0_output_7_3 * w1_3_8 + s0_output_7_4 * w1_4_8 + s0_output_7_5 * w1_5_8)[23:8] + b_8;
        meta.ff_7_9 = (s0_output_7_0 * w1_0_9 + s0_output_7_1 * w1_1_9 + s0_output_7_2 * w1_2_9 + s0_output_7_3 * w1_3_9 + s0_output_7_4 * w1_4_9 + s0_output_7_5 * w1_5_9)[23:8] + b_9;
        meta.ff_7_10 = (s0_output_7_0 * w1_0_10 + s0_output_7_1 * w1_1_10 + s0_output_7_2 * w1_2_10 + s0_output_7_3 * w1_3_10 + s0_output_7_4 * w1_4_10 + s0_output_7_5 * w1_5_10)[23:8] + b_10;
        meta.ff_7_11 = (s0_output_7_0 * w1_0_11 + s0_output_7_1 * w1_1_11 + s0_output_7_2 * w1_2_11 + s0_output_7_3 * w1_3_11 + s0_output_7_4 * w1_4_11 + s0_output_7_5 * w1_5_11)[23:8] + b_11;

  }


    action operation_relu() {
        const bit<16> zero = 0x0;
        // 通过符号位判断是否大于0以实现relu
        meta.ff_0_0 = ((meta.ff_0_0 & 0x8000) != 0) ? zero : meta.ff_0_0;
        meta.ff_0_1 = ((meta.ff_0_1 & 0x8000) != 0) ? zero : meta.ff_0_1;
        meta.ff_0_2 = ((meta.ff_0_2 & 0x8000) != 0) ? zero : meta.ff_0_2;
        meta.ff_0_3 = ((meta.ff_0_3 & 0x8000) != 0) ? zero : meta.ff_0_3;
        meta.ff_0_4 = ((meta.ff_0_4 & 0x8000) != 0) ? zero : meta.ff_0_4;
        meta.ff_0_5 = ((meta.ff_0_5 & 0x8000) != 0) ? zero : meta.ff_0_5;
        meta.ff_0_6 = ((meta.ff_0_6 & 0x8000) != 0) ? zero : meta.ff_0_6;
        meta.ff_0_7 = ((meta.ff_0_7 & 0x8000) != 0) ? zero : meta.ff_0_7;
        meta.ff_0_8 = ((meta.ff_0_8 & 0x8000) != 0) ? zero : meta.ff_0_8;
        meta.ff_0_9 = ((meta.ff_0_9 & 0x8000) != 0) ? zero : meta.ff_0_9;
        meta.ff_0_10 = ((meta.ff_0_10 & 0x8000) != 0) ? zero : meta.ff_0_10;
        meta.ff_0_11 = ((meta.ff_0_11 & 0x8000) != 0) ? zero : meta.ff_0_11;
        meta.ff_1_0 = ((meta.ff_1_0 & 0x8000) != 0) ? zero : meta.ff_1_0;
        meta.ff_1_1 = ((meta.ff_1_1 & 0x8000) != 0) ? zero : meta.ff_1_1;
        meta.ff_1_2 = ((meta.ff_1_2 & 0x8000) != 0) ? zero : meta.ff_1_2;
        meta.ff_1_3 = ((meta.ff_1_3 & 0x8000) != 0) ? zero : meta.ff_1_3;
        meta.ff_1_4 = ((meta.ff_1_4 & 0x8000) != 0) ? zero : meta.ff_1_4;
        meta.ff_1_5 = ((meta.ff_1_5 & 0x8000) != 0) ? zero : meta.ff_1_5;
        meta.ff_1_6 = ((meta.ff_1_6 & 0x8000) != 0) ? zero : meta.ff_1_6;
        meta.ff_1_7 = ((meta.ff_1_7 & 0x8000) != 0) ? zero : meta.ff_1_7;
        meta.ff_1_8 = ((meta.ff_1_8 & 0x8000) != 0) ? zero : meta.ff_1_8;
        meta.ff_1_9 = ((meta.ff_1_9 & 0x8000) != 0) ? zero : meta.ff_1_9;
        meta.ff_1_10 = ((meta.ff_1_10 & 0x8000) != 0) ? zero : meta.ff_1_10;
        meta.ff_1_11 = ((meta.ff_1_11 & 0x8000) != 0) ? zero : meta.ff_1_11;
        meta.ff_2_0 = ((meta.ff_2_0 & 0x8000) != 0) ? zero : meta.ff_2_0;
        meta.ff_2_1 = ((meta.ff_2_1 & 0x8000) != 0) ? zero : meta.ff_2_1;
        meta.ff_2_2 = ((meta.ff_2_2 & 0x8000) != 0) ? zero : meta.ff_2_2;
        meta.ff_2_3 = ((meta.ff_2_3 & 0x8000) != 0) ? zero : meta.ff_2_3;
        meta.ff_2_4 = ((meta.ff_2_4 & 0x8000) != 0) ? zero : meta.ff_2_4;
        meta.ff_2_5 = ((meta.ff_2_5 & 0x8000) != 0) ? zero : meta.ff_2_5;
        meta.ff_2_6 = ((meta.ff_2_6 & 0x8000) != 0) ? zero : meta.ff_2_6;
        meta.ff_2_7 = ((meta.ff_2_7 & 0x8000) != 0) ? zero : meta.ff_2_7;
        meta.ff_2_8 = ((meta.ff_2_8 & 0x8000) != 0) ? zero : meta.ff_2_8;
        meta.ff_2_9 = ((meta.ff_2_9 & 0x8000) != 0) ? zero : meta.ff_2_9;
        meta.ff_2_10 = ((meta.ff_2_10 & 0x8000) != 0) ? zero : meta.ff_2_10;
        meta.ff_2_11 = ((meta.ff_2_11 & 0x8000) != 0) ? zero : meta.ff_2_11;
        meta.ff_3_0 = ((meta.ff_3_0 & 0x8000) != 0) ? zero : meta.ff_3_0;
        meta.ff_3_1 = ((meta.ff_3_1 & 0x8000) != 0) ? zero : meta.ff_3_1;
        meta.ff_3_2 = ((meta.ff_3_2 & 0x8000) != 0) ? zero : meta.ff_3_2;
        meta.ff_3_3 = ((meta.ff_3_3 & 0x8000) != 0) ? zero : meta.ff_3_3;
        meta.ff_3_4 = ((meta.ff_3_4 & 0x8000) != 0) ? zero : meta.ff_3_4;
        meta.ff_3_5 = ((meta.ff_3_5 & 0x8000) != 0) ? zero : meta.ff_3_5;
        meta.ff_3_6 = ((meta.ff_3_6 & 0x8000) != 0) ? zero : meta.ff_3_6;
        meta.ff_3_7 = ((meta.ff_3_7 & 0x8000) != 0) ? zero : meta.ff_3_7;
        meta.ff_3_8 = ((meta.ff_3_8 & 0x8000) != 0) ? zero : meta.ff_3_8;
        meta.ff_3_9 = ((meta.ff_3_9 & 0x8000) != 0) ? zero : meta.ff_3_9;
        meta.ff_3_10 = ((meta.ff_3_10 & 0x8000) != 0) ? zero : meta.ff_3_10;
        meta.ff_3_11 = ((meta.ff_3_11 & 0x8000) != 0) ? zero : meta.ff_3_11;
        meta.ff_4_0 = ((meta.ff_4_0 & 0x8000) != 0) ? zero : meta.ff_4_0;
        meta.ff_4_1 = ((meta.ff_4_1 & 0x8000) != 0) ? zero : meta.ff_4_1;
        meta.ff_4_2 = ((meta.ff_4_2 & 0x8000) != 0) ? zero : meta.ff_4_2;
        meta.ff_4_3 = ((meta.ff_4_3 & 0x8000) != 0) ? zero : meta.ff_4_3;
        meta.ff_4_4 = ((meta.ff_4_4 & 0x8000) != 0) ? zero : meta.ff_4_4;
        meta.ff_4_5 = ((meta.ff_4_5 & 0x8000) != 0) ? zero : meta.ff_4_5;
        meta.ff_4_6 = ((meta.ff_4_6 & 0x8000) != 0) ? zero : meta.ff_4_6;
        meta.ff_4_7 = ((meta.ff_4_7 & 0x8000) != 0) ? zero : meta.ff_4_7;
        meta.ff_4_8 = ((meta.ff_4_8 & 0x8000) != 0) ? zero : meta.ff_4_8;
        meta.ff_4_9 = ((meta.ff_4_9 & 0x8000) != 0) ? zero : meta.ff_4_9;
        meta.ff_4_10 = ((meta.ff_4_10 & 0x8000) != 0) ? zero : meta.ff_4_10;
        meta.ff_4_11 = ((meta.ff_4_11 & 0x8000) != 0) ? zero : meta.ff_4_11;
        meta.ff_5_0 = ((meta.ff_5_0 & 0x8000) != 0) ? zero : meta.ff_5_0;
        meta.ff_5_1 = ((meta.ff_5_1 & 0x8000) != 0) ? zero : meta.ff_5_1;
        meta.ff_5_2 = ((meta.ff_5_2 & 0x8000) != 0) ? zero : meta.ff_5_2;
        meta.ff_5_3 = ((meta.ff_5_3 & 0x8000) != 0) ? zero : meta.ff_5_3;
        meta.ff_5_4 = ((meta.ff_5_4 & 0x8000) != 0) ? zero : meta.ff_5_4;
        meta.ff_5_5 = ((meta.ff_5_5 & 0x8000) != 0) ? zero : meta.ff_5_5;
        meta.ff_5_6 = ((meta.ff_5_6 & 0x8000) != 0) ? zero : meta.ff_5_6;
        meta.ff_5_7 = ((meta.ff_5_7 & 0x8000) != 0) ? zero : meta.ff_5_7;
        meta.ff_5_8 = ((meta.ff_5_8 & 0x8000) != 0) ? zero : meta.ff_5_8;
        meta.ff_5_9 = ((meta.ff_5_9 & 0x8000) != 0) ? zero : meta.ff_5_9;
        meta.ff_5_10 = ((meta.ff_5_10 & 0x8000) != 0) ? zero : meta.ff_5_10;
        meta.ff_5_11 = ((meta.ff_5_11 & 0x8000) != 0) ? zero : meta.ff_5_11;
        meta.ff_6_0 = ((meta.ff_6_0 & 0x8000) != 0) ? zero : meta.ff_6_0;
        meta.ff_6_1 = ((meta.ff_6_1 & 0x8000) != 0) ? zero : meta.ff_6_1;
        meta.ff_6_2 = ((meta.ff_6_2 & 0x8000) != 0) ? zero : meta.ff_6_2;
        meta.ff_6_3 = ((meta.ff_6_3 & 0x8000) != 0) ? zero : meta.ff_6_3;
        meta.ff_6_4 = ((meta.ff_6_4 & 0x8000) != 0) ? zero : meta.ff_6_4;
        meta.ff_6_5 = ((meta.ff_6_5 & 0x8000) != 0) ? zero : meta.ff_6_5;
        meta.ff_6_6 = ((meta.ff_6_6 & 0x8000) != 0) ? zero : meta.ff_6_6;
        meta.ff_6_7 = ((meta.ff_6_7 & 0x8000) != 0) ? zero : meta.ff_6_7;
        meta.ff_6_8 = ((meta.ff_6_8 & 0x8000) != 0) ? zero : meta.ff_6_8;
        meta.ff_6_9 = ((meta.ff_6_9 & 0x8000) != 0) ? zero : meta.ff_6_9;
        meta.ff_6_10 = ((meta.ff_6_10 & 0x8000) != 0) ? zero : meta.ff_6_10;
        meta.ff_6_11 = ((meta.ff_6_11 & 0x8000) != 0) ? zero : meta.ff_6_11;
        meta.ff_7_0 = ((meta.ff_7_0 & 0x8000) != 0) ? zero : meta.ff_7_0;
        meta.ff_7_1 = ((meta.ff_7_1 & 0x8000) != 0) ? zero : meta.ff_7_1;
        meta.ff_7_2 = ((meta.ff_7_2 & 0x8000) != 0) ? zero : meta.ff_7_2;
        meta.ff_7_3 = ((meta.ff_7_3 & 0x8000) != 0) ? zero : meta.ff_7_3;
        meta.ff_7_4 = ((meta.ff_7_4 & 0x8000) != 0) ? zero : meta.ff_7_4;
        meta.ff_7_5 = ((meta.ff_7_5 & 0x8000) != 0) ? zero : meta.ff_7_5;
        meta.ff_7_6 = ((meta.ff_7_6 & 0x8000) != 0) ? zero : meta.ff_7_6;
        meta.ff_7_7 = ((meta.ff_7_7 & 0x8000) != 0) ? zero : meta.ff_7_7;
        meta.ff_7_8 = ((meta.ff_7_8 & 0x8000) != 0) ? zero : meta.ff_7_8;
        meta.ff_7_9 = ((meta.ff_7_9 & 0x8000) != 0) ? zero : meta.ff_7_9;
        meta.ff_7_10 = ((meta.ff_7_10 & 0x8000) != 0) ? zero : meta.ff_7_10;
        meta.ff_7_11 = ((meta.ff_7_11 & 0x8000) != 0) ? zero : meta.ff_7_11;

    }

    // (8*12) * (12*6) = (8*6)，实现残差连接
    action operation_linear2() {
        bit<32> ff_0_0 = (bit<32>) meta.ff_0_0 | (((meta.ff_0_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_0_1 = (bit<32>) meta.ff_0_1 | (((meta.ff_0_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_0_2 = (bit<32>) meta.ff_0_2 | (((meta.ff_0_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_0_3 = (bit<32>) meta.ff_0_3 | (((meta.ff_0_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_0_4 = (bit<32>) meta.ff_0_4 | (((meta.ff_0_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_0_5 = (bit<32>) meta.ff_0_5 | (((meta.ff_0_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_0_6 = (bit<32>) meta.ff_0_6 | (((meta.ff_0_6 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_0_7 = (bit<32>) meta.ff_0_7 | (((meta.ff_0_7 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_0_8 = (bit<32>) meta.ff_0_8 | (((meta.ff_0_8 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_0_9 = (bit<32>) meta.ff_0_9 | (((meta.ff_0_9 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_0_10 = (bit<32>) meta.ff_0_10 | (((meta.ff_0_10 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_0_11 = (bit<32>) meta.ff_0_11 | (((meta.ff_0_11 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_1_0 = (bit<32>) meta.ff_1_0 | (((meta.ff_1_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_1_1 = (bit<32>) meta.ff_1_1 | (((meta.ff_1_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_1_2 = (bit<32>) meta.ff_1_2 | (((meta.ff_1_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_1_3 = (bit<32>) meta.ff_1_3 | (((meta.ff_1_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_1_4 = (bit<32>) meta.ff_1_4 | (((meta.ff_1_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_1_5 = (bit<32>) meta.ff_1_5 | (((meta.ff_1_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_1_6 = (bit<32>) meta.ff_1_6 | (((meta.ff_1_6 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_1_7 = (bit<32>) meta.ff_1_7 | (((meta.ff_1_7 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_1_8 = (bit<32>) meta.ff_1_8 | (((meta.ff_1_8 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_1_9 = (bit<32>) meta.ff_1_9 | (((meta.ff_1_9 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_1_10 = (bit<32>) meta.ff_1_10 | (((meta.ff_1_10 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_1_11 = (bit<32>) meta.ff_1_11 | (((meta.ff_1_11 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_2_0 = (bit<32>) meta.ff_2_0 | (((meta.ff_2_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_2_1 = (bit<32>) meta.ff_2_1 | (((meta.ff_2_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_2_2 = (bit<32>) meta.ff_2_2 | (((meta.ff_2_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_2_3 = (bit<32>) meta.ff_2_3 | (((meta.ff_2_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_2_4 = (bit<32>) meta.ff_2_4 | (((meta.ff_2_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_2_5 = (bit<32>) meta.ff_2_5 | (((meta.ff_2_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_2_6 = (bit<32>) meta.ff_2_6 | (((meta.ff_2_6 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_2_7 = (bit<32>) meta.ff_2_7 | (((meta.ff_2_7 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_2_8 = (bit<32>) meta.ff_2_8 | (((meta.ff_2_8 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_2_9 = (bit<32>) meta.ff_2_9 | (((meta.ff_2_9 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_2_10 = (bit<32>) meta.ff_2_10 | (((meta.ff_2_10 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_2_11 = (bit<32>) meta.ff_2_11 | (((meta.ff_2_11 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_3_0 = (bit<32>) meta.ff_3_0 | (((meta.ff_3_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_3_1 = (bit<32>) meta.ff_3_1 | (((meta.ff_3_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_3_2 = (bit<32>) meta.ff_3_2 | (((meta.ff_3_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_3_3 = (bit<32>) meta.ff_3_3 | (((meta.ff_3_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_3_4 = (bit<32>) meta.ff_3_4 | (((meta.ff_3_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_3_5 = (bit<32>) meta.ff_3_5 | (((meta.ff_3_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_3_6 = (bit<32>) meta.ff_3_6 | (((meta.ff_3_6 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_3_7 = (bit<32>) meta.ff_3_7 | (((meta.ff_3_7 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_3_8 = (bit<32>) meta.ff_3_8 | (((meta.ff_3_8 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_3_9 = (bit<32>) meta.ff_3_9 | (((meta.ff_3_9 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_3_10 = (bit<32>) meta.ff_3_10 | (((meta.ff_3_10 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_3_11 = (bit<32>) meta.ff_3_11 | (((meta.ff_3_11 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_4_0 = (bit<32>) meta.ff_4_0 | (((meta.ff_4_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_4_1 = (bit<32>) meta.ff_4_1 | (((meta.ff_4_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_4_2 = (bit<32>) meta.ff_4_2 | (((meta.ff_4_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_4_3 = (bit<32>) meta.ff_4_3 | (((meta.ff_4_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_4_4 = (bit<32>) meta.ff_4_4 | (((meta.ff_4_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_4_5 = (bit<32>) meta.ff_4_5 | (((meta.ff_4_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_4_6 = (bit<32>) meta.ff_4_6 | (((meta.ff_4_6 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_4_7 = (bit<32>) meta.ff_4_7 | (((meta.ff_4_7 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_4_8 = (bit<32>) meta.ff_4_8 | (((meta.ff_4_8 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_4_9 = (bit<32>) meta.ff_4_9 | (((meta.ff_4_9 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_4_10 = (bit<32>) meta.ff_4_10 | (((meta.ff_4_10 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_4_11 = (bit<32>) meta.ff_4_11 | (((meta.ff_4_11 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_5_0 = (bit<32>) meta.ff_5_0 | (((meta.ff_5_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_5_1 = (bit<32>) meta.ff_5_1 | (((meta.ff_5_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_5_2 = (bit<32>) meta.ff_5_2 | (((meta.ff_5_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_5_3 = (bit<32>) meta.ff_5_3 | (((meta.ff_5_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_5_4 = (bit<32>) meta.ff_5_4 | (((meta.ff_5_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_5_5 = (bit<32>) meta.ff_5_5 | (((meta.ff_5_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_5_6 = (bit<32>) meta.ff_5_6 | (((meta.ff_5_6 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_5_7 = (bit<32>) meta.ff_5_7 | (((meta.ff_5_7 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_5_8 = (bit<32>) meta.ff_5_8 | (((meta.ff_5_8 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_5_9 = (bit<32>) meta.ff_5_9 | (((meta.ff_5_9 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_5_10 = (bit<32>) meta.ff_5_10 | (((meta.ff_5_10 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_5_11 = (bit<32>) meta.ff_5_11 | (((meta.ff_5_11 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_6_0 = (bit<32>) meta.ff_6_0 | (((meta.ff_6_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_6_1 = (bit<32>) meta.ff_6_1 | (((meta.ff_6_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_6_2 = (bit<32>) meta.ff_6_2 | (((meta.ff_6_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_6_3 = (bit<32>) meta.ff_6_3 | (((meta.ff_6_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_6_4 = (bit<32>) meta.ff_6_4 | (((meta.ff_6_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_6_5 = (bit<32>) meta.ff_6_5 | (((meta.ff_6_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_6_6 = (bit<32>) meta.ff_6_6 | (((meta.ff_6_6 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_6_7 = (bit<32>) meta.ff_6_7 | (((meta.ff_6_7 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_6_8 = (bit<32>) meta.ff_6_8 | (((meta.ff_6_8 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_6_9 = (bit<32>) meta.ff_6_9 | (((meta.ff_6_9 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_6_10 = (bit<32>) meta.ff_6_10 | (((meta.ff_6_10 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_6_11 = (bit<32>) meta.ff_6_11 | (((meta.ff_6_11 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_7_0 = (bit<32>) meta.ff_7_0 | (((meta.ff_7_0 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_7_1 = (bit<32>) meta.ff_7_1 | (((meta.ff_7_1 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_7_2 = (bit<32>) meta.ff_7_2 | (((meta.ff_7_2 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_7_3 = (bit<32>) meta.ff_7_3 | (((meta.ff_7_3 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_7_4 = (bit<32>) meta.ff_7_4 | (((meta.ff_7_4 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_7_5 = (bit<32>) meta.ff_7_5 | (((meta.ff_7_5 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_7_6 = (bit<32>) meta.ff_7_6 | (((meta.ff_7_6 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_7_7 = (bit<32>) meta.ff_7_7 | (((meta.ff_7_7 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_7_8 = (bit<32>) meta.ff_7_8 | (((meta.ff_7_8 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_7_9 = (bit<32>) meta.ff_7_9 | (((meta.ff_7_9 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_7_10 = (bit<32>) meta.ff_7_10 | (((meta.ff_7_10 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        bit<32> ff_7_11 = (bit<32>) meta.ff_7_11 | (((meta.ff_7_11 & 0x8000) != 0) ? 32w0xFFFF0000 : 0);
        
        bit<16> result_0_0 = (ff_0_0 * w2_0_0 + ff_0_1 * w2_1_0 + ff_0_2 * w2_2_0 + ff_0_3 * w2_3_0 + ff_0_4 * w2_4_0 + ff_0_5 * w2_5_0 + ff_0_6 * w2_6_0 + ff_0_7 * w2_7_0 + ff_0_8 * w2_8_0 + ff_0_9 * w2_9_0 + ff_0_10 * w2_10_0 + ff_0_11 * w2_11_0)[23:8] + b2_0;
        bit<16> result_0_1 = (ff_0_0 * w2_0_1 + ff_0_1 * w2_1_1 + ff_0_2 * w2_2_1 + ff_0_3 * w2_3_1 + ff_0_4 * w2_4_1 + ff_0_5 * w2_5_1 + ff_0_6 * w2_6_1 + ff_0_7 * w2_7_1 + ff_0_8 * w2_8_1 + ff_0_9 * w2_9_1 + ff_0_10 * w2_10_1 + ff_0_11 * w2_11_1)[23:8] + b2_1;
        bit<16> result_0_2 = (ff_0_0 * w2_0_2 + ff_0_1 * w2_1_2 + ff_0_2 * w2_2_2 + ff_0_3 * w2_3_2 + ff_0_4 * w2_4_2 + ff_0_5 * w2_5_2 + ff_0_6 * w2_6_2 + ff_0_7 * w2_7_2 + ff_0_8 * w2_8_2 + ff_0_9 * w2_9_2 + ff_0_10 * w2_10_2 + ff_0_11 * w2_11_2)[23:8] + b2_2;
        bit<16> result_0_3 = (ff_0_0 * w2_0_3 + ff_0_1 * w2_1_3 + ff_0_2 * w2_2_3 + ff_0_3 * w2_3_3 + ff_0_4 * w2_4_3 + ff_0_5 * w2_5_3 + ff_0_6 * w2_6_3 + ff_0_7 * w2_7_3 + ff_0_8 * w2_8_3 + ff_0_9 * w2_9_3 + ff_0_10 * w2_10_3 + ff_0_11 * w2_11_3)[23:8] + b2_3;
        bit<16> result_0_4 = (ff_0_0 * w2_0_4 + ff_0_1 * w2_1_4 + ff_0_2 * w2_2_4 + ff_0_3 * w2_3_4 + ff_0_4 * w2_4_4 + ff_0_5 * w2_5_4 + ff_0_6 * w2_6_4 + ff_0_7 * w2_7_4 + ff_0_8 * w2_8_4 + ff_0_9 * w2_9_4 + ff_0_10 * w2_10_4 + ff_0_11 * w2_11_4)[23:8] + b2_4;
        bit<16> result_0_5 = (ff_0_0 * w2_0_5 + ff_0_1 * w2_1_5 + ff_0_2 * w2_2_5 + ff_0_3 * w2_3_5 + ff_0_4 * w2_4_5 + ff_0_5 * w2_5_5 + ff_0_6 * w2_6_5 + ff_0_7 * w2_7_5 + ff_0_8 * w2_8_5 + ff_0_9 * w2_9_5 + ff_0_10 * w2_10_5 + ff_0_11 * w2_11_5)[23:8] + b2_5;
        bit<16> result_1_0 = (ff_1_0 * w2_0_0 + ff_1_1 * w2_1_0 + ff_1_2 * w2_2_0 + ff_1_3 * w2_3_0 + ff_1_4 * w2_4_0 + ff_1_5 * w2_5_0 + ff_1_6 * w2_6_0 + ff_1_7 * w2_7_0 + ff_1_8 * w2_8_0 + ff_1_9 * w2_9_0 + ff_1_10 * w2_10_0 + ff_1_11 * w2_11_0)[23:8] + b2_0;
        bit<16> result_1_1 = (ff_1_0 * w2_0_1 + ff_1_1 * w2_1_1 + ff_1_2 * w2_2_1 + ff_1_3 * w2_3_1 + ff_1_4 * w2_4_1 + ff_1_5 * w2_5_1 + ff_1_6 * w2_6_1 + ff_1_7 * w2_7_1 + ff_1_8 * w2_8_1 + ff_1_9 * w2_9_1 + ff_1_10 * w2_10_1 + ff_1_11 * w2_11_1)[23:8] + b2_1;
        bit<16> result_1_2 = (ff_1_0 * w2_0_2 + ff_1_1 * w2_1_2 + ff_1_2 * w2_2_2 + ff_1_3 * w2_3_2 + ff_1_4 * w2_4_2 + ff_1_5 * w2_5_2 + ff_1_6 * w2_6_2 + ff_1_7 * w2_7_2 + ff_1_8 * w2_8_2 + ff_1_9 * w2_9_2 + ff_1_10 * w2_10_2 + ff_1_11 * w2_11_2)[23:8] + b2_2;
        bit<16> result_1_3 = (ff_1_0 * w2_0_3 + ff_1_1 * w2_1_3 + ff_1_2 * w2_2_3 + ff_1_3 * w2_3_3 + ff_1_4 * w2_4_3 + ff_1_5 * w2_5_3 + ff_1_6 * w2_6_3 + ff_1_7 * w2_7_3 + ff_1_8 * w2_8_3 + ff_1_9 * w2_9_3 + ff_1_10 * w2_10_3 + ff_1_11 * w2_11_3)[23:8] + b2_3;
        bit<16> result_1_4 = (ff_1_0 * w2_0_4 + ff_1_1 * w2_1_4 + ff_1_2 * w2_2_4 + ff_1_3 * w2_3_4 + ff_1_4 * w2_4_4 + ff_1_5 * w2_5_4 + ff_1_6 * w2_6_4 + ff_1_7 * w2_7_4 + ff_1_8 * w2_8_4 + ff_1_9 * w2_9_4 + ff_1_10 * w2_10_4 + ff_1_11 * w2_11_4)[23:8] + b2_4;
        bit<16> result_1_5 = (ff_1_0 * w2_0_5 + ff_1_1 * w2_1_5 + ff_1_2 * w2_2_5 + ff_1_3 * w2_3_5 + ff_1_4 * w2_4_5 + ff_1_5 * w2_5_5 + ff_1_6 * w2_6_5 + ff_1_7 * w2_7_5 + ff_1_8 * w2_8_5 + ff_1_9 * w2_9_5 + ff_1_10 * w2_10_5 + ff_1_11 * w2_11_5)[23:8] + b2_5;
        bit<16> result_2_0 = (ff_2_0 * w2_0_0 + ff_2_1 * w2_1_0 + ff_2_2 * w2_2_0 + ff_2_3 * w2_3_0 + ff_2_4 * w2_4_0 + ff_2_5 * w2_5_0 + ff_2_6 * w2_6_0 + ff_2_7 * w2_7_0 + ff_2_8 * w2_8_0 + ff_2_9 * w2_9_0 + ff_2_10 * w2_10_0 + ff_2_11 * w2_11_0)[23:8] + b2_0;
        bit<16> result_2_1 = (ff_2_0 * w2_0_1 + ff_2_1 * w2_1_1 + ff_2_2 * w2_2_1 + ff_2_3 * w2_3_1 + ff_2_4 * w2_4_1 + ff_2_5 * w2_5_1 + ff_2_6 * w2_6_1 + ff_2_7 * w2_7_1 + ff_2_8 * w2_8_1 + ff_2_9 * w2_9_1 + ff_2_10 * w2_10_1 + ff_2_11 * w2_11_1)[23:8] + b2_1;
        bit<16> result_2_2 = (ff_2_0 * w2_0_2 + ff_2_1 * w2_1_2 + ff_2_2 * w2_2_2 + ff_2_3 * w2_3_2 + ff_2_4 * w2_4_2 + ff_2_5 * w2_5_2 + ff_2_6 * w2_6_2 + ff_2_7 * w2_7_2 + ff_2_8 * w2_8_2 + ff_2_9 * w2_9_2 + ff_2_10 * w2_10_2 + ff_2_11 * w2_11_2)[23:8] + b2_2;
        bit<16> result_2_3 = (ff_2_0 * w2_0_3 + ff_2_1 * w2_1_3 + ff_2_2 * w2_2_3 + ff_2_3 * w2_3_3 + ff_2_4 * w2_4_3 + ff_2_5 * w2_5_3 + ff_2_6 * w2_6_3 + ff_2_7 * w2_7_3 + ff_2_8 * w2_8_3 + ff_2_9 * w2_9_3 + ff_2_10 * w2_10_3 + ff_2_11 * w2_11_3)[23:8] + b2_3;
        bit<16> result_2_4 = (ff_2_0 * w2_0_4 + ff_2_1 * w2_1_4 + ff_2_2 * w2_2_4 + ff_2_3 * w2_3_4 + ff_2_4 * w2_4_4 + ff_2_5 * w2_5_4 + ff_2_6 * w2_6_4 + ff_2_7 * w2_7_4 + ff_2_8 * w2_8_4 + ff_2_9 * w2_9_4 + ff_2_10 * w2_10_4 + ff_2_11 * w2_11_4)[23:8] + b2_4;
        bit<16> result_2_5 = (ff_2_0 * w2_0_5 + ff_2_1 * w2_1_5 + ff_2_2 * w2_2_5 + ff_2_3 * w2_3_5 + ff_2_4 * w2_4_5 + ff_2_5 * w2_5_5 + ff_2_6 * w2_6_5 + ff_2_7 * w2_7_5 + ff_2_8 * w2_8_5 + ff_2_9 * w2_9_5 + ff_2_10 * w2_10_5 + ff_2_11 * w2_11_5)[23:8] + b2_5;
        bit<16> result_3_0 = (ff_3_0 * w2_0_0 + ff_3_1 * w2_1_0 + ff_3_2 * w2_2_0 + ff_3_3 * w2_3_0 + ff_3_4 * w2_4_0 + ff_3_5 * w2_5_0 + ff_3_6 * w2_6_0 + ff_3_7 * w2_7_0 + ff_3_8 * w2_8_0 + ff_3_9 * w2_9_0 + ff_3_10 * w2_10_0 + ff_3_11 * w2_11_0)[23:8] + b2_0;
        bit<16> result_3_1 = (ff_3_0 * w2_0_1 + ff_3_1 * w2_1_1 + ff_3_2 * w2_2_1 + ff_3_3 * w2_3_1 + ff_3_4 * w2_4_1 + ff_3_5 * w2_5_1 + ff_3_6 * w2_6_1 + ff_3_7 * w2_7_1 + ff_3_8 * w2_8_1 + ff_3_9 * w2_9_1 + ff_3_10 * w2_10_1 + ff_3_11 * w2_11_1)[23:8] + b2_1;
        bit<16> result_3_2 = (ff_3_0 * w2_0_2 + ff_3_1 * w2_1_2 + ff_3_2 * w2_2_2 + ff_3_3 * w2_3_2 + ff_3_4 * w2_4_2 + ff_3_5 * w2_5_2 + ff_3_6 * w2_6_2 + ff_3_7 * w2_7_2 + ff_3_8 * w2_8_2 + ff_3_9 * w2_9_2 + ff_3_10 * w2_10_2 + ff_3_11 * w2_11_2)[23:8] + b2_2;
        bit<16> result_3_3 = (ff_3_0 * w2_0_3 + ff_3_1 * w2_1_3 + ff_3_2 * w2_2_3 + ff_3_3 * w2_3_3 + ff_3_4 * w2_4_3 + ff_3_5 * w2_5_3 + ff_3_6 * w2_6_3 + ff_3_7 * w2_7_3 + ff_3_8 * w2_8_3 + ff_3_9 * w2_9_3 + ff_3_10 * w2_10_3 + ff_3_11 * w2_11_3)[23:8] + b2_3;
        bit<16> result_3_4 = (ff_3_0 * w2_0_4 + ff_3_1 * w2_1_4 + ff_3_2 * w2_2_4 + ff_3_3 * w2_3_4 + ff_3_4 * w2_4_4 + ff_3_5 * w2_5_4 + ff_3_6 * w2_6_4 + ff_3_7 * w2_7_4 + ff_3_8 * w2_8_4 + ff_3_9 * w2_9_4 + ff_3_10 * w2_10_4 + ff_3_11 * w2_11_4)[23:8] + b2_4;
        bit<16> result_3_5 = (ff_3_0 * w2_0_5 + ff_3_1 * w2_1_5 + ff_3_2 * w2_2_5 + ff_3_3 * w2_3_5 + ff_3_4 * w2_4_5 + ff_3_5 * w2_5_5 + ff_3_6 * w2_6_5 + ff_3_7 * w2_7_5 + ff_3_8 * w2_8_5 + ff_3_9 * w2_9_5 + ff_3_10 * w2_10_5 + ff_3_11 * w2_11_5)[23:8] + b2_5;
        bit<16> result_4_0 = (ff_4_0 * w2_0_0 + ff_4_1 * w2_1_0 + ff_4_2 * w2_2_0 + ff_4_3 * w2_3_0 + ff_4_4 * w2_4_0 + ff_4_5 * w2_5_0 + ff_4_6 * w2_6_0 + ff_4_7 * w2_7_0 + ff_4_8 * w2_8_0 + ff_4_9 * w2_9_0 + ff_4_10 * w2_10_0 + ff_4_11 * w2_11_0)[23:8] + b2_0;
        bit<16> result_4_1 = (ff_4_0 * w2_0_1 + ff_4_1 * w2_1_1 + ff_4_2 * w2_2_1 + ff_4_3 * w2_3_1 + ff_4_4 * w2_4_1 + ff_4_5 * w2_5_1 + ff_4_6 * w2_6_1 + ff_4_7 * w2_7_1 + ff_4_8 * w2_8_1 + ff_4_9 * w2_9_1 + ff_4_10 * w2_10_1 + ff_4_11 * w2_11_1)[23:8] + b2_1;
        bit<16> result_4_2 = (ff_4_0 * w2_0_2 + ff_4_1 * w2_1_2 + ff_4_2 * w2_2_2 + ff_4_3 * w2_3_2 + ff_4_4 * w2_4_2 + ff_4_5 * w2_5_2 + ff_4_6 * w2_6_2 + ff_4_7 * w2_7_2 + ff_4_8 * w2_8_2 + ff_4_9 * w2_9_2 + ff_4_10 * w2_10_2 + ff_4_11 * w2_11_2)[23:8] + b2_2;
        bit<16> result_4_3 = (ff_4_0 * w2_0_3 + ff_4_1 * w2_1_3 + ff_4_2 * w2_2_3 + ff_4_3 * w2_3_3 + ff_4_4 * w2_4_3 + ff_4_5 * w2_5_3 + ff_4_6 * w2_6_3 + ff_4_7 * w2_7_3 + ff_4_8 * w2_8_3 + ff_4_9 * w2_9_3 + ff_4_10 * w2_10_3 + ff_4_11 * w2_11_3)[23:8] + b2_3;
        bit<16> result_4_4 = (ff_4_0 * w2_0_4 + ff_4_1 * w2_1_4 + ff_4_2 * w2_2_4 + ff_4_3 * w2_3_4 + ff_4_4 * w2_4_4 + ff_4_5 * w2_5_4 + ff_4_6 * w2_6_4 + ff_4_7 * w2_7_4 + ff_4_8 * w2_8_4 + ff_4_9 * w2_9_4 + ff_4_10 * w2_10_4 + ff_4_11 * w2_11_4)[23:8] + b2_4;
        bit<16> result_4_5 = (ff_4_0 * w2_0_5 + ff_4_1 * w2_1_5 + ff_4_2 * w2_2_5 + ff_4_3 * w2_3_5 + ff_4_4 * w2_4_5 + ff_4_5 * w2_5_5 + ff_4_6 * w2_6_5 + ff_4_7 * w2_7_5 + ff_4_8 * w2_8_5 + ff_4_9 * w2_9_5 + ff_4_10 * w2_10_5 + ff_4_11 * w2_11_5)[23:8] + b2_5;
        bit<16> result_5_0 = (ff_5_0 * w2_0_0 + ff_5_1 * w2_1_0 + ff_5_2 * w2_2_0 + ff_5_3 * w2_3_0 + ff_5_4 * w2_4_0 + ff_5_5 * w2_5_0 + ff_5_6 * w2_6_0 + ff_5_7 * w2_7_0 + ff_5_8 * w2_8_0 + ff_5_9 * w2_9_0 + ff_5_10 * w2_10_0 + ff_5_11 * w2_11_0)[23:8] + b2_0;
        bit<16> result_5_1 = (ff_5_0 * w2_0_1 + ff_5_1 * w2_1_1 + ff_5_2 * w2_2_1 + ff_5_3 * w2_3_1 + ff_5_4 * w2_4_1 + ff_5_5 * w2_5_1 + ff_5_6 * w2_6_1 + ff_5_7 * w2_7_1 + ff_5_8 * w2_8_1 + ff_5_9 * w2_9_1 + ff_5_10 * w2_10_1 + ff_5_11 * w2_11_1)[23:8] + b2_1;
        bit<16> result_5_2 = (ff_5_0 * w2_0_2 + ff_5_1 * w2_1_2 + ff_5_2 * w2_2_2 + ff_5_3 * w2_3_2 + ff_5_4 * w2_4_2 + ff_5_5 * w2_5_2 + ff_5_6 * w2_6_2 + ff_5_7 * w2_7_2 + ff_5_8 * w2_8_2 + ff_5_9 * w2_9_2 + ff_5_10 * w2_10_2 + ff_5_11 * w2_11_2)[23:8] + b2_2;
        bit<16> result_5_3 = (ff_5_0 * w2_0_3 + ff_5_1 * w2_1_3 + ff_5_2 * w2_2_3 + ff_5_3 * w2_3_3 + ff_5_4 * w2_4_3 + ff_5_5 * w2_5_3 + ff_5_6 * w2_6_3 + ff_5_7 * w2_7_3 + ff_5_8 * w2_8_3 + ff_5_9 * w2_9_3 + ff_5_10 * w2_10_3 + ff_5_11 * w2_11_3)[23:8] + b2_3;
        bit<16> result_5_4 = (ff_5_0 * w2_0_4 + ff_5_1 * w2_1_4 + ff_5_2 * w2_2_4 + ff_5_3 * w2_3_4 + ff_5_4 * w2_4_4 + ff_5_5 * w2_5_4 + ff_5_6 * w2_6_4 + ff_5_7 * w2_7_4 + ff_5_8 * w2_8_4 + ff_5_9 * w2_9_4 + ff_5_10 * w2_10_4 + ff_5_11 * w2_11_4)[23:8] + b2_4;
        bit<16> result_5_5 = (ff_5_0 * w2_0_5 + ff_5_1 * w2_1_5 + ff_5_2 * w2_2_5 + ff_5_3 * w2_3_5 + ff_5_4 * w2_4_5 + ff_5_5 * w2_5_5 + ff_5_6 * w2_6_5 + ff_5_7 * w2_7_5 + ff_5_8 * w2_8_5 + ff_5_9 * w2_9_5 + ff_5_10 * w2_10_5 + ff_5_11 * w2_11_5)[23:8] + b2_5;
        bit<16> result_6_0 = (ff_6_0 * w2_0_0 + ff_6_1 * w2_1_0 + ff_6_2 * w2_2_0 + ff_6_3 * w2_3_0 + ff_6_4 * w2_4_0 + ff_6_5 * w2_5_0 + ff_6_6 * w2_6_0 + ff_6_7 * w2_7_0 + ff_6_8 * w2_8_0 + ff_6_9 * w2_9_0 + ff_6_10 * w2_10_0 + ff_6_11 * w2_11_0)[23:8] + b2_0;
        bit<16> result_6_1 = (ff_6_0 * w2_0_1 + ff_6_1 * w2_1_1 + ff_6_2 * w2_2_1 + ff_6_3 * w2_3_1 + ff_6_4 * w2_4_1 + ff_6_5 * w2_5_1 + ff_6_6 * w2_6_1 + ff_6_7 * w2_7_1 + ff_6_8 * w2_8_1 + ff_6_9 * w2_9_1 + ff_6_10 * w2_10_1 + ff_6_11 * w2_11_1)[23:8] + b2_1;
        bit<16> result_6_2 = (ff_6_0 * w2_0_2 + ff_6_1 * w2_1_2 + ff_6_2 * w2_2_2 + ff_6_3 * w2_3_2 + ff_6_4 * w2_4_2 + ff_6_5 * w2_5_2 + ff_6_6 * w2_6_2 + ff_6_7 * w2_7_2 + ff_6_8 * w2_8_2 + ff_6_9 * w2_9_2 + ff_6_10 * w2_10_2 + ff_6_11 * w2_11_2)[23:8] + b2_2;
        bit<16> result_6_3 = (ff_6_0 * w2_0_3 + ff_6_1 * w2_1_3 + ff_6_2 * w2_2_3 + ff_6_3 * w2_3_3 + ff_6_4 * w2_4_3 + ff_6_5 * w2_5_3 + ff_6_6 * w2_6_3 + ff_6_7 * w2_7_3 + ff_6_8 * w2_8_3 + ff_6_9 * w2_9_3 + ff_6_10 * w2_10_3 + ff_6_11 * w2_11_3)[23:8] + b2_3;
        bit<16> result_6_4 = (ff_6_0 * w2_0_4 + ff_6_1 * w2_1_4 + ff_6_2 * w2_2_4 + ff_6_3 * w2_3_4 + ff_6_4 * w2_4_4 + ff_6_5 * w2_5_4 + ff_6_6 * w2_6_4 + ff_6_7 * w2_7_4 + ff_6_8 * w2_8_4 + ff_6_9 * w2_9_4 + ff_6_10 * w2_10_4 + ff_6_11 * w2_11_4)[23:8] + b2_4;
        bit<16> result_6_5 = (ff_6_0 * w2_0_5 + ff_6_1 * w2_1_5 + ff_6_2 * w2_2_5 + ff_6_3 * w2_3_5 + ff_6_4 * w2_4_5 + ff_6_5 * w2_5_5 + ff_6_6 * w2_6_5 + ff_6_7 * w2_7_5 + ff_6_8 * w2_8_5 + ff_6_9 * w2_9_5 + ff_6_10 * w2_10_5 + ff_6_11 * w2_11_5)[23:8] + b2_5;
        bit<16> result_7_0 = (ff_7_0 * w2_0_0 + ff_7_1 * w2_1_0 + ff_7_2 * w2_2_0 + ff_7_3 * w2_3_0 + ff_7_4 * w2_4_0 + ff_7_5 * w2_5_0 + ff_7_6 * w2_6_0 + ff_7_7 * w2_7_0 + ff_7_8 * w2_8_0 + ff_7_9 * w2_9_0 + ff_7_10 * w2_10_0 + ff_7_11 * w2_11_0)[23:8] + b2_0;
        bit<16> result_7_1 = (ff_7_0 * w2_0_1 + ff_7_1 * w2_1_1 + ff_7_2 * w2_2_1 + ff_7_3 * w2_3_1 + ff_7_4 * w2_4_1 + ff_7_5 * w2_5_1 + ff_7_6 * w2_6_1 + ff_7_7 * w2_7_1 + ff_7_8 * w2_8_1 + ff_7_9 * w2_9_1 + ff_7_10 * w2_10_1 + ff_7_11 * w2_11_1)[23:8] + b2_1;
        bit<16> result_7_2 = (ff_7_0 * w2_0_2 + ff_7_1 * w2_1_2 + ff_7_2 * w2_2_2 + ff_7_3 * w2_3_2 + ff_7_4 * w2_4_2 + ff_7_5 * w2_5_2 + ff_7_6 * w2_6_2 + ff_7_7 * w2_7_2 + ff_7_8 * w2_8_2 + ff_7_9 * w2_9_2 + ff_7_10 * w2_10_2 + ff_7_11 * w2_11_2)[23:8] + b2_2;
        bit<16> result_7_3 = (ff_7_0 * w2_0_3 + ff_7_1 * w2_1_3 + ff_7_2 * w2_2_3 + ff_7_3 * w2_3_3 + ff_7_4 * w2_4_3 + ff_7_5 * w2_5_3 + ff_7_6 * w2_6_3 + ff_7_7 * w2_7_3 + ff_7_8 * w2_8_3 + ff_7_9 * w2_9_3 + ff_7_10 * w2_10_3 + ff_7_11 * w2_11_3)[23:8] + b2_3;
        bit<16> result_7_4 = (ff_7_0 * w2_0_4 + ff_7_1 * w2_1_4 + ff_7_2 * w2_2_4 + ff_7_3 * w2_3_4 + ff_7_4 * w2_4_4 + ff_7_5 * w2_5_4 + ff_7_6 * w2_6_4 + ff_7_7 * w2_7_4 + ff_7_8 * w2_8_4 + ff_7_9 * w2_9_4 + ff_7_10 * w2_10_4 + ff_7_11 * w2_11_4)[23:8] + b2_4;
        bit<16> result_7_5 = (ff_7_0 * w2_0_5 + ff_7_1 * w2_1_5 + ff_7_2 * w2_2_5 + ff_7_3 * w2_3_5 + ff_7_4 * w2_4_5 + ff_7_5 * w2_5_5 + ff_7_6 * w2_6_5 + ff_7_7 * w2_7_5 + ff_7_8 * w2_8_5 + ff_7_9 * w2_9_5 + ff_7_10 * w2_10_5 + ff_7_11 * w2_11_5)[23:8] + b2_5;


        //残差连接
        hdr.s0_output0_calc.s0_output_0_0 = hdr.s0_output0_calc.s0_output_0_0 + result_0_0;
        hdr.s0_output0_calc.s0_output_0_1 = hdr.s0_output0_calc.s0_output_0_1 + result_0_1;
        hdr.s0_output0_calc.s0_output_0_2 = hdr.s0_output0_calc.s0_output_0_2 + result_0_2;
        hdr.s0_output0_calc.s0_output_0_3 = hdr.s0_output0_calc.s0_output_0_3 + result_0_3;
        hdr.s0_output0_calc.s0_output_0_4 = hdr.s0_output0_calc.s0_output_0_4 + result_0_4;
        hdr.s0_output0_calc.s0_output_0_5 = hdr.s0_output0_calc.s0_output_0_5 + result_0_5;
        hdr.s0_output0_calc.s0_output_1_0 = hdr.s0_output0_calc.s0_output_1_0 + result_1_0;
        hdr.s0_output0_calc.s0_output_1_1 = hdr.s0_output0_calc.s0_output_1_1 + result_1_1;
        hdr.s0_output0_calc.s0_output_1_2 = hdr.s0_output0_calc.s0_output_1_2 + result_1_2;
        hdr.s0_output0_calc.s0_output_1_3 = hdr.s0_output0_calc.s0_output_1_3 + result_1_3;
        hdr.s0_output0_calc.s0_output_1_4 = hdr.s0_output0_calc.s0_output_1_4 + result_1_4;
        hdr.s0_output0_calc.s0_output_1_5 = hdr.s0_output0_calc.s0_output_1_5 + result_1_5;
        hdr.s0_output0_calc.s0_output_2_0 = hdr.s0_output0_calc.s0_output_2_0 + result_2_0;
        hdr.s0_output0_calc.s0_output_2_1 = hdr.s0_output0_calc.s0_output_2_1 + result_2_1;
        hdr.s0_output0_calc.s0_output_2_2 = hdr.s0_output0_calc.s0_output_2_2 + result_2_2;
        hdr.s0_output0_calc.s0_output_2_3 = hdr.s0_output0_calc.s0_output_2_3 + result_2_3;
        hdr.s0_output0_calc.s0_output_2_4 = hdr.s0_output0_calc.s0_output_2_4 + result_2_4;
        hdr.s0_output0_calc.s0_output_2_5 = hdr.s0_output0_calc.s0_output_2_5 + result_2_5;
        hdr.s0_output0_calc.s0_output_3_0 = hdr.s0_output0_calc.s0_output_3_0 + result_3_0;
        hdr.s0_output0_calc.s0_output_3_1 = hdr.s0_output0_calc.s0_output_3_1 + result_3_1;
        hdr.s0_output0_calc.s0_output_3_2 = hdr.s0_output0_calc.s0_output_3_2 + result_3_2;
        hdr.s0_output0_calc.s0_output_3_3 = hdr.s0_output0_calc.s0_output_3_3 + result_3_3;
        hdr.s0_output0_calc.s0_output_3_4 = hdr.s0_output0_calc.s0_output_3_4 + result_3_4;
        hdr.s0_output0_calc.s0_output_3_5 = hdr.s0_output0_calc.s0_output_3_5 + result_3_5;
        hdr.s0_output0_calc.s0_output_4_0 = hdr.s0_output0_calc.s0_output_4_0 + result_4_0;
        hdr.s0_output0_calc.s0_output_4_1 = hdr.s0_output0_calc.s0_output_4_1 + result_4_1;
        hdr.s0_output0_calc.s0_output_4_2 = hdr.s0_output0_calc.s0_output_4_2 + result_4_2;
        hdr.s0_output0_calc.s0_output_4_3 = hdr.s0_output0_calc.s0_output_4_3 + result_4_3;
        hdr.s0_output0_calc.s0_output_4_4 = hdr.s0_output0_calc.s0_output_4_4 + result_4_4;
        hdr.s0_output0_calc.s0_output_4_5 = hdr.s0_output0_calc.s0_output_4_5 + result_4_5;
        hdr.s0_output0_calc.s0_output_5_0 = hdr.s0_output0_calc.s0_output_5_0 + result_5_0;
        hdr.s0_output0_calc.s0_output_5_1 = hdr.s0_output0_calc.s0_output_5_1 + result_5_1;
        hdr.s0_output0_calc.s0_output_5_2 = hdr.s0_output0_calc.s0_output_5_2 + result_5_2;
        hdr.s0_output0_calc.s0_output_5_3 = hdr.s0_output0_calc.s0_output_5_3 + result_5_3;
        hdr.s0_output0_calc.s0_output_5_4 = hdr.s0_output0_calc.s0_output_5_4 + result_5_4;
        hdr.s0_output0_calc.s0_output_5_5 = hdr.s0_output0_calc.s0_output_5_5 + result_5_5;
        hdr.s0_output0_calc.s0_output_6_0 = hdr.s0_output0_calc.s0_output_6_0 + result_6_0;
        hdr.s0_output0_calc.s0_output_6_1 = hdr.s0_output0_calc.s0_output_6_1 + result_6_1;
        hdr.s0_output0_calc.s0_output_6_2 = hdr.s0_output0_calc.s0_output_6_2 + result_6_2;
        hdr.s0_output0_calc.s0_output_6_3 = hdr.s0_output0_calc.s0_output_6_3 + result_6_3;
        hdr.s0_output0_calc.s0_output_6_4 = hdr.s0_output0_calc.s0_output_6_4 + result_6_4;
        hdr.s0_output0_calc.s0_output_6_5 = hdr.s0_output0_calc.s0_output_6_5 + result_6_5;
        hdr.s0_output0_calc.s0_output_7_0 = hdr.s0_output0_calc.s0_output_7_0 + result_7_0;
        hdr.s0_output0_calc.s0_output_7_1 = hdr.s0_output0_calc.s0_output_7_1 + result_7_1;
        hdr.s0_output0_calc.s0_output_7_2 = hdr.s0_output0_calc.s0_output_7_2 + result_7_2;
        hdr.s0_output0_calc.s0_output_7_3 = hdr.s0_output0_calc.s0_output_7_3 + result_7_3;
        hdr.s0_output0_calc.s0_output_7_4 = hdr.s0_output0_calc.s0_output_7_4 + result_7_4;
        hdr.s0_output0_calc.s0_output_7_5 = hdr.s0_output0_calc.s0_output_7_5 + result_7_5;

    }

    action operation_calc_mean_var() {
        const bit<16> number_six = 43; // 43/256 = 0.16796875，非常接近实际值1/6 = 0.16666667
        bit<16> sum0 = hdr.s0_output0_calc.s0_output_0_0 + hdr.s0_output0_calc.s0_output_0_1 + hdr.s0_output0_calc.s0_output_0_2 + hdr.s0_output0_calc.s0_output_0_3 + hdr.s0_output0_calc.s0_output_0_4 + hdr.s0_output0_calc.s0_output_0_5;
        bit<16> sum1 = hdr.s0_output0_calc.s0_output_1_0 + hdr.s0_output0_calc.s0_output_1_1 + hdr.s0_output0_calc.s0_output_1_2 + hdr.s0_output0_calc.s0_output_1_3 + hdr.s0_output0_calc.s0_output_1_4 + hdr.s0_output0_calc.s0_output_1_5;
        bit<16> sum2 = hdr.s0_output0_calc.s0_output_2_0 + hdr.s0_output0_calc.s0_output_2_1 + hdr.s0_output0_calc.s0_output_2_2 + hdr.s0_output0_calc.s0_output_2_3 + hdr.s0_output0_calc.s0_output_2_4 + hdr.s0_output0_calc.s0_output_2_5;
        bit<16> sum3 = hdr.s0_output0_calc.s0_output_3_0 + hdr.s0_output0_calc.s0_output_3_1 + hdr.s0_output0_calc.s0_output_3_2 + hdr.s0_output0_calc.s0_output_3_3 + hdr.s0_output0_calc.s0_output_3_4 + hdr.s0_output0_calc.s0_output_3_5;
        bit<16> sum4 = hdr.s0_output0_calc.s0_output_4_0 + hdr.s0_output0_calc.s0_output_4_1 + hdr.s0_output0_calc.s0_output_4_2 + hdr.s0_output0_calc.s0_output_4_3 + hdr.s0_output0_calc.s0_output_4_4 + hdr.s0_output0_calc.s0_output_4_5;
        bit<16> sum5 = hdr.s0_output0_calc.s0_output_5_0 + hdr.s0_output0_calc.s0_output_5_1 + hdr.s0_output0_calc.s0_output_5_2 + hdr.s0_output0_calc.s0_output_5_3 + hdr.s0_output0_calc.s0_output_5_4 + hdr.s0_output0_calc.s0_output_5_5;
        bit<16> sum6 = hdr.s0_output0_calc.s0_output_6_0 + hdr.s0_output0_calc.s0_output_6_1 + hdr.s0_output0_calc.s0_output_6_2 + hdr.s0_output0_calc.s0_output_6_3 + hdr.s0_output0_calc.s0_output_6_4 + hdr.s0_output0_calc.s0_output_6_5;
        bit<16> sum7 = hdr.s0_output0_calc.s0_output_7_0 + hdr.s0_output0_calc.s0_output_7_1 + hdr.s0_output0_calc.s0_output_7_2 + hdr.s0_output0_calc.s0_output_7_3 + hdr.s0_output0_calc.s0_output_7_4 + hdr.s0_output0_calc.s0_output_7_5;

        bit<16> mean0 = sum0*number_six;
        bit<16> mean1 = sum1*number_six;
        bit<16> mean2 = sum2*number_six;
        bit<16> mean3 = sum3*number_six;
        bit<16> mean4 = sum4*number_six;
        bit<16> mean5 = sum5*number_six;
        bit<16> mean6 = sum6*number_six;
        bit<16> mean7 = sum7*number_six;
        
        // 求与均值的偏差
        meta.deviation_0_0 = hdr.s0_output0_calc.s0_output_0_0 - mean0;
        meta.deviation_0_1 = hdr.s0_output0_calc.s0_output_0_1 - mean0;
        meta.deviation_0_2 = hdr.s0_output0_calc.s0_output_0_2 - mean0;
        meta.deviation_0_3 = hdr.s0_output0_calc.s0_output_0_3 - mean0;
        meta.deviation_0_4 = hdr.s0_output0_calc.s0_output_0_4 - mean0;
        meta.deviation_0_5 = hdr.s0_output0_calc.s0_output_0_5 - mean0;
        meta.deviation_1_0 = hdr.s0_output0_calc.s0_output_1_0 - mean1;
        meta.deviation_1_1 = hdr.s0_output0_calc.s0_output_1_1 - mean1;
        meta.deviation_1_2 = hdr.s0_output0_calc.s0_output_1_2 - mean1;
        meta.deviation_1_3 = hdr.s0_output0_calc.s0_output_1_3 - mean1;
        meta.deviation_1_4 = hdr.s0_output0_calc.s0_output_1_4 - mean1;
        meta.deviation_1_5 = hdr.s0_output0_calc.s0_output_1_5 - mean1;
        meta.deviation_2_0 = hdr.s0_output0_calc.s0_output_2_0 - mean2;
        meta.deviation_2_1 = hdr.s0_output0_calc.s0_output_2_1 - mean2;
        meta.deviation_2_2 = hdr.s0_output0_calc.s0_output_2_2 - mean2;
        meta.deviation_2_3 = hdr.s0_output0_calc.s0_output_2_3 - mean2;
        meta.deviation_2_4 = hdr.s0_output0_calc.s0_output_2_4 - mean2;
        meta.deviation_2_5 = hdr.s0_output0_calc.s0_output_2_5 - mean2;
        meta.deviation_3_0 = hdr.s0_output0_calc.s0_output_3_0 - mean3;
        meta.deviation_3_1 = hdr.s0_output0_calc.s0_output_3_1 - mean3;
        meta.deviation_3_2 = hdr.s0_output0_calc.s0_output_3_2 - mean3;
        meta.deviation_3_3 = hdr.s0_output0_calc.s0_output_3_3 - mean3;
        meta.deviation_3_4 = hdr.s0_output0_calc.s0_output_3_4 - mean3;
        meta.deviation_3_5 = hdr.s0_output0_calc.s0_output_3_5 - mean3;
        meta.deviation_4_0 = hdr.s0_output0_calc.s0_output_4_0 - mean4;
        meta.deviation_4_1 = hdr.s0_output0_calc.s0_output_4_1 - mean4;
        meta.deviation_4_2 = hdr.s0_output0_calc.s0_output_4_2 - mean4;
        meta.deviation_4_3 = hdr.s0_output0_calc.s0_output_4_3 - mean4;
        meta.deviation_4_4 = hdr.s0_output0_calc.s0_output_4_4 - mean4;
        meta.deviation_4_5 = hdr.s0_output0_calc.s0_output_4_5 - mean4;
        meta.deviation_5_0 = hdr.s0_output0_calc.s0_output_5_0 - mean5;
        meta.deviation_5_1 = hdr.s0_output0_calc.s0_output_5_1 - mean5;
        meta.deviation_5_2 = hdr.s0_output0_calc.s0_output_5_2 - mean5;
        meta.deviation_5_3 = hdr.s0_output0_calc.s0_output_5_3 - mean5;
        meta.deviation_5_4 = hdr.s0_output0_calc.s0_output_5_4 - mean5;
        meta.deviation_5_5 = hdr.s0_output0_calc.s0_output_5_5 - mean5;
        meta.deviation_6_0 = hdr.s0_output0_calc.s0_output_6_0 - mean6;
        meta.deviation_6_1 = hdr.s0_output0_calc.s0_output_6_1 - mean6;
        meta.deviation_6_2 = hdr.s0_output0_calc.s0_output_6_2 - mean6;
        meta.deviation_6_3 = hdr.s0_output0_calc.s0_output_6_3 - mean6;
        meta.deviation_6_4 = hdr.s0_output0_calc.s0_output_6_4 - mean6;
        meta.deviation_6_5 = hdr.s0_output0_calc.s0_output_6_5 - mean6;
        meta.deviation_7_0 = hdr.s0_output0_calc.s0_output_7_0 - mean7;
        meta.deviation_7_1 = hdr.s0_output0_calc.s0_output_7_1 - mean7;
        meta.deviation_7_2 = hdr.s0_output0_calc.s0_output_7_2 - mean7;
        meta.deviation_7_3 = hdr.s0_output0_calc.s0_output_7_3 - mean7;
        meta.deviation_7_4 = hdr.s0_output0_calc.s0_output_7_4 - mean7;
        meta.deviation_7_5 = hdr.s0_output0_calc.s0_output_7_5 - mean7;
        
        // 偏差16位->32位
        bit<32> deviation_0_0 = (bit<32>) meta.deviation_0_0 | (( meta.deviation_0_0 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_0_1 = (bit<32>) meta.deviation_0_1 | (( meta.deviation_0_1 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_0_2 = (bit<32>) meta.deviation_0_2 | (( meta.deviation_0_2 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_0_3 = (bit<32>) meta.deviation_0_3 | (( meta.deviation_0_3 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_0_4 = (bit<32>) meta.deviation_0_4 | (( meta.deviation_0_4 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_0_5 = (bit<32>) meta.deviation_0_5 | (( meta.deviation_0_5 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_1_0 = (bit<32>) meta.deviation_1_0 | (( meta.deviation_1_0 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_1_1 = (bit<32>) meta.deviation_1_1 | (( meta.deviation_1_1 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_1_2 = (bit<32>) meta.deviation_1_2 | (( meta.deviation_1_2 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_1_3 = (bit<32>) meta.deviation_1_3 | (( meta.deviation_1_3 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_1_4 = (bit<32>) meta.deviation_1_4 | (( meta.deviation_1_4 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_1_5 = (bit<32>) meta.deviation_1_5 | (( meta.deviation_1_5 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_2_0 = (bit<32>) meta.deviation_2_0 | (( meta.deviation_2_0 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_2_1 = (bit<32>) meta.deviation_2_1 | (( meta.deviation_2_1 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_2_2 = (bit<32>) meta.deviation_2_2 | (( meta.deviation_2_2 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_2_3 = (bit<32>) meta.deviation_2_3 | (( meta.deviation_2_3 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_2_4 = (bit<32>) meta.deviation_2_4 | (( meta.deviation_2_4 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_2_5 = (bit<32>) meta.deviation_2_5 | (( meta.deviation_2_5 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_3_0 = (bit<32>) meta.deviation_3_0 | (( meta.deviation_3_0 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_3_1 = (bit<32>) meta.deviation_3_1 | (( meta.deviation_3_1 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_3_2 = (bit<32>) meta.deviation_3_2 | (( meta.deviation_3_2 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_3_3 = (bit<32>) meta.deviation_3_3 | (( meta.deviation_3_3 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_3_4 = (bit<32>) meta.deviation_3_4 | (( meta.deviation_3_4 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_3_5 = (bit<32>) meta.deviation_3_5 | (( meta.deviation_3_5 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_4_0 = (bit<32>) meta.deviation_4_0 | (( meta.deviation_4_0 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_4_1 = (bit<32>) meta.deviation_4_1 | (( meta.deviation_4_1 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_4_2 = (bit<32>) meta.deviation_4_2 | (( meta.deviation_4_2 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_4_3 = (bit<32>) meta.deviation_4_3 | (( meta.deviation_4_3 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_4_4 = (bit<32>) meta.deviation_4_4 | (( meta.deviation_4_4 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_4_5 = (bit<32>) meta.deviation_4_5 | (( meta.deviation_4_5 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_5_0 = (bit<32>) meta.deviation_5_0 | (( meta.deviation_5_0 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_5_1 = (bit<32>) meta.deviation_5_1 | (( meta.deviation_5_1 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_5_2 = (bit<32>) meta.deviation_5_2 | (( meta.deviation_5_2 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_5_3 = (bit<32>) meta.deviation_5_3 | (( meta.deviation_5_3 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_5_4 = (bit<32>) meta.deviation_5_4 | (( meta.deviation_5_4 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_5_5 = (bit<32>) meta.deviation_5_5 | (( meta.deviation_5_5 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_6_0 = (bit<32>) meta.deviation_6_0 | (( meta.deviation_6_0 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_6_1 = (bit<32>) meta.deviation_6_1 | (( meta.deviation_6_1 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_6_2 = (bit<32>) meta.deviation_6_2 | (( meta.deviation_6_2 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_6_3 = (bit<32>) meta.deviation_6_3 | (( meta.deviation_6_3 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_6_4 = (bit<32>) meta.deviation_6_4 | (( meta.deviation_6_4 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_6_5 = (bit<32>) meta.deviation_6_5 | (( meta.deviation_6_5 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_7_0 = (bit<32>) meta.deviation_7_0 | (( meta.deviation_7_0 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_7_1 = (bit<32>) meta.deviation_7_1 | (( meta.deviation_7_1 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_7_2 = (bit<32>) meta.deviation_7_2 | (( meta.deviation_7_2 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_7_3 = (bit<32>) meta.deviation_7_3 | (( meta.deviation_7_3 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_7_4 = (bit<32>) meta.deviation_7_4 | (( meta.deviation_7_4 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_7_5 = (bit<32>) meta.deviation_7_5 | (( meta.deviation_7_5 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);

        meta.variance0 = (deviation_0_0 * deviation_0_0 + deviation_0_1 * deviation_0_1 + deviation_0_2 * deviation_0_2 + deviation_0_3 * deviation_0_3 + deviation_0_4 * deviation_0_4 + deviation_0_5 * deviation_0_5)[23:8];
        meta.variance1 = (deviation_1_0 * deviation_1_0 + deviation_1_1 * deviation_1_1 + deviation_1_2 * deviation_1_2 + deviation_1_3 * deviation_1_3 + deviation_1_4 * deviation_1_4 + deviation_1_5 * deviation_1_5)[23:8];
        meta.variance2 = (deviation_2_0 * deviation_2_0 + deviation_2_1 * deviation_2_1 + deviation_2_2 * deviation_2_2 + deviation_2_3 * deviation_2_3 + deviation_2_4 * deviation_2_4 + deviation_2_5 * deviation_2_5)[23:8];
        meta.variance3 = (deviation_3_0 * deviation_3_0 + deviation_3_1 * deviation_3_1 + deviation_3_2 * deviation_3_2 + deviation_3_3 * deviation_3_3 + deviation_3_4 * deviation_3_4 + deviation_3_5 * deviation_3_5)[23:8];
        meta.variance4 = (deviation_4_0 * deviation_4_0 + deviation_4_1 * deviation_4_1 + deviation_4_2 * deviation_4_2 + deviation_4_3 * deviation_4_3 + deviation_4_4 * deviation_4_4 + deviation_4_5 * deviation_4_5)[23:8];
        meta.variance5 = (deviation_5_0 * deviation_5_0 + deviation_5_1 * deviation_5_1 + deviation_5_2 * deviation_5_2 + deviation_5_3 * deviation_5_3 + deviation_5_4 * deviation_5_4 + deviation_5_5 * deviation_5_5)[23:8];
        meta.variance6 = (deviation_6_0 * deviation_6_0 + deviation_6_1 * deviation_6_1 + deviation_6_2 * deviation_6_2 + deviation_6_3 * deviation_6_3 + deviation_6_4 * deviation_6_4 + deviation_6_5 * deviation_6_5)[23:8];
        meta.variance7 = (deviation_7_0 * deviation_7_0 + deviation_7_1 * deviation_7_1 + deviation_7_2 * deviation_7_2 + deviation_7_3 * deviation_7_3 + deviation_7_4 * deviation_7_4 + deviation_7_5 * deviation_7_5)[23:8];
    }

    // 下面用表项匹配1/sqrt(var(x))，这里只是演示，对整数部分开根号，因为小数部分开根号的值影响不大
    action operation_inv_sqrt_var0(bit<16> inv_sqrt_var0) {
        meta.inv_sqrt_var0 = inv_sqrt_var0;
    }

    table calc_inv_sqrt_var0 {
        key = { 
            meta.variance0 : ternary;
        }
        actions = { 
            operation_inv_sqrt_var0;
            operation_drop;
        }
        default_action = operation_drop();
        size = 256;
    }
    
    action operation_inv_sqrt_var1(bit<16> inv_sqrt_var1) {
        meta.inv_sqrt_var1 = inv_sqrt_var1;
    }

    table calc_inv_sqrt_var1 {
        key = { 
            meta.variance1 : ternary;
        }
        actions = { 
            operation_inv_sqrt_var1;
            operation_drop;
        }
        default_action = operation_drop();
        size = 256;
    }
    
    action operation_inv_sqrt_var2(bit<16> inv_sqrt_var2) {
        meta.inv_sqrt_var2 = inv_sqrt_var2;
    }

    table calc_inv_sqrt_var2 {
        key = { 
            meta.variance2 : ternary;
        }
        actions = { 
            operation_inv_sqrt_var2;
            operation_drop;
        }
        default_action = operation_drop();
        size = 256;
    }
    
    action operation_inv_sqrt_var3(bit<16> inv_sqrt_var3) {
        meta.inv_sqrt_var3 = inv_sqrt_var3;
    }

    table calc_inv_sqrt_var3 {
        key = { 
            meta.variance3 : ternary;
        }
        actions = { 
            operation_inv_sqrt_var3;
            operation_drop;
        }
        default_action = operation_drop();
        size = 256;
    }
    
    action operation_inv_sqrt_var4(bit<16> inv_sqrt_var4) {
        meta.inv_sqrt_var4 = inv_sqrt_var4;
    }

    table calc_inv_sqrt_var4 {
        key = { 
            meta.variance4 : ternary;
        }
        actions = { 
            operation_inv_sqrt_var4;
            operation_drop;
        }
        default_action = operation_drop();
        size = 256;
    }
    
    action operation_inv_sqrt_var5(bit<16> inv_sqrt_var5) {
        meta.inv_sqrt_var5 = inv_sqrt_var5;
    }

    table calc_inv_sqrt_var5 {
        key = { 
            meta.variance5 : ternary;
        }
        actions = { 
            operation_inv_sqrt_var5;
            operation_drop;
        }
        default_action = operation_drop();
        size = 256;
    }
    
    action operation_inv_sqrt_var6(bit<16> inv_sqrt_var6) {
        meta.inv_sqrt_var6 = inv_sqrt_var6;
    }

    table calc_inv_sqrt_var6 {
        key = { 
            meta.variance6 : ternary;
        }
        actions = { 
            operation_inv_sqrt_var6;
            operation_drop;
        }
        default_action = operation_drop();
        size = 256;
    }
    
    action operation_inv_sqrt_var7(bit<16> inv_sqrt_var7) {
        meta.inv_sqrt_var7 = inv_sqrt_var7;
    }

    table calc_inv_sqrt_var7 {
        key = { 
            meta.variance7 : ternary;
        }
        actions = { 
            operation_inv_sqrt_var7;
            operation_drop;
        }
        default_action = operation_drop();
        size = 256;
    }

    // 偏差*1/sqrt(var(x))
    action operation_norm() {
        // 偏差16位->32位
        bit<32> deviation_0_0 = (bit<32>) meta.deviation_0_0 | (( meta.deviation_0_0 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_0_1 = (bit<32>) meta.deviation_0_1 | (( meta.deviation_0_1 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_0_2 = (bit<32>) meta.deviation_0_2 | (( meta.deviation_0_2 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_0_3 = (bit<32>) meta.deviation_0_3 | (( meta.deviation_0_3 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_0_4 = (bit<32>) meta.deviation_0_4 | (( meta.deviation_0_4 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_0_5 = (bit<32>) meta.deviation_0_5 | (( meta.deviation_0_5 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_1_0 = (bit<32>) meta.deviation_1_0 | (( meta.deviation_1_0 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_1_1 = (bit<32>) meta.deviation_1_1 | (( meta.deviation_1_1 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_1_2 = (bit<32>) meta.deviation_1_2 | (( meta.deviation_1_2 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_1_3 = (bit<32>) meta.deviation_1_3 | (( meta.deviation_1_3 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_1_4 = (bit<32>) meta.deviation_1_4 | (( meta.deviation_1_4 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_1_5 = (bit<32>) meta.deviation_1_5 | (( meta.deviation_1_5 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_2_0 = (bit<32>) meta.deviation_2_0 | (( meta.deviation_2_0 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_2_1 = (bit<32>) meta.deviation_2_1 | (( meta.deviation_2_1 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_2_2 = (bit<32>) meta.deviation_2_2 | (( meta.deviation_2_2 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_2_3 = (bit<32>) meta.deviation_2_3 | (( meta.deviation_2_3 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_2_4 = (bit<32>) meta.deviation_2_4 | (( meta.deviation_2_4 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_2_5 = (bit<32>) meta.deviation_2_5 | (( meta.deviation_2_5 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_3_0 = (bit<32>) meta.deviation_3_0 | (( meta.deviation_3_0 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_3_1 = (bit<32>) meta.deviation_3_1 | (( meta.deviation_3_1 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_3_2 = (bit<32>) meta.deviation_3_2 | (( meta.deviation_3_2 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_3_3 = (bit<32>) meta.deviation_3_3 | (( meta.deviation_3_3 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_3_4 = (bit<32>) meta.deviation_3_4 | (( meta.deviation_3_4 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_3_5 = (bit<32>) meta.deviation_3_5 | (( meta.deviation_3_5 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_4_0 = (bit<32>) meta.deviation_4_0 | (( meta.deviation_4_0 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_4_1 = (bit<32>) meta.deviation_4_1 | (( meta.deviation_4_1 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_4_2 = (bit<32>) meta.deviation_4_2 | (( meta.deviation_4_2 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_4_3 = (bit<32>) meta.deviation_4_3 | (( meta.deviation_4_3 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_4_4 = (bit<32>) meta.deviation_4_4 | (( meta.deviation_4_4 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_4_5 = (bit<32>) meta.deviation_4_5 | (( meta.deviation_4_5 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_5_0 = (bit<32>) meta.deviation_5_0 | (( meta.deviation_5_0 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_5_1 = (bit<32>) meta.deviation_5_1 | (( meta.deviation_5_1 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_5_2 = (bit<32>) meta.deviation_5_2 | (( meta.deviation_5_2 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_5_3 = (bit<32>) meta.deviation_5_3 | (( meta.deviation_5_3 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_5_4 = (bit<32>) meta.deviation_5_4 | (( meta.deviation_5_4 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_5_5 = (bit<32>) meta.deviation_5_5 | (( meta.deviation_5_5 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_6_0 = (bit<32>) meta.deviation_6_0 | (( meta.deviation_6_0 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_6_1 = (bit<32>) meta.deviation_6_1 | (( meta.deviation_6_1 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_6_2 = (bit<32>) meta.deviation_6_2 | (( meta.deviation_6_2 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_6_3 = (bit<32>) meta.deviation_6_3 | (( meta.deviation_6_3 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_6_4 = (bit<32>) meta.deviation_6_4 | (( meta.deviation_6_4 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_6_5 = (bit<32>) meta.deviation_6_5 | (( meta.deviation_6_5 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_7_0 = (bit<32>) meta.deviation_7_0 | (( meta.deviation_7_0 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_7_1 = (bit<32>) meta.deviation_7_1 | (( meta.deviation_7_1 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_7_2 = (bit<32>) meta.deviation_7_2 | (( meta.deviation_7_2 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_7_3 = (bit<32>) meta.deviation_7_3 | (( meta.deviation_7_3 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_7_4 = (bit<32>) meta.deviation_7_4 | (( meta.deviation_7_4 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> deviation_7_5 = (bit<32>) meta.deviation_7_5 | (( meta.deviation_7_5 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);

        bit<32> inv_sqrt_var_0 = (bit<32>) meta.inv_sqrt_var0 | (( meta.inv_sqrt_var0 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> inv_sqrt_var_1 = (bit<32>) meta.inv_sqrt_var1 | (( meta.inv_sqrt_var1 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> inv_sqrt_var_2 = (bit<32>) meta.inv_sqrt_var2 | (( meta.inv_sqrt_var2 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> inv_sqrt_var_3 = (bit<32>) meta.inv_sqrt_var3 | (( meta.inv_sqrt_var3 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> inv_sqrt_var_4 = (bit<32>) meta.inv_sqrt_var4 | (( meta.inv_sqrt_var4 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> inv_sqrt_var_5 = (bit<32>) meta.inv_sqrt_var5 | (( meta.inv_sqrt_var5 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> inv_sqrt_var_6 = (bit<32>) meta.inv_sqrt_var6 | (( meta.inv_sqrt_var6 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);
        bit<32> inv_sqrt_var_7 = (bit<32>) meta.inv_sqrt_var7 | (( meta.inv_sqrt_var7 & 0x8000) != 0 ? 32w0xFFFF0000 : 32w0x00000000);

        // 求出norm值
        hdr.s0_output0_calc.s0_output_0_0 = (deviation_0_0 * inv_sqrt_var_0)[23:8];
        hdr.s0_output0_calc.s0_output_0_1 = (deviation_0_1 * inv_sqrt_var_0)[23:8];
        hdr.s0_output0_calc.s0_output_0_2 = (deviation_0_2 * inv_sqrt_var_0)[23:8];
        hdr.s0_output0_calc.s0_output_0_3 = (deviation_0_3 * inv_sqrt_var_0)[23:8];
        hdr.s0_output0_calc.s0_output_0_4 = (deviation_0_4 * inv_sqrt_var_0)[23:8];
        hdr.s0_output0_calc.s0_output_0_5 = (deviation_0_5 * inv_sqrt_var_0)[23:8];
        hdr.s0_output0_calc.s0_output_1_0 = (deviation_1_0 * inv_sqrt_var_1)[23:8];
        hdr.s0_output0_calc.s0_output_1_1 = (deviation_1_1 * inv_sqrt_var_1)[23:8];
        hdr.s0_output0_calc.s0_output_1_2 = (deviation_1_2 * inv_sqrt_var_1)[23:8];
        hdr.s0_output0_calc.s0_output_1_3 = (deviation_1_3 * inv_sqrt_var_1)[23:8];
        hdr.s0_output0_calc.s0_output_1_4 = (deviation_1_4 * inv_sqrt_var_1)[23:8];
        hdr.s0_output0_calc.s0_output_1_5 = (deviation_1_5 * inv_sqrt_var_1)[23:8];
        hdr.s0_output0_calc.s0_output_2_0 = (deviation_2_0 * inv_sqrt_var_2)[23:8];
        hdr.s0_output0_calc.s0_output_2_1 = (deviation_2_1 * inv_sqrt_var_2)[23:8];
        hdr.s0_output0_calc.s0_output_2_2 = (deviation_2_2 * inv_sqrt_var_2)[23:8];
        hdr.s0_output0_calc.s0_output_2_3 = (deviation_2_3 * inv_sqrt_var_2)[23:8];
        hdr.s0_output0_calc.s0_output_2_4 = (deviation_2_4 * inv_sqrt_var_2)[23:8];
        hdr.s0_output0_calc.s0_output_2_5 = (deviation_2_5 * inv_sqrt_var_2)[23:8];
        hdr.s0_output0_calc.s0_output_3_0 = (deviation_3_0 * inv_sqrt_var_3)[23:8];
        hdr.s0_output0_calc.s0_output_3_1 = (deviation_3_1 * inv_sqrt_var_3)[23:8];
        hdr.s0_output0_calc.s0_output_3_2 = (deviation_3_2 * inv_sqrt_var_3)[23:8];
        hdr.s0_output0_calc.s0_output_3_3 = (deviation_3_3 * inv_sqrt_var_3)[23:8];
        hdr.s0_output0_calc.s0_output_3_4 = (deviation_3_4 * inv_sqrt_var_3)[23:8];
        hdr.s0_output0_calc.s0_output_3_5 = (deviation_3_5 * inv_sqrt_var_3)[23:8];
        hdr.s0_output0_calc.s0_output_4_0 = (deviation_4_0 * inv_sqrt_var_4)[23:8];
        hdr.s0_output0_calc.s0_output_4_1 = (deviation_4_1 * inv_sqrt_var_4)[23:8];
        hdr.s0_output0_calc.s0_output_4_2 = (deviation_4_2 * inv_sqrt_var_4)[23:8];
        hdr.s0_output0_calc.s0_output_4_3 = (deviation_4_3 * inv_sqrt_var_4)[23:8];
        hdr.s0_output0_calc.s0_output_4_4 = (deviation_4_4 * inv_sqrt_var_4)[23:8];
        hdr.s0_output0_calc.s0_output_4_5 = (deviation_4_5 * inv_sqrt_var_4)[23:8];
        hdr.s0_output0_calc.s0_output_5_0 = (deviation_5_0 * inv_sqrt_var_5)[23:8];
        hdr.s0_output0_calc.s0_output_5_1 = (deviation_5_1 * inv_sqrt_var_5)[23:8];
        hdr.s0_output0_calc.s0_output_5_2 = (deviation_5_2 * inv_sqrt_var_5)[23:8];
        hdr.s0_output0_calc.s0_output_5_3 = (deviation_5_3 * inv_sqrt_var_5)[23:8];
        hdr.s0_output0_calc.s0_output_5_4 = (deviation_5_4 * inv_sqrt_var_5)[23:8];
        hdr.s0_output0_calc.s0_output_5_5 = (deviation_5_5 * inv_sqrt_var_5)[23:8];
        hdr.s0_output0_calc.s0_output_6_0 = (deviation_6_0 * inv_sqrt_var_6)[23:8];
        hdr.s0_output0_calc.s0_output_6_1 = (deviation_6_1 * inv_sqrt_var_6)[23:8];
        hdr.s0_output0_calc.s0_output_6_2 = (deviation_6_2 * inv_sqrt_var_6)[23:8];
        hdr.s0_output0_calc.s0_output_6_3 = (deviation_6_3 * inv_sqrt_var_6)[23:8];
        hdr.s0_output0_calc.s0_output_6_4 = (deviation_6_4 * inv_sqrt_var_6)[23:8];
        hdr.s0_output0_calc.s0_output_6_5 = (deviation_6_5 * inv_sqrt_var_6)[23:8];
        hdr.s0_output0_calc.s0_output_7_0 = (deviation_7_0 * inv_sqrt_var_7)[23:8];
        hdr.s0_output0_calc.s0_output_7_1 = (deviation_7_1 * inv_sqrt_var_7)[23:8];
        hdr.s0_output0_calc.s0_output_7_2 = (deviation_7_2 * inv_sqrt_var_7)[23:8];
        hdr.s0_output0_calc.s0_output_7_3 = (deviation_7_3 * inv_sqrt_var_7)[23:8];
        hdr.s0_output0_calc.s0_output_7_4 = (deviation_7_4 * inv_sqrt_var_7)[23:8];
        hdr.s0_output0_calc.s0_output_7_5 = (deviation_7_5 * inv_sqrt_var_7)[23:8];
    }
    

    
    
    apply {
        if (hdr.p4calc.isValid()) {
            operation_linear1();
            operation_relu();
            operation_linear2();

            operation_calc_mean_var();
            calc_inv_sqrt_var0.apply();
            calc_inv_sqrt_var1.apply();
            calc_inv_sqrt_var2.apply();
            calc_inv_sqrt_var3.apply();
            calc_inv_sqrt_var4.apply();
            calc_inv_sqrt_var5.apply();
            calc_inv_sqrt_var6.apply();
            calc_inv_sqrt_var7.apply();
            operation_norm();
            
            standard_metadata.mcast_grp =  1;
            // standard_metadata.egress_spec = 2;
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