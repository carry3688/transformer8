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
const bit<32> w1_0_0 = 0x226ACEC2;
const bit<32> w1_0_1 = 0x1FC98EE9;
const bit<32> w1_0_2 = 0x7DE9BB23;
const bit<32> w1_0_3 = 0xE5F776CD;
const bit<32> w1_0_4 = 0xD5D74F61;
const bit<32> w1_0_5 = 0x60034A0C;
const bit<32> w1_0_6 = 0xF17B1FEA;
const bit<32> w1_0_7 = 0x7BC8FE7E;
const bit<32> w1_0_8 = 0x3D54D499;
const bit<32> w1_0_9 = 0xD4F54477;
const bit<32> w1_0_10 = 0xD653A3BB;
const bit<32> w1_0_11 = 0xA1415522;
const bit<32> w1_1_0 = 0x5A564AEA;
const bit<32> w1_1_1 = 0x6C828EE3;
const bit<32> w1_1_2 = 0x215FCFAA;
const bit<32> w1_1_3 = 0xE9FCDE03;
const bit<32> w1_1_4 = 0xD140C3AA;
const bit<32> w1_1_5 = 0x41D51AF8;
const bit<32> w1_1_6 = 0x77718013;
const bit<32> w1_1_7 = 0x96527450;
const bit<32> w1_1_8 = 0x235239E7;
const bit<32> w1_1_9 = 0x5743CAB5;
const bit<32> w1_1_10 = 0xDA47B547;
const bit<32> w1_1_11 = 0x112B8F48;
const bit<32> w1_2_0 = 0x65830028;
const bit<32> w1_2_1 = 0x2E5A22A1;
const bit<32> w1_2_2 = 0xA04522E4;
const bit<32> w1_2_3 = 0x4B165A04;
const bit<32> w1_2_4 = 0x4AA9C87F;
const bit<32> w1_2_5 = 0x488865D7;
const bit<32> w1_2_6 = 0x29CEC2B3;
const bit<32> w1_2_7 = 0x97CD1DA5;
const bit<32> w1_2_8 = 0x5DE4DB63;
const bit<32> w1_2_9 = 0x3F0EAA0A;
const bit<32> w1_2_10 = 0xB75C75BF;
const bit<32> w1_2_11 = 0x15D8AFD3;
const bit<32> w1_3_0 = 0x43B7F3FC;
const bit<32> w1_3_1 = 0x7E1214D5;
const bit<32> w1_3_2 = 0x26820EBA;
const bit<32> w1_3_3 = 0xA1C6B894;
const bit<32> w1_3_4 = 0x9D4609E0;
const bit<32> w1_3_5 = 0xE8AF3DDB;
const bit<32> w1_3_6 = 0xD2BEA6A9;
const bit<32> w1_3_7 = 0x5F196128;
const bit<32> w1_3_8 = 0xAB4272A8;
const bit<32> w1_3_9 = 0x817ECDE9;
const bit<32> w1_3_10 = 0x694F626B;
const bit<32> w1_3_11 = 0x2EB28EDD;
const bit<32> w1_4_0 = 0x74D87CAA;
const bit<32> w1_4_1 = 0x4692C8D1;
const bit<32> w1_4_2 = 0x47065C2F;
const bit<32> w1_4_3 = 0x4844F5F2;
const bit<32> w1_4_4 = 0x109A334D;
const bit<32> w1_4_5 = 0x5B36EAA8;
const bit<32> w1_4_6 = 0xEE04FE84;
const bit<32> w1_4_7 = 0x486CBCA8;
const bit<32> w1_4_8 = 0xAD924365;
const bit<32> w1_4_9 = 0xA37B5C08;
const bit<32> w1_4_10 = 0xC1EAF454;
const bit<32> w1_4_11 = 0xB0FDB1E5;
const bit<32> w1_5_0 = 0x1A092B25;
const bit<32> w1_5_1 = 0x68C79638;
const bit<32> w1_5_2 = 0x236F8241;
const bit<32> w1_5_3 = 0x6C1C7B9A;
const bit<32> w1_5_4 = 0x34077C74;
const bit<32> w1_5_5 = 0xA4A72B0D;
const bit<32> w1_5_6 = 0xD569C8CC;
const bit<32> w1_5_7 = 0x513C2D29;
const bit<32> w1_5_8 = 0x25973DF0;
const bit<32> w1_5_9 = 0xC2B6458F;
const bit<32> w1_5_10 = 0x45502542;
const bit<32> w1_5_11 = 0x5DEFFA50;

