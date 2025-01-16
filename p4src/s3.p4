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
const bit<64> w1_0_0 = 0xffffffffadadeb07;
const bit<64> w1_0_1 = 0xffffffffb732aba8;
const bit<64> w1_0_2 = 0x000000005d96f0a1;
const bit<64> w1_0_3 = 0xffffffffe46f6d1a;
const bit<64> w1_0_4 = 0xffffffffee2eac46;
const bit<64> w1_0_5 = 0xffffffffa4a2916f;
const bit<64> w1_0_6 = 0xffffffff75301916;
const bit<64> w1_0_7 = 0xffffffff03ab8c4c;
const bit<64> w1_0_8 = 0xffffffff48d7a495;
const bit<64> w1_0_9 = 0x00000000236cbbef;
const bit<64> w1_0_10 = 0x00000000be7f732d;
const bit<64> w1_0_11 = 0x000000003b9801c6;
const bit<64> w1_1_0 = 0xffffffff3b746f16;
const bit<64> w1_1_1 = 0x0000000000fc6fc9;
const bit<64> w1_1_2 = 0x0000000022ff84aa;
const bit<64> w1_1_3 = 0xffffffffebe9b27a;
const bit<64> w1_1_4 = 0x0000000024cb83c5;
const bit<64> w1_1_5 = 0xffffffffa43ef17b;
const bit<64> w1_1_6 = 0xffffffff80862aab;
const bit<64> w1_1_7 = 0x00000000222ba60c;
const bit<64> w1_1_8 = 0x00000000ec2271bb;
const bit<64> w1_1_9 = 0x00000000d2ef4256;
const bit<64> w1_1_10 = 0xffffffff260a3380;
const bit<64> w1_1_11 = 0xffffffff6db8bdbf;
const bit<64> w1_2_0 = 0x00000000b0ee852e;
const bit<64> w1_2_1 = 0xffffffffe340744f;
const bit<64> w1_2_2 = 0x000000005d9764cb;
const bit<64> w1_2_3 = 0x0000000012949ec9;
const bit<64> w1_2_4 = 0xffffffffc1c2d996;
const bit<64> w1_2_5 = 0x0000000012bbbe81;
const bit<64> w1_2_6 = 0x000000008b162d6c;
const bit<64> w1_2_7 = 0x000000001f0ad7b9;
const bit<64> w1_2_8 = 0xffffffffd4dab297;
const bit<64> w1_2_9 = 0xffffffff5200d467;
const bit<64> w1_2_10 = 0xffffffffb5b844c8;
const bit<64> w1_2_11 = 0xffffffff539be6b8;
const bit<64> w1_3_0 = 0x000000000c0a2afd;
const bit<64> w1_3_1 = 0xffffffff95565dbf;
const bit<64> w1_3_2 = 0xffffffff789df8e0;
const bit<64> w1_3_3 = 0xffffffff969f6fb0;
const bit<64> w1_3_4 = 0x00000000bdef307f;
const bit<64> w1_3_5 = 0xfffffffff79e5477;
const bit<64> w1_3_6 = 0xffffffff22dcab8d;
const bit<64> w1_3_7 = 0xffffffffe19be878;
const bit<64> w1_3_8 = 0x000000008b84db1f;
const bit<64> w1_3_9 = 0xffffffff57784a87;
const bit<64> w1_3_10 = 0x0000000021bb9fe3;
const bit<64> w1_3_11 = 0xffffffffaba69689;
const bit<64> w1_4_0 = 0xffffffff2d541166;
const bit<64> w1_4_1 = 0x00000000c8143d35;
const bit<64> w1_4_2 = 0x000000001c4848a5;
const bit<64> w1_4_3 = 0x0000000076a0a55c;
const bit<64> w1_4_4 = 0x00000000d9b6dcb2;
const bit<64> w1_4_5 = 0xffffffff1225576d;
const bit<64> w1_4_6 = 0x0000000011af9ac9;
const bit<64> w1_4_7 = 0xffffffff30742c60;
const bit<64> w1_4_8 = 0xffffffffb733620b;
const bit<64> w1_4_9 = 0xffffffff242effe0;
const bit<64> w1_4_10 = 0xffffffffcf456575;
const bit<64> w1_4_11 = 0x00000000b65d58ce;
const bit<64> w1_5_0 = 0xffffffffb18f0862;
const bit<64> w1_5_1 = 0xffffffff8850a659;
const bit<64> w1_5_2 = 0xffffffff294aa17e;
const bit<64> w1_5_3 = 0x00000000ffe39e1a;
const bit<64> w1_5_4 = 0x00000000e4a51f45;
const bit<64> w1_5_5 = 0x00000000521280d6;
const bit<64> w1_5_6 = 0x000000007dc233aa;
const bit<64> w1_5_7 = 0xffffffffe0a86421;
const bit<64> w1_5_8 = 0xffffffff8d5d9b3c;
const bit<64> w1_5_9 = 0xffffffffac52fa50;
const bit<64> w1_5_10 = 0x00000000dcef7060;
const bit<64> w1_5_11 = 0xffffffff23b6a9b3;

const bit<64> w2_0_0 = 0xffffffffc8ac59fd;
const bit<64> w2_0_1 = 0xffffffff86d17618;
const bit<64> w2_0_2 = 0x000000006e1c27fe;
const bit<64> w2_0_3 = 0x00000000f1333808;
const bit<64> w2_0_4 = 0x000000000d53e516;
const bit<64> w2_0_5 = 0x000000004baedc38;
const bit<64> w2_1_0 = 0x000000009ae25986;
const bit<64> w2_1_1 = 0xffffffffef561318;
const bit<64> w2_1_2 = 0x00000000c0a494e0;
const bit<64> w2_1_3 = 0xffffffffbf086ee1;
const bit<64> w2_1_4 = 0xffffffff9d819d4f;
const bit<64> w2_1_5 = 0xffffffffb422a0be;
const bit<64> w2_2_0 = 0xffffffffecccd2cb;
const bit<64> w2_2_1 = 0xffffffffe8b2e076;
const bit<64> w2_2_2 = 0xffffffff0dc9a4b5;
const bit<64> w2_2_3 = 0xffffffff17cadb3d;
const bit<64> w2_2_4 = 0x000000003f1f766c;
const bit<64> w2_2_5 = 0x00000000ded17315;
const bit<64> w2_3_0 = 0x00000000ce4101c3;
const bit<64> w2_3_1 = 0xffffffffcd1435e1;
const bit<64> w2_3_2 = 0x0000000002c84dc1;
const bit<64> w2_3_3 = 0xffffffff1a50657c;
const bit<64> w2_3_4 = 0x00000000d70dc5a6;
const bit<64> w2_3_5 = 0x00000000f900b225;
const bit<64> w2_4_0 = 0x00000000f8bedb95;
const bit<64> w2_4_1 = 0x000000000677b1ab;
const bit<64> w2_4_2 = 0xffffffff5c974e5c;
const bit<64> w2_4_3 = 0x0000000086f33313;
const bit<64> w2_4_4 = 0xfffffffffe4410db;
const bit<64> w2_4_5 = 0x0000000089b2f3d7;
const bit<64> w2_5_0 = 0xffffffff90281384;
const bit<64> w2_5_1 = 0x000000006a36a36f;
const bit<64> w2_5_2 = 0xffffffff3266b2aa;
const bit<64> w2_5_3 = 0x0000000067582cef;
const bit<64> w2_5_4 = 0x0000000046881cf3;
const bit<64> w2_5_5 = 0xffffffff78911c90;
const bit<64> w2_6_0 = 0x00000000fcbe980f;
const bit<64> w2_6_1 = 0x000000006c47cc9a;
const bit<64> w2_6_2 = 0x0000000067605b6f;
const bit<64> w2_6_3 = 0xffffffffbf1530b7;
const bit<64> w2_6_4 = 0xffffffffa996d79f;
const bit<64> w2_6_5 = 0x000000006f7fb874;
const bit<64> w2_7_0 = 0xffffffff0619991b;
const bit<64> w2_7_1 = 0x00000000aac7ca73;
const bit<64> w2_7_2 = 0x00000000f06a2317;
const bit<64> w2_7_3 = 0xffffffff337ea1d9;
const bit<64> w2_7_4 = 0x00000000bb6974c2;
const bit<64> w2_7_5 = 0xffffffff2f680ac3;
const bit<64> w2_8_0 = 0x00000000f06b7721;
const bit<64> w2_8_1 = 0xfffffffff00325d8;
const bit<64> w2_8_2 = 0xffffffff6e38f7fa;
const bit<64> w2_8_3 = 0xffffffff19b5ed55;
const bit<64> w2_8_4 = 0xffffffff756372b5;
const bit<64> w2_8_5 = 0x0000000054cf04eb;
const bit<64> w2_9_0 = 0xffffffff8b48d399;
const bit<64> w2_9_1 = 0x000000008fb496f7;
const bit<64> w2_9_2 = 0x000000005e3d5ed1;
const bit<64> w2_9_3 = 0x00000000b02df240;
const bit<64> w2_9_4 = 0xffffffff8e9f39a0;
const bit<64> w2_9_5 = 0xffffffff8a1eacc1;
const bit<64> w2_10_0 = 0xffffffff872846d9;
const bit<64> w2_10_1 = 0x00000000c1f1a6ee;
const bit<64> w2_10_2 = 0xfffffffff423e549;
const bit<64> w2_10_3 = 0x000000001cfe9b1c;
const bit<64> w2_10_4 = 0xffffffffad0ab9af;
const bit<64> w2_10_5 = 0x00000000ffb1505a;
const bit<64> w2_11_0 = 0xffffffff7ad516ff;
const bit<64> w2_11_1 = 0x0000000057bc2079;
const bit<64> w2_11_2 = 0x000000007e894098;
const bit<64> w2_11_3 = 0x00000000706ef68f;
const bit<64> w2_11_4 = 0x000000000156ce5e;
const bit<64> w2_11_5 = 0x00000000088a7399;


const bit<32> b_0 = 0xD60FEF1F;
const bit<32> b_1 = 0xA49ABD0E;
const bit<32> b_2 = 0x2B16E722;
const bit<32> b_3 = 0x33C1F4ED;
const bit<32> b_4 = 0x51A730AA;
const bit<32> b_5 = 0x0200306A;
const bit<32> b_6 = 0xB4638496;
const bit<32> b_7 = 0x33AE901A;
const bit<32> b_8 = 0xDE1E8135;
const bit<32> b_9 = 0x8CC143D5;
const bit<32> b_10 = 0x809BE337;
const bit<32> b_11 = 0x66A4CD3C;