const bit<32> w2_0_0 = 0xA73A7016;
const bit<32> w2_0_1 = 0xBAB62C1B;
const bit<32> w2_0_2 = 0xC0792A55;
const bit<32> w2_0_3 = 0x11B15933;
const bit<32> w2_0_4 = 0xF3233B05;
const bit<32> w2_0_5 = 0x0796A5C3;
const bit<32> w2_1_0 = 0xC9A49C9F;
const bit<32> w2_1_1 = 0xB5D4B1FB;
const bit<32> w2_1_2 = 0xE5351A34;
const bit<32> w2_1_3 = 0xF4B5446C;
const bit<32> w2_1_4 = 0x2CB96AC9;
const bit<32> w2_1_5 = 0x0533BAA3;
const bit<32> w2_2_0 = 0xB14CF0BF;
const bit<32> w2_2_1 = 0x10171D89;
const bit<32> w2_2_2 = 0xD4FF8A6C;
const bit<32> w2_2_3 = 0xF5136C53;
const bit<32> w2_2_4 = 0x366A8C20;
const bit<32> w2_2_5 = 0x0A0DFB00;
const bit<32> w2_3_0 = 0x892D54DB;
const bit<32> w2_3_1 = 0xD72E4A89;
const bit<32> w2_3_2 = 0x8FA90557;
const bit<32> w2_3_3 = 0x47BACCD3;
const bit<32> w2_3_4 = 0xB1F1943A;
const bit<32> w2_3_5 = 0x581D0E4B;
const bit<32> w2_4_0 = 0xA42904E8;
const bit<32> w2_4_1 = 0xE0134C79;
const bit<32> w2_4_2 = 0x09E4C8C3;
const bit<32> w2_4_3 = 0x0F7433F4;
const bit<32> w2_4_4 = 0x80B427E7;
const bit<32> w2_4_5 = 0xF198B9A8;
const bit<32> w2_5_0 = 0x27BD2F7F;
const bit<32> w2_5_1 = 0x6CCFC973;
const bit<32> w2_5_2 = 0x8F4D0791;
const bit<32> w2_5_3 = 0x5B533121;
const bit<32> w2_5_4 = 0xAF868E67;
const bit<32> w2_5_5 = 0x46DA0261;
const bit<32> w2_6_0 = 0x7C3786FD;
const bit<32> w2_6_1 = 0x2F6798F7;
const bit<32> w2_6_2 = 0xCB813DEC;
const bit<32> w2_6_3 = 0xC16C7F3D;
const bit<32> w2_6_4 = 0x997EDFE0;
const bit<32> w2_6_5 = 0x70700BC6;
const bit<32> w2_7_0 = 0xCFEBB7A3;
const bit<32> w2_7_1 = 0x19184E9C;
const bit<32> w2_7_2 = 0x22241191;
const bit<32> w2_7_3 = 0x6B4AA067;
const bit<32> w2_7_4 = 0xD053BBCE;
const bit<32> w2_7_5 = 0x34637FFC;
const bit<32> w2_8_0 = 0xF7BB40CE;
const bit<32> w2_8_1 = 0x781A943F;
const bit<32> w2_8_2 = 0xF59CD80D;
const bit<32> w2_8_3 = 0x5E0A650B;
const bit<32> w2_8_4 = 0x24408595;
const bit<32> w2_8_5 = 0x8FFAFA87;
const bit<32> w2_9_0 = 0x431240F4;
const bit<32> w2_9_1 = 0x301156C4;
const bit<32> w2_9_2 = 0x3B8A3C2A;
const bit<32> w2_9_3 = 0xE6B59EA7;
const bit<32> w2_9_4 = 0x5831F9B5;
const bit<32> w2_9_5 = 0x6A2DF91B;
const bit<32> w2_10_0 = 0x40FB994C;
const bit<32> w2_10_1 = 0xD55E7152;
const bit<32> w2_10_2 = 0xA42406B4;
const bit<32> w2_10_3 = 0x7F700FBF;
const bit<32> w2_10_4 = 0x0A419A7B;
const bit<32> w2_10_5 = 0xF60693BD;
const bit<32> w2_11_0 = 0x598679C5;
const bit<32> w2_11_1 = 0x2D4207C9;
const bit<32> w2_11_2 = 0x2EDD9DAF;
const bit<32> w2_11_3 = 0x6A162E3E;
const bit<32> w2_11_4 = 0xF1CAA804;
const bit<32> w2_11_5 = 0xD11DE430;


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

      // 丢弃
    action operation_drop() {
        mark_to_drop(standard_metadata);
    }

    // 全连接层1，映射成8*dff，dff暂取12 矩阵乘法为(8*6) * (6*12)
    action operation_linear1() {
        meta.ff_0_0 = hdr.s0_output0_calc.s0_output_0_0 * w1_0_0 + hdr.s0_output0_calc.s0_output_0_1 * w1_1_0 + hdr.s0_output0_calc.s0_output_0_2 * w1_2_0 + hdr.s0_output0_calc.s0_output_0_3 * w1_3_0 + hdr.s0_output0_calc.s0_output_0_4 * w1_4_0 + hdr.s0_output0_calc.s0_output_0_5 * w1_5_0 + b_0;
        meta.ff_0_1 = hdr.s0_output0_calc.s0_output_0_0 * w1_0_1 + hdr.s0_output0_calc.s0_output_0_1 * w1_1_1 + hdr.s0_output0_calc.s0_output_0_2 * w1_2_1 + hdr.s0_output0_calc.s0_output_0_3 * w1_3_1 + hdr.s0_output0_calc.s0_output_0_4 * w1_4_1 + hdr.s0_output0_calc.s0_output_0_5 * w1_5_1 + b_1;
        meta.ff_0_2 = hdr.s0_output0_calc.s0_output_0_0 * w1_0_2 + hdr.s0_output0_calc.s0_output_0_1 * w1_1_2 + hdr.s0_output0_calc.s0_output_0_2 * w1_2_2 + hdr.s0_output0_calc.s0_output_0_3 * w1_3_2 + hdr.s0_output0_calc.s0_output_0_4 * w1_4_2 + hdr.s0_output0_calc.s0_output_0_5 * w1_5_2 + b_2;
        meta.ff_0_3 = hdr.s0_output0_calc.s0_output_0_0 * w1_0_3 + hdr.s0_output0_calc.s0_output_0_1 * w1_1_3 + hdr.s0_output0_calc.s0_output_0_2 * w1_2_3 + hdr.s0_output0_calc.s0_output_0_3 * w1_3_3 + hdr.s0_output0_calc.s0_output_0_4 * w1_4_3 + hdr.s0_output0_calc.s0_output_0_5 * w1_5_3 + b_3;
        meta.ff_0_4 = hdr.s0_output0_calc.s0_output_0_0 * w1_0_4 + hdr.s0_output0_calc.s0_output_0_1 * w1_1_4 + hdr.s0_output0_calc.s0_output_0_2 * w1_2_4 + hdr.s0_output0_calc.s0_output_0_3 * w1_3_4 + hdr.s0_output0_calc.s0_output_0_4 * w1_4_4 + hdr.s0_output0_calc.s0_output_0_5 * w1_5_4 + b_4;
        meta.ff_0_5 = hdr.s0_output0_calc.s0_output_0_0 * w1_0_5 + hdr.s0_output0_calc.s0_output_0_1 * w1_1_5 + hdr.s0_output0_calc.s0_output_0_2 * w1_2_5 + hdr.s0_output0_calc.s0_output_0_3 * w1_3_5 + hdr.s0_output0_calc.s0_output_0_4 * w1_4_5 + hdr.s0_output0_calc.s0_output_0_5 * w1_5_5 + b_5;
        meta.ff_0_6 = hdr.s0_output0_calc.s0_output_0_0 * w1_0_6 + hdr.s0_output0_calc.s0_output_0_1 * w1_1_6 + hdr.s0_output0_calc.s0_output_0_2 * w1_2_6 + hdr.s0_output0_calc.s0_output_0_3 * w1_3_6 + hdr.s0_output0_calc.s0_output_0_4 * w1_4_6 + hdr.s0_output0_calc.s0_output_0_5 * w1_5_6 + b_6;
        meta.ff_0_7 = hdr.s0_output0_calc.s0_output_0_0 * w1_0_7 + hdr.s0_output0_calc.s0_output_0_1 * w1_1_7 + hdr.s0_output0_calc.s0_output_0_2 * w1_2_7 + hdr.s0_output0_calc.s0_output_0_3 * w1_3_7 + hdr.s0_output0_calc.s0_output_0_4 * w1_4_7 + hdr.s0_output0_calc.s0_output_0_5 * w1_5_7 + b_7;
        meta.ff_0_8 = hdr.s0_output0_calc.s0_output_0_0 * w1_0_8 + hdr.s0_output0_calc.s0_output_0_1 * w1_1_8 + hdr.s0_output0_calc.s0_output_0_2 * w1_2_8 + hdr.s0_output0_calc.s0_output_0_3 * w1_3_8 + hdr.s0_output0_calc.s0_output_0_4 * w1_4_8 + hdr.s0_output0_calc.s0_output_0_5 * w1_5_8 + b_8;
        meta.ff_0_9 = hdr.s0_output0_calc.s0_output_0_0 * w1_0_9 + hdr.s0_output0_calc.s0_output_0_1 * w1_1_9 + hdr.s0_output0_calc.s0_output_0_2 * w1_2_9 + hdr.s0_output0_calc.s0_output_0_3 * w1_3_9 + hdr.s0_output0_calc.s0_output_0_4 * w1_4_9 + hdr.s0_output0_calc.s0_output_0_5 * w1_5_9 + b_9;
        meta.ff_0_10 = hdr.s0_output0_calc.s0_output_0_0 * w1_0_10 + hdr.s0_output0_calc.s0_output_0_1 * w1_1_10 + hdr.s0_output0_calc.s0_output_0_2 * w1_2_10 + hdr.s0_output0_calc.s0_output_0_3 * w1_3_10 + hdr.s0_output0_calc.s0_output_0_4 * w1_4_10 + hdr.s0_output0_calc.s0_output_0_5 * w1_5_10 + b_10;
        meta.ff_0_11 = hdr.s0_output0_calc.s0_output_0_0 * w1_0_11 + hdr.s0_output0_calc.s0_output_0_1 * w1_1_11 + hdr.s0_output0_calc.s0_output_0_2 * w1_2_11 + hdr.s0_output0_calc.s0_output_0_3 * w1_3_11 + hdr.s0_output0_calc.s0_output_0_4 * w1_4_11 + hdr.s0_output0_calc.s0_output_0_5 * w1_5_11 + b_11;
        meta.ff_1_0 = hdr.s0_output0_calc.s0_output_1_0 * w1_0_0 + hdr.s0_output0_calc.s0_output_1_1 * w1_1_0 + hdr.s0_output0_calc.s0_output_1_2 * w1_2_0 + hdr.s0_output0_calc.s0_output_1_3 * w1_3_0 + hdr.s0_output0_calc.s0_output_1_4 * w1_4_0 + hdr.s0_output0_calc.s0_output_1_5 * w1_5_0 + b_0;
        meta.ff_1_1 = hdr.s0_output0_calc.s0_output_1_0 * w1_0_1 + hdr.s0_output0_calc.s0_output_1_1 * w1_1_1 + hdr.s0_output0_calc.s0_output_1_2 * w1_2_1 + hdr.s0_output0_calc.s0_output_1_3 * w1_3_1 + hdr.s0_output0_calc.s0_output_1_4 * w1_4_1 + hdr.s0_output0_calc.s0_output_1_5 * w1_5_1 + b_1;
        meta.ff_1_2 = hdr.s0_output0_calc.s0_output_1_0 * w1_0_2 + hdr.s0_output0_calc.s0_output_1_1 * w1_1_2 + hdr.s0_output0_calc.s0_output_1_2 * w1_2_2 + hdr.s0_output0_calc.s0_output_1_3 * w1_3_2 + hdr.s0_output0_calc.s0_output_1_4 * w1_4_2 + hdr.s0_output0_calc.s0_output_1_5 * w1_5_2 + b_2;
        meta.ff_1_3 = hdr.s0_output0_calc.s0_output_1_0 * w1_0_3 + hdr.s0_output0_calc.s0_output_1_1 * w1_1_3 + hdr.s0_output0_calc.s0_output_1_2 * w1_2_3 + hdr.s0_output0_calc.s0_output_1_3 * w1_3_3 + hdr.s0_output0_calc.s0_output_1_4 * w1_4_3 + hdr.s0_output0_calc.s0_output_1_5 * w1_5_3 + b_3;
        meta.ff_1_4 = hdr.s0_output0_calc.s0_output_1_0 * w1_0_4 + hdr.s0_output0_calc.s0_output_1_1 * w1_1_4 + hdr.s0_output0_calc.s0_output_1_2 * w1_2_4 + hdr.s0_output0_calc.s0_output_1_3 * w1_3_4 + hdr.s0_output0_calc.s0_output_1_4 * w1_4_4 + hdr.s0_output0_calc.s0_output_1_5 * w1_5_4 + b_4;
        meta.ff_1_5 = hdr.s0_output0_calc.s0_output_1_0 * w1_0_5 + hdr.s0_output0_calc.s0_output_1_1 * w1_1_5 + hdr.s0_output0_calc.s0_output_1_2 * w1_2_5 + hdr.s0_output0_calc.s0_output_1_3 * w1_3_5 + hdr.s0_output0_calc.s0_output_1_4 * w1_4_5 + hdr.s0_output0_calc.s0_output_1_5 * w1_5_5 + b_5;
        meta.ff_1_6 = hdr.s0_output0_calc.s0_output_1_0 * w1_0_6 + hdr.s0_output0_calc.s0_output_1_1 * w1_1_6 + hdr.s0_output0_calc.s0_output_1_2 * w1_2_6 + hdr.s0_output0_calc.s0_output_1_3 * w1_3_6 + hdr.s0_output0_calc.s0_output_1_4 * w1_4_6 + hdr.s0_output0_calc.s0_output_1_5 * w1_5_6 + b_6;
        meta.ff_1_7 = hdr.s0_output0_calc.s0_output_1_0 * w1_0_7 + hdr.s0_output0_calc.s0_output_1_1 * w1_1_7 + hdr.s0_output0_calc.s0_output_1_2 * w1_2_7 + hdr.s0_output0_calc.s0_output_1_3 * w1_3_7 + hdr.s0_output0_calc.s0_output_1_4 * w1_4_7 + hdr.s0_output0_calc.s0_output_1_5 * w1_5_7 + b_7;
        meta.ff_1_8 = hdr.s0_output0_calc.s0_output_1_0 * w1_0_8 + hdr.s0_output0_calc.s0_output_1_1 * w1_1_8 + hdr.s0_output0_calc.s0_output_1_2 * w1_2_8 + hdr.s0_output0_calc.s0_output_1_3 * w1_3_8 + hdr.s0_output0_calc.s0_output_1_4 * w1_4_8 + hdr.s0_output0_calc.s0_output_1_5 * w1_5_8 + b_8;
        meta.ff_1_9 = hdr.s0_output0_calc.s0_output_1_0 * w1_0_9 + hdr.s0_output0_calc.s0_output_1_1 * w1_1_9 + hdr.s0_output0_calc.s0_output_1_2 * w1_2_9 + hdr.s0_output0_calc.s0_output_1_3 * w1_3_9 + hdr.s0_output0_calc.s0_output_1_4 * w1_4_9 + hdr.s0_output0_calc.s0_output_1_5 * w1_5_9 + b_9;
        meta.ff_1_10 = hdr.s0_output0_calc.s0_output_1_0 * w1_0_10 + hdr.s0_output0_calc.s0_output_1_1 * w1_1_10 + hdr.s0_output0_calc.s0_output_1_2 * w1_2_10 + hdr.s0_output0_calc.s0_output_1_3 * w1_3_10 + hdr.s0_output0_calc.s0_output_1_4 * w1_4_10 + hdr.s0_output0_calc.s0_output_1_5 * w1_5_10 + b_10;
        meta.ff_1_11 = hdr.s0_output0_calc.s0_output_1_0 * w1_0_11 + hdr.s0_output0_calc.s0_output_1_1 * w1_1_11 + hdr.s0_output0_calc.s0_output_1_2 * w1_2_11 + hdr.s0_output0_calc.s0_output_1_3 * w1_3_11 + hdr.s0_output0_calc.s0_output_1_4 * w1_4_11 + hdr.s0_output0_calc.s0_output_1_5 * w1_5_11 + b_11;
        meta.ff_2_0 = hdr.s0_output0_calc.s0_output_2_0 * w1_0_0 + hdr.s0_output0_calc.s0_output_2_1 * w1_1_0 + hdr.s0_output0_calc.s0_output_2_2 * w1_2_0 + hdr.s0_output0_calc.s0_output_2_3 * w1_3_0 + hdr.s0_output0_calc.s0_output_2_4 * w1_4_0 + hdr.s0_output0_calc.s0_output_2_5 * w1_5_0 + b_0;
        meta.ff_2_1 = hdr.s0_output0_calc.s0_output_2_0 * w1_0_1 + hdr.s0_output0_calc.s0_output_2_1 * w1_1_1 + hdr.s0_output0_calc.s0_output_2_2 * w1_2_1 + hdr.s0_output0_calc.s0_output_2_3 * w1_3_1 + hdr.s0_output0_calc.s0_output_2_4 * w1_4_1 + hdr.s0_output0_calc.s0_output_2_5 * w1_5_1 + b_1;
        meta.ff_2_2 = hdr.s0_output0_calc.s0_output_2_0 * w1_0_2 + hdr.s0_output0_calc.s0_output_2_1 * w1_1_2 + hdr.s0_output0_calc.s0_output_2_2 * w1_2_2 + hdr.s0_output0_calc.s0_output_2_3 * w1_3_2 + hdr.s0_output0_calc.s0_output_2_4 * w1_4_2 + hdr.s0_output0_calc.s0_output_2_5 * w1_5_2 + b_2;
        meta.ff_2_3 = hdr.s0_output0_calc.s0_output_2_0 * w1_0_3 + hdr.s0_output0_calc.s0_output_2_1 * w1_1_3 + hdr.s0_output0_calc.s0_output_2_2 * w1_2_3 + hdr.s0_output0_calc.s0_output_2_3 * w1_3_3 + hdr.s0_output0_calc.s0_output_2_4 * w1_4_3 + hdr.s0_output0_calc.s0_output_2_5 * w1_5_3 + b_3;
        meta.ff_2_4 = hdr.s0_output0_calc.s0_output_2_0 * w1_0_4 + hdr.s0_output0_calc.s0_output_2_1 * w1_1_4 + hdr.s0_output0_calc.s0_output_2_2 * w1_2_4 + hdr.s0_output0_calc.s0_output_2_3 * w1_3_4 + hdr.s0_output0_calc.s0_output_2_4 * w1_4_4 + hdr.s0_output0_calc.s0_output_2_5 * w1_5_4 + b_4;
        meta.ff_2_5 = hdr.s0_output0_calc.s0_output_2_0 * w1_0_5 + hdr.s0_output0_calc.s0_output_2_1 * w1_1_5 + hdr.s0_output0_calc.s0_output_2_2 * w1_2_5 + hdr.s0_output0_calc.s0_output_2_3 * w1_3_5 + hdr.s0_output0_calc.s0_output_2_4 * w1_4_5 + hdr.s0_output0_calc.s0_output_2_5 * w1_5_5 + b_5;
        meta.ff_2_6 = hdr.s0_output0_calc.s0_output_2_0 * w1_0_6 + hdr.s0_output0_calc.s0_output_2_1 * w1_1_6 + hdr.s0_output0_calc.s0_output_2_2 * w1_2_6 + hdr.s0_output0_calc.s0_output_2_3 * w1_3_6 + hdr.s0_output0_calc.s0_output_2_4 * w1_4_6 + hdr.s0_output0_calc.s0_output_2_5 * w1_5_6 + b_6;
        meta.ff_2_7 = hdr.s0_output0_calc.s0_output_2_0 * w1_0_7 + hdr.s0_output0_calc.s0_output_2_1 * w1_1_7 + hdr.s0_output0_calc.s0_output_2_2 * w1_2_7 + hdr.s0_output0_calc.s0_output_2_3 * w1_3_7 + hdr.s0_output0_calc.s0_output_2_4 * w1_4_7 + hdr.s0_output0_calc.s0_output_2_5 * w1_5_7 + b_7;
        meta.ff_2_8 = hdr.s0_output0_calc.s0_output_2_0 * w1_0_8 + hdr.s0_output0_calc.s0_output_2_1 * w1_1_8 + hdr.s0_output0_calc.s0_output_2_2 * w1_2_8 + hdr.s0_output0_calc.s0_output_2_3 * w1_3_8 + hdr.s0_output0_calc.s0_output_2_4 * w1_4_8 + hdr.s0_output0_calc.s0_output_2_5 * w1_5_8 + b_8;
        meta.ff_2_9 = hdr.s0_output0_calc.s0_output_2_0 * w1_0_9 + hdr.s0_output0_calc.s0_output_2_1 * w1_1_9 + hdr.s0_output0_calc.s0_output_2_2 * w1_2_9 + hdr.s0_output0_calc.s0_output_2_3 * w1_3_9 + hdr.s0_output0_calc.s0_output_2_4 * w1_4_9 + hdr.s0_output0_calc.s0_output_2_5 * w1_5_9 + b_9;
        meta.ff_2_10 = hdr.s0_output0_calc.s0_output_2_0 * w1_0_10 + hdr.s0_output0_calc.s0_output_2_1 * w1_1_10 + hdr.s0_output0_calc.s0_output_2_2 * w1_2_10 + hdr.s0_output0_calc.s0_output_2_3 * w1_3_10 + hdr.s0_output0_calc.s0_output_2_4 * w1_4_10 + hdr.s0_output0_calc.s0_output_2_5 * w1_5_10 + b_10;
        meta.ff_2_11 = hdr.s0_output0_calc.s0_output_2_0 * w1_0_11 + hdr.s0_output0_calc.s0_output_2_1 * w1_1_11 + hdr.s0_output0_calc.s0_output_2_2 * w1_2_11 + hdr.s0_output0_calc.s0_output_2_3 * w1_3_11 + hdr.s0_output0_calc.s0_output_2_4 * w1_4_11 + hdr.s0_output0_calc.s0_output_2_5 * w1_5_11 + b_11;
        meta.ff_3_0 = hdr.s0_output0_calc.s0_output_3_0 * w1_0_0 + hdr.s0_output0_calc.s0_output_3_1 * w1_1_0 + hdr.s0_output0_calc.s0_output_3_2 * w1_2_0 + hdr.s0_output0_calc.s0_output_3_3 * w1_3_0 + hdr.s0_output0_calc.s0_output_3_4 * w1_4_0 + hdr.s0_output0_calc.s0_output_3_5 * w1_5_0 + b_0;
        meta.ff_3_1 = hdr.s0_output0_calc.s0_output_3_0 * w1_0_1 + hdr.s0_output0_calc.s0_output_3_1 * w1_1_1 + hdr.s0_output0_calc.s0_output_3_2 * w1_2_1 + hdr.s0_output0_calc.s0_output_3_3 * w1_3_1 + hdr.s0_output0_calc.s0_output_3_4 * w1_4_1 + hdr.s0_output0_calc.s0_output_3_5 * w1_5_1 + b_1;
        meta.ff_3_2 = hdr.s0_output0_calc.s0_output_3_0 * w1_0_2 + hdr.s0_output0_calc.s0_output_3_1 * w1_1_2 + hdr.s0_output0_calc.s0_output_3_2 * w1_2_2 + hdr.s0_output0_calc.s0_output_3_3 * w1_3_2 + hdr.s0_output0_calc.s0_output_3_4 * w1_4_2 + hdr.s0_output0_calc.s0_output_3_5 * w1_5_2 + b_2;
        meta.ff_3_3 = hdr.s0_output0_calc.s0_output_3_0 * w1_0_3 + hdr.s0_output0_calc.s0_output_3_1 * w1_1_3 + hdr.s0_output0_calc.s0_output_3_2 * w1_2_3 + hdr.s0_output0_calc.s0_output_3_3 * w1_3_3 + hdr.s0_output0_calc.s0_output_3_4 * w1_4_3 + hdr.s0_output0_calc.s0_output_3_5 * w1_5_3 + b_3;
        meta.ff_3_4 = hdr.s0_output0_calc.s0_output_3_0 * w1_0_4 + hdr.s0_output0_calc.s0_output_3_1 * w1_1_4 + hdr.s0_output0_calc.s0_output_3_2 * w1_2_4 + hdr.s0_output0_calc.s0_output_3_3 * w1_3_4 + hdr.s0_output0_calc.s0_output_3_4 * w1_4_4 + hdr.s0_output0_calc.s0_output_3_5 * w1_5_4 + b_4;
        meta.ff_3_5 = hdr.s0_output0_calc.s0_output_3_0 * w1_0_5 + hdr.s0_output0_calc.s0_output_3_1 * w1_1_5 + hdr.s0_output0_calc.s0_output_3_2 * w1_2_5 + hdr.s0_output0_calc.s0_output_3_3 * w1_3_5 + hdr.s0_output0_calc.s0_output_3_4 * w1_4_5 + hdr.s0_output0_calc.s0_output_3_5 * w1_5_5 + b_5;
        meta.ff_3_6 = hdr.s0_output0_calc.s0_output_3_0 * w1_0_6 + hdr.s0_output0_calc.s0_output_3_1 * w1_1_6 + hdr.s0_output0_calc.s0_output_3_2 * w1_2_6 + hdr.s0_output0_calc.s0_output_3_3 * w1_3_6 + hdr.s0_output0_calc.s0_output_3_4 * w1_4_6 + hdr.s0_output0_calc.s0_output_3_5 * w1_5_6 + b_6;
        meta.ff_3_7 = hdr.s0_output0_calc.s0_output_3_0 * w1_0_7 + hdr.s0_output0_calc.s0_output_3_1 * w1_1_7 + hdr.s0_output0_calc.s0_output_3_2 * w1_2_7 + hdr.s0_output0_calc.s0_output_3_3 * w1_3_7 + hdr.s0_output0_calc.s0_output_3_4 * w1_4_7 + hdr.s0_output0_calc.s0_output_3_5 * w1_5_7 + b_7;
        meta.ff_3_8 = hdr.s0_output0_calc.s0_output_3_0 * w1_0_8 + hdr.s0_output0_calc.s0_output_3_1 * w1_1_8 + hdr.s0_output0_calc.s0_output_3_2 * w1_2_8 + hdr.s0_output0_calc.s0_output_3_3 * w1_3_8 + hdr.s0_output0_calc.s0_output_3_4 * w1_4_8 + hdr.s0_output0_calc.s0_output_3_5 * w1_5_8 + b_8;
        meta.ff_3_9 = hdr.s0_output0_calc.s0_output_3_0 * w1_0_9 + hdr.s0_output0_calc.s0_output_3_1 * w1_1_9 + hdr.s0_output0_calc.s0_output_3_2 * w1_2_9 + hdr.s0_output0_calc.s0_output_3_3 * w1_3_9 + hdr.s0_output0_calc.s0_output_3_4 * w1_4_9 + hdr.s0_output0_calc.s0_output_3_5 * w1_5_9 + b_9;
        meta.ff_3_10 = hdr.s0_output0_calc.s0_output_3_0 * w1_0_10 + hdr.s0_output0_calc.s0_output_3_1 * w1_1_10 + hdr.s0_output0_calc.s0_output_3_2 * w1_2_10 + hdr.s0_output0_calc.s0_output_3_3 * w1_3_10 + hdr.s0_output0_calc.s0_output_3_4 * w1_4_10 + hdr.s0_output0_calc.s0_output_3_5 * w1_5_10 + b_10;
        meta.ff_3_11 = hdr.s0_output0_calc.s0_output_3_0 * w1_0_11 + hdr.s0_output0_calc.s0_output_3_1 * w1_1_11 + hdr.s0_output0_calc.s0_output_3_2 * w1_2_11 + hdr.s0_output0_calc.s0_output_3_3 * w1_3_11 + hdr.s0_output0_calc.s0_output_3_4 * w1_4_11 + hdr.s0_output0_calc.s0_output_3_5 * w1_5_11 + b_11;
        meta.ff_4_0 = hdr.s0_output0_calc.s0_output_4_0 * w1_0_0 + hdr.s0_output0_calc.s0_output_4_1 * w1_1_0 + hdr.s0_output0_calc.s0_output_4_2 * w1_2_0 + hdr.s0_output0_calc.s0_output_4_3 * w1_3_0 + hdr.s0_output0_calc.s0_output_4_4 * w1_4_0 + hdr.s0_output0_calc.s0_output_4_5 * w1_5_0 + b_0;
        meta.ff_4_1 = hdr.s0_output0_calc.s0_output_4_0 * w1_0_1 + hdr.s0_output0_calc.s0_output_4_1 * w1_1_1 + hdr.s0_output0_calc.s0_output_4_2 * w1_2_1 + hdr.s0_output0_calc.s0_output_4_3 * w1_3_1 + hdr.s0_output0_calc.s0_output_4_4 * w1_4_1 + hdr.s0_output0_calc.s0_output_4_5 * w1_5_1 + b_1;
        meta.ff_4_2 = hdr.s0_output0_calc.s0_output_4_0 * w1_0_2 + hdr.s0_output0_calc.s0_output_4_1 * w1_1_2 + hdr.s0_output0_calc.s0_output_4_2 * w1_2_2 + hdr.s0_output0_calc.s0_output_4_3 * w1_3_2 + hdr.s0_output0_calc.s0_output_4_4 * w1_4_2 + hdr.s0_output0_calc.s0_output_4_5 * w1_5_2 + b_2;
        meta.ff_4_3 = hdr.s0_output0_calc.s0_output_4_0 * w1_0_3 + hdr.s0_output0_calc.s0_output_4_1 * w1_1_3 + hdr.s0_output0_calc.s0_output_4_2 * w1_2_3 + hdr.s0_output0_calc.s0_output_4_3 * w1_3_3 + hdr.s0_output0_calc.s0_output_4_4 * w1_4_3 + hdr.s0_output0_calc.s0_output_4_5 * w1_5_3 + b_3;
        meta.ff_4_4 = hdr.s0_output0_calc.s0_output_4_0 * w1_0_4 + hdr.s0_output0_calc.s0_output_4_1 * w1_1_4 + hdr.s0_output0_calc.s0_output_4_2 * w1_2_4 + hdr.s0_output0_calc.s0_output_4_3 * w1_3_4 + hdr.s0_output0_calc.s0_output_4_4 * w1_4_4 + hdr.s0_output0_calc.s0_output_4_5 * w1_5_4 + b_4;
        meta.ff_4_5 = hdr.s0_output0_calc.s0_output_4_0 * w1_0_5 + hdr.s0_output0_calc.s0_output_4_1 * w1_1_5 + hdr.s0_output0_calc.s0_output_4_2 * w1_2_5 + hdr.s0_output0_calc.s0_output_4_3 * w1_3_5 + hdr.s0_output0_calc.s0_output_4_4 * w1_4_5 + hdr.s0_output0_calc.s0_output_4_5 * w1_5_5 + b_5;
        meta.ff_4_6 = hdr.s0_output0_calc.s0_output_4_0 * w1_0_6 + hdr.s0_output0_calc.s0_output_4_1 * w1_1_6 + hdr.s0_output0_calc.s0_output_4_2 * w1_2_6 + hdr.s0_output0_calc.s0_output_4_3 * w1_3_6 + hdr.s0_output0_calc.s0_output_4_4 * w1_4_6 + hdr.s0_output0_calc.s0_output_4_5 * w1_5_6 + b_6;
        meta.ff_4_7 = hdr.s0_output0_calc.s0_output_4_0 * w1_0_7 + hdr.s0_output0_calc.s0_output_4_1 * w1_1_7 + hdr.s0_output0_calc.s0_output_4_2 * w1_2_7 + hdr.s0_output0_calc.s0_output_4_3 * w1_3_7 + hdr.s0_output0_calc.s0_output_4_4 * w1_4_7 + hdr.s0_output0_calc.s0_output_4_5 * w1_5_7 + b_7;
        meta.ff_4_8 = hdr.s0_output0_calc.s0_output_4_0 * w1_0_8 + hdr.s0_output0_calc.s0_output_4_1 * w1_1_8 + hdr.s0_output0_calc.s0_output_4_2 * w1_2_8 + hdr.s0_output0_calc.s0_output_4_3 * w1_3_8 + hdr.s0_output0_calc.s0_output_4_4 * w1_4_8 + hdr.s0_output0_calc.s0_output_4_5 * w1_5_8 + b_8;
        meta.ff_4_9 = hdr.s0_output0_calc.s0_output_4_0 * w1_0_9 + hdr.s0_output0_calc.s0_output_4_1 * w1_1_9 + hdr.s0_output0_calc.s0_output_4_2 * w1_2_9 + hdr.s0_output0_calc.s0_output_4_3 * w1_3_9 + hdr.s0_output0_calc.s0_output_4_4 * w1_4_9 + hdr.s0_output0_calc.s0_output_4_5 * w1_5_9 + b_9;
        meta.ff_4_10 = hdr.s0_output0_calc.s0_output_4_0 * w1_0_10 + hdr.s0_output0_calc.s0_output_4_1 * w1_1_10 + hdr.s0_output0_calc.s0_output_4_2 * w1_2_10 + hdr.s0_output0_calc.s0_output_4_3 * w1_3_10 + hdr.s0_output0_calc.s0_output_4_4 * w1_4_10 + hdr.s0_output0_calc.s0_output_4_5 * w1_5_10 + b_10;
        meta.ff_4_11 = hdr.s0_output0_calc.s0_output_4_0 * w1_0_11 + hdr.s0_output0_calc.s0_output_4_1 * w1_1_11 + hdr.s0_output0_calc.s0_output_4_2 * w1_2_11 + hdr.s0_output0_calc.s0_output_4_3 * w1_3_11 + hdr.s0_output0_calc.s0_output_4_4 * w1_4_11 + hdr.s0_output0_calc.s0_output_4_5 * w1_5_11 + b_11;
        meta.ff_5_0 = hdr.s0_output0_calc.s0_output_5_0 * w1_0_0 + hdr.s0_output0_calc.s0_output_5_1 * w1_1_0 + hdr.s0_output0_calc.s0_output_5_2 * w1_2_0 + hdr.s0_output0_calc.s0_output_5_3 * w1_3_0 + hdr.s0_output0_calc.s0_output_5_4 * w1_4_0 + hdr.s0_output0_calc.s0_output_5_5 * w1_5_0 + b_0;
        meta.ff_5_1 = hdr.s0_output0_calc.s0_output_5_0 * w1_0_1 + hdr.s0_output0_calc.s0_output_5_1 * w1_1_1 + hdr.s0_output0_calc.s0_output_5_2 * w1_2_1 + hdr.s0_output0_calc.s0_output_5_3 * w1_3_1 + hdr.s0_output0_calc.s0_output_5_4 * w1_4_1 + hdr.s0_output0_calc.s0_output_5_5 * w1_5_1 + b_1;
        meta.ff_5_2 = hdr.s0_output0_calc.s0_output_5_0 * w1_0_2 + hdr.s0_output0_calc.s0_output_5_1 * w1_1_2 + hdr.s0_output0_calc.s0_output_5_2 * w1_2_2 + hdr.s0_output0_calc.s0_output_5_3 * w1_3_2 + hdr.s0_output0_calc.s0_output_5_4 * w1_4_2 + hdr.s0_output0_calc.s0_output_5_5 * w1_5_2 + b_2;
        meta.ff_5_3 = hdr.s0_output0_calc.s0_output_5_0 * w1_0_3 + hdr.s0_output0_calc.s0_output_5_1 * w1_1_3 + hdr.s0_output0_calc.s0_output_5_2 * w1_2_3 + hdr.s0_output0_calc.s0_output_5_3 * w1_3_3 + hdr.s0_output0_calc.s0_output_5_4 * w1_4_3 + hdr.s0_output0_calc.s0_output_5_5 * w1_5_3 + b_3;
        meta.ff_5_4 = hdr.s0_output0_calc.s0_output_5_0 * w1_0_4 + hdr.s0_output0_calc.s0_output_5_1 * w1_1_4 + hdr.s0_output0_calc.s0_output_5_2 * w1_2_4 + hdr.s0_output0_calc.s0_output_5_3 * w1_3_4 + hdr.s0_output0_calc.s0_output_5_4 * w1_4_4 + hdr.s0_output0_calc.s0_output_5_5 * w1_5_4 + b_4;
        meta.ff_5_5 = hdr.s0_output0_calc.s0_output_5_0 * w1_0_5 + hdr.s0_output0_calc.s0_output_5_1 * w1_1_5 + hdr.s0_output0_calc.s0_output_5_2 * w1_2_5 + hdr.s0_output0_calc.s0_output_5_3 * w1_3_5 + hdr.s0_output0_calc.s0_output_5_4 * w1_4_5 + hdr.s0_output0_calc.s0_output_5_5 * w1_5_5 + b_5;
        meta.ff_5_6 = hdr.s0_output0_calc.s0_output_5_0 * w1_0_6 + hdr.s0_output0_calc.s0_output_5_1 * w1_1_6 + hdr.s0_output0_calc.s0_output_5_2 * w1_2_6 + hdr.s0_output0_calc.s0_output_5_3 * w1_3_6 + hdr.s0_output0_calc.s0_output_5_4 * w1_4_6 + hdr.s0_output0_calc.s0_output_5_5 * w1_5_6 + b_6;
        meta.ff_5_7 = hdr.s0_output0_calc.s0_output_5_0 * w1_0_7 + hdr.s0_output0_calc.s0_output_5_1 * w1_1_7 + hdr.s0_output0_calc.s0_output_5_2 * w1_2_7 + hdr.s0_output0_calc.s0_output_5_3 * w1_3_7 + hdr.s0_output0_calc.s0_output_5_4 * w1_4_7 + hdr.s0_output0_calc.s0_output_5_5 * w1_5_7 + b_7;
        meta.ff_5_8 = hdr.s0_output0_calc.s0_output_5_0 * w1_0_8 + hdr.s0_output0_calc.s0_output_5_1 * w1_1_8 + hdr.s0_output0_calc.s0_output_5_2 * w1_2_8 + hdr.s0_output0_calc.s0_output_5_3 * w1_3_8 + hdr.s0_output0_calc.s0_output_5_4 * w1_4_8 + hdr.s0_output0_calc.s0_output_5_5 * w1_5_8 + b_8;
        meta.ff_5_9 = hdr.s0_output0_calc.s0_output_5_0 * w1_0_9 + hdr.s0_output0_calc.s0_output_5_1 * w1_1_9 + hdr.s0_output0_calc.s0_output_5_2 * w1_2_9 + hdr.s0_output0_calc.s0_output_5_3 * w1_3_9 + hdr.s0_output0_calc.s0_output_5_4 * w1_4_9 + hdr.s0_output0_calc.s0_output_5_5 * w1_5_9 + b_9;
        meta.ff_5_10 = hdr.s0_output0_calc.s0_output_5_0 * w1_0_10 + hdr.s0_output0_calc.s0_output_5_1 * w1_1_10 + hdr.s0_output0_calc.s0_output_5_2 * w1_2_10 + hdr.s0_output0_calc.s0_output_5_3 * w1_3_10 + hdr.s0_output0_calc.s0_output_5_4 * w1_4_10 + hdr.s0_output0_calc.s0_output_5_5 * w1_5_10 + b_10;
        meta.ff_5_11 = hdr.s0_output0_calc.s0_output_5_0 * w1_0_11 + hdr.s0_output0_calc.s0_output_5_1 * w1_1_11 + hdr.s0_output0_calc.s0_output_5_2 * w1_2_11 + hdr.s0_output0_calc.s0_output_5_3 * w1_3_11 + hdr.s0_output0_calc.s0_output_5_4 * w1_4_11 + hdr.s0_output0_calc.s0_output_5_5 * w1_5_11 + b_11;
        meta.ff_6_0 = hdr.s0_output0_calc.s0_output_6_0 * w1_0_0 + hdr.s0_output0_calc.s0_output_6_1 * w1_1_0 + hdr.s0_output0_calc.s0_output_6_2 * w1_2_0 + hdr.s0_output0_calc.s0_output_6_3 * w1_3_0 + hdr.s0_output0_calc.s0_output_6_4 * w1_4_0 + hdr.s0_output0_calc.s0_output_6_5 * w1_5_0 + b_0;
        meta.ff_6_1 = hdr.s0_output0_calc.s0_output_6_0 * w1_0_1 + hdr.s0_output0_calc.s0_output_6_1 * w1_1_1 + hdr.s0_output0_calc.s0_output_6_2 * w1_2_1 + hdr.s0_output0_calc.s0_output_6_3 * w1_3_1 + hdr.s0_output0_calc.s0_output_6_4 * w1_4_1 + hdr.s0_output0_calc.s0_output_6_5 * w1_5_1 + b_1;
        meta.ff_6_2 = hdr.s0_output0_calc.s0_output_6_0 * w1_0_2 + hdr.s0_output0_calc.s0_output_6_1 * w1_1_2 + hdr.s0_output0_calc.s0_output_6_2 * w1_2_2 + hdr.s0_output0_calc.s0_output_6_3 * w1_3_2 + hdr.s0_output0_calc.s0_output_6_4 * w1_4_2 + hdr.s0_output0_calc.s0_output_6_5 * w1_5_2 + b_2;
        meta.ff_6_3 = hdr.s0_output0_calc.s0_output_6_0 * w1_0_3 + hdr.s0_output0_calc.s0_output_6_1 * w1_1_3 + hdr.s0_output0_calc.s0_output_6_2 * w1_2_3 + hdr.s0_output0_calc.s0_output_6_3 * w1_3_3 + hdr.s0_output0_calc.s0_output_6_4 * w1_4_3 + hdr.s0_output0_calc.s0_output_6_5 * w1_5_3 + b_3;
        meta.ff_6_4 = hdr.s0_output0_calc.s0_output_6_0 * w1_0_4 + hdr.s0_output0_calc.s0_output_6_1 * w1_1_4 + hdr.s0_output0_calc.s0_output_6_2 * w1_2_4 + hdr.s0_output0_calc.s0_output_6_3 * w1_3_4 + hdr.s0_output0_calc.s0_output_6_4 * w1_4_4 + hdr.s0_output0_calc.s0_output_6_5 * w1_5_4 + b_4;
        meta.ff_6_5 = hdr.s0_output0_calc.s0_output_6_0 * w1_0_5 + hdr.s0_output0_calc.s0_output_6_1 * w1_1_5 + hdr.s0_output0_calc.s0_output_6_2 * w1_2_5 + hdr.s0_output0_calc.s0_output_6_3 * w1_3_5 + hdr.s0_output0_calc.s0_output_6_4 * w1_4_5 + hdr.s0_output0_calc.s0_output_6_5 * w1_5_5 + b_5;
        meta.ff_6_6 = hdr.s0_output0_calc.s0_output_6_0 * w1_0_6 + hdr.s0_output0_calc.s0_output_6_1 * w1_1_6 + hdr.s0_output0_calc.s0_output_6_2 * w1_2_6 + hdr.s0_output0_calc.s0_output_6_3 * w1_3_6 + hdr.s0_output0_calc.s0_output_6_4 * w1_4_6 + hdr.s0_output0_calc.s0_output_6_5 * w1_5_6 + b_6;
        meta.ff_6_7 = hdr.s0_output0_calc.s0_output_6_0 * w1_0_7 + hdr.s0_output0_calc.s0_output_6_1 * w1_1_7 + hdr.s0_output0_calc.s0_output_6_2 * w1_2_7 + hdr.s0_output0_calc.s0_output_6_3 * w1_3_7 + hdr.s0_output0_calc.s0_output_6_4 * w1_4_7 + hdr.s0_output0_calc.s0_output_6_5 * w1_5_7 + b_7;
        meta.ff_6_8 = hdr.s0_output0_calc.s0_output_6_0 * w1_0_8 + hdr.s0_output0_calc.s0_output_6_1 * w1_1_8 + hdr.s0_output0_calc.s0_output_6_2 * w1_2_8 + hdr.s0_output0_calc.s0_output_6_3 * w1_3_8 + hdr.s0_output0_calc.s0_output_6_4 * w1_4_8 + hdr.s0_output0_calc.s0_output_6_5 * w1_5_8 + b_8;
        meta.ff_6_9 = hdr.s0_output0_calc.s0_output_6_0 * w1_0_9 + hdr.s0_output0_calc.s0_output_6_1 * w1_1_9 + hdr.s0_output0_calc.s0_output_6_2 * w1_2_9 + hdr.s0_output0_calc.s0_output_6_3 * w1_3_9 + hdr.s0_output0_calc.s0_output_6_4 * w1_4_9 + hdr.s0_output0_calc.s0_output_6_5 * w1_5_9 + b_9;
        meta.ff_6_10 = hdr.s0_output0_calc.s0_output_6_0 * w1_0_10 + hdr.s0_output0_calc.s0_output_6_1 * w1_1_10 + hdr.s0_output0_calc.s0_output_6_2 * w1_2_10 + hdr.s0_output0_calc.s0_output_6_3 * w1_3_10 + hdr.s0_output0_calc.s0_output_6_4 * w1_4_10 + hdr.s0_output0_calc.s0_output_6_5 * w1_5_10 + b_10;
        meta.ff_6_11 = hdr.s0_output0_calc.s0_output_6_0 * w1_0_11 + hdr.s0_output0_calc.s0_output_6_1 * w1_1_11 + hdr.s0_output0_calc.s0_output_6_2 * w1_2_11 + hdr.s0_output0_calc.s0_output_6_3 * w1_3_11 + hdr.s0_output0_calc.s0_output_6_4 * w1_4_11 + hdr.s0_output0_calc.s0_output_6_5 * w1_5_11 + b_11;
        meta.ff_7_0 = hdr.s0_output0_calc.s0_output_7_0 * w1_0_0 + hdr.s0_output0_calc.s0_output_7_1 * w1_1_0 + hdr.s0_output0_calc.s0_output_7_2 * w1_2_0 + hdr.s0_output0_calc.s0_output_7_3 * w1_3_0 + hdr.s0_output0_calc.s0_output_7_4 * w1_4_0 + hdr.s0_output0_calc.s0_output_7_5 * w1_5_0 + b_0;
        meta.ff_7_1 = hdr.s0_output0_calc.s0_output_7_0 * w1_0_1 + hdr.s0_output0_calc.s0_output_7_1 * w1_1_1 + hdr.s0_output0_calc.s0_output_7_2 * w1_2_1 + hdr.s0_output0_calc.s0_output_7_3 * w1_3_1 + hdr.s0_output0_calc.s0_output_7_4 * w1_4_1 + hdr.s0_output0_calc.s0_output_7_5 * w1_5_1 + b_1;
        meta.ff_7_2 = hdr.s0_output0_calc.s0_output_7_0 * w1_0_2 + hdr.s0_output0_calc.s0_output_7_1 * w1_1_2 + hdr.s0_output0_calc.s0_output_7_2 * w1_2_2 + hdr.s0_output0_calc.s0_output_7_3 * w1_3_2 + hdr.s0_output0_calc.s0_output_7_4 * w1_4_2 + hdr.s0_output0_calc.s0_output_7_5 * w1_5_2 + b_2;
        meta.ff_7_3 = hdr.s0_output0_calc.s0_output_7_0 * w1_0_3 + hdr.s0_output0_calc.s0_output_7_1 * w1_1_3 + hdr.s0_output0_calc.s0_output_7_2 * w1_2_3 + hdr.s0_output0_calc.s0_output_7_3 * w1_3_3 + hdr.s0_output0_calc.s0_output_7_4 * w1_4_3 + hdr.s0_output0_calc.s0_output_7_5 * w1_5_3 + b_3;
        meta.ff_7_4 = hdr.s0_output0_calc.s0_output_7_0 * w1_0_4 + hdr.s0_output0_calc.s0_output_7_1 * w1_1_4 + hdr.s0_output0_calc.s0_output_7_2 * w1_2_4 + hdr.s0_output0_calc.s0_output_7_3 * w1_3_4 + hdr.s0_output0_calc.s0_output_7_4 * w1_4_4 + hdr.s0_output0_calc.s0_output_7_5 * w1_5_4 + b_4;
        meta.ff_7_5 = hdr.s0_output0_calc.s0_output_7_0 * w1_0_5 + hdr.s0_output0_calc.s0_output_7_1 * w1_1_5 + hdr.s0_output0_calc.s0_output_7_2 * w1_2_5 + hdr.s0_output0_calc.s0_output_7_3 * w1_3_5 + hdr.s0_output0_calc.s0_output_7_4 * w1_4_5 + hdr.s0_output0_calc.s0_output_7_5 * w1_5_5 + b_5;
        meta.ff_7_6 = hdr.s0_output0_calc.s0_output_7_0 * w1_0_6 + hdr.s0_output0_calc.s0_output_7_1 * w1_1_6 + hdr.s0_output0_calc.s0_output_7_2 * w1_2_6 + hdr.s0_output0_calc.s0_output_7_3 * w1_3_6 + hdr.s0_output0_calc.s0_output_7_4 * w1_4_6 + hdr.s0_output0_calc.s0_output_7_5 * w1_5_6 + b_6;
        meta.ff_7_7 = hdr.s0_output0_calc.s0_output_7_0 * w1_0_7 + hdr.s0_output0_calc.s0_output_7_1 * w1_1_7 + hdr.s0_output0_calc.s0_output_7_2 * w1_2_7 + hdr.s0_output0_calc.s0_output_7_3 * w1_3_7 + hdr.s0_output0_calc.s0_output_7_4 * w1_4_7 + hdr.s0_output0_calc.s0_output_7_5 * w1_5_7 + b_7;
        meta.ff_7_8 = hdr.s0_output0_calc.s0_output_7_0 * w1_0_8 + hdr.s0_output0_calc.s0_output_7_1 * w1_1_8 + hdr.s0_output0_calc.s0_output_7_2 * w1_2_8 + hdr.s0_output0_calc.s0_output_7_3 * w1_3_8 + hdr.s0_output0_calc.s0_output_7_4 * w1_4_8 + hdr.s0_output0_calc.s0_output_7_5 * w1_5_8 + b_8;
        meta.ff_7_9 = hdr.s0_output0_calc.s0_output_7_0 * w1_0_9 + hdr.s0_output0_calc.s0_output_7_1 * w1_1_9 + hdr.s0_output0_calc.s0_output_7_2 * w1_2_9 + hdr.s0_output0_calc.s0_output_7_3 * w1_3_9 + hdr.s0_output0_calc.s0_output_7_4 * w1_4_9 + hdr.s0_output0_calc.s0_output_7_5 * w1_5_9 + b_9;
        meta.ff_7_10 = hdr.s0_output0_calc.s0_output_7_0 * w1_0_10 + hdr.s0_output0_calc.s0_output_7_1 * w1_1_10 + hdr.s0_output0_calc.s0_output_7_2 * w1_2_10 + hdr.s0_output0_calc.s0_output_7_3 * w1_3_10 + hdr.s0_output0_calc.s0_output_7_4 * w1_4_10 + hdr.s0_output0_calc.s0_output_7_5 * w1_5_10 + b_10;
        meta.ff_7_11 = hdr.s0_output0_calc.s0_output_7_0 * w1_0_11 + hdr.s0_output0_calc.s0_output_7_1 * w1_1_11 + hdr.s0_output0_calc.s0_output_7_2 * w1_2_11 + hdr.s0_output0_calc.s0_output_7_3 * w1_3_11 + hdr.s0_output0_calc.s0_output_7_4 * w1_4_11 + hdr.s0_output0_calc.s0_output_7_5 * w1_5_11 + b_11;
  }


    action operation_relu() {
        const bit<32> zero = 0x0;
        meta.ff_0_0 = (meta.ff_0_0 > zero) ? meta.ff_0_0 : zero;
        meta.ff_0_1 = (meta.ff_0_1 > zero) ? meta.ff_0_1 : zero;
        meta.ff_0_2 = (meta.ff_0_2 > zero) ? meta.ff_0_2 : zero;
        meta.ff_0_3 = (meta.ff_0_3 > zero) ? meta.ff_0_3 : zero;
        meta.ff_0_4 = (meta.ff_0_4 > zero) ? meta.ff_0_4 : zero;
        meta.ff_0_5 = (meta.ff_0_5 > zero) ? meta.ff_0_5 : zero;
        meta.ff_0_6 = (meta.ff_0_6 > zero) ? meta.ff_0_6 : zero;
        meta.ff_0_7 = (meta.ff_0_7 > zero) ? meta.ff_0_7 : zero;
        meta.ff_0_8 = (meta.ff_0_8 > zero) ? meta.ff_0_8 : zero;
        meta.ff_0_9 = (meta.ff_0_9 > zero) ? meta.ff_0_9 : zero;
        meta.ff_0_10 = (meta.ff_0_10 > zero) ? meta.ff_0_10 : zero;
        meta.ff_0_11 = (meta.ff_0_11 > zero) ? meta.ff_0_11 : zero;
        meta.ff_1_0 = (meta.ff_1_0 > zero) ? meta.ff_1_0 : zero;
        meta.ff_1_1 = (meta.ff_1_1 > zero) ? meta.ff_1_1 : zero;
        meta.ff_1_2 = (meta.ff_1_2 > zero) ? meta.ff_1_2 : zero;
        meta.ff_1_3 = (meta.ff_1_3 > zero) ? meta.ff_1_3 : zero;
        meta.ff_1_4 = (meta.ff_1_4 > zero) ? meta.ff_1_4 : zero;
        meta.ff_1_5 = (meta.ff_1_5 > zero) ? meta.ff_1_5 : zero;
        meta.ff_1_6 = (meta.ff_1_6 > zero) ? meta.ff_1_6 : zero;
        meta.ff_1_7 = (meta.ff_1_7 > zero) ? meta.ff_1_7 : zero;
        meta.ff_1_8 = (meta.ff_1_8 > zero) ? meta.ff_1_8 : zero;
        meta.ff_1_9 = (meta.ff_1_9 > zero) ? meta.ff_1_9 : zero;
        meta.ff_1_10 = (meta.ff_1_10 > zero) ? meta.ff_1_10 : zero;
        meta.ff_1_11 = (meta.ff_1_11 > zero) ? meta.ff_1_11 : zero;
        meta.ff_2_0 = (meta.ff_2_0 > zero) ? meta.ff_2_0 : zero;
        meta.ff_2_1 = (meta.ff_2_1 > zero) ? meta.ff_2_1 : zero;
        meta.ff_2_2 = (meta.ff_2_2 > zero) ? meta.ff_2_2 : zero;
        meta.ff_2_3 = (meta.ff_2_3 > zero) ? meta.ff_2_3 : zero;
        meta.ff_2_4 = (meta.ff_2_4 > zero) ? meta.ff_2_4 : zero;
        meta.ff_2_5 = (meta.ff_2_5 > zero) ? meta.ff_2_5 : zero;
        meta.ff_2_6 = (meta.ff_2_6 > zero) ? meta.ff_2_6 : zero;
        meta.ff_2_7 = (meta.ff_2_7 > zero) ? meta.ff_2_7 : zero;
        meta.ff_2_8 = (meta.ff_2_8 > zero) ? meta.ff_2_8 : zero;
        meta.ff_2_9 = (meta.ff_2_9 > zero) ? meta.ff_2_9 : zero;
        meta.ff_2_10 = (meta.ff_2_10 > zero) ? meta.ff_2_10 : zero;
        meta.ff_2_11 = (meta.ff_2_11 > zero) ? meta.ff_2_11 : zero;
        meta.ff_3_0 = (meta.ff_3_0 > zero) ? meta.ff_3_0 : zero;
        meta.ff_3_1 = (meta.ff_3_1 > zero) ? meta.ff_3_1 : zero;
        meta.ff_3_2 = (meta.ff_3_2 > zero) ? meta.ff_3_2 : zero;
        meta.ff_3_3 = (meta.ff_3_3 > zero) ? meta.ff_3_3 : zero;
        meta.ff_3_4 = (meta.ff_3_4 > zero) ? meta.ff_3_4 : zero;
        meta.ff_3_5 = (meta.ff_3_5 > zero) ? meta.ff_3_5 : zero;
        meta.ff_3_6 = (meta.ff_3_6 > zero) ? meta.ff_3_6 : zero;
        meta.ff_3_7 = (meta.ff_3_7 > zero) ? meta.ff_3_7 : zero;
        meta.ff_3_8 = (meta.ff_3_8 > zero) ? meta.ff_3_8 : zero;
        meta.ff_3_9 = (meta.ff_3_9 > zero) ? meta.ff_3_9 : zero;
        meta.ff_3_10 = (meta.ff_3_10 > zero) ? meta.ff_3_10 : zero;
        meta.ff_3_11 = (meta.ff_3_11 > zero) ? meta.ff_3_11 : zero;
        meta.ff_4_0 = (meta.ff_4_0 > zero) ? meta.ff_4_0 : zero;
        meta.ff_4_1 = (meta.ff_4_1 > zero) ? meta.ff_4_1 : zero;
        meta.ff_4_2 = (meta.ff_4_2 > zero) ? meta.ff_4_2 : zero;
        meta.ff_4_3 = (meta.ff_4_3 > zero) ? meta.ff_4_3 : zero;
        meta.ff_4_4 = (meta.ff_4_4 > zero) ? meta.ff_4_4 : zero;
        meta.ff_4_5 = (meta.ff_4_5 > zero) ? meta.ff_4_5 : zero;
        meta.ff_4_6 = (meta.ff_4_6 > zero) ? meta.ff_4_6 : zero;
        meta.ff_4_7 = (meta.ff_4_7 > zero) ? meta.ff_4_7 : zero;
        meta.ff_4_8 = (meta.ff_4_8 > zero) ? meta.ff_4_8 : zero;
        meta.ff_4_9 = (meta.ff_4_9 > zero) ? meta.ff_4_9 : zero;
        meta.ff_4_10 = (meta.ff_4_10 > zero) ? meta.ff_4_10 : zero;
        meta.ff_4_11 = (meta.ff_4_11 > zero) ? meta.ff_4_11 : zero;
        meta.ff_5_0 = (meta.ff_5_0 > zero) ? meta.ff_5_0 : zero;
        meta.ff_5_1 = (meta.ff_5_1 > zero) ? meta.ff_5_1 : zero;
        meta.ff_5_2 = (meta.ff_5_2 > zero) ? meta.ff_5_2 : zero;
        meta.ff_5_3 = (meta.ff_5_3 > zero) ? meta.ff_5_3 : zero;
        meta.ff_5_4 = (meta.ff_5_4 > zero) ? meta.ff_5_4 : zero;
        meta.ff_5_5 = (meta.ff_5_5 > zero) ? meta.ff_5_5 : zero;
        meta.ff_5_6 = (meta.ff_5_6 > zero) ? meta.ff_5_6 : zero;
        meta.ff_5_7 = (meta.ff_5_7 > zero) ? meta.ff_5_7 : zero;
        meta.ff_5_8 = (meta.ff_5_8 > zero) ? meta.ff_5_8 : zero;
        meta.ff_5_9 = (meta.ff_5_9 > zero) ? meta.ff_5_9 : zero;
        meta.ff_5_10 = (meta.ff_5_10 > zero) ? meta.ff_5_10 : zero;
        meta.ff_5_11 = (meta.ff_5_11 > zero) ? meta.ff_5_11 : zero;
        meta.ff_6_0 = (meta.ff_6_0 > zero) ? meta.ff_6_0 : zero;
        meta.ff_6_1 = (meta.ff_6_1 > zero) ? meta.ff_6_1 : zero;
        meta.ff_6_2 = (meta.ff_6_2 > zero) ? meta.ff_6_2 : zero;
        meta.ff_6_3 = (meta.ff_6_3 > zero) ? meta.ff_6_3 : zero;
        meta.ff_6_4 = (meta.ff_6_4 > zero) ? meta.ff_6_4 : zero;
        meta.ff_6_5 = (meta.ff_6_5 > zero) ? meta.ff_6_5 : zero;
        meta.ff_6_6 = (meta.ff_6_6 > zero) ? meta.ff_6_6 : zero;
        meta.ff_6_7 = (meta.ff_6_7 > zero) ? meta.ff_6_7 : zero;
        meta.ff_6_8 = (meta.ff_6_8 > zero) ? meta.ff_6_8 : zero;
        meta.ff_6_9 = (meta.ff_6_9 > zero) ? meta.ff_6_9 : zero;
        meta.ff_6_10 = (meta.ff_6_10 > zero) ? meta.ff_6_10 : zero;
        meta.ff_6_11 = (meta.ff_6_11 > zero) ? meta.ff_6_11 : zero;
        meta.ff_7_0 = (meta.ff_7_0 > zero) ? meta.ff_7_0 : zero;
        meta.ff_7_1 = (meta.ff_7_1 > zero) ? meta.ff_7_1 : zero;
        meta.ff_7_2 = (meta.ff_7_2 > zero) ? meta.ff_7_2 : zero;
        meta.ff_7_3 = (meta.ff_7_3 > zero) ? meta.ff_7_3 : zero;
        meta.ff_7_4 = (meta.ff_7_4 > zero) ? meta.ff_7_4 : zero;
        meta.ff_7_5 = (meta.ff_7_5 > zero) ? meta.ff_7_5 : zero;
        meta.ff_7_6 = (meta.ff_7_6 > zero) ? meta.ff_7_6 : zero;
        meta.ff_7_7 = (meta.ff_7_7 > zero) ? meta.ff_7_7 : zero;
        meta.ff_7_8 = (meta.ff_7_8 > zero) ? meta.ff_7_8 : zero;
        meta.ff_7_9 = (meta.ff_7_9 > zero) ? meta.ff_7_9 : zero;
        meta.ff_7_10 = (meta.ff_7_10 > zero) ? meta.ff_7_10 : zero;
        meta.ff_7_11 = (meta.ff_7_11 > zero) ? meta.ff_7_11 : zero;
    }

    // (8*12) * (12*6) = (8*6)，实现残差连接
    action operation_linear2() {
        bit<32> result_0_0 = meta.ff_0_0 * w2_0_0 + meta.ff_0_1 * w2_1_0 + meta.ff_0_2 * w2_2_0 + meta.ff_0_3 * w2_3_0 + meta.ff_0_4 * w2_4_0 + meta.ff_0_5 * w2_5_0 + meta.ff_0_6 * w2_6_0 + meta.ff_0_7 * w2_7_0 + meta.ff_0_8 * w2_8_0 + meta.ff_0_9 * w2_9_0 + meta.ff_0_10 * w2_10_0 + meta.ff_0_11 * w2_11_0 + b2_0;
        bit<32> result_0_1 = meta.ff_0_0 * w2_0_1 + meta.ff_0_1 * w2_1_1 + meta.ff_0_2 * w2_2_1 + meta.ff_0_3 * w2_3_1 + meta.ff_0_4 * w2_4_1 + meta.ff_0_5 * w2_5_1 + meta.ff_0_6 * w2_6_1 + meta.ff_0_7 * w2_7_1 + meta.ff_0_8 * w2_8_1 + meta.ff_0_9 * w2_9_1 + meta.ff_0_10 * w2_10_1 + meta.ff_0_11 * w2_11_1 + b2_1;
        bit<32> result_0_2 = meta.ff_0_0 * w2_0_2 + meta.ff_0_1 * w2_1_2 + meta.ff_0_2 * w2_2_2 + meta.ff_0_3 * w2_3_2 + meta.ff_0_4 * w2_4_2 + meta.ff_0_5 * w2_5_2 + meta.ff_0_6 * w2_6_2 + meta.ff_0_7 * w2_7_2 + meta.ff_0_8 * w2_8_2 + meta.ff_0_9 * w2_9_2 + meta.ff_0_10 * w2_10_2 + meta.ff_0_11 * w2_11_2 + b2_2;
        bit<32> result_0_3 = meta.ff_0_0 * w2_0_3 + meta.ff_0_1 * w2_1_3 + meta.ff_0_2 * w2_2_3 + meta.ff_0_3 * w2_3_3 + meta.ff_0_4 * w2_4_3 + meta.ff_0_5 * w2_5_3 + meta.ff_0_6 * w2_6_3 + meta.ff_0_7 * w2_7_3 + meta.ff_0_8 * w2_8_3 + meta.ff_0_9 * w2_9_3 + meta.ff_0_10 * w2_10_3 + meta.ff_0_11 * w2_11_3 + b2_3;
        bit<32> result_0_4 = meta.ff_0_0 * w2_0_4 + meta.ff_0_1 * w2_1_4 + meta.ff_0_2 * w2_2_4 + meta.ff_0_3 * w2_3_4 + meta.ff_0_4 * w2_4_4 + meta.ff_0_5 * w2_5_4 + meta.ff_0_6 * w2_6_4 + meta.ff_0_7 * w2_7_4 + meta.ff_0_8 * w2_8_4 + meta.ff_0_9 * w2_9_4 + meta.ff_0_10 * w2_10_4 + meta.ff_0_11 * w2_11_4 + b2_4;
        bit<32> result_0_5 = meta.ff_0_0 * w2_0_5 + meta.ff_0_1 * w2_1_5 + meta.ff_0_2 * w2_2_5 + meta.ff_0_3 * w2_3_5 + meta.ff_0_4 * w2_4_5 + meta.ff_0_5 * w2_5_5 + meta.ff_0_6 * w2_6_5 + meta.ff_0_7 * w2_7_5 + meta.ff_0_8 * w2_8_5 + meta.ff_0_9 * w2_9_5 + meta.ff_0_10 * w2_10_5 + meta.ff_0_11 * w2_11_5 + b2_5;
        bit<32> result_1_0 = meta.ff_1_0 * w2_0_0 + meta.ff_1_1 * w2_1_0 + meta.ff_1_2 * w2_2_0 + meta.ff_1_3 * w2_3_0 + meta.ff_1_4 * w2_4_0 + meta.ff_1_5 * w2_5_0 + meta.ff_1_6 * w2_6_0 + meta.ff_1_7 * w2_7_0 + meta.ff_1_8 * w2_8_0 + meta.ff_1_9 * w2_9_0 + meta.ff_1_10 * w2_10_0 + meta.ff_1_11 * w2_11_0 + b2_0;
        bit<32> result_1_1 = meta.ff_1_0 * w2_0_1 + meta.ff_1_1 * w2_1_1 + meta.ff_1_2 * w2_2_1 + meta.ff_1_3 * w2_3_1 + meta.ff_1_4 * w2_4_1 + meta.ff_1_5 * w2_5_1 + meta.ff_1_6 * w2_6_1 + meta.ff_1_7 * w2_7_1 + meta.ff_1_8 * w2_8_1 + meta.ff_1_9 * w2_9_1 + meta.ff_1_10 * w2_10_1 + meta.ff_1_11 * w2_11_1 + b2_1;
        bit<32> result_1_2 = meta.ff_1_0 * w2_0_2 + meta.ff_1_1 * w2_1_2 + meta.ff_1_2 * w2_2_2 + meta.ff_1_3 * w2_3_2 + meta.ff_1_4 * w2_4_2 + meta.ff_1_5 * w2_5_2 + meta.ff_1_6 * w2_6_2 + meta.ff_1_7 * w2_7_2 + meta.ff_1_8 * w2_8_2 + meta.ff_1_9 * w2_9_2 + meta.ff_1_10 * w2_10_2 + meta.ff_1_11 * w2_11_2 + b2_2;
        bit<32> result_1_3 = meta.ff_1_0 * w2_0_3 + meta.ff_1_1 * w2_1_3 + meta.ff_1_2 * w2_2_3 + meta.ff_1_3 * w2_3_3 + meta.ff_1_4 * w2_4_3 + meta.ff_1_5 * w2_5_3 + meta.ff_1_6 * w2_6_3 + meta.ff_1_7 * w2_7_3 + meta.ff_1_8 * w2_8_3 + meta.ff_1_9 * w2_9_3 + meta.ff_1_10 * w2_10_3 + meta.ff_1_11 * w2_11_3 + b2_3;
        bit<32> result_1_4 = meta.ff_1_0 * w2_0_4 + meta.ff_1_1 * w2_1_4 + meta.ff_1_2 * w2_2_4 + meta.ff_1_3 * w2_3_4 + meta.ff_1_4 * w2_4_4 + meta.ff_1_5 * w2_5_4 + meta.ff_1_6 * w2_6_4 + meta.ff_1_7 * w2_7_4 + meta.ff_1_8 * w2_8_4 + meta.ff_1_9 * w2_9_4 + meta.ff_1_10 * w2_10_4 + meta.ff_1_11 * w2_11_4 + b2_4;
        bit<32> result_1_5 = meta.ff_1_0 * w2_0_5 + meta.ff_1_1 * w2_1_5 + meta.ff_1_2 * w2_2_5 + meta.ff_1_3 * w2_3_5 + meta.ff_1_4 * w2_4_5 + meta.ff_1_5 * w2_5_5 + meta.ff_1_6 * w2_6_5 + meta.ff_1_7 * w2_7_5 + meta.ff_1_8 * w2_8_5 + meta.ff_1_9 * w2_9_5 + meta.ff_1_10 * w2_10_5 + meta.ff_1_11 * w2_11_5 + b2_5;
        bit<32> result_2_0 = meta.ff_2_0 * w2_0_0 + meta.ff_2_1 * w2_1_0 + meta.ff_2_2 * w2_2_0 + meta.ff_2_3 * w2_3_0 + meta.ff_2_4 * w2_4_0 + meta.ff_2_5 * w2_5_0 + meta.ff_2_6 * w2_6_0 + meta.ff_2_7 * w2_7_0 + meta.ff_2_8 * w2_8_0 + meta.ff_2_9 * w2_9_0 + meta.ff_2_10 * w2_10_0 + meta.ff_2_11 * w2_11_0 + b2_0;
        bit<32> result_2_1 = meta.ff_2_0 * w2_0_1 + meta.ff_2_1 * w2_1_1 + meta.ff_2_2 * w2_2_1 + meta.ff_2_3 * w2_3_1 + meta.ff_2_4 * w2_4_1 + meta.ff_2_5 * w2_5_1 + meta.ff_2_6 * w2_6_1 + meta.ff_2_7 * w2_7_1 + meta.ff_2_8 * w2_8_1 + meta.ff_2_9 * w2_9_1 + meta.ff_2_10 * w2_10_1 + meta.ff_2_11 * w2_11_1 + b2_1;
        bit<32> result_2_2 = meta.ff_2_0 * w2_0_2 + meta.ff_2_1 * w2_1_2 + meta.ff_2_2 * w2_2_2 + meta.ff_2_3 * w2_3_2 + meta.ff_2_4 * w2_4_2 + meta.ff_2_5 * w2_5_2 + meta.ff_2_6 * w2_6_2 + meta.ff_2_7 * w2_7_2 + meta.ff_2_8 * w2_8_2 + meta.ff_2_9 * w2_9_2 + meta.ff_2_10 * w2_10_2 + meta.ff_2_11 * w2_11_2 + b2_2;
        bit<32> result_2_3 = meta.ff_2_0 * w2_0_3 + meta.ff_2_1 * w2_1_3 + meta.ff_2_2 * w2_2_3 + meta.ff_2_3 * w2_3_3 + meta.ff_2_4 * w2_4_3 + meta.ff_2_5 * w2_5_3 + meta.ff_2_6 * w2_6_3 + meta.ff_2_7 * w2_7_3 + meta.ff_2_8 * w2_8_3 + meta.ff_2_9 * w2_9_3 + meta.ff_2_10 * w2_10_3 + meta.ff_2_11 * w2_11_3 + b2_3;
        bit<32> result_2_4 = meta.ff_2_0 * w2_0_4 + meta.ff_2_1 * w2_1_4 + meta.ff_2_2 * w2_2_4 + meta.ff_2_3 * w2_3_4 + meta.ff_2_4 * w2_4_4 + meta.ff_2_5 * w2_5_4 + meta.ff_2_6 * w2_6_4 + meta.ff_2_7 * w2_7_4 + meta.ff_2_8 * w2_8_4 + meta.ff_2_9 * w2_9_4 + meta.ff_2_10 * w2_10_4 + meta.ff_2_11 * w2_11_4 + b2_4;
        bit<32> result_2_5 = meta.ff_2_0 * w2_0_5 + meta.ff_2_1 * w2_1_5 + meta.ff_2_2 * w2_2_5 + meta.ff_2_3 * w2_3_5 + meta.ff_2_4 * w2_4_5 + meta.ff_2_5 * w2_5_5 + meta.ff_2_6 * w2_6_5 + meta.ff_2_7 * w2_7_5 + meta.ff_2_8 * w2_8_5 + meta.ff_2_9 * w2_9_5 + meta.ff_2_10 * w2_10_5 + meta.ff_2_11 * w2_11_5 + b2_5;
        bit<32> result_3_0 = meta.ff_3_0 * w2_0_0 + meta.ff_3_1 * w2_1_0 + meta.ff_3_2 * w2_2_0 + meta.ff_3_3 * w2_3_0 + meta.ff_3_4 * w2_4_0 + meta.ff_3_5 * w2_5_0 + meta.ff_3_6 * w2_6_0 + meta.ff_3_7 * w2_7_0 + meta.ff_3_8 * w2_8_0 + meta.ff_3_9 * w2_9_0 + meta.ff_3_10 * w2_10_0 + meta.ff_3_11 * w2_11_0 + b2_0;
        bit<32> result_3_1 = meta.ff_3_0 * w2_0_1 + meta.ff_3_1 * w2_1_1 + meta.ff_3_2 * w2_2_1 + meta.ff_3_3 * w2_3_1 + meta.ff_3_4 * w2_4_1 + meta.ff_3_5 * w2_5_1 + meta.ff_3_6 * w2_6_1 + meta.ff_3_7 * w2_7_1 + meta.ff_3_8 * w2_8_1 + meta.ff_3_9 * w2_9_1 + meta.ff_3_10 * w2_10_1 + meta.ff_3_11 * w2_11_1 + b2_1;
        bit<32> result_3_2 = meta.ff_3_0 * w2_0_2 + meta.ff_3_1 * w2_1_2 + meta.ff_3_2 * w2_2_2 + meta.ff_3_3 * w2_3_2 + meta.ff_3_4 * w2_4_2 + meta.ff_3_5 * w2_5_2 + meta.ff_3_6 * w2_6_2 + meta.ff_3_7 * w2_7_2 + meta.ff_3_8 * w2_8_2 + meta.ff_3_9 * w2_9_2 + meta.ff_3_10 * w2_10_2 + meta.ff_3_11 * w2_11_2 + b2_2;
        bit<32> result_3_3 = meta.ff_3_0 * w2_0_3 + meta.ff_3_1 * w2_1_3 + meta.ff_3_2 * w2_2_3 + meta.ff_3_3 * w2_3_3 + meta.ff_3_4 * w2_4_3 + meta.ff_3_5 * w2_5_3 + meta.ff_3_6 * w2_6_3 + meta.ff_3_7 * w2_7_3 + meta.ff_3_8 * w2_8_3 + meta.ff_3_9 * w2_9_3 + meta.ff_3_10 * w2_10_3 + meta.ff_3_11 * w2_11_3 + b2_3;
        bit<32> result_3_4 = meta.ff_3_0 * w2_0_4 + meta.ff_3_1 * w2_1_4 + meta.ff_3_2 * w2_2_4 + meta.ff_3_3 * w2_3_4 + meta.ff_3_4 * w2_4_4 + meta.ff_3_5 * w2_5_4 + meta.ff_3_6 * w2_6_4 + meta.ff_3_7 * w2_7_4 + meta.ff_3_8 * w2_8_4 + meta.ff_3_9 * w2_9_4 + meta.ff_3_10 * w2_10_4 + meta.ff_3_11 * w2_11_4 + b2_4;
        bit<32> result_3_5 = meta.ff_3_0 * w2_0_5 + meta.ff_3_1 * w2_1_5 + meta.ff_3_2 * w2_2_5 + meta.ff_3_3 * w2_3_5 + meta.ff_3_4 * w2_4_5 + meta.ff_3_5 * w2_5_5 + meta.ff_3_6 * w2_6_5 + meta.ff_3_7 * w2_7_5 + meta.ff_3_8 * w2_8_5 + meta.ff_3_9 * w2_9_5 + meta.ff_3_10 * w2_10_5 + meta.ff_3_11 * w2_11_5 + b2_5;
        bit<32> result_4_0 = meta.ff_4_0 * w2_0_0 + meta.ff_4_1 * w2_1_0 + meta.ff_4_2 * w2_2_0 + meta.ff_4_3 * w2_3_0 + meta.ff_4_4 * w2_4_0 + meta.ff_4_5 * w2_5_0 + meta.ff_4_6 * w2_6_0 + meta.ff_4_7 * w2_7_0 + meta.ff_4_8 * w2_8_0 + meta.ff_4_9 * w2_9_0 + meta.ff_4_10 * w2_10_0 + meta.ff_4_11 * w2_11_0 + b2_0;
        bit<32> result_4_1 = meta.ff_4_0 * w2_0_1 + meta.ff_4_1 * w2_1_1 + meta.ff_4_2 * w2_2_1 + meta.ff_4_3 * w2_3_1 + meta.ff_4_4 * w2_4_1 + meta.ff_4_5 * w2_5_1 + meta.ff_4_6 * w2_6_1 + meta.ff_4_7 * w2_7_1 + meta.ff_4_8 * w2_8_1 + meta.ff_4_9 * w2_9_1 + meta.ff_4_10 * w2_10_1 + meta.ff_4_11 * w2_11_1 + b2_1;
        bit<32> result_4_2 = meta.ff_4_0 * w2_0_2 + meta.ff_4_1 * w2_1_2 + meta.ff_4_2 * w2_2_2 + meta.ff_4_3 * w2_3_2 + meta.ff_4_4 * w2_4_2 + meta.ff_4_5 * w2_5_2 + meta.ff_4_6 * w2_6_2 + meta.ff_4_7 * w2_7_2 + meta.ff_4_8 * w2_8_2 + meta.ff_4_9 * w2_9_2 + meta.ff_4_10 * w2_10_2 + meta.ff_4_11 * w2_11_2 + b2_2;
        bit<32> result_4_3 = meta.ff_4_0 * w2_0_3 + meta.ff_4_1 * w2_1_3 + meta.ff_4_2 * w2_2_3 + meta.ff_4_3 * w2_3_3 + meta.ff_4_4 * w2_4_3 + meta.ff_4_5 * w2_5_3 + meta.ff_4_6 * w2_6_3 + meta.ff_4_7 * w2_7_3 + meta.ff_4_8 * w2_8_3 + meta.ff_4_9 * w2_9_3 + meta.ff_4_10 * w2_10_3 + meta.ff_4_11 * w2_11_3 + b2_3;
        bit<32> result_4_4 = meta.ff_4_0 * w2_0_4 + meta.ff_4_1 * w2_1_4 + meta.ff_4_2 * w2_2_4 + meta.ff_4_3 * w2_3_4 + meta.ff_4_4 * w2_4_4 + meta.ff_4_5 * w2_5_4 + meta.ff_4_6 * w2_6_4 + meta.ff_4_7 * w2_7_4 + meta.ff_4_8 * w2_8_4 + meta.ff_4_9 * w2_9_4 + meta.ff_4_10 * w2_10_4 + meta.ff_4_11 * w2_11_4 + b2_4;
        bit<32> result_4_5 = meta.ff_4_0 * w2_0_5 + meta.ff_4_1 * w2_1_5 + meta.ff_4_2 * w2_2_5 + meta.ff_4_3 * w2_3_5 + meta.ff_4_4 * w2_4_5 + meta.ff_4_5 * w2_5_5 + meta.ff_4_6 * w2_6_5 + meta.ff_4_7 * w2_7_5 + meta.ff_4_8 * w2_8_5 + meta.ff_4_9 * w2_9_5 + meta.ff_4_10 * w2_10_5 + meta.ff_4_11 * w2_11_5 + b2_5;
        bit<32> result_5_0 = meta.ff_5_0 * w2_0_0 + meta.ff_5_1 * w2_1_0 + meta.ff_5_2 * w2_2_0 + meta.ff_5_3 * w2_3_0 + meta.ff_5_4 * w2_4_0 + meta.ff_5_5 * w2_5_0 + meta.ff_5_6 * w2_6_0 + meta.ff_5_7 * w2_7_0 + meta.ff_5_8 * w2_8_0 + meta.ff_5_9 * w2_9_0 + meta.ff_5_10 * w2_10_0 + meta.ff_5_11 * w2_11_0 + b2_0;
        bit<32> result_5_1 = meta.ff_5_0 * w2_0_1 + meta.ff_5_1 * w2_1_1 + meta.ff_5_2 * w2_2_1 + meta.ff_5_3 * w2_3_1 + meta.ff_5_4 * w2_4_1 + meta.ff_5_5 * w2_5_1 + meta.ff_5_6 * w2_6_1 + meta.ff_5_7 * w2_7_1 + meta.ff_5_8 * w2_8_1 + meta.ff_5_9 * w2_9_1 + meta.ff_5_10 * w2_10_1 + meta.ff_5_11 * w2_11_1 + b2_1;
        bit<32> result_5_2 = meta.ff_5_0 * w2_0_2 + meta.ff_5_1 * w2_1_2 + meta.ff_5_2 * w2_2_2 + meta.ff_5_3 * w2_3_2 + meta.ff_5_4 * w2_4_2 + meta.ff_5_5 * w2_5_2 + meta.ff_5_6 * w2_6_2 + meta.ff_5_7 * w2_7_2 + meta.ff_5_8 * w2_8_2 + meta.ff_5_9 * w2_9_2 + meta.ff_5_10 * w2_10_2 + meta.ff_5_11 * w2_11_2 + b2_2;
        bit<32> result_5_3 = meta.ff_5_0 * w2_0_3 + meta.ff_5_1 * w2_1_3 + meta.ff_5_2 * w2_2_3 + meta.ff_5_3 * w2_3_3 + meta.ff_5_4 * w2_4_3 + meta.ff_5_5 * w2_5_3 + meta.ff_5_6 * w2_6_3 + meta.ff_5_7 * w2_7_3 + meta.ff_5_8 * w2_8_3 + meta.ff_5_9 * w2_9_3 + meta.ff_5_10 * w2_10_3 + meta.ff_5_11 * w2_11_3 + b2_3;
        bit<32> result_5_4 = meta.ff_5_0 * w2_0_4 + meta.ff_5_1 * w2_1_4 + meta.ff_5_2 * w2_2_4 + meta.ff_5_3 * w2_3_4 + meta.ff_5_4 * w2_4_4 + meta.ff_5_5 * w2_5_4 + meta.ff_5_6 * w2_6_4 + meta.ff_5_7 * w2_7_4 + meta.ff_5_8 * w2_8_4 + meta.ff_5_9 * w2_9_4 + meta.ff_5_10 * w2_10_4 + meta.ff_5_11 * w2_11_4 + b2_4;
        bit<32> result_5_5 = meta.ff_5_0 * w2_0_5 + meta.ff_5_1 * w2_1_5 + meta.ff_5_2 * w2_2_5 + meta.ff_5_3 * w2_3_5 + meta.ff_5_4 * w2_4_5 + meta.ff_5_5 * w2_5_5 + meta.ff_5_6 * w2_6_5 + meta.ff_5_7 * w2_7_5 + meta.ff_5_8 * w2_8_5 + meta.ff_5_9 * w2_9_5 + meta.ff_5_10 * w2_10_5 + meta.ff_5_11 * w2_11_5 + b2_5;
        bit<32> result_6_0 = meta.ff_6_0 * w2_0_0 + meta.ff_6_1 * w2_1_0 + meta.ff_6_2 * w2_2_0 + meta.ff_6_3 * w2_3_0 + meta.ff_6_4 * w2_4_0 + meta.ff_6_5 * w2_5_0 + meta.ff_6_6 * w2_6_0 + meta.ff_6_7 * w2_7_0 + meta.ff_6_8 * w2_8_0 + meta.ff_6_9 * w2_9_0 + meta.ff_6_10 * w2_10_0 + meta.ff_6_11 * w2_11_0 + b2_0;
        bit<32> result_6_1 = meta.ff_6_0 * w2_0_1 + meta.ff_6_1 * w2_1_1 + meta.ff_6_2 * w2_2_1 + meta.ff_6_3 * w2_3_1 + meta.ff_6_4 * w2_4_1 + meta.ff_6_5 * w2_5_1 + meta.ff_6_6 * w2_6_1 + meta.ff_6_7 * w2_7_1 + meta.ff_6_8 * w2_8_1 + meta.ff_6_9 * w2_9_1 + meta.ff_6_10 * w2_10_1 + meta.ff_6_11 * w2_11_1 + b2_1;
        bit<32> result_6_2 = meta.ff_6_0 * w2_0_2 + meta.ff_6_1 * w2_1_2 + meta.ff_6_2 * w2_2_2 + meta.ff_6_3 * w2_3_2 + meta.ff_6_4 * w2_4_2 + meta.ff_6_5 * w2_5_2 + meta.ff_6_6 * w2_6_2 + meta.ff_6_7 * w2_7_2 + meta.ff_6_8 * w2_8_2 + meta.ff_6_9 * w2_9_2 + meta.ff_6_10 * w2_10_2 + meta.ff_6_11 * w2_11_2 + b2_2;
        bit<32> result_6_3 = meta.ff_6_0 * w2_0_3 + meta.ff_6_1 * w2_1_3 + meta.ff_6_2 * w2_2_3 + meta.ff_6_3 * w2_3_3 + meta.ff_6_4 * w2_4_3 + meta.ff_6_5 * w2_5_3 + meta.ff_6_6 * w2_6_3 + meta.ff_6_7 * w2_7_3 + meta.ff_6_8 * w2_8_3 + meta.ff_6_9 * w2_9_3 + meta.ff_6_10 * w2_10_3 + meta.ff_6_11 * w2_11_3 + b2_3;
        bit<32> result_6_4 = meta.ff_6_0 * w2_0_4 + meta.ff_6_1 * w2_1_4 + meta.ff_6_2 * w2_2_4 + meta.ff_6_3 * w2_3_4 + meta.ff_6_4 * w2_4_4 + meta.ff_6_5 * w2_5_4 + meta.ff_6_6 * w2_6_4 + meta.ff_6_7 * w2_7_4 + meta.ff_6_8 * w2_8_4 + meta.ff_6_9 * w2_9_4 + meta.ff_6_10 * w2_10_4 + meta.ff_6_11 * w2_11_4 + b2_4;
        bit<32> result_6_5 = meta.ff_6_0 * w2_0_5 + meta.ff_6_1 * w2_1_5 + meta.ff_6_2 * w2_2_5 + meta.ff_6_3 * w2_3_5 + meta.ff_6_4 * w2_4_5 + meta.ff_6_5 * w2_5_5 + meta.ff_6_6 * w2_6_5 + meta.ff_6_7 * w2_7_5 + meta.ff_6_8 * w2_8_5 + meta.ff_6_9 * w2_9_5 + meta.ff_6_10 * w2_10_5 + meta.ff_6_11 * w2_11_5 + b2_5;
        bit<32> result_7_0 = meta.ff_7_0 * w2_0_0 + meta.ff_7_1 * w2_1_0 + meta.ff_7_2 * w2_2_0 + meta.ff_7_3 * w2_3_0 + meta.ff_7_4 * w2_4_0 + meta.ff_7_5 * w2_5_0 + meta.ff_7_6 * w2_6_0 + meta.ff_7_7 * w2_7_0 + meta.ff_7_8 * w2_8_0 + meta.ff_7_9 * w2_9_0 + meta.ff_7_10 * w2_10_0 + meta.ff_7_11 * w2_11_0 + b2_0;
        bit<32> result_7_1 = meta.ff_7_0 * w2_0_1 + meta.ff_7_1 * w2_1_1 + meta.ff_7_2 * w2_2_1 + meta.ff_7_3 * w2_3_1 + meta.ff_7_4 * w2_4_1 + meta.ff_7_5 * w2_5_1 + meta.ff_7_6 * w2_6_1 + meta.ff_7_7 * w2_7_1 + meta.ff_7_8 * w2_8_1 + meta.ff_7_9 * w2_9_1 + meta.ff_7_10 * w2_10_1 + meta.ff_7_11 * w2_11_1 + b2_1;
        bit<32> result_7_2 = meta.ff_7_0 * w2_0_2 + meta.ff_7_1 * w2_1_2 + meta.ff_7_2 * w2_2_2 + meta.ff_7_3 * w2_3_2 + meta.ff_7_4 * w2_4_2 + meta.ff_7_5 * w2_5_2 + meta.ff_7_6 * w2_6_2 + meta.ff_7_7 * w2_7_2 + meta.ff_7_8 * w2_8_2 + meta.ff_7_9 * w2_9_2 + meta.ff_7_10 * w2_10_2 + meta.ff_7_11 * w2_11_2 + b2_2;
        bit<32> result_7_3 = meta.ff_7_0 * w2_0_3 + meta.ff_7_1 * w2_1_3 + meta.ff_7_2 * w2_2_3 + meta.ff_7_3 * w2_3_3 + meta.ff_7_4 * w2_4_3 + meta.ff_7_5 * w2_5_3 + meta.ff_7_6 * w2_6_3 + meta.ff_7_7 * w2_7_3 + meta.ff_7_8 * w2_8_3 + meta.ff_7_9 * w2_9_3 + meta.ff_7_10 * w2_10_3 + meta.ff_7_11 * w2_11_3 + b2_3;
        bit<32> result_7_4 = meta.ff_7_0 * w2_0_4 + meta.ff_7_1 * w2_1_4 + meta.ff_7_2 * w2_2_4 + meta.ff_7_3 * w2_3_4 + meta.ff_7_4 * w2_4_4 + meta.ff_7_5 * w2_5_4 + meta.ff_7_6 * w2_6_4 + meta.ff_7_7 * w2_7_4 + meta.ff_7_8 * w2_8_4 + meta.ff_7_9 * w2_9_4 + meta.ff_7_10 * w2_10_4 + meta.ff_7_11 * w2_11_4 + b2_4;
        bit<32> result_7_5 = meta.ff_7_0 * w2_0_5 + meta.ff_7_1 * w2_1_5 + meta.ff_7_2 * w2_2_5 + meta.ff_7_3 * w2_3_5 + meta.ff_7_4 * w2_4_5 + meta.ff_7_5 * w2_5_5 + meta.ff_7_6 * w2_6_5 + meta.ff_7_7 * w2_7_5 + meta.ff_7_8 * w2_8_5 + meta.ff_7_9 * w2_9_5 + meta.ff_7_10 * w2_10_5 + meta.ff_7_11 * w2_11_5 + b2_5;

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