const bit<32> b2_0 = 0xCE242E24;
const bit<32> b2_1 = 0x09CAC7F1;
const bit<32> b2_2 = 0x3511E3CB;
const bit<32> b2_3 = 0x11B71AEF;
const bit<32> b2_4 = 0xF17F2351;
const bit<32> b2_5 = 0x94390B7E;

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
    bit<32> ff_0_0;
    bit<32> ff_0_1;
    bit<32> ff_0_2;
    bit<32> ff_0_3;
    bit<32> ff_0_4;
    bit<32> ff_0_5;
    bit<32> ff_0_6;
    bit<32> ff_0_7;
    bit<32> ff_0_8;
    bit<32> ff_0_9;
    bit<32> ff_0_10;
    bit<32> ff_0_11;
    bit<32> ff_1_0;
    bit<32> ff_1_1;
    bit<32> ff_1_2;
    bit<32> ff_1_3;
    bit<32> ff_1_4;
    bit<32> ff_1_5;
    bit<32> ff_1_6;
    bit<32> ff_1_7;
    bit<32> ff_1_8;
    bit<32> ff_1_9;
    bit<32> ff_1_10;
    bit<32> ff_1_11;
    bit<32> ff_2_0;
    bit<32> ff_2_1;
    bit<32> ff_2_2;
    bit<32> ff_2_3;
    bit<32> ff_2_4;
    bit<32> ff_2_5;
    bit<32> ff_2_6;
    bit<32> ff_2_7;
    bit<32> ff_2_8;
    bit<32> ff_2_9;
    bit<32> ff_2_10;
    bit<32> ff_2_11;
    bit<32> ff_3_0;
    bit<32> ff_3_1;
    bit<32> ff_3_2;
    bit<32> ff_3_3;
    bit<32> ff_3_4;
    bit<32> ff_3_5;
    bit<32> ff_3_6;
    bit<32> ff_3_7;
    bit<32> ff_3_8;
    bit<32> ff_3_9;
    bit<32> ff_3_10;
    bit<32> ff_3_11;
    bit<32> ff_4_0;
    bit<32> ff_4_1;
    bit<32> ff_4_2;
    bit<32> ff_4_3;
    bit<32> ff_4_4;
    bit<32> ff_4_5;
    bit<32> ff_4_6;
    bit<32> ff_4_7;
    bit<32> ff_4_8;
    bit<32> ff_4_9;
    bit<32> ff_4_10;
    bit<32> ff_4_11;
    bit<32> ff_5_0;
    bit<32> ff_5_1;
    bit<32> ff_5_2;
    bit<32> ff_5_3;
    bit<32> ff_5_4;
    bit<32> ff_5_5;
    bit<32> ff_5_6;
    bit<32> ff_5_7;
    bit<32> ff_5_8;
    bit<32> ff_5_9;
    bit<32> ff_5_10;
    bit<32> ff_5_11;
    bit<32> ff_6_0;
    bit<32> ff_6_1;
    bit<32> ff_6_2;
    bit<32> ff_6_3;
    bit<32> ff_6_4;
    bit<32> ff_6_5;
    bit<32> ff_6_6;
    bit<32> ff_6_7;
    bit<32> ff_6_8;
    bit<32> ff_6_9;
    bit<32> ff_6_10;
    bit<32> ff_6_11;
    bit<32> ff_7_0;
    bit<32> ff_7_1;
    bit<32> ff_7_2;
    bit<32> ff_7_3;
    bit<32> ff_7_4;
    bit<32> ff_7_5;
    bit<32> ff_7_6;
    bit<32> ff_7_7;
    bit<32> ff_7_8;
    bit<32> ff_7_9;
    bit<32> ff_7_10;
    bit<32> ff_7_11;

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
        bit<64> s0_output_0_0 = (bit<64>) hdr.s0_output0_calc.s0_output_0_0 | (((hdr.s0_output0_calc.s0_output_0_0 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_0_1 = (bit<64>) hdr.s0_output0_calc.s0_output_0_1 | (((hdr.s0_output0_calc.s0_output_0_1 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_0_2 = (bit<64>) hdr.s0_output0_calc.s0_output_0_2 | (((hdr.s0_output0_calc.s0_output_0_2 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_0_3 = (bit<64>) hdr.s0_output0_calc.s0_output_0_3 | (((hdr.s0_output0_calc.s0_output_0_3 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_0_4 = (bit<64>) hdr.s0_output0_calc.s0_output_0_4 | (((hdr.s0_output0_calc.s0_output_0_4 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_0_5 = (bit<64>) hdr.s0_output0_calc.s0_output_0_5 | (((hdr.s0_output0_calc.s0_output_0_5 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_1_0 = (bit<64>) hdr.s0_output0_calc.s0_output_1_0 | (((hdr.s0_output0_calc.s0_output_1_0 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_1_1 = (bit<64>) hdr.s0_output0_calc.s0_output_1_1 | (((hdr.s0_output0_calc.s0_output_1_1 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_1_2 = (bit<64>) hdr.s0_output0_calc.s0_output_1_2 | (((hdr.s0_output0_calc.s0_output_1_2 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_1_3 = (bit<64>) hdr.s0_output0_calc.s0_output_1_3 | (((hdr.s0_output0_calc.s0_output_1_3 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_1_4 = (bit<64>) hdr.s0_output0_calc.s0_output_1_4 | (((hdr.s0_output0_calc.s0_output_1_4 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_1_5 = (bit<64>) hdr.s0_output0_calc.s0_output_1_5 | (((hdr.s0_output0_calc.s0_output_1_5 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_2_0 = (bit<64>) hdr.s0_output0_calc.s0_output_2_0 | (((hdr.s0_output0_calc.s0_output_2_0 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_2_1 = (bit<64>) hdr.s0_output0_calc.s0_output_2_1 | (((hdr.s0_output0_calc.s0_output_2_1 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_2_2 = (bit<64>) hdr.s0_output0_calc.s0_output_2_2 | (((hdr.s0_output0_calc.s0_output_2_2 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_2_3 = (bit<64>) hdr.s0_output0_calc.s0_output_2_3 | (((hdr.s0_output0_calc.s0_output_2_3 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_2_4 = (bit<64>) hdr.s0_output0_calc.s0_output_2_4 | (((hdr.s0_output0_calc.s0_output_2_4 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_2_5 = (bit<64>) hdr.s0_output0_calc.s0_output_2_5 | (((hdr.s0_output0_calc.s0_output_2_5 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_3_0 = (bit<64>) hdr.s0_output0_calc.s0_output_3_0 | (((hdr.s0_output0_calc.s0_output_3_0 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_3_1 = (bit<64>) hdr.s0_output0_calc.s0_output_3_1 | (((hdr.s0_output0_calc.s0_output_3_1 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_3_2 = (bit<64>) hdr.s0_output0_calc.s0_output_3_2 | (((hdr.s0_output0_calc.s0_output_3_2 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_3_3 = (bit<64>) hdr.s0_output0_calc.s0_output_3_3 | (((hdr.s0_output0_calc.s0_output_3_3 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_3_4 = (bit<64>) hdr.s0_output0_calc.s0_output_3_4 | (((hdr.s0_output0_calc.s0_output_3_4 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_3_5 = (bit<64>) hdr.s0_output0_calc.s0_output_3_5 | (((hdr.s0_output0_calc.s0_output_3_5 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_4_0 = (bit<64>) hdr.s0_output0_calc.s0_output_4_0 | (((hdr.s0_output0_calc.s0_output_4_0 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_4_1 = (bit<64>) hdr.s0_output0_calc.s0_output_4_1 | (((hdr.s0_output0_calc.s0_output_4_1 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_4_2 = (bit<64>) hdr.s0_output0_calc.s0_output_4_2 | (((hdr.s0_output0_calc.s0_output_4_2 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_4_3 = (bit<64>) hdr.s0_output0_calc.s0_output_4_3 | (((hdr.s0_output0_calc.s0_output_4_3 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_4_4 = (bit<64>) hdr.s0_output0_calc.s0_output_4_4 | (((hdr.s0_output0_calc.s0_output_4_4 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_4_5 = (bit<64>) hdr.s0_output0_calc.s0_output_4_5 | (((hdr.s0_output0_calc.s0_output_4_5 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_5_0 = (bit<64>) hdr.s0_output0_calc.s0_output_5_0 | (((hdr.s0_output0_calc.s0_output_5_0 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_5_1 = (bit<64>) hdr.s0_output0_calc.s0_output_5_1 | (((hdr.s0_output0_calc.s0_output_5_1 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_5_2 = (bit<64>) hdr.s0_output0_calc.s0_output_5_2 | (((hdr.s0_output0_calc.s0_output_5_2 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_5_3 = (bit<64>) hdr.s0_output0_calc.s0_output_5_3 | (((hdr.s0_output0_calc.s0_output_5_3 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_5_4 = (bit<64>) hdr.s0_output0_calc.s0_output_5_4 | (((hdr.s0_output0_calc.s0_output_5_4 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_5_5 = (bit<64>) hdr.s0_output0_calc.s0_output_5_5 | (((hdr.s0_output0_calc.s0_output_5_5 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_6_0 = (bit<64>) hdr.s0_output0_calc.s0_output_6_0 | (((hdr.s0_output0_calc.s0_output_6_0 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_6_1 = (bit<64>) hdr.s0_output0_calc.s0_output_6_1 | (((hdr.s0_output0_calc.s0_output_6_1 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_6_2 = (bit<64>) hdr.s0_output0_calc.s0_output_6_2 | (((hdr.s0_output0_calc.s0_output_6_2 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_6_3 = (bit<64>) hdr.s0_output0_calc.s0_output_6_3 | (((hdr.s0_output0_calc.s0_output_6_3 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_6_4 = (bit<64>) hdr.s0_output0_calc.s0_output_6_4 | (((hdr.s0_output0_calc.s0_output_6_4 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_6_5 = (bit<64>) hdr.s0_output0_calc.s0_output_6_5 | (((hdr.s0_output0_calc.s0_output_6_5 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_7_0 = (bit<64>) hdr.s0_output0_calc.s0_output_7_0 | (((hdr.s0_output0_calc.s0_output_7_0 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_7_1 = (bit<64>) hdr.s0_output0_calc.s0_output_7_1 | (((hdr.s0_output0_calc.s0_output_7_1 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_7_2 = (bit<64>) hdr.s0_output0_calc.s0_output_7_2 | (((hdr.s0_output0_calc.s0_output_7_2 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_7_3 = (bit<64>) hdr.s0_output0_calc.s0_output_7_3 | (((hdr.s0_output0_calc.s0_output_7_3 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_7_4 = (bit<64>) hdr.s0_output0_calc.s0_output_7_4 | (((hdr.s0_output0_calc.s0_output_7_4 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> s0_output_7_5 = (bit<64>) hdr.s0_output0_calc.s0_output_7_5 | (((hdr.s0_output0_calc.s0_output_7_5 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);

        meta.ff_0_0 = (s0_output_0_0 * w1_0_0 + s0_output_0_1 * w1_1_0 + s0_output_0_2 * w1_2_0 + s0_output_0_3 * w1_3_0 + s0_output_0_4 * w1_4_0 + s0_output_0_5 * w1_5_0)[39:8] + b_0;
        meta.ff_0_1 = (s0_output_0_0 * w1_0_1 + s0_output_0_1 * w1_1_1 + s0_output_0_2 * w1_2_1 + s0_output_0_3 * w1_3_1 + s0_output_0_4 * w1_4_1 + s0_output_0_5 * w1_5_1)[39:8] + b_1;
        meta.ff_0_2 = (s0_output_0_0 * w1_0_2 + s0_output_0_1 * w1_1_2 + s0_output_0_2 * w1_2_2 + s0_output_0_3 * w1_3_2 + s0_output_0_4 * w1_4_2 + s0_output_0_5 * w1_5_2)[39:8] + b_2;
        meta.ff_0_3 = (s0_output_0_0 * w1_0_3 + s0_output_0_1 * w1_1_3 + s0_output_0_2 * w1_2_3 + s0_output_0_3 * w1_3_3 + s0_output_0_4 * w1_4_3 + s0_output_0_5 * w1_5_3)[39:8] + b_3;
        meta.ff_0_4 = (s0_output_0_0 * w1_0_4 + s0_output_0_1 * w1_1_4 + s0_output_0_2 * w1_2_4 + s0_output_0_3 * w1_3_4 + s0_output_0_4 * w1_4_4 + s0_output_0_5 * w1_5_4)[39:8] + b_4;
        meta.ff_0_5 = (s0_output_0_0 * w1_0_5 + s0_output_0_1 * w1_1_5 + s0_output_0_2 * w1_2_5 + s0_output_0_3 * w1_3_5 + s0_output_0_4 * w1_4_5 + s0_output_0_5 * w1_5_5)[39:8] + b_5;
        meta.ff_0_6 = (s0_output_0_0 * w1_0_6 + s0_output_0_1 * w1_1_6 + s0_output_0_2 * w1_2_6 + s0_output_0_3 * w1_3_6 + s0_output_0_4 * w1_4_6 + s0_output_0_5 * w1_5_6)[39:8] + b_6;
        meta.ff_0_7 = (s0_output_0_0 * w1_0_7 + s0_output_0_1 * w1_1_7 + s0_output_0_2 * w1_2_7 + s0_output_0_3 * w1_3_7 + s0_output_0_4 * w1_4_7 + s0_output_0_5 * w1_5_7)[39:8] + b_7;
        meta.ff_0_8 = (s0_output_0_0 * w1_0_8 + s0_output_0_1 * w1_1_8 + s0_output_0_2 * w1_2_8 + s0_output_0_3 * w1_3_8 + s0_output_0_4 * w1_4_8 + s0_output_0_5 * w1_5_8)[39:8] + b_8;
        meta.ff_0_9 = (s0_output_0_0 * w1_0_9 + s0_output_0_1 * w1_1_9 + s0_output_0_2 * w1_2_9 + s0_output_0_3 * w1_3_9 + s0_output_0_4 * w1_4_9 + s0_output_0_5 * w1_5_9)[39:8] + b_9;
        meta.ff_0_10 = (s0_output_0_0 * w1_0_10 + s0_output_0_1 * w1_1_10 + s0_output_0_2 * w1_2_10 + s0_output_0_3 * w1_3_10 + s0_output_0_4 * w1_4_10 + s0_output_0_5 * w1_5_10)[39:8] + b_10;
        meta.ff_0_11 = (s0_output_0_0 * w1_0_11 + s0_output_0_1 * w1_1_11 + s0_output_0_2 * w1_2_11 + s0_output_0_3 * w1_3_11 + s0_output_0_4 * w1_4_11 + s0_output_0_5 * w1_5_11)[39:8] + b_11;
        meta.ff_1_0 = (s0_output_1_0 * w1_0_0 + s0_output_1_1 * w1_1_0 + s0_output_1_2 * w1_2_0 + s0_output_1_3 * w1_3_0 + s0_output_1_4 * w1_4_0 + s0_output_1_5 * w1_5_0)[39:8] + b_0;
        meta.ff_1_1 = (s0_output_1_0 * w1_0_1 + s0_output_1_1 * w1_1_1 + s0_output_1_2 * w1_2_1 + s0_output_1_3 * w1_3_1 + s0_output_1_4 * w1_4_1 + s0_output_1_5 * w1_5_1)[39:8] + b_1;
        meta.ff_1_2 = (s0_output_1_0 * w1_0_2 + s0_output_1_1 * w1_1_2 + s0_output_1_2 * w1_2_2 + s0_output_1_3 * w1_3_2 + s0_output_1_4 * w1_4_2 + s0_output_1_5 * w1_5_2)[39:8] + b_2;
        meta.ff_1_3 = (s0_output_1_0 * w1_0_3 + s0_output_1_1 * w1_1_3 + s0_output_1_2 * w1_2_3 + s0_output_1_3 * w1_3_3 + s0_output_1_4 * w1_4_3 + s0_output_1_5 * w1_5_3)[39:8] + b_3;
        meta.ff_1_4 = (s0_output_1_0 * w1_0_4 + s0_output_1_1 * w1_1_4 + s0_output_1_2 * w1_2_4 + s0_output_1_3 * w1_3_4 + s0_output_1_4 * w1_4_4 + s0_output_1_5 * w1_5_4)[39:8] + b_4;
        meta.ff_1_5 = (s0_output_1_0 * w1_0_5 + s0_output_1_1 * w1_1_5 + s0_output_1_2 * w1_2_5 + s0_output_1_3 * w1_3_5 + s0_output_1_4 * w1_4_5 + s0_output_1_5 * w1_5_5)[39:8] + b_5;
        meta.ff_1_6 = (s0_output_1_0 * w1_0_6 + s0_output_1_1 * w1_1_6 + s0_output_1_2 * w1_2_6 + s0_output_1_3 * w1_3_6 + s0_output_1_4 * w1_4_6 + s0_output_1_5 * w1_5_6)[39:8] + b_6;
        meta.ff_1_7 = (s0_output_1_0 * w1_0_7 + s0_output_1_1 * w1_1_7 + s0_output_1_2 * w1_2_7 + s0_output_1_3 * w1_3_7 + s0_output_1_4 * w1_4_7 + s0_output_1_5 * w1_5_7)[39:8] + b_7;
        meta.ff_1_8 = (s0_output_1_0 * w1_0_8 + s0_output_1_1 * w1_1_8 + s0_output_1_2 * w1_2_8 + s0_output_1_3 * w1_3_8 + s0_output_1_4 * w1_4_8 + s0_output_1_5 * w1_5_8)[39:8] + b_8;
        meta.ff_1_9 = (s0_output_1_0 * w1_0_9 + s0_output_1_1 * w1_1_9 + s0_output_1_2 * w1_2_9 + s0_output_1_3 * w1_3_9 + s0_output_1_4 * w1_4_9 + s0_output_1_5 * w1_5_9)[39:8] + b_9;
        meta.ff_1_10 = (s0_output_1_0 * w1_0_10 + s0_output_1_1 * w1_1_10 + s0_output_1_2 * w1_2_10 + s0_output_1_3 * w1_3_10 + s0_output_1_4 * w1_4_10 + s0_output_1_5 * w1_5_10)[39:8] + b_10;
        meta.ff_1_11 = (s0_output_1_0 * w1_0_11 + s0_output_1_1 * w1_1_11 + s0_output_1_2 * w1_2_11 + s0_output_1_3 * w1_3_11 + s0_output_1_4 * w1_4_11 + s0_output_1_5 * w1_5_11)[39:8] + b_11;
        meta.ff_2_0 = (s0_output_2_0 * w1_0_0 + s0_output_2_1 * w1_1_0 + s0_output_2_2 * w1_2_0 + s0_output_2_3 * w1_3_0 + s0_output_2_4 * w1_4_0 + s0_output_2_5 * w1_5_0)[39:8] + b_0;
        meta.ff_2_1 = (s0_output_2_0 * w1_0_1 + s0_output_2_1 * w1_1_1 + s0_output_2_2 * w1_2_1 + s0_output_2_3 * w1_3_1 + s0_output_2_4 * w1_4_1 + s0_output_2_5 * w1_5_1)[39:8] + b_1;
        meta.ff_2_2 = (s0_output_2_0 * w1_0_2 + s0_output_2_1 * w1_1_2 + s0_output_2_2 * w1_2_2 + s0_output_2_3 * w1_3_2 + s0_output_2_4 * w1_4_2 + s0_output_2_5 * w1_5_2)[39:8] + b_2;
        meta.ff_2_3 = (s0_output_2_0 * w1_0_3 + s0_output_2_1 * w1_1_3 + s0_output_2_2 * w1_2_3 + s0_output_2_3 * w1_3_3 + s0_output_2_4 * w1_4_3 + s0_output_2_5 * w1_5_3)[39:8] + b_3;
        meta.ff_2_4 = (s0_output_2_0 * w1_0_4 + s0_output_2_1 * w1_1_4 + s0_output_2_2 * w1_2_4 + s0_output_2_3 * w1_3_4 + s0_output_2_4 * w1_4_4 + s0_output_2_5 * w1_5_4)[39:8] + b_4;
        meta.ff_2_5 = (s0_output_2_0 * w1_0_5 + s0_output_2_1 * w1_1_5 + s0_output_2_2 * w1_2_5 + s0_output_2_3 * w1_3_5 + s0_output_2_4 * w1_4_5 + s0_output_2_5 * w1_5_5)[39:8] + b_5;
        meta.ff_2_6 = (s0_output_2_0 * w1_0_6 + s0_output_2_1 * w1_1_6 + s0_output_2_2 * w1_2_6 + s0_output_2_3 * w1_3_6 + s0_output_2_4 * w1_4_6 + s0_output_2_5 * w1_5_6)[39:8] + b_6;
        meta.ff_2_7 = (s0_output_2_0 * w1_0_7 + s0_output_2_1 * w1_1_7 + s0_output_2_2 * w1_2_7 + s0_output_2_3 * w1_3_7 + s0_output_2_4 * w1_4_7 + s0_output_2_5 * w1_5_7)[39:8] + b_7;
        meta.ff_2_8 = (s0_output_2_0 * w1_0_8 + s0_output_2_1 * w1_1_8 + s0_output_2_2 * w1_2_8 + s0_output_2_3 * w1_3_8 + s0_output_2_4 * w1_4_8 + s0_output_2_5 * w1_5_8)[39:8] + b_8;
        meta.ff_2_9 = (s0_output_2_0 * w1_0_9 + s0_output_2_1 * w1_1_9 + s0_output_2_2 * w1_2_9 + s0_output_2_3 * w1_3_9 + s0_output_2_4 * w1_4_9 + s0_output_2_5 * w1_5_9)[39:8] + b_9;
        meta.ff_2_10 = (s0_output_2_0 * w1_0_10 + s0_output_2_1 * w1_1_10 + s0_output_2_2 * w1_2_10 + s0_output_2_3 * w1_3_10 + s0_output_2_4 * w1_4_10 + s0_output_2_5 * w1_5_10)[39:8] + b_10;
        meta.ff_2_11 = (s0_output_2_0 * w1_0_11 + s0_output_2_1 * w1_1_11 + s0_output_2_2 * w1_2_11 + s0_output_2_3 * w1_3_11 + s0_output_2_4 * w1_4_11 + s0_output_2_5 * w1_5_11)[39:8] + b_11;
        meta.ff_3_0 = (s0_output_3_0 * w1_0_0 + s0_output_3_1 * w1_1_0 + s0_output_3_2 * w1_2_0 + s0_output_3_3 * w1_3_0 + s0_output_3_4 * w1_4_0 + s0_output_3_5 * w1_5_0)[39:8] + b_0;
        meta.ff_3_1 = (s0_output_3_0 * w1_0_1 + s0_output_3_1 * w1_1_1 + s0_output_3_2 * w1_2_1 + s0_output_3_3 * w1_3_1 + s0_output_3_4 * w1_4_1 + s0_output_3_5 * w1_5_1)[39:8] + b_1;
        meta.ff_3_2 = (s0_output_3_0 * w1_0_2 + s0_output_3_1 * w1_1_2 + s0_output_3_2 * w1_2_2 + s0_output_3_3 * w1_3_2 + s0_output_3_4 * w1_4_2 + s0_output_3_5 * w1_5_2)[39:8] + b_2;
        meta.ff_3_3 = (s0_output_3_0 * w1_0_3 + s0_output_3_1 * w1_1_3 + s0_output_3_2 * w1_2_3 + s0_output_3_3 * w1_3_3 + s0_output_3_4 * w1_4_3 + s0_output_3_5 * w1_5_3)[39:8] + b_3;
        meta.ff_3_4 = (s0_output_3_0 * w1_0_4 + s0_output_3_1 * w1_1_4 + s0_output_3_2 * w1_2_4 + s0_output_3_3 * w1_3_4 + s0_output_3_4 * w1_4_4 + s0_output_3_5 * w1_5_4)[39:8] + b_4;
        meta.ff_3_5 = (s0_output_3_0 * w1_0_5 + s0_output_3_1 * w1_1_5 + s0_output_3_2 * w1_2_5 + s0_output_3_3 * w1_3_5 + s0_output_3_4 * w1_4_5 + s0_output_3_5 * w1_5_5)[39:8] + b_5;
        meta.ff_3_6 = (s0_output_3_0 * w1_0_6 + s0_output_3_1 * w1_1_6 + s0_output_3_2 * w1_2_6 + s0_output_3_3 * w1_3_6 + s0_output_3_4 * w1_4_6 + s0_output_3_5 * w1_5_6)[39:8] + b_6;
        meta.ff_3_7 = (s0_output_3_0 * w1_0_7 + s0_output_3_1 * w1_1_7 + s0_output_3_2 * w1_2_7 + s0_output_3_3 * w1_3_7 + s0_output_3_4 * w1_4_7 + s0_output_3_5 * w1_5_7)[39:8] + b_7;
        meta.ff_3_8 = (s0_output_3_0 * w1_0_8 + s0_output_3_1 * w1_1_8 + s0_output_3_2 * w1_2_8 + s0_output_3_3 * w1_3_8 + s0_output_3_4 * w1_4_8 + s0_output_3_5 * w1_5_8)[39:8] + b_8;
        meta.ff_3_9 = (s0_output_3_0 * w1_0_9 + s0_output_3_1 * w1_1_9 + s0_output_3_2 * w1_2_9 + s0_output_3_3 * w1_3_9 + s0_output_3_4 * w1_4_9 + s0_output_3_5 * w1_5_9)[39:8] + b_9;
        meta.ff_3_10 = (s0_output_3_0 * w1_0_10 + s0_output_3_1 * w1_1_10 + s0_output_3_2 * w1_2_10 + s0_output_3_3 * w1_3_10 + s0_output_3_4 * w1_4_10 + s0_output_3_5 * w1_5_10)[39:8] + b_10;
        meta.ff_3_11 = (s0_output_3_0 * w1_0_11 + s0_output_3_1 * w1_1_11 + s0_output_3_2 * w1_2_11 + s0_output_3_3 * w1_3_11 + s0_output_3_4 * w1_4_11 + s0_output_3_5 * w1_5_11)[39:8] + b_11;
        meta.ff_4_0 = (s0_output_4_0 * w1_0_0 + s0_output_4_1 * w1_1_0 + s0_output_4_2 * w1_2_0 + s0_output_4_3 * w1_3_0 + s0_output_4_4 * w1_4_0 + s0_output_4_5 * w1_5_0)[39:8] + b_0;
        meta.ff_4_1 = (s0_output_4_0 * w1_0_1 + s0_output_4_1 * w1_1_1 + s0_output_4_2 * w1_2_1 + s0_output_4_3 * w1_3_1 + s0_output_4_4 * w1_4_1 + s0_output_4_5 * w1_5_1)[39:8] + b_1;
        meta.ff_4_2 = (s0_output_4_0 * w1_0_2 + s0_output_4_1 * w1_1_2 + s0_output_4_2 * w1_2_2 + s0_output_4_3 * w1_3_2 + s0_output_4_4 * w1_4_2 + s0_output_4_5 * w1_5_2)[39:8] + b_2;
        meta.ff_4_3 = (s0_output_4_0 * w1_0_3 + s0_output_4_1 * w1_1_3 + s0_output_4_2 * w1_2_3 + s0_output_4_3 * w1_3_3 + s0_output_4_4 * w1_4_3 + s0_output_4_5 * w1_5_3)[39:8] + b_3;
        meta.ff_4_4 = (s0_output_4_0 * w1_0_4 + s0_output_4_1 * w1_1_4 + s0_output_4_2 * w1_2_4 + s0_output_4_3 * w1_3_4 + s0_output_4_4 * w1_4_4 + s0_output_4_5 * w1_5_4)[39:8] + b_4;
        meta.ff_4_5 = (s0_output_4_0 * w1_0_5 + s0_output_4_1 * w1_1_5 + s0_output_4_2 * w1_2_5 + s0_output_4_3 * w1_3_5 + s0_output_4_4 * w1_4_5 + s0_output_4_5 * w1_5_5)[39:8] + b_5;
        meta.ff_4_6 = (s0_output_4_0 * w1_0_6 + s0_output_4_1 * w1_1_6 + s0_output_4_2 * w1_2_6 + s0_output_4_3 * w1_3_6 + s0_output_4_4 * w1_4_6 + s0_output_4_5 * w1_5_6)[39:8] + b_6;
        meta.ff_4_7 = (s0_output_4_0 * w1_0_7 + s0_output_4_1 * w1_1_7 + s0_output_4_2 * w1_2_7 + s0_output_4_3 * w1_3_7 + s0_output_4_4 * w1_4_7 + s0_output_4_5 * w1_5_7)[39:8] + b_7;
        meta.ff_4_8 = (s0_output_4_0 * w1_0_8 + s0_output_4_1 * w1_1_8 + s0_output_4_2 * w1_2_8 + s0_output_4_3 * w1_3_8 + s0_output_4_4 * w1_4_8 + s0_output_4_5 * w1_5_8)[39:8] + b_8;
        meta.ff_4_9 = (s0_output_4_0 * w1_0_9 + s0_output_4_1 * w1_1_9 + s0_output_4_2 * w1_2_9 + s0_output_4_3 * w1_3_9 + s0_output_4_4 * w1_4_9 + s0_output_4_5 * w1_5_9)[39:8] + b_9;
        meta.ff_4_10 = (s0_output_4_0 * w1_0_10 + s0_output_4_1 * w1_1_10 + s0_output_4_2 * w1_2_10 + s0_output_4_3 * w1_3_10 + s0_output_4_4 * w1_4_10 + s0_output_4_5 * w1_5_10)[39:8] + b_10;
        meta.ff_4_11 = (s0_output_4_0 * w1_0_11 + s0_output_4_1 * w1_1_11 + s0_output_4_2 * w1_2_11 + s0_output_4_3 * w1_3_11 + s0_output_4_4 * w1_4_11 + s0_output_4_5 * w1_5_11)[39:8] + b_11;
        meta.ff_5_0 = (s0_output_5_0 * w1_0_0 + s0_output_5_1 * w1_1_0 + s0_output_5_2 * w1_2_0 + s0_output_5_3 * w1_3_0 + s0_output_5_4 * w1_4_0 + s0_output_5_5 * w1_5_0)[39:8] + b_0;
        meta.ff_5_1 = (s0_output_5_0 * w1_0_1 + s0_output_5_1 * w1_1_1 + s0_output_5_2 * w1_2_1 + s0_output_5_3 * w1_3_1 + s0_output_5_4 * w1_4_1 + s0_output_5_5 * w1_5_1)[39:8] + b_1;
        meta.ff_5_2 = (s0_output_5_0 * w1_0_2 + s0_output_5_1 * w1_1_2 + s0_output_5_2 * w1_2_2 + s0_output_5_3 * w1_3_2 + s0_output_5_4 * w1_4_2 + s0_output_5_5 * w1_5_2)[39:8] + b_2;
        meta.ff_5_3 = (s0_output_5_0 * w1_0_3 + s0_output_5_1 * w1_1_3 + s0_output_5_2 * w1_2_3 + s0_output_5_3 * w1_3_3 + s0_output_5_4 * w1_4_3 + s0_output_5_5 * w1_5_3)[39:8] + b_3;
        meta.ff_5_4 = (s0_output_5_0 * w1_0_4 + s0_output_5_1 * w1_1_4 + s0_output_5_2 * w1_2_4 + s0_output_5_3 * w1_3_4 + s0_output_5_4 * w1_4_4 + s0_output_5_5 * w1_5_4)[39:8] + b_4;
        meta.ff_5_5 = (s0_output_5_0 * w1_0_5 + s0_output_5_1 * w1_1_5 + s0_output_5_2 * w1_2_5 + s0_output_5_3 * w1_3_5 + s0_output_5_4 * w1_4_5 + s0_output_5_5 * w1_5_5)[39:8] + b_5;
        meta.ff_5_6 = (s0_output_5_0 * w1_0_6 + s0_output_5_1 * w1_1_6 + s0_output_5_2 * w1_2_6 + s0_output_5_3 * w1_3_6 + s0_output_5_4 * w1_4_6 + s0_output_5_5 * w1_5_6)[39:8] + b_6;
        meta.ff_5_7 = (s0_output_5_0 * w1_0_7 + s0_output_5_1 * w1_1_7 + s0_output_5_2 * w1_2_7 + s0_output_5_3 * w1_3_7 + s0_output_5_4 * w1_4_7 + s0_output_5_5 * w1_5_7)[39:8] + b_7;
        meta.ff_5_8 = (s0_output_5_0 * w1_0_8 + s0_output_5_1 * w1_1_8 + s0_output_5_2 * w1_2_8 + s0_output_5_3 * w1_3_8 + s0_output_5_4 * w1_4_8 + s0_output_5_5 * w1_5_8)[39:8] + b_8;
        meta.ff_5_9 = (s0_output_5_0 * w1_0_9 + s0_output_5_1 * w1_1_9 + s0_output_5_2 * w1_2_9 + s0_output_5_3 * w1_3_9 + s0_output_5_4 * w1_4_9 + s0_output_5_5 * w1_5_9)[39:8] + b_9;
        meta.ff_5_10 = (s0_output_5_0 * w1_0_10 + s0_output_5_1 * w1_1_10 + s0_output_5_2 * w1_2_10 + s0_output_5_3 * w1_3_10 + s0_output_5_4 * w1_4_10 + s0_output_5_5 * w1_5_10)[39:8] + b_10;
        meta.ff_5_11 = (s0_output_5_0 * w1_0_11 + s0_output_5_1 * w1_1_11 + s0_output_5_2 * w1_2_11 + s0_output_5_3 * w1_3_11 + s0_output_5_4 * w1_4_11 + s0_output_5_5 * w1_5_11)[39:8] + b_11;
        meta.ff_6_0 = (s0_output_6_0 * w1_0_0 + s0_output_6_1 * w1_1_0 + s0_output_6_2 * w1_2_0 + s0_output_6_3 * w1_3_0 + s0_output_6_4 * w1_4_0 + s0_output_6_5 * w1_5_0)[39:8] + b_0;
        meta.ff_6_1 = (s0_output_6_0 * w1_0_1 + s0_output_6_1 * w1_1_1 + s0_output_6_2 * w1_2_1 + s0_output_6_3 * w1_3_1 + s0_output_6_4 * w1_4_1 + s0_output_6_5 * w1_5_1)[39:8] + b_1;
        meta.ff_6_2 = (s0_output_6_0 * w1_0_2 + s0_output_6_1 * w1_1_2 + s0_output_6_2 * w1_2_2 + s0_output_6_3 * w1_3_2 + s0_output_6_4 * w1_4_2 + s0_output_6_5 * w1_5_2)[39:8] + b_2;
        meta.ff_6_3 = (s0_output_6_0 * w1_0_3 + s0_output_6_1 * w1_1_3 + s0_output_6_2 * w1_2_3 + s0_output_6_3 * w1_3_3 + s0_output_6_4 * w1_4_3 + s0_output_6_5 * w1_5_3)[39:8] + b_3;
        meta.ff_6_4 = (s0_output_6_0 * w1_0_4 + s0_output_6_1 * w1_1_4 + s0_output_6_2 * w1_2_4 + s0_output_6_3 * w1_3_4 + s0_output_6_4 * w1_4_4 + s0_output_6_5 * w1_5_4)[39:8] + b_4;
        meta.ff_6_5 = (s0_output_6_0 * w1_0_5 + s0_output_6_1 * w1_1_5 + s0_output_6_2 * w1_2_5 + s0_output_6_3 * w1_3_5 + s0_output_6_4 * w1_4_5 + s0_output_6_5 * w1_5_5)[39:8] + b_5;
        meta.ff_6_6 = (s0_output_6_0 * w1_0_6 + s0_output_6_1 * w1_1_6 + s0_output_6_2 * w1_2_6 + s0_output_6_3 * w1_3_6 + s0_output_6_4 * w1_4_6 + s0_output_6_5 * w1_5_6)[39:8] + b_6;
        meta.ff_6_7 = (s0_output_6_0 * w1_0_7 + s0_output_6_1 * w1_1_7 + s0_output_6_2 * w1_2_7 + s0_output_6_3 * w1_3_7 + s0_output_6_4 * w1_4_7 + s0_output_6_5 * w1_5_7)[39:8] + b_7;
        meta.ff_6_8 = (s0_output_6_0 * w1_0_8 + s0_output_6_1 * w1_1_8 + s0_output_6_2 * w1_2_8 + s0_output_6_3 * w1_3_8 + s0_output_6_4 * w1_4_8 + s0_output_6_5 * w1_5_8)[39:8] + b_8;
        meta.ff_6_9 = (s0_output_6_0 * w1_0_9 + s0_output_6_1 * w1_1_9 + s0_output_6_2 * w1_2_9 + s0_output_6_3 * w1_3_9 + s0_output_6_4 * w1_4_9 + s0_output_6_5 * w1_5_9)[39:8] + b_9;
        meta.ff_6_10 = (s0_output_6_0 * w1_0_10 + s0_output_6_1 * w1_1_10 + s0_output_6_2 * w1_2_10 + s0_output_6_3 * w1_3_10 + s0_output_6_4 * w1_4_10 + s0_output_6_5 * w1_5_10)[39:8] + b_10;
        meta.ff_6_11 = (s0_output_6_0 * w1_0_11 + s0_output_6_1 * w1_1_11 + s0_output_6_2 * w1_2_11 + s0_output_6_3 * w1_3_11 + s0_output_6_4 * w1_4_11 + s0_output_6_5 * w1_5_11)[39:8] + b_11;
        meta.ff_7_0 = (s0_output_7_0 * w1_0_0 + s0_output_7_1 * w1_1_0 + s0_output_7_2 * w1_2_0 + s0_output_7_3 * w1_3_0 + s0_output_7_4 * w1_4_0 + s0_output_7_5 * w1_5_0)[39:8] + b_0;
        meta.ff_7_1 = (s0_output_7_0 * w1_0_1 + s0_output_7_1 * w1_1_1 + s0_output_7_2 * w1_2_1 + s0_output_7_3 * w1_3_1 + s0_output_7_4 * w1_4_1 + s0_output_7_5 * w1_5_1)[39:8] + b_1;
        meta.ff_7_2 = (s0_output_7_0 * w1_0_2 + s0_output_7_1 * w1_1_2 + s0_output_7_2 * w1_2_2 + s0_output_7_3 * w1_3_2 + s0_output_7_4 * w1_4_2 + s0_output_7_5 * w1_5_2)[39:8] + b_2;
        meta.ff_7_3 = (s0_output_7_0 * w1_0_3 + s0_output_7_1 * w1_1_3 + s0_output_7_2 * w1_2_3 + s0_output_7_3 * w1_3_3 + s0_output_7_4 * w1_4_3 + s0_output_7_5 * w1_5_3)[39:8] + b_3;
        meta.ff_7_4 = (s0_output_7_0 * w1_0_4 + s0_output_7_1 * w1_1_4 + s0_output_7_2 * w1_2_4 + s0_output_7_3 * w1_3_4 + s0_output_7_4 * w1_4_4 + s0_output_7_5 * w1_5_4)[39:8] + b_4;
        meta.ff_7_5 = (s0_output_7_0 * w1_0_5 + s0_output_7_1 * w1_1_5 + s0_output_7_2 * w1_2_5 + s0_output_7_3 * w1_3_5 + s0_output_7_4 * w1_4_5 + s0_output_7_5 * w1_5_5)[39:8] + b_5;
        meta.ff_7_6 = (s0_output_7_0 * w1_0_6 + s0_output_7_1 * w1_1_6 + s0_output_7_2 * w1_2_6 + s0_output_7_3 * w1_3_6 + s0_output_7_4 * w1_4_6 + s0_output_7_5 * w1_5_6)[39:8] + b_6;
        meta.ff_7_7 = (s0_output_7_0 * w1_0_7 + s0_output_7_1 * w1_1_7 + s0_output_7_2 * w1_2_7 + s0_output_7_3 * w1_3_7 + s0_output_7_4 * w1_4_7 + s0_output_7_5 * w1_5_7)[39:8] + b_7;
        meta.ff_7_8 = (s0_output_7_0 * w1_0_8 + s0_output_7_1 * w1_1_8 + s0_output_7_2 * w1_2_8 + s0_output_7_3 * w1_3_8 + s0_output_7_4 * w1_4_8 + s0_output_7_5 * w1_5_8)[39:8] + b_8;
        meta.ff_7_9 = (s0_output_7_0 * w1_0_9 + s0_output_7_1 * w1_1_9 + s0_output_7_2 * w1_2_9 + s0_output_7_3 * w1_3_9 + s0_output_7_4 * w1_4_9 + s0_output_7_5 * w1_5_9)[39:8] + b_9;
        meta.ff_7_10 = (s0_output_7_0 * w1_0_10 + s0_output_7_1 * w1_1_10 + s0_output_7_2 * w1_2_10 + s0_output_7_3 * w1_3_10 + s0_output_7_4 * w1_4_10 + s0_output_7_5 * w1_5_10)[39:8] + b_10;
        meta.ff_7_11 = (s0_output_7_0 * w1_0_11 + s0_output_7_1 * w1_1_11 + s0_output_7_2 * w1_2_11 + s0_output_7_3 * w1_3_11 + s0_output_7_4 * w1_4_11 + s0_output_7_5 * w1_5_11)[39:8] + b_11;

  }


    action operation_relu() {
        const bit<32> zero = 0x0;
        meta.ff_0_0 = ((meta.ff_0_0 & 0x80000000) != 0) ? zero : meta.ff_0_0;
        meta.ff_0_1 = ((meta.ff_0_1 & 0x80000000) != 0) ? zero : meta.ff_0_1;
        meta.ff_0_2 = ((meta.ff_0_2 & 0x80000000) != 0) ? zero : meta.ff_0_2;
        meta.ff_0_3 = ((meta.ff_0_3 & 0x80000000) != 0) ? zero : meta.ff_0_3;
        meta.ff_0_4 = ((meta.ff_0_4 & 0x80000000) != 0) ? zero : meta.ff_0_4;
        meta.ff_0_5 = ((meta.ff_0_5 & 0x80000000) != 0) ? zero : meta.ff_0_5;
        meta.ff_0_6 = ((meta.ff_0_6 & 0x80000000) != 0) ? zero : meta.ff_0_6;
        meta.ff_0_7 = ((meta.ff_0_7 & 0x80000000) != 0) ? zero : meta.ff_0_7;
        meta.ff_0_8 = ((meta.ff_0_8 & 0x80000000) != 0) ? zero : meta.ff_0_8;
        meta.ff_0_9 = ((meta.ff_0_9 & 0x80000000) != 0) ? zero : meta.ff_0_9;
        meta.ff_0_10 = ((meta.ff_0_10 & 0x80000000) != 0) ? zero : meta.ff_0_10;
        meta.ff_0_11 = ((meta.ff_0_11 & 0x80000000) != 0) ? zero : meta.ff_0_11;
        meta.ff_1_0 = ((meta.ff_1_0 & 0x80000000) != 0) ? zero : meta.ff_1_0;
        meta.ff_1_1 = ((meta.ff_1_1 & 0x80000000) != 0) ? zero : meta.ff_1_1;
        meta.ff_1_2 = ((meta.ff_1_2 & 0x80000000) != 0) ? zero : meta.ff_1_2;
        meta.ff_1_3 = ((meta.ff_1_3 & 0x80000000) != 0) ? zero : meta.ff_1_3;
        meta.ff_1_4 = ((meta.ff_1_4 & 0x80000000) != 0) ? zero : meta.ff_1_4;
        meta.ff_1_5 = ((meta.ff_1_5 & 0x80000000) != 0) ? zero : meta.ff_1_5;
        meta.ff_1_6 = ((meta.ff_1_6 & 0x80000000) != 0) ? zero : meta.ff_1_6;
        meta.ff_1_7 = ((meta.ff_1_7 & 0x80000000) != 0) ? zero : meta.ff_1_7;
        meta.ff_1_8 = ((meta.ff_1_8 & 0x80000000) != 0) ? zero : meta.ff_1_8;
        meta.ff_1_9 = ((meta.ff_1_9 & 0x80000000) != 0) ? zero : meta.ff_1_9;
        meta.ff_1_10 = ((meta.ff_1_10 & 0x80000000) != 0) ? zero : meta.ff_1_10;
        meta.ff_1_11 = ((meta.ff_1_11 & 0x80000000) != 0) ? zero : meta.ff_1_11;
        meta.ff_2_0 = ((meta.ff_2_0 & 0x80000000) != 0) ? zero : meta.ff_2_0;
        meta.ff_2_1 = ((meta.ff_2_1 & 0x80000000) != 0) ? zero : meta.ff_2_1;
        meta.ff_2_2 = ((meta.ff_2_2 & 0x80000000) != 0) ? zero : meta.ff_2_2;
        meta.ff_2_3 = ((meta.ff_2_3 & 0x80000000) != 0) ? zero : meta.ff_2_3;
        meta.ff_2_4 = ((meta.ff_2_4 & 0x80000000) != 0) ? zero : meta.ff_2_4;
        meta.ff_2_5 = ((meta.ff_2_5 & 0x80000000) != 0) ? zero : meta.ff_2_5;
        meta.ff_2_6 = ((meta.ff_2_6 & 0x80000000) != 0) ? zero : meta.ff_2_6;
        meta.ff_2_7 = ((meta.ff_2_7 & 0x80000000) != 0) ? zero : meta.ff_2_7;
        meta.ff_2_8 = ((meta.ff_2_8 & 0x80000000) != 0) ? zero : meta.ff_2_8;
        meta.ff_2_9 = ((meta.ff_2_9 & 0x80000000) != 0) ? zero : meta.ff_2_9;
        meta.ff_2_10 = ((meta.ff_2_10 & 0x80000000) != 0) ? zero : meta.ff_2_10;
        meta.ff_2_11 = ((meta.ff_2_11 & 0x80000000) != 0) ? zero : meta.ff_2_11;
        meta.ff_3_0 = ((meta.ff_3_0 & 0x80000000) != 0) ? zero : meta.ff_3_0;
        meta.ff_3_1 = ((meta.ff_3_1 & 0x80000000) != 0) ? zero : meta.ff_3_1;
        meta.ff_3_2 = ((meta.ff_3_2 & 0x80000000) != 0) ? zero : meta.ff_3_2;
        meta.ff_3_3 = ((meta.ff_3_3 & 0x80000000) != 0) ? zero : meta.ff_3_3;
        meta.ff_3_4 = ((meta.ff_3_4 & 0x80000000) != 0) ? zero : meta.ff_3_4;
        meta.ff_3_5 = ((meta.ff_3_5 & 0x80000000) != 0) ? zero : meta.ff_3_5;
        meta.ff_3_6 = ((meta.ff_3_6 & 0x80000000) != 0) ? zero : meta.ff_3_6;
        meta.ff_3_7 = ((meta.ff_3_7 & 0x80000000) != 0) ? zero : meta.ff_3_7;
        meta.ff_3_8 = ((meta.ff_3_8 & 0x80000000) != 0) ? zero : meta.ff_3_8;
        meta.ff_3_9 = ((meta.ff_3_9 & 0x80000000) != 0) ? zero : meta.ff_3_9;
        meta.ff_3_10 = ((meta.ff_3_10 & 0x80000000) != 0) ? zero : meta.ff_3_10;
        meta.ff_3_11 = ((meta.ff_3_11 & 0x80000000) != 0) ? zero : meta.ff_3_11;
        meta.ff_4_0 = ((meta.ff_4_0 & 0x80000000) != 0) ? zero : meta.ff_4_0;
        meta.ff_4_1 = ((meta.ff_4_1 & 0x80000000) != 0) ? zero : meta.ff_4_1;
        meta.ff_4_2 = ((meta.ff_4_2 & 0x80000000) != 0) ? zero : meta.ff_4_2;
        meta.ff_4_3 = ((meta.ff_4_3 & 0x80000000) != 0) ? zero : meta.ff_4_3;
        meta.ff_4_4 = ((meta.ff_4_4 & 0x80000000) != 0) ? zero : meta.ff_4_4;
        meta.ff_4_5 = ((meta.ff_4_5 & 0x80000000) != 0) ? zero : meta.ff_4_5;
        meta.ff_4_6 = ((meta.ff_4_6 & 0x80000000) != 0) ? zero : meta.ff_4_6;
        meta.ff_4_7 = ((meta.ff_4_7 & 0x80000000) != 0) ? zero : meta.ff_4_7;
        meta.ff_4_8 = ((meta.ff_4_8 & 0x80000000) != 0) ? zero : meta.ff_4_8;
        meta.ff_4_9 = ((meta.ff_4_9 & 0x80000000) != 0) ? zero : meta.ff_4_9;
        meta.ff_4_10 = ((meta.ff_4_10 & 0x80000000) != 0) ? zero : meta.ff_4_10;
        meta.ff_4_11 = ((meta.ff_4_11 & 0x80000000) != 0) ? zero : meta.ff_4_11;
        meta.ff_5_0 = ((meta.ff_5_0 & 0x80000000) != 0) ? zero : meta.ff_5_0;
        meta.ff_5_1 = ((meta.ff_5_1 & 0x80000000) != 0) ? zero : meta.ff_5_1;
        meta.ff_5_2 = ((meta.ff_5_2 & 0x80000000) != 0) ? zero : meta.ff_5_2;
        meta.ff_5_3 = ((meta.ff_5_3 & 0x80000000) != 0) ? zero : meta.ff_5_3;
        meta.ff_5_4 = ((meta.ff_5_4 & 0x80000000) != 0) ? zero : meta.ff_5_4;
        meta.ff_5_5 = ((meta.ff_5_5 & 0x80000000) != 0) ? zero : meta.ff_5_5;
        meta.ff_5_6 = ((meta.ff_5_6 & 0x80000000) != 0) ? zero : meta.ff_5_6;
        meta.ff_5_7 = ((meta.ff_5_7 & 0x80000000) != 0) ? zero : meta.ff_5_7;
        meta.ff_5_8 = ((meta.ff_5_8 & 0x80000000) != 0) ? zero : meta.ff_5_8;
        meta.ff_5_9 = ((meta.ff_5_9 & 0x80000000) != 0) ? zero : meta.ff_5_9;
        meta.ff_5_10 = ((meta.ff_5_10 & 0x80000000) != 0) ? zero : meta.ff_5_10;
        meta.ff_5_11 = ((meta.ff_5_11 & 0x80000000) != 0) ? zero : meta.ff_5_11;
        meta.ff_6_0 = ((meta.ff_6_0 & 0x80000000) != 0) ? zero : meta.ff_6_0;
        meta.ff_6_1 = ((meta.ff_6_1 & 0x80000000) != 0) ? zero : meta.ff_6_1;
        meta.ff_6_2 = ((meta.ff_6_2 & 0x80000000) != 0) ? zero : meta.ff_6_2;
        meta.ff_6_3 = ((meta.ff_6_3 & 0x80000000) != 0) ? zero : meta.ff_6_3;
        meta.ff_6_4 = ((meta.ff_6_4 & 0x80000000) != 0) ? zero : meta.ff_6_4;
        meta.ff_6_5 = ((meta.ff_6_5 & 0x80000000) != 0) ? zero : meta.ff_6_5;
        meta.ff_6_6 = ((meta.ff_6_6 & 0x80000000) != 0) ? zero : meta.ff_6_6;
        meta.ff_6_7 = ((meta.ff_6_7 & 0x80000000) != 0) ? zero : meta.ff_6_7;
        meta.ff_6_8 = ((meta.ff_6_8 & 0x80000000) != 0) ? zero : meta.ff_6_8;
        meta.ff_6_9 = ((meta.ff_6_9 & 0x80000000) != 0) ? zero : meta.ff_6_9;
        meta.ff_6_10 = ((meta.ff_6_10 & 0x80000000) != 0) ? zero : meta.ff_6_10;
        meta.ff_6_11 = ((meta.ff_6_11 & 0x80000000) != 0) ? zero : meta.ff_6_11;
        meta.ff_7_0 = ((meta.ff_7_0 & 0x80000000) != 0) ? zero : meta.ff_7_0;
        meta.ff_7_1 = ((meta.ff_7_1 & 0x80000000) != 0) ? zero : meta.ff_7_1;
        meta.ff_7_2 = ((meta.ff_7_2 & 0x80000000) != 0) ? zero : meta.ff_7_2;
        meta.ff_7_3 = ((meta.ff_7_3 & 0x80000000) != 0) ? zero : meta.ff_7_3;
        meta.ff_7_4 = ((meta.ff_7_4 & 0x80000000) != 0) ? zero : meta.ff_7_4;
        meta.ff_7_5 = ((meta.ff_7_5 & 0x80000000) != 0) ? zero : meta.ff_7_5;
        meta.ff_7_6 = ((meta.ff_7_6 & 0x80000000) != 0) ? zero : meta.ff_7_6;
        meta.ff_7_7 = ((meta.ff_7_7 & 0x80000000) != 0) ? zero : meta.ff_7_7;
        meta.ff_7_8 = ((meta.ff_7_8 & 0x80000000) != 0) ? zero : meta.ff_7_8;
        meta.ff_7_9 = ((meta.ff_7_9 & 0x80000000) != 0) ? zero : meta.ff_7_9;
        meta.ff_7_10 = ((meta.ff_7_10 & 0x80000000) != 0) ? zero : meta.ff_7_10;
        meta.ff_7_11 = ((meta.ff_7_11 & 0x80000000) != 0) ? zero : meta.ff_7_11;
    }

    // (8*12) * (12*6) = (8*6)，实现残差连接
    action operation_linear2() {
        bit<64> ff_0_0 = (bit<64>) meta.ff_0_0 | (((meta.ff_0_0 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_0_1 = (bit<64>) meta.ff_0_1 | (((meta.ff_0_1 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_0_2 = (bit<64>) meta.ff_0_2 | (((meta.ff_0_2 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_0_3 = (bit<64>) meta.ff_0_3 | (((meta.ff_0_3 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_0_4 = (bit<64>) meta.ff_0_4 | (((meta.ff_0_4 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_0_5 = (bit<64>) meta.ff_0_5 | (((meta.ff_0_5 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_0_6 = (bit<64>) meta.ff_0_6 | (((meta.ff_0_6 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_0_7 = (bit<64>) meta.ff_0_7 | (((meta.ff_0_7 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_0_8 = (bit<64>) meta.ff_0_8 | (((meta.ff_0_8 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_0_9 = (bit<64>) meta.ff_0_9 | (((meta.ff_0_9 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_0_10 = (bit<64>) meta.ff_0_10 | (((meta.ff_0_10 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_0_11 = (bit<64>) meta.ff_0_11 | (((meta.ff_0_11 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_1_0 = (bit<64>) meta.ff_1_0 | (((meta.ff_1_0 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_1_1 = (bit<64>) meta.ff_1_1 | (((meta.ff_1_1 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_1_2 = (bit<64>) meta.ff_1_2 | (((meta.ff_1_2 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_1_3 = (bit<64>) meta.ff_1_3 | (((meta.ff_1_3 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_1_4 = (bit<64>) meta.ff_1_4 | (((meta.ff_1_4 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_1_5 = (bit<64>) meta.ff_1_5 | (((meta.ff_1_5 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_1_6 = (bit<64>) meta.ff_1_6 | (((meta.ff_1_6 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_1_7 = (bit<64>) meta.ff_1_7 | (((meta.ff_1_7 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_1_8 = (bit<64>) meta.ff_1_8 | (((meta.ff_1_8 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_1_9 = (bit<64>) meta.ff_1_9 | (((meta.ff_1_9 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_1_10 = (bit<64>) meta.ff_1_10 | (((meta.ff_1_10 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_1_11 = (bit<64>) meta.ff_1_11 | (((meta.ff_1_11 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_2_0 = (bit<64>) meta.ff_2_0 | (((meta.ff_2_0 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_2_1 = (bit<64>) meta.ff_2_1 | (((meta.ff_2_1 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_2_2 = (bit<64>) meta.ff_2_2 | (((meta.ff_2_2 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_2_3 = (bit<64>) meta.ff_2_3 | (((meta.ff_2_3 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_2_4 = (bit<64>) meta.ff_2_4 | (((meta.ff_2_4 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_2_5 = (bit<64>) meta.ff_2_5 | (((meta.ff_2_5 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_2_6 = (bit<64>) meta.ff_2_6 | (((meta.ff_2_6 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_2_7 = (bit<64>) meta.ff_2_7 | (((meta.ff_2_7 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_2_8 = (bit<64>) meta.ff_2_8 | (((meta.ff_2_8 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_2_9 = (bit<64>) meta.ff_2_9 | (((meta.ff_2_9 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_2_10 = (bit<64>) meta.ff_2_10 | (((meta.ff_2_10 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_2_11 = (bit<64>) meta.ff_2_11 | (((meta.ff_2_11 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_3_0 = (bit<64>) meta.ff_3_0 | (((meta.ff_3_0 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_3_1 = (bit<64>) meta.ff_3_1 | (((meta.ff_3_1 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_3_2 = (bit<64>) meta.ff_3_2 | (((meta.ff_3_2 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_3_3 = (bit<64>) meta.ff_3_3 | (((meta.ff_3_3 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_3_4 = (bit<64>) meta.ff_3_4 | (((meta.ff_3_4 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_3_5 = (bit<64>) meta.ff_3_5 | (((meta.ff_3_5 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_3_6 = (bit<64>) meta.ff_3_6 | (((meta.ff_3_6 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_3_7 = (bit<64>) meta.ff_3_7 | (((meta.ff_3_7 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_3_8 = (bit<64>) meta.ff_3_8 | (((meta.ff_3_8 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_3_9 = (bit<64>) meta.ff_3_9 | (((meta.ff_3_9 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_3_10 = (bit<64>) meta.ff_3_10 | (((meta.ff_3_10 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_3_11 = (bit<64>) meta.ff_3_11 | (((meta.ff_3_11 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_4_0 = (bit<64>) meta.ff_4_0 | (((meta.ff_4_0 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_4_1 = (bit<64>) meta.ff_4_1 | (((meta.ff_4_1 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_4_2 = (bit<64>) meta.ff_4_2 | (((meta.ff_4_2 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_4_3 = (bit<64>) meta.ff_4_3 | (((meta.ff_4_3 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_4_4 = (bit<64>) meta.ff_4_4 | (((meta.ff_4_4 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_4_5 = (bit<64>) meta.ff_4_5 | (((meta.ff_4_5 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_4_6 = (bit<64>) meta.ff_4_6 | (((meta.ff_4_6 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_4_7 = (bit<64>) meta.ff_4_7 | (((meta.ff_4_7 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_4_8 = (bit<64>) meta.ff_4_8 | (((meta.ff_4_8 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_4_9 = (bit<64>) meta.ff_4_9 | (((meta.ff_4_9 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_4_10 = (bit<64>) meta.ff_4_10 | (((meta.ff_4_10 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_4_11 = (bit<64>) meta.ff_4_11 | (((meta.ff_4_11 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_5_0 = (bit<64>) meta.ff_5_0 | (((meta.ff_5_0 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_5_1 = (bit<64>) meta.ff_5_1 | (((meta.ff_5_1 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_5_2 = (bit<64>) meta.ff_5_2 | (((meta.ff_5_2 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_5_3 = (bit<64>) meta.ff_5_3 | (((meta.ff_5_3 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_5_4 = (bit<64>) meta.ff_5_4 | (((meta.ff_5_4 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_5_5 = (bit<64>) meta.ff_5_5 | (((meta.ff_5_5 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_5_6 = (bit<64>) meta.ff_5_6 | (((meta.ff_5_6 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_5_7 = (bit<64>) meta.ff_5_7 | (((meta.ff_5_7 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_5_8 = (bit<64>) meta.ff_5_8 | (((meta.ff_5_8 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_5_9 = (bit<64>) meta.ff_5_9 | (((meta.ff_5_9 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_5_10 = (bit<64>) meta.ff_5_10 | (((meta.ff_5_10 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_5_11 = (bit<64>) meta.ff_5_11 | (((meta.ff_5_11 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_6_0 = (bit<64>) meta.ff_6_0 | (((meta.ff_6_0 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_6_1 = (bit<64>) meta.ff_6_1 | (((meta.ff_6_1 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_6_2 = (bit<64>) meta.ff_6_2 | (((meta.ff_6_2 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_6_3 = (bit<64>) meta.ff_6_3 | (((meta.ff_6_3 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_6_4 = (bit<64>) meta.ff_6_4 | (((meta.ff_6_4 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_6_5 = (bit<64>) meta.ff_6_5 | (((meta.ff_6_5 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_6_6 = (bit<64>) meta.ff_6_6 | (((meta.ff_6_6 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_6_7 = (bit<64>) meta.ff_6_7 | (((meta.ff_6_7 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_6_8 = (bit<64>) meta.ff_6_8 | (((meta.ff_6_8 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_6_9 = (bit<64>) meta.ff_6_9 | (((meta.ff_6_9 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_6_10 = (bit<64>) meta.ff_6_10 | (((meta.ff_6_10 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_6_11 = (bit<64>) meta.ff_6_11 | (((meta.ff_6_11 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_7_0 = (bit<64>) meta.ff_7_0 | (((meta.ff_7_0 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_7_1 = (bit<64>) meta.ff_7_1 | (((meta.ff_7_1 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_7_2 = (bit<64>) meta.ff_7_2 | (((meta.ff_7_2 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_7_3 = (bit<64>) meta.ff_7_3 | (((meta.ff_7_3 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_7_4 = (bit<64>) meta.ff_7_4 | (((meta.ff_7_4 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_7_5 = (bit<64>) meta.ff_7_5 | (((meta.ff_7_5 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_7_6 = (bit<64>) meta.ff_7_6 | (((meta.ff_7_6 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_7_7 = (bit<64>) meta.ff_7_7 | (((meta.ff_7_7 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_7_8 = (bit<64>) meta.ff_7_8 | (((meta.ff_7_8 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_7_9 = (bit<64>) meta.ff_7_9 | (((meta.ff_7_9 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_7_10 = (bit<64>) meta.ff_7_10 | (((meta.ff_7_10 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);
        bit<64> ff_7_11 = (bit<64>) meta.ff_7_11 | (((meta.ff_7_11 & 0x80000000) != 0) ? 64w0xFFFFFFFF00000000 : 0);

        bit<32> result_0_0 = (ff_0_0 * w2_0_0 + ff_0_1 * w2_1_0 + ff_0_2 * w2_2_0 + ff_0_3 * w2_3_0 + ff_0_4 * w2_4_0 + ff_0_5 * w2_5_0 + ff_0_6 * w2_6_0 + ff_0_7 * w2_7_0 + ff_0_8 * w2_8_0 + ff_0_9 * w2_9_0 + ff_0_10 * w2_10_0 + ff_0_11 * w2_11_0)[39:8] + b2_0;
        bit<32> result_0_1 = (ff_0_0 * w2_0_1 + ff_0_1 * w2_1_1 + ff_0_2 * w2_2_1 + ff_0_3 * w2_3_1 + ff_0_4 * w2_4_1 + ff_0_5 * w2_5_1 + ff_0_6 * w2_6_1 + ff_0_7 * w2_7_1 + ff_0_8 * w2_8_1 + ff_0_9 * w2_9_1 + ff_0_10 * w2_10_1 + ff_0_11 * w2_11_1)[39:8] + b2_1;
        bit<32> result_0_2 = (ff_0_0 * w2_0_2 + ff_0_1 * w2_1_2 + ff_0_2 * w2_2_2 + ff_0_3 * w2_3_2 + ff_0_4 * w2_4_2 + ff_0_5 * w2_5_2 + ff_0_6 * w2_6_2 + ff_0_7 * w2_7_2 + ff_0_8 * w2_8_2 + ff_0_9 * w2_9_2 + ff_0_10 * w2_10_2 + ff_0_11 * w2_11_2)[39:8] + b2_2;
        bit<32> result_0_3 = (ff_0_0 * w2_0_3 + ff_0_1 * w2_1_3 + ff_0_2 * w2_2_3 + ff_0_3 * w2_3_3 + ff_0_4 * w2_4_3 + ff_0_5 * w2_5_3 + ff_0_6 * w2_6_3 + ff_0_7 * w2_7_3 + ff_0_8 * w2_8_3 + ff_0_9 * w2_9_3 + ff_0_10 * w2_10_3 + ff_0_11 * w2_11_3)[39:8] + b2_3;
        bit<32> result_0_4 = (ff_0_0 * w2_0_4 + ff_0_1 * w2_1_4 + ff_0_2 * w2_2_4 + ff_0_3 * w2_3_4 + ff_0_4 * w2_4_4 + ff_0_5 * w2_5_4 + ff_0_6 * w2_6_4 + ff_0_7 * w2_7_4 + ff_0_8 * w2_8_4 + ff_0_9 * w2_9_4 + ff_0_10 * w2_10_4 + ff_0_11 * w2_11_4)[39:8] + b2_4;
        bit<32> result_0_5 = (ff_0_0 * w2_0_5 + ff_0_1 * w2_1_5 + ff_0_2 * w2_2_5 + ff_0_3 * w2_3_5 + ff_0_4 * w2_4_5 + ff_0_5 * w2_5_5 + ff_0_6 * w2_6_5 + ff_0_7 * w2_7_5 + ff_0_8 * w2_8_5 + ff_0_9 * w2_9_5 + ff_0_10 * w2_10_5 + ff_0_11 * w2_11_5)[39:8] + b2_5;
        bit<32> result_1_0 = (ff_1_0 * w2_0_0 + ff_1_1 * w2_1_0 + ff_1_2 * w2_2_0 + ff_1_3 * w2_3_0 + ff_1_4 * w2_4_0 + ff_1_5 * w2_5_0 + ff_1_6 * w2_6_0 + ff_1_7 * w2_7_0 + ff_1_8 * w2_8_0 + ff_1_9 * w2_9_0 + ff_1_10 * w2_10_0 + ff_1_11 * w2_11_0)[39:8] + b2_0;
        bit<32> result_1_1 = (ff_1_0 * w2_0_1 + ff_1_1 * w2_1_1 + ff_1_2 * w2_2_1 + ff_1_3 * w2_3_1 + ff_1_4 * w2_4_1 + ff_1_5 * w2_5_1 + ff_1_6 * w2_6_1 + ff_1_7 * w2_7_1 + ff_1_8 * w2_8_1 + ff_1_9 * w2_9_1 + ff_1_10 * w2_10_1 + ff_1_11 * w2_11_1)[39:8] + b2_1;
        bit<32> result_1_2 = (ff_1_0 * w2_0_2 + ff_1_1 * w2_1_2 + ff_1_2 * w2_2_2 + ff_1_3 * w2_3_2 + ff_1_4 * w2_4_2 + ff_1_5 * w2_5_2 + ff_1_6 * w2_6_2 + ff_1_7 * w2_7_2 + ff_1_8 * w2_8_2 + ff_1_9 * w2_9_2 + ff_1_10 * w2_10_2 + ff_1_11 * w2_11_2)[39:8] + b2_2;
        bit<32> result_1_3 = (ff_1_0 * w2_0_3 + ff_1_1 * w2_1_3 + ff_1_2 * w2_2_3 + ff_1_3 * w2_3_3 + ff_1_4 * w2_4_3 + ff_1_5 * w2_5_3 + ff_1_6 * w2_6_3 + ff_1_7 * w2_7_3 + ff_1_8 * w2_8_3 + ff_1_9 * w2_9_3 + ff_1_10 * w2_10_3 + ff_1_11 * w2_11_3)[39:8] + b2_3;
        bit<32> result_1_4 = (ff_1_0 * w2_0_4 + ff_1_1 * w2_1_4 + ff_1_2 * w2_2_4 + ff_1_3 * w2_3_4 + ff_1_4 * w2_4_4 + ff_1_5 * w2_5_4 + ff_1_6 * w2_6_4 + ff_1_7 * w2_7_4 + ff_1_8 * w2_8_4 + ff_1_9 * w2_9_4 + ff_1_10 * w2_10_4 + ff_1_11 * w2_11_4)[39:8] + b2_4;
        bit<32> result_1_5 = (ff_1_0 * w2_0_5 + ff_1_1 * w2_1_5 + ff_1_2 * w2_2_5 + ff_1_3 * w2_3_5 + ff_1_4 * w2_4_5 + ff_1_5 * w2_5_5 + ff_1_6 * w2_6_5 + ff_1_7 * w2_7_5 + ff_1_8 * w2_8_5 + ff_1_9 * w2_9_5 + ff_1_10 * w2_10_5 + ff_1_11 * w2_11_5)[39:8] + b2_5;
        bit<32> result_2_0 = (ff_2_0 * w2_0_0 + ff_2_1 * w2_1_0 + ff_2_2 * w2_2_0 + ff_2_3 * w2_3_0 + ff_2_4 * w2_4_0 + ff_2_5 * w2_5_0 + ff_2_6 * w2_6_0 + ff_2_7 * w2_7_0 + ff_2_8 * w2_8_0 + ff_2_9 * w2_9_0 + ff_2_10 * w2_10_0 + ff_2_11 * w2_11_0)[39:8] + b2_0;
        bit<32> result_2_1 = (ff_2_0 * w2_0_1 + ff_2_1 * w2_1_1 + ff_2_2 * w2_2_1 + ff_2_3 * w2_3_1 + ff_2_4 * w2_4_1 + ff_2_5 * w2_5_1 + ff_2_6 * w2_6_1 + ff_2_7 * w2_7_1 + ff_2_8 * w2_8_1 + ff_2_9 * w2_9_1 + ff_2_10 * w2_10_1 + ff_2_11 * w2_11_1)[39:8] + b2_1;
        bit<32> result_2_2 = (ff_2_0 * w2_0_2 + ff_2_1 * w2_1_2 + ff_2_2 * w2_2_2 + ff_2_3 * w2_3_2 + ff_2_4 * w2_4_2 + ff_2_5 * w2_5_2 + ff_2_6 * w2_6_2 + ff_2_7 * w2_7_2 + ff_2_8 * w2_8_2 + ff_2_9 * w2_9_2 + ff_2_10 * w2_10_2 + ff_2_11 * w2_11_2)[39:8] + b2_2;
        bit<32> result_2_3 = (ff_2_0 * w2_0_3 + ff_2_1 * w2_1_3 + ff_2_2 * w2_2_3 + ff_2_3 * w2_3_3 + ff_2_4 * w2_4_3 + ff_2_5 * w2_5_3 + ff_2_6 * w2_6_3 + ff_2_7 * w2_7_3 + ff_2_8 * w2_8_3 + ff_2_9 * w2_9_3 + ff_2_10 * w2_10_3 + ff_2_11 * w2_11_3)[39:8] + b2_3;
        bit<32> result_2_4 = (ff_2_0 * w2_0_4 + ff_2_1 * w2_1_4 + ff_2_2 * w2_2_4 + ff_2_3 * w2_3_4 + ff_2_4 * w2_4_4 + ff_2_5 * w2_5_4 + ff_2_6 * w2_6_4 + ff_2_7 * w2_7_4 + ff_2_8 * w2_8_4 + ff_2_9 * w2_9_4 + ff_2_10 * w2_10_4 + ff_2_11 * w2_11_4)[39:8] + b2_4;
        bit<32> result_2_5 = (ff_2_0 * w2_0_5 + ff_2_1 * w2_1_5 + ff_2_2 * w2_2_5 + ff_2_3 * w2_3_5 + ff_2_4 * w2_4_5 + ff_2_5 * w2_5_5 + ff_2_6 * w2_6_5 + ff_2_7 * w2_7_5 + ff_2_8 * w2_8_5 + ff_2_9 * w2_9_5 + ff_2_10 * w2_10_5 + ff_2_11 * w2_11_5)[39:8] + b2_5;
        bit<32> result_3_0 = (ff_3_0 * w2_0_0 + ff_3_1 * w2_1_0 + ff_3_2 * w2_2_0 + ff_3_3 * w2_3_0 + ff_3_4 * w2_4_0 + ff_3_5 * w2_5_0 + ff_3_6 * w2_6_0 + ff_3_7 * w2_7_0 + ff_3_8 * w2_8_0 + ff_3_9 * w2_9_0 + ff_3_10 * w2_10_0 + ff_3_11 * w2_11_0)[39:8] + b2_0;
        bit<32> result_3_1 = (ff_3_0 * w2_0_1 + ff_3_1 * w2_1_1 + ff_3_2 * w2_2_1 + ff_3_3 * w2_3_1 + ff_3_4 * w2_4_1 + ff_3_5 * w2_5_1 + ff_3_6 * w2_6_1 + ff_3_7 * w2_7_1 + ff_3_8 * w2_8_1 + ff_3_9 * w2_9_1 + ff_3_10 * w2_10_1 + ff_3_11 * w2_11_1)[39:8] + b2_1;
        bit<32> result_3_2 = (ff_3_0 * w2_0_2 + ff_3_1 * w2_1_2 + ff_3_2 * w2_2_2 + ff_3_3 * w2_3_2 + ff_3_4 * w2_4_2 + ff_3_5 * w2_5_2 + ff_3_6 * w2_6_2 + ff_3_7 * w2_7_2 + ff_3_8 * w2_8_2 + ff_3_9 * w2_9_2 + ff_3_10 * w2_10_2 + ff_3_11 * w2_11_2)[39:8] + b2_2;
        bit<32> result_3_3 = (ff_3_0 * w2_0_3 + ff_3_1 * w2_1_3 + ff_3_2 * w2_2_3 + ff_3_3 * w2_3_3 + ff_3_4 * w2_4_3 + ff_3_5 * w2_5_3 + ff_3_6 * w2_6_3 + ff_3_7 * w2_7_3 + ff_3_8 * w2_8_3 + ff_3_9 * w2_9_3 + ff_3_10 * w2_10_3 + ff_3_11 * w2_11_3)[39:8] + b2_3;
        bit<32> result_3_4 = (ff_3_0 * w2_0_4 + ff_3_1 * w2_1_4 + ff_3_2 * w2_2_4 + ff_3_3 * w2_3_4 + ff_3_4 * w2_4_4 + ff_3_5 * w2_5_4 + ff_3_6 * w2_6_4 + ff_3_7 * w2_7_4 + ff_3_8 * w2_8_4 + ff_3_9 * w2_9_4 + ff_3_10 * w2_10_4 + ff_3_11 * w2_11_4)[39:8] + b2_4;
        bit<32> result_3_5 = (ff_3_0 * w2_0_5 + ff_3_1 * w2_1_5 + ff_3_2 * w2_2_5 + ff_3_3 * w2_3_5 + ff_3_4 * w2_4_5 + ff_3_5 * w2_5_5 + ff_3_6 * w2_6_5 + ff_3_7 * w2_7_5 + ff_3_8 * w2_8_5 + ff_3_9 * w2_9_5 + ff_3_10 * w2_10_5 + ff_3_11 * w2_11_5)[39:8] + b2_5;
        bit<32> result_4_0 = (ff_4_0 * w2_0_0 + ff_4_1 * w2_1_0 + ff_4_2 * w2_2_0 + ff_4_3 * w2_3_0 + ff_4_4 * w2_4_0 + ff_4_5 * w2_5_0 + ff_4_6 * w2_6_0 + ff_4_7 * w2_7_0 + ff_4_8 * w2_8_0 + ff_4_9 * w2_9_0 + ff_4_10 * w2_10_0 + ff_4_11 * w2_11_0)[39:8] + b2_0;
        bit<32> result_4_1 = (ff_4_0 * w2_0_1 + ff_4_1 * w2_1_1 + ff_4_2 * w2_2_1 + ff_4_3 * w2_3_1 + ff_4_4 * w2_4_1 + ff_4_5 * w2_5_1 + ff_4_6 * w2_6_1 + ff_4_7 * w2_7_1 + ff_4_8 * w2_8_1 + ff_4_9 * w2_9_1 + ff_4_10 * w2_10_1 + ff_4_11 * w2_11_1)[39:8] + b2_1;
        bit<32> result_4_2 = (ff_4_0 * w2_0_2 + ff_4_1 * w2_1_2 + ff_4_2 * w2_2_2 + ff_4_3 * w2_3_2 + ff_4_4 * w2_4_2 + ff_4_5 * w2_5_2 + ff_4_6 * w2_6_2 + ff_4_7 * w2_7_2 + ff_4_8 * w2_8_2 + ff_4_9 * w2_9_2 + ff_4_10 * w2_10_2 + ff_4_11 * w2_11_2)[39:8] + b2_2;
        bit<32> result_4_3 = (ff_4_0 * w2_0_3 + ff_4_1 * w2_1_3 + ff_4_2 * w2_2_3 + ff_4_3 * w2_3_3 + ff_4_4 * w2_4_3 + ff_4_5 * w2_5_3 + ff_4_6 * w2_6_3 + ff_4_7 * w2_7_3 + ff_4_8 * w2_8_3 + ff_4_9 * w2_9_3 + ff_4_10 * w2_10_3 + ff_4_11 * w2_11_3)[39:8] + b2_3;
        bit<32> result_4_4 = (ff_4_0 * w2_0_4 + ff_4_1 * w2_1_4 + ff_4_2 * w2_2_4 + ff_4_3 * w2_3_4 + ff_4_4 * w2_4_4 + ff_4_5 * w2_5_4 + ff_4_6 * w2_6_4 + ff_4_7 * w2_7_4 + ff_4_8 * w2_8_4 + ff_4_9 * w2_9_4 + ff_4_10 * w2_10_4 + ff_4_11 * w2_11_4)[39:8] + b2_4;
        bit<32> result_4_5 = (ff_4_0 * w2_0_5 + ff_4_1 * w2_1_5 + ff_4_2 * w2_2_5 + ff_4_3 * w2_3_5 + ff_4_4 * w2_4_5 + ff_4_5 * w2_5_5 + ff_4_6 * w2_6_5 + ff_4_7 * w2_7_5 + ff_4_8 * w2_8_5 + ff_4_9 * w2_9_5 + ff_4_10 * w2_10_5 + ff_4_11 * w2_11_5)[39:8] + b2_5;
        bit<32> result_5_0 = (ff_5_0 * w2_0_0 + ff_5_1 * w2_1_0 + ff_5_2 * w2_2_0 + ff_5_3 * w2_3_0 + ff_5_4 * w2_4_0 + ff_5_5 * w2_5_0 + ff_5_6 * w2_6_0 + ff_5_7 * w2_7_0 + ff_5_8 * w2_8_0 + ff_5_9 * w2_9_0 + ff_5_10 * w2_10_0 + ff_5_11 * w2_11_0)[39:8] + b2_0;
        bit<32> result_5_1 = (ff_5_0 * w2_0_1 + ff_5_1 * w2_1_1 + ff_5_2 * w2_2_1 + ff_5_3 * w2_3_1 + ff_5_4 * w2_4_1 + ff_5_5 * w2_5_1 + ff_5_6 * w2_6_1 + ff_5_7 * w2_7_1 + ff_5_8 * w2_8_1 + ff_5_9 * w2_9_1 + ff_5_10 * w2_10_1 + ff_5_11 * w2_11_1)[39:8] + b2_1;
        bit<32> result_5_2 = (ff_5_0 * w2_0_2 + ff_5_1 * w2_1_2 + ff_5_2 * w2_2_2 + ff_5_3 * w2_3_2 + ff_5_4 * w2_4_2 + ff_5_5 * w2_5_2 + ff_5_6 * w2_6_2 + ff_5_7 * w2_7_2 + ff_5_8 * w2_8_2 + ff_5_9 * w2_9_2 + ff_5_10 * w2_10_2 + ff_5_11 * w2_11_2)[39:8] + b2_2;
        bit<32> result_5_3 = (ff_5_0 * w2_0_3 + ff_5_1 * w2_1_3 + ff_5_2 * w2_2_3 + ff_5_3 * w2_3_3 + ff_5_4 * w2_4_3 + ff_5_5 * w2_5_3 + ff_5_6 * w2_6_3 + ff_5_7 * w2_7_3 + ff_5_8 * w2_8_3 + ff_5_9 * w2_9_3 + ff_5_10 * w2_10_3 + ff_5_11 * w2_11_3)[39:8] + b2_3;
        bit<32> result_5_4 = (ff_5_0 * w2_0_4 + ff_5_1 * w2_1_4 + ff_5_2 * w2_2_4 + ff_5_3 * w2_3_4 + ff_5_4 * w2_4_4 + ff_5_5 * w2_5_4 + ff_5_6 * w2_6_4 + ff_5_7 * w2_7_4 + ff_5_8 * w2_8_4 + ff_5_9 * w2_9_4 + ff_5_10 * w2_10_4 + ff_5_11 * w2_11_4)[39:8] + b2_4;
        bit<32> result_5_5 = (ff_5_0 * w2_0_5 + ff_5_1 * w2_1_5 + ff_5_2 * w2_2_5 + ff_5_3 * w2_3_5 + ff_5_4 * w2_4_5 + ff_5_5 * w2_5_5 + ff_5_6 * w2_6_5 + ff_5_7 * w2_7_5 + ff_5_8 * w2_8_5 + ff_5_9 * w2_9_5 + ff_5_10 * w2_10_5 + ff_5_11 * w2_11_5)[39:8] + b2_5;
        bit<32> result_6_0 = (ff_6_0 * w2_0_0 + ff_6_1 * w2_1_0 + ff_6_2 * w2_2_0 + ff_6_3 * w2_3_0 + ff_6_4 * w2_4_0 + ff_6_5 * w2_5_0 + ff_6_6 * w2_6_0 + ff_6_7 * w2_7_0 + ff_6_8 * w2_8_0 + ff_6_9 * w2_9_0 + ff_6_10 * w2_10_0 + ff_6_11 * w2_11_0)[39:8] + b2_0;
        bit<32> result_6_1 = (ff_6_0 * w2_0_1 + ff_6_1 * w2_1_1 + ff_6_2 * w2_2_1 + ff_6_3 * w2_3_1 + ff_6_4 * w2_4_1 + ff_6_5 * w2_5_1 + ff_6_6 * w2_6_1 + ff_6_7 * w2_7_1 + ff_6_8 * w2_8_1 + ff_6_9 * w2_9_1 + ff_6_10 * w2_10_1 + ff_6_11 * w2_11_1)[39:8] + b2_1;
        bit<32> result_6_2 = (ff_6_0 * w2_0_2 + ff_6_1 * w2_1_2 + ff_6_2 * w2_2_2 + ff_6_3 * w2_3_2 + ff_6_4 * w2_4_2 + ff_6_5 * w2_5_2 + ff_6_6 * w2_6_2 + ff_6_7 * w2_7_2 + ff_6_8 * w2_8_2 + ff_6_9 * w2_9_2 + ff_6_10 * w2_10_2 + ff_6_11 * w2_11_2)[39:8] + b2_2;
        bit<32> result_6_3 = (ff_6_0 * w2_0_3 + ff_6_1 * w2_1_3 + ff_6_2 * w2_2_3 + ff_6_3 * w2_3_3 + ff_6_4 * w2_4_3 + ff_6_5 * w2_5_3 + ff_6_6 * w2_6_3 + ff_6_7 * w2_7_3 + ff_6_8 * w2_8_3 + ff_6_9 * w2_9_3 + ff_6_10 * w2_10_3 + ff_6_11 * w2_11_3)[39:8] + b2_3;
        bit<32> result_6_4 = (ff_6_0 * w2_0_4 + ff_6_1 * w2_1_4 + ff_6_2 * w2_2_4 + ff_6_3 * w2_3_4 + ff_6_4 * w2_4_4 + ff_6_5 * w2_5_4 + ff_6_6 * w2_6_4 + ff_6_7 * w2_7_4 + ff_6_8 * w2_8_4 + ff_6_9 * w2_9_4 + ff_6_10 * w2_10_4 + ff_6_11 * w2_11_4)[39:8] + b2_4;
        bit<32> result_6_5 = (ff_6_0 * w2_0_5 + ff_6_1 * w2_1_5 + ff_6_2 * w2_2_5 + ff_6_3 * w2_3_5 + ff_6_4 * w2_4_5 + ff_6_5 * w2_5_5 + ff_6_6 * w2_6_5 + ff_6_7 * w2_7_5 + ff_6_8 * w2_8_5 + ff_6_9 * w2_9_5 + ff_6_10 * w2_10_5 + ff_6_11 * w2_11_5)[39:8] + b2_5;
        bit<32> result_7_0 = (ff_7_0 * w2_0_0 + ff_7_1 * w2_1_0 + ff_7_2 * w2_2_0 + ff_7_3 * w2_3_0 + ff_7_4 * w2_4_0 + ff_7_5 * w2_5_0 + ff_7_6 * w2_6_0 + ff_7_7 * w2_7_0 + ff_7_8 * w2_8_0 + ff_7_9 * w2_9_0 + ff_7_10 * w2_10_0 + ff_7_11 * w2_11_0)[39:8] + b2_0;
        bit<32> result_7_1 = (ff_7_0 * w2_0_1 + ff_7_1 * w2_1_1 + ff_7_2 * w2_2_1 + ff_7_3 * w2_3_1 + ff_7_4 * w2_4_1 + ff_7_5 * w2_5_1 + ff_7_6 * w2_6_1 + ff_7_7 * w2_7_1 + ff_7_8 * w2_8_1 + ff_7_9 * w2_9_1 + ff_7_10 * w2_10_1 + ff_7_11 * w2_11_1)[39:8] + b2_1;
        bit<32> result_7_2 = (ff_7_0 * w2_0_2 + ff_7_1 * w2_1_2 + ff_7_2 * w2_2_2 + ff_7_3 * w2_3_2 + ff_7_4 * w2_4_2 + ff_7_5 * w2_5_2 + ff_7_6 * w2_6_2 + ff_7_7 * w2_7_2 + ff_7_8 * w2_8_2 + ff_7_9 * w2_9_2 + ff_7_10 * w2_10_2 + ff_7_11 * w2_11_2)[39:8] + b2_2;
        bit<32> result_7_3 = (ff_7_0 * w2_0_3 + ff_7_1 * w2_1_3 + ff_7_2 * w2_2_3 + ff_7_3 * w2_3_3 + ff_7_4 * w2_4_3 + ff_7_5 * w2_5_3 + ff_7_6 * w2_6_3 + ff_7_7 * w2_7_3 + ff_7_8 * w2_8_3 + ff_7_9 * w2_9_3 + ff_7_10 * w2_10_3 + ff_7_11 * w2_11_3)[39:8] + b2_3;
        bit<32> result_7_4 = (ff_7_0 * w2_0_4 + ff_7_1 * w2_1_4 + ff_7_2 * w2_2_4 + ff_7_3 * w2_3_4 + ff_7_4 * w2_4_4 + ff_7_5 * w2_5_4 + ff_7_6 * w2_6_4 + ff_7_7 * w2_7_4 + ff_7_8 * w2_8_4 + ff_7_9 * w2_9_4 + ff_7_10 * w2_10_4 + ff_7_11 * w2_11_4)[39:8] + b2_4;
        bit<32> result_7_5 = (ff_7_0 * w2_0_5 + ff_7_1 * w2_1_5 + ff_7_2 * w2_2_5 + ff_7_3 * w2_3_5 + ff_7_4 * w2_4_5 + ff_7_5 * w2_5_5 + ff_7_6 * w2_6_5 + ff_7_7 * w2_7_5 + ff_7_8 * w2_8_5 + ff_7_9 * w2_9_5 + ff_7_10 * w2_10_5 + ff_7_11 * w2_11_5)[39:8] + b2_5;

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
    


    apply {
        if (hdr.p4calc.isValid()) {
            operation_linear1();
            operation_relu();
            operation_linear2();
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