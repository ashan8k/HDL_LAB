
module fetch_mem_wr_ADDR_WIDTH12_REG_WIDTH16 ( clk, rst, o_16_data_mem2cpu, 
        or_R_pcplus, or_R_alu_out, or_1_mem2reg_sel, or_4_reg_wr_addr, 
        or_1_reg_wr_en, i_1_alu_zero, i_R_alu_out, i_R_wr_data, 
        i_4_reg_wr_addr, i_R_pc_branch, i_1_mem_addr_sel, i_1_reg_wr_en, 
        i_1_mem2reg_sel, i_1_mem_wr_en, i_1_branch, i_16_data_mem2cpu, 
        o_1_mem_en, o_1_mem_rd_en, o_1_mem_wr_en, o_16_data_cpu2mem, 
        o_A_addr_cpu2mem );
  output [15:0] o_16_data_mem2cpu;
  output [15:0] or_R_pcplus;
  output [15:0] or_R_alu_out;
  output [3:0] or_4_reg_wr_addr;
  input [15:0] i_R_alu_out;
  input [15:0] i_R_wr_data;
  input [3:0] i_4_reg_wr_addr;
  input [15:0] i_R_pc_branch;
  input [15:0] i_16_data_mem2cpu;
  output [15:0] o_16_data_cpu2mem;
  output [11:0] o_A_addr_cpu2mem;
  input clk, rst, i_1_alu_zero, i_1_mem_addr_sel, i_1_reg_wr_en,
         i_1_mem2reg_sel, i_1_mem_wr_en, i_1_branch;
  output or_1_mem2reg_sel, or_1_reg_wr_en, o_1_mem_en, o_1_mem_rd_en,
         o_1_mem_wr_en;
  wire   N10, N11, N12, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27,
         N28, N29, N30, N31, N32, loading_from_memory, n28, n31, n33, n35, n37,
         n39, n41, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n29, n30, n32, n34, n36, n38, n40, n42, n58, n59;
  wire   [1:0] counter;
  wire   [15:1] pc;

  DFQD1BWP12T counter_reg_1_ ( .D(N11), .CP(clk), .Q(counter[1]) );
  DFQD1BWP12T pc_reg_1_ ( .D(n56), .CP(clk), .Q(pc[1]) );
  DFQD1BWP12T pc_reg_2_ ( .D(n55), .CP(clk), .Q(pc[2]) );
  DFQD1BWP12T pc_reg_4_ ( .D(n53), .CP(clk), .Q(pc[4]) );
  DFQD1BWP12T pc_reg_6_ ( .D(n51), .CP(clk), .Q(pc[6]) );
  DFQD1BWP12T pc_reg_8_ ( .D(n49), .CP(clk), .Q(pc[8]) );
  DFQD1BWP12T pc_reg_10_ ( .D(n47), .CP(clk), .Q(pc[10]) );
  DFQD1BWP12T pc_reg_12_ ( .D(n45), .CP(clk), .Q(pc[12]) );
  DFQD1BWP12T pc_reg_15_ ( .D(n41), .CP(clk), .Q(pc[15]) );
  DFQD1BWP12T pc_reg_14_ ( .D(n43), .CP(clk), .Q(pc[14]) );
  DFQD1BWP12T pc_reg_0_ ( .D(n57), .CP(clk), .Q(N17) );
  DFKCNQD1BWP12T loading_from_memory_reg ( .CN(o_1_mem_rd_en), .D(
        i_1_mem_addr_sel), .CP(clk), .Q(loading_from_memory) );
  DFQD1BWP12T or_R_pcplus_reg_15_ ( .D(N32), .CP(clk), .Q(or_R_pcplus[15]) );
  DFQD1BWP12T or_R_pcplus_reg_14_ ( .D(N31), .CP(clk), .Q(or_R_pcplus[14]) );
  DFQD1BWP12T or_R_pcplus_reg_13_ ( .D(N30), .CP(clk), .Q(or_R_pcplus[13]) );
  DFQD1BWP12T or_R_pcplus_reg_12_ ( .D(N29), .CP(clk), .Q(or_R_pcplus[12]) );
  DFQD1BWP12T or_R_pcplus_reg_11_ ( .D(N28), .CP(clk), .Q(or_R_pcplus[11]) );
  DFQD1BWP12T or_R_pcplus_reg_10_ ( .D(N27), .CP(clk), .Q(or_R_pcplus[10]) );
  DFQD1BWP12T or_R_pcplus_reg_9_ ( .D(N26), .CP(clk), .Q(or_R_pcplus[9]) );
  DFQD1BWP12T or_R_pcplus_reg_8_ ( .D(N25), .CP(clk), .Q(or_R_pcplus[8]) );
  DFQD1BWP12T or_R_pcplus_reg_7_ ( .D(N24), .CP(clk), .Q(or_R_pcplus[7]) );
  DFQD1BWP12T or_R_pcplus_reg_6_ ( .D(N23), .CP(clk), .Q(or_R_pcplus[6]) );
  DFQD1BWP12T or_R_pcplus_reg_5_ ( .D(N22), .CP(clk), .Q(or_R_pcplus[5]) );
  DFQD1BWP12T or_R_pcplus_reg_4_ ( .D(N21), .CP(clk), .Q(or_R_pcplus[4]) );
  DFQD1BWP12T or_R_pcplus_reg_3_ ( .D(N20), .CP(clk), .Q(or_R_pcplus[3]) );
  DFQD1BWP12T or_R_pcplus_reg_2_ ( .D(N19), .CP(clk), .Q(or_R_pcplus[2]) );
  DFQD1BWP12T or_R_pcplus_reg_1_ ( .D(N18), .CP(clk), .Q(or_R_pcplus[1]) );
  DFQD1BWP12T or_R_pcplus_reg_0_ ( .D(N17), .CP(clk), .Q(or_R_pcplus[0]) );
  DFQD1BWP12T or_R_alu_out_reg_15_ ( .D(i_R_alu_out[15]), .CP(clk), .Q(
        or_R_alu_out[15]) );
  DFQD1BWP12T or_R_alu_out_reg_14_ ( .D(i_R_alu_out[14]), .CP(clk), .Q(
        or_R_alu_out[14]) );
  DFQD1BWP12T or_R_alu_out_reg_13_ ( .D(i_R_alu_out[13]), .CP(clk), .Q(
        or_R_alu_out[13]) );
  DFQD1BWP12T or_R_alu_out_reg_12_ ( .D(i_R_alu_out[12]), .CP(clk), .Q(
        or_R_alu_out[12]) );
  DFQD1BWP12T or_R_alu_out_reg_11_ ( .D(i_R_alu_out[11]), .CP(clk), .Q(
        or_R_alu_out[11]) );
  DFQD1BWP12T or_R_alu_out_reg_10_ ( .D(i_R_alu_out[10]), .CP(clk), .Q(
        or_R_alu_out[10]) );
  DFQD1BWP12T or_R_alu_out_reg_9_ ( .D(i_R_alu_out[9]), .CP(clk), .Q(
        or_R_alu_out[9]) );
  DFQD1BWP12T or_R_alu_out_reg_8_ ( .D(i_R_alu_out[8]), .CP(clk), .Q(
        or_R_alu_out[8]) );
  DFQD1BWP12T or_R_alu_out_reg_7_ ( .D(i_R_alu_out[7]), .CP(clk), .Q(
        or_R_alu_out[7]) );
  DFQD1BWP12T or_R_alu_out_reg_6_ ( .D(i_R_alu_out[6]), .CP(clk), .Q(
        or_R_alu_out[6]) );
  DFQD1BWP12T or_R_alu_out_reg_5_ ( .D(i_R_alu_out[5]), .CP(clk), .Q(
        or_R_alu_out[5]) );
  DFQD1BWP12T or_R_alu_out_reg_4_ ( .D(i_R_alu_out[4]), .CP(clk), .Q(
        or_R_alu_out[4]) );
  DFQD1BWP12T or_R_alu_out_reg_3_ ( .D(i_R_alu_out[3]), .CP(clk), .Q(
        or_R_alu_out[3]) );
  DFQD1BWP12T or_R_alu_out_reg_2_ ( .D(i_R_alu_out[2]), .CP(clk), .Q(
        or_R_alu_out[2]) );
  DFQD1BWP12T or_R_alu_out_reg_1_ ( .D(i_R_alu_out[1]), .CP(clk), .Q(
        or_R_alu_out[1]) );
  DFQD1BWP12T or_R_alu_out_reg_0_ ( .D(i_R_alu_out[0]), .CP(clk), .Q(
        or_R_alu_out[0]) );
  DFQD1BWP12T or_1_mem2reg_sel_reg ( .D(i_1_mem2reg_sel), .CP(clk), .Q(
        or_1_mem2reg_sel) );
  DFQD1BWP12T or_4_reg_wr_addr_reg_3_ ( .D(i_4_reg_wr_addr[3]), .CP(clk), .Q(
        or_4_reg_wr_addr[3]) );
  DFQD1BWP12T or_4_reg_wr_addr_reg_2_ ( .D(i_4_reg_wr_addr[2]), .CP(clk), .Q(
        or_4_reg_wr_addr[2]) );
  DFQD1BWP12T or_4_reg_wr_addr_reg_1_ ( .D(i_4_reg_wr_addr[1]), .CP(clk), .Q(
        or_4_reg_wr_addr[1]) );
  DFQD1BWP12T or_4_reg_wr_addr_reg_0_ ( .D(i_4_reg_wr_addr[0]), .CP(clk), .Q(
        or_4_reg_wr_addr[0]) );
  DFQD1BWP12T or_1_reg_wr_en_reg ( .D(i_1_reg_wr_en), .CP(clk), .Q(
        or_1_reg_wr_en) );
  DFD1BWP12T pc_reg_11_ ( .D(n46), .CP(clk), .Q(n59), .QN(n31) );
  DFD1BWP12T pc_reg_9_ ( .D(n48), .CP(clk), .Q(n58), .QN(n33) );
  DFD1BWP12T pc_reg_7_ ( .D(n50), .CP(clk), .Q(n42), .QN(n35) );
  DFD1BWP12T pc_reg_5_ ( .D(n52), .CP(clk), .Q(n40), .QN(n37) );
  DFD1BWP12T pc_reg_3_ ( .D(n54), .CP(clk), .Q(n38), .QN(n39) );
  DFD1BWP12T pc_reg_13_ ( .D(n44), .CP(clk), .Q(pc[13]), .QN(n36) );
  DFD1BWP12T counter_reg_2_ ( .D(N12), .CP(clk), .QN(n28) );
  DFXD1BWP12T counter_reg_0_ ( .D(N10), .CP(clk), .Q(counter[0]) );
  INVD1BWP12T U3 ( .I(n11), .ZN(n5) );
  ND2D1BWP12T U4 ( .A1(pc[1]), .A2(pc[2]), .ZN(n16) );
  NR2D1BWP12T U5 ( .A1(n39), .A2(n16), .ZN(n15) );
  ND2D1BWP12T U6 ( .A1(n15), .A2(pc[4]), .ZN(n18) );
  NR2D1BWP12T U7 ( .A1(n37), .A2(n18), .ZN(n17) );
  ND2D1BWP12T U8 ( .A1(n17), .A2(pc[6]), .ZN(n9) );
  NR2D1BWP12T U9 ( .A1(n35), .A2(n9), .ZN(n8) );
  ND2D1BWP12T U10 ( .A1(n8), .A2(pc[8]), .ZN(n7) );
  NR2D1BWP12T U11 ( .A1(n33), .A2(n7), .ZN(n6) );
  ND2D1BWP12T U12 ( .A1(n6), .A2(pc[10]), .ZN(n20) );
  NR2D1BWP12T U13 ( .A1(n31), .A2(n20), .ZN(n19) );
  ND2D1BWP12T U14 ( .A1(n19), .A2(pc[12]), .ZN(n22) );
  NR2D1BWP12T U15 ( .A1(n22), .A2(n36), .ZN(n21) );
  ND2D1BWP12T U16 ( .A1(n21), .A2(pc[14]), .ZN(n4) );
  NR4D0BWP12T U17 ( .A1(n28), .A2(counter[1]), .A3(counter[0]), .A4(n5), .ZN(
        n24) );
  INVD1BWP12T U18 ( .I(n25), .ZN(n14) );
  AOI21D1BWP12T U19 ( .A1(i_1_branch), .A2(i_1_alu_zero), .B(rst), .ZN(n11) );
  INVD1BWP12T U20 ( .I(pc[1]), .ZN(N18) );
  OA21D1BWP12T U21 ( .A1(n21), .A2(pc[14]), .B(n4), .Z(N31) );
  MOAI22D0BWP12T U22 ( .A1(pc[15]), .A2(n4), .B1(pc[15]), .B2(n4), .ZN(N32) );
  INVD1BWP12T U23 ( .I(i_1_mem_wr_en), .ZN(o_1_mem_rd_en) );
  CKND0BWP12T U24 ( .I(n5), .ZN(n1) );
  OA31D0BWP12T U25 ( .A1(counter[1]), .A2(n28), .A3(counter[0]), .B(n1), .Z(
        n25) );
  CKND0BWP12T U26 ( .I(counter[1]), .ZN(n2) );
  AOI31D0BWP12T U27 ( .A1(n28), .A2(counter[0]), .A3(n2), .B(
        loading_from_memory), .ZN(n26) );
  CKND2D0BWP12T U28 ( .A1(i_1_alu_zero), .A2(i_1_branch), .ZN(n3) );
  NR2D0BWP12T U29 ( .A1(rst), .A2(n3), .ZN(n23) );
  OA21XD1BWP12T U30 ( .A1(n19), .A2(pc[12]), .B(n22), .Z(N29) );
  OA21XD1BWP12T U31 ( .A1(n6), .A2(pc[10]), .B(n20), .Z(N27) );
  AO222D0BWP12T U32 ( .A1(pc[10]), .A2(n25), .B1(n24), .B2(N27), .C1(n23), 
        .C2(i_R_pc_branch[10]), .Z(n47) );
  AOI21D1BWP12T U33 ( .A1(n33), .A2(n7), .B(n6), .ZN(N26) );
  AO222D0BWP12T U34 ( .A1(n58), .A2(n25), .B1(n23), .B2(i_R_pc_branch[9]), 
        .C1(N26), .C2(n24), .Z(n48) );
  OA21XD1BWP12T U35 ( .A1(n8), .A2(pc[8]), .B(n7), .Z(N25) );
  AO222D0BWP12T U36 ( .A1(pc[8]), .A2(n25), .B1(n24), .B2(N25), .C1(n23), .C2(
        i_R_pc_branch[8]), .Z(n49) );
  AOI21D1BWP12T U37 ( .A1(n35), .A2(n9), .B(n8), .ZN(N24) );
  AO222D0BWP12T U38 ( .A1(n42), .A2(n25), .B1(n23), .B2(i_R_pc_branch[7]), 
        .C1(N24), .C2(n24), .Z(n50) );
  OA21XD1BWP12T U39 ( .A1(n17), .A2(pc[6]), .B(n9), .Z(N23) );
  AO222D0BWP12T U40 ( .A1(pc[6]), .A2(n25), .B1(n24), .B2(N23), .C1(n23), .C2(
        i_R_pc_branch[6]), .Z(n51) );
  CKND2D0BWP12T U41 ( .A1(counter[1]), .A2(counter[0]), .ZN(n12) );
  NR2D0BWP12T U42 ( .A1(n28), .A2(n12), .ZN(n10) );
  RCAOI211D0BWP12T U43 ( .A1(n28), .A2(n12), .B(n14), .C(n10), .ZN(N12) );
  TPNR2D0BWP12T U44 ( .A1(counter[0]), .A2(n14), .ZN(N10) );
  OA21XD1BWP12T U45 ( .A1(n15), .A2(pc[4]), .B(n18), .Z(N21) );
  AO222D0BWP12T U46 ( .A1(pc[4]), .A2(n25), .B1(n24), .B2(N21), .C1(n23), .C2(
        i_R_pc_branch[4]), .Z(n53) );
  OA21D1BWP12T U47 ( .A1(pc[1]), .A2(pc[2]), .B(n16), .Z(N19) );
  AO222D0BWP12T U48 ( .A1(pc[2]), .A2(n25), .B1(n24), .B2(N19), .C1(n23), .C2(
        i_R_pc_branch[2]), .Z(n55) );
  INR2D0BWP12T U49 ( .A1(i_16_data_mem2cpu[5]), .B1(n26), .ZN(
        o_16_data_mem2cpu[13]) );
  INR2D0BWP12T U50 ( .A1(i_16_data_mem2cpu[7]), .B1(n26), .ZN(
        o_16_data_mem2cpu[15]) );
  INR2D0BWP12T U51 ( .A1(i_16_data_mem2cpu[14]), .B1(n26), .ZN(
        o_16_data_mem2cpu[6]) );
  INR2D0BWP12T U52 ( .A1(i_16_data_mem2cpu[12]), .B1(n26), .ZN(
        o_16_data_mem2cpu[4]) );
  INR2D0BWP12T U53 ( .A1(i_16_data_mem2cpu[13]), .B1(n26), .ZN(
        o_16_data_mem2cpu[5]) );
  INR2D0BWP12T U54 ( .A1(i_16_data_mem2cpu[9]), .B1(n26), .ZN(
        o_16_data_mem2cpu[1]) );
  INR2D0BWP12T U55 ( .A1(i_16_data_mem2cpu[2]), .B1(n26), .ZN(
        o_16_data_mem2cpu[10]) );
  INR2D0BWP12T U56 ( .A1(i_16_data_mem2cpu[1]), .B1(n26), .ZN(
        o_16_data_mem2cpu[9]) );
  INR2D0BWP12T U57 ( .A1(i_16_data_mem2cpu[11]), .B1(n26), .ZN(
        o_16_data_mem2cpu[3]) );
  INR2D0BWP12T U58 ( .A1(i_16_data_mem2cpu[15]), .B1(n26), .ZN(
        o_16_data_mem2cpu[7]) );
  INR2D0BWP12T U59 ( .A1(i_16_data_mem2cpu[0]), .B1(n26), .ZN(
        o_16_data_mem2cpu[8]) );
  INR2D0BWP12T U60 ( .A1(i_16_data_mem2cpu[10]), .B1(n26), .ZN(
        o_16_data_mem2cpu[2]) );
  INR2D0BWP12T U61 ( .A1(i_16_data_mem2cpu[8]), .B1(n26), .ZN(
        o_16_data_mem2cpu[0]) );
  AO22XD1BWP12T U62 ( .A1(n11), .A2(N17), .B1(n23), .B2(i_R_pc_branch[0]), .Z(
        n57) );
  OA211D0BWP12T U63 ( .A1(counter[1]), .A2(counter[0]), .B(n12), .C(n11), .Z(
        N11) );
  CKBD1BWP12T U64 ( .I(i_R_wr_data[6]), .Z(o_16_data_cpu2mem[14]) );
  CKBD1BWP12T U65 ( .I(i_R_wr_data[1]), .Z(o_16_data_cpu2mem[9]) );
  CKBD1BWP12T U66 ( .I(i_R_wr_data[7]), .Z(o_16_data_cpu2mem[15]) );
  CKBD1BWP12T U67 ( .I(i_R_wr_data[2]), .Z(o_16_data_cpu2mem[10]) );
  CKBD1BWP12T U68 ( .I(i_R_wr_data[8]), .Z(o_16_data_cpu2mem[0]) );
  CKBD1BWP12T U69 ( .I(i_R_wr_data[3]), .Z(o_16_data_cpu2mem[11]) );
  CKBD1BWP12T U70 ( .I(i_1_mem_wr_en), .Z(o_1_mem_wr_en) );
  CKBD1BWP12T U71 ( .I(i_R_wr_data[11]), .Z(o_16_data_cpu2mem[3]) );
  CKBD1BWP12T U72 ( .I(i_R_wr_data[12]), .Z(o_16_data_cpu2mem[4]) );
  CKBD1BWP12T U73 ( .I(i_R_wr_data[13]), .Z(o_16_data_cpu2mem[5]) );
  CKBD1BWP12T U74 ( .I(i_R_wr_data[10]), .Z(o_16_data_cpu2mem[2]) );
  CKBD1BWP12T U75 ( .I(i_R_wr_data[9]), .Z(o_16_data_cpu2mem[1]) );
  CKBD1BWP12T U76 ( .I(i_R_wr_data[14]), .Z(o_16_data_cpu2mem[6]) );
  CKBD1BWP12T U77 ( .I(i_R_wr_data[5]), .Z(o_16_data_cpu2mem[13]) );
  CKBD1BWP12T U78 ( .I(i_R_wr_data[4]), .Z(o_16_data_cpu2mem[12]) );
  CKBD1BWP12T U79 ( .I(i_R_wr_data[0]), .Z(o_16_data_cpu2mem[8]) );
  CKBD1BWP12T U80 ( .I(i_R_wr_data[15]), .Z(o_16_data_cpu2mem[7]) );
  TPAOI22D0BWP12T U81 ( .A1(i_R_pc_branch[1]), .A2(n23), .B1(n24), .B2(N18), 
        .ZN(n13) );
  OAI21D1BWP12T U82 ( .A1(N18), .A2(n14), .B(n13), .ZN(n56) );
  AOI21D1BWP12T U83 ( .A1(n39), .A2(n16), .B(n15), .ZN(N20) );
  AO222D1BWP12T U84 ( .A1(n38), .A2(n25), .B1(n23), .B2(i_R_pc_branch[3]), 
        .C1(N20), .C2(n24), .Z(n54) );
  AOI21D1BWP12T U85 ( .A1(n37), .A2(n18), .B(n17), .ZN(N22) );
  AO222D1BWP12T U86 ( .A1(n40), .A2(n25), .B1(n23), .B2(i_R_pc_branch[5]), 
        .C1(N22), .C2(n24), .Z(n52) );
  AOI21D1BWP12T U87 ( .A1(n31), .A2(n20), .B(n19), .ZN(N28) );
  AO222D1BWP12T U88 ( .A1(n59), .A2(n25), .B1(n23), .B2(i_R_pc_branch[11]), 
        .C1(N28), .C2(n24), .Z(n46) );
  AO222D1BWP12T U89 ( .A1(pc[12]), .A2(n25), .B1(n24), .B2(N29), .C1(n23), 
        .C2(i_R_pc_branch[12]), .Z(n45) );
  AOI21D1BWP12T U90 ( .A1(n22), .A2(n36), .B(n21), .ZN(N30) );
  AO222D1BWP12T U91 ( .A1(pc[13]), .A2(n25), .B1(n24), .B2(N30), .C1(n23), 
        .C2(i_R_pc_branch[13]), .Z(n44) );
  AO222D1BWP12T U92 ( .A1(pc[14]), .A2(n25), .B1(n24), .B2(N31), .C1(n23), 
        .C2(i_R_pc_branch[14]), .Z(n43) );
  AO222D1BWP12T U93 ( .A1(pc[15]), .A2(n25), .B1(n24), .B2(N32), .C1(n23), 
        .C2(i_R_pc_branch[15]), .Z(n41) );
  INR2D1BWP12T U94 ( .A1(i_16_data_mem2cpu[4]), .B1(n26), .ZN(
        o_16_data_mem2cpu[12]) );
  INR2D1BWP12T U95 ( .A1(i_16_data_mem2cpu[6]), .B1(n26), .ZN(
        o_16_data_mem2cpu[14]) );
  INR2D1BWP12T U96 ( .A1(i_16_data_mem2cpu[3]), .B1(n26), .ZN(
        o_16_data_mem2cpu[11]) );
  MOAI22D0BWP12T U97 ( .A1(i_1_mem_addr_sel), .A2(N18), .B1(i_1_mem_addr_sel), 
        .B2(i_R_alu_out[1]), .ZN(o_A_addr_cpu2mem[0]) );
  INVD1BWP12T U98 ( .I(pc[2]), .ZN(n27) );
  MOAI22D0BWP12T U99 ( .A1(i_1_mem_addr_sel), .A2(n27), .B1(i_1_mem_addr_sel), 
        .B2(i_R_alu_out[2]), .ZN(o_A_addr_cpu2mem[1]) );
  MOAI22D0BWP12T U100 ( .A1(i_1_mem_addr_sel), .A2(n39), .B1(i_1_mem_addr_sel), 
        .B2(i_R_alu_out[3]), .ZN(o_A_addr_cpu2mem[2]) );
  INVD1BWP12T U101 ( .I(pc[4]), .ZN(n29) );
  MOAI22D0BWP12T U102 ( .A1(i_1_mem_addr_sel), .A2(n29), .B1(i_1_mem_addr_sel), 
        .B2(i_R_alu_out[4]), .ZN(o_A_addr_cpu2mem[3]) );
  MOAI22D0BWP12T U103 ( .A1(i_1_mem_addr_sel), .A2(n37), .B1(i_1_mem_addr_sel), 
        .B2(i_R_alu_out[5]), .ZN(o_A_addr_cpu2mem[4]) );
  INVD1BWP12T U104 ( .I(pc[6]), .ZN(n30) );
  MOAI22D0BWP12T U105 ( .A1(i_1_mem_addr_sel), .A2(n30), .B1(i_1_mem_addr_sel), 
        .B2(i_R_alu_out[6]), .ZN(o_A_addr_cpu2mem[5]) );
  MOAI22D0BWP12T U106 ( .A1(i_1_mem_addr_sel), .A2(n35), .B1(i_1_mem_addr_sel), 
        .B2(i_R_alu_out[7]), .ZN(o_A_addr_cpu2mem[6]) );
  INVD1BWP12T U107 ( .I(pc[8]), .ZN(n32) );
  MOAI22D0BWP12T U108 ( .A1(i_1_mem_addr_sel), .A2(n32), .B1(i_1_mem_addr_sel), 
        .B2(i_R_alu_out[8]), .ZN(o_A_addr_cpu2mem[7]) );
  MOAI22D0BWP12T U109 ( .A1(i_1_mem_addr_sel), .A2(n33), .B1(i_1_mem_addr_sel), 
        .B2(i_R_alu_out[9]), .ZN(o_A_addr_cpu2mem[8]) );
  INVD1BWP12T U110 ( .I(pc[10]), .ZN(n34) );
  MOAI22D0BWP12T U111 ( .A1(i_1_mem_addr_sel), .A2(n34), .B1(i_1_mem_addr_sel), 
        .B2(i_R_alu_out[10]), .ZN(o_A_addr_cpu2mem[9]) );
  MOAI22D0BWP12T U112 ( .A1(i_1_mem_addr_sel), .A2(n31), .B1(i_1_mem_addr_sel), 
        .B2(i_R_alu_out[11]), .ZN(o_A_addr_cpu2mem[10]) );
endmodule


module decode ( decode_in, decoded_opcode, decoded_imm );
  input [15:0] decode_in;
  output [4:0] decoded_opcode;
  output [7:0] decoded_imm;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28;

  ND2D1BWP12T U2 ( .A1(decode_in[11]), .A2(n23), .ZN(n11) );
  OR2XD1BWP12T U3 ( .A1(n26), .A2(n25), .Z(decoded_opcode[4]) );
  MOAI22D0BWP12T U4 ( .A1(n22), .A2(n13), .B1(decode_in[10]), .B2(n12), .ZN(
        n18) );
  INR2D1BWP12T U5 ( .A1(decode_in[12]), .B1(n14), .ZN(n19) );
  NR2D1BWP12T U6 ( .A1(n8), .A2(n10), .ZN(n26) );
  ND2D1BWP12T U7 ( .A1(decode_in[13]), .A2(n6), .ZN(n22) );
  NR2D1BWP12T U8 ( .A1(decode_in[15]), .A2(decode_in[12]), .ZN(n6) );
  INVD1BWP12T U9 ( .I(decode_in[14]), .ZN(n23) );
  NR2D1BWP12T U10 ( .A1(n11), .A2(n22), .ZN(n25) );
  AO211D1BWP12T U11 ( .A1(decode_in[11]), .A2(n21), .B(n19), .C(n18), .Z(
        decoded_opcode[1]) );
  AO22D1BWP12T U12 ( .A1(decode_in[9]), .A2(n25), .B1(decode_in[1]), .B2(n7), 
        .Z(decoded_imm[1]) );
  CKND2D0BWP12T U13 ( .A1(n24), .A2(decode_in[14]), .ZN(n1) );
  CKND0BWP12T U14 ( .I(n17), .ZN(n2) );
  OAI211D0BWP12T U15 ( .A1(n22), .A2(n1), .B(n28), .C(n2), .ZN(
        decoded_opcode[3]) );
  NR3D0BWP12T U16 ( .A1(n20), .A2(n18), .A3(n17), .ZN(n3) );
  OAI31D0BWP12T U17 ( .A1(decode_in[12]), .A2(n14), .A3(n24), .B(n3), .ZN(
        decoded_opcode[0]) );
  CKND0BWP12T U18 ( .I(n12), .ZN(n4) );
  OAI22D0BWP12T U19 ( .A1(n19), .A2(n26), .B1(decode_in[10]), .B2(n4), .ZN(n28) );
  OAI22D0BWP12T U20 ( .A1(decode_in[11]), .A2(decode_in[10]), .B1(n20), .B2(
        n21), .ZN(n5) );
  OAI31D0BWP12T U21 ( .A1(n23), .A2(n22), .A3(n24), .B(n5), .ZN(
        decoded_opcode[2]) );
  ND3D1BWP12T U22 ( .A1(decode_in[13]), .A2(decode_in[15]), .A3(n23), .ZN(n14)
         );
  CKND2D1BWP12T U23 ( .A1(decode_in[14]), .A2(decode_in[15]), .ZN(n8) );
  INVD1BWP12T U24 ( .I(decode_in[13]), .ZN(n9) );
  ND4D1BWP12T U25 ( .A1(decode_in[11]), .A2(decode_in[10]), .A3(decode_in[12]), 
        .A4(n9), .ZN(n10) );
  INR2D1BWP12T U26 ( .A1(n19), .B1(decode_in[11]), .ZN(n12) );
  NR4D0BWP12T U27 ( .A1(decode_in[13]), .A2(decode_in[15]), .A3(decode_in[12]), 
        .A4(n23), .ZN(n21) );
  CKND1BWP12T U28 ( .I(decode_in[11]), .ZN(n24) );
  ND3D0BWP12T U29 ( .A1(decode_in[10]), .A2(n21), .A3(n24), .ZN(n16) );
  ND2D1BWP12T U30 ( .A1(n28), .A2(n16), .ZN(n7) );
  AO22XD1BWP12T U31 ( .A1(decode_in[10]), .A2(n25), .B1(decode_in[2]), .B2(n7), 
        .Z(decoded_imm[2]) );
  AO22XD1BWP12T U32 ( .A1(decode_in[8]), .A2(n25), .B1(decode_in[0]), .B2(n7), 
        .Z(decoded_imm[0]) );
  NR4D0BWP12T U33 ( .A1(decode_in[11]), .A2(decode_in[12]), .A3(n9), .A4(n8), 
        .ZN(n17) );
  NR3D1BWP12T U34 ( .A1(decode_in[14]), .A2(decode_in[15]), .A3(n10), .ZN(n20)
         );
  OAI21D0BWP12T U35 ( .A1(decode_in[11]), .A2(n23), .B(n11), .ZN(n13) );
  CKND0BWP12T U36 ( .I(decode_in[7]), .ZN(n27) );
  CKND0BWP12T U37 ( .I(decode_in[3]), .ZN(n15) );
  TPOAI22D0BWP12T U38 ( .A1(n16), .A2(n27), .B1(n28), .B2(n15), .ZN(
        decoded_imm[3]) );
  INR2D0BWP12T U39 ( .A1(decode_in[4]), .B1(n28), .ZN(decoded_imm[4]) );
  INR2D0BWP12T U40 ( .A1(decode_in[5]), .B1(n28), .ZN(decoded_imm[5]) );
  INR2D0BWP12T U41 ( .A1(decode_in[6]), .B1(n28), .ZN(decoded_imm[6]) );
  NR2D0BWP12T U42 ( .A1(n28), .A2(n27), .ZN(decoded_imm[7]) );
endmodule


module control ( clk, rst, i_5_control_opcode, i_8_control_imm, 
        or_4_fwd_wr_addr_from_cu, or_4_rd1_addr_from_cu, or_1_rd1_addr_sel, 
        or_1_rd2_addr_sel, or_2_fwd_wr_sel, or_1_alu_in2_sel, or_5_alu_control, 
        or_1_branch, or_1_mem_wr_en, or_1_mem2reg_sel, or_1_reg_wr_en, 
        or_1_mem_addr_sel );
  input [4:0] i_5_control_opcode;
  input [7:0] i_8_control_imm;
  output [3:0] or_4_fwd_wr_addr_from_cu;
  output [3:0] or_4_rd1_addr_from_cu;
  output [1:0] or_2_fwd_wr_sel;
  output [4:0] or_5_alu_control;
  input clk, rst;
  output or_1_rd1_addr_sel, or_1_rd2_addr_sel, or_1_alu_in2_sel, or_1_branch,
         or_1_mem_wr_en, or_1_mem2reg_sel, or_1_reg_wr_en, or_1_mem_addr_sel;
  wire   N337, N339, N342, N343, N345, N346, N347, N348, N349, N350, N351,
         N352, N353, N354, N355, N356, N357, N358, N359, N360, N361, N363, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;

  DFQD1BWP12T or_1_reg_wr_en_reg ( .D(N363), .CP(clk), .Q(or_1_reg_wr_en) );
  DFQD1BWP12T or_1_mem_addr_sel_reg ( .D(N337), .CP(clk), .Q(or_1_mem_addr_sel) );
  DFQD1BWP12T or_4_fwd_wr_addr_from_cu_reg_3_ ( .D(N346), .CP(clk), .Q(
        or_4_fwd_wr_addr_from_cu[3]) );
  DFQD1BWP12T or_4_fwd_wr_addr_from_cu_reg_2_ ( .D(N345), .CP(clk), .Q(
        or_4_fwd_wr_addr_from_cu[2]) );
  DFKCNQD1BWP12T or_4_fwd_wr_addr_from_cu_reg_1_ ( .CN(N352), .D(
        i_8_control_imm[1]), .CP(clk), .Q(or_4_fwd_wr_addr_from_cu[1]) );
  DFQD1BWP12T or_4_fwd_wr_addr_from_cu_reg_0_ ( .D(N343), .CP(clk), .Q(
        or_4_fwd_wr_addr_from_cu[0]) );
  DFQD1BWP12T or_4_rd1_addr_from_cu_reg_3_ ( .D(N350), .CP(clk), .Q(
        or_4_rd1_addr_from_cu[3]) );
  DFQD1BWP12T or_4_rd1_addr_from_cu_reg_2_ ( .D(N349), .CP(clk), .Q(
        or_4_rd1_addr_from_cu[2]) );
  DFQD1BWP12T or_4_rd1_addr_from_cu_reg_1_ ( .D(N348), .CP(clk), .Q(
        or_4_rd1_addr_from_cu[1]) );
  DFQD1BWP12T or_4_rd1_addr_from_cu_reg_0_ ( .D(N347), .CP(clk), .Q(
        or_4_rd1_addr_from_cu[0]) );
  DFQD1BWP12T or_1_rd1_addr_sel_reg ( .D(N351), .CP(clk), .Q(or_1_rd1_addr_sel) );
  DFQD1BWP12T or_1_rd2_addr_sel_reg ( .D(N352), .CP(clk), .Q(or_1_rd2_addr_sel) );
  DFQD1BWP12T or_2_fwd_wr_sel_reg_1_ ( .D(N354), .CP(clk), .Q(
        or_2_fwd_wr_sel[1]) );
  DFQD1BWP12T or_2_fwd_wr_sel_reg_0_ ( .D(N353), .CP(clk), .Q(
        or_2_fwd_wr_sel[0]) );
  DFQD1BWP12T or_1_alu_in2_sel_reg ( .D(N355), .CP(clk), .Q(or_1_alu_in2_sel)
         );
  DFQD1BWP12T or_5_alu_control_reg_4_ ( .D(N342), .CP(clk), .Q(
        or_5_alu_control[4]) );
  DFQD1BWP12T or_5_alu_control_reg_3_ ( .D(N359), .CP(clk), .Q(
        or_5_alu_control[3]) );
  DFQD1BWP12T or_5_alu_control_reg_2_ ( .D(N358), .CP(clk), .Q(
        or_5_alu_control[2]) );
  DFQD1BWP12T or_5_alu_control_reg_1_ ( .D(N357), .CP(clk), .Q(
        or_5_alu_control[1]) );
  DFQD1BWP12T or_5_alu_control_reg_0_ ( .D(N356), .CP(clk), .Q(
        or_5_alu_control[0]) );
  DFQD1BWP12T or_1_branch_reg ( .D(N360), .CP(clk), .Q(or_1_branch) );
  DFQD1BWP12T or_1_mem_wr_en_reg ( .D(N361), .CP(clk), .Q(or_1_mem_wr_en) );
  DFKCNQD1BWP12T or_1_mem2reg_sel_reg ( .CN(i_5_control_opcode[2]), .D(N339), 
        .CP(clk), .Q(or_1_mem2reg_sel) );
  INVD1BWP12T U3 ( .I(i_5_control_opcode[1]), .ZN(n7) );
  INVD1BWP12T U4 ( .I(i_5_control_opcode[0]), .ZN(n1) );
  NR2D1BWP12T U5 ( .A1(n10), .A2(i_5_control_opcode[3]), .ZN(n12) );
  ND2D1BWP12T U6 ( .A1(N339), .A2(n1), .ZN(n2) );
  IND2D1BWP12T U7 ( .A1(n2), .B1(n6), .ZN(n15) );
  ND2D1BWP12T U8 ( .A1(n9), .A2(i_5_control_opcode[1]), .ZN(n3) );
  INVD1BWP12T U9 ( .I(i_5_control_opcode[2]), .ZN(n6) );
  NR2D1BWP12T U10 ( .A1(i_5_control_opcode[4]), .A2(i_5_control_opcode[3]), 
        .ZN(n9) );
  INVD1BWP12T U11 ( .I(n3), .ZN(N339) );
  MOAI22D0BWP12T U12 ( .A1(n6), .A2(n2), .B1(n12), .B2(i_8_control_imm[1]), 
        .ZN(N348) );
  INVD1BWP12T U13 ( .I(n5), .ZN(N352) );
  IOA21D0BWP12T U14 ( .A1(n9), .A2(i_5_control_opcode[2]), .B(n4), .ZN(N358)
         );
  CKND2D1BWP12T U15 ( .A1(n9), .A2(i_5_control_opcode[0]), .ZN(n14) );
  OAI31D1BWP12T U16 ( .A1(i_5_control_opcode[2]), .A2(i_5_control_opcode[1]), 
        .A3(n14), .B(n2), .ZN(N350) );
  ND4D1BWP12T U17 ( .A1(n6), .A2(n1), .A3(n7), .A4(i_5_control_opcode[4]), 
        .ZN(n10) );
  OR2D0BWP12T U18 ( .A1(N350), .A2(n12), .Z(N351) );
  ND4D1BWP12T U19 ( .A1(n1), .A2(n7), .A3(n9), .A4(i_5_control_opcode[2]), 
        .ZN(n5) );
  TPND2D0BWP12T U20 ( .A1(n5), .A2(n15), .ZN(N354) );
  AOI22D0BWP12T U21 ( .A1(i_5_control_opcode[2]), .A2(n2), .B1(n14), .B2(n6), 
        .ZN(N353) );
  IND2D1BWP12T U22 ( .A1(i_5_control_opcode[4]), .B1(i_5_control_opcode[3]), 
        .ZN(n8) );
  NR4D0BWP12T U23 ( .A1(i_5_control_opcode[0]), .A2(i_5_control_opcode[2]), 
        .A3(i_5_control_opcode[1]), .A4(n8), .ZN(N361) );
  INVD1BWP12T U24 ( .I(N361), .ZN(n4) );
  TPOAI21D0BWP12T U25 ( .A1(n3), .A2(n6), .B(n4), .ZN(N337) );
  CKND2D1BWP12T U26 ( .A1(n3), .A2(n4), .ZN(N357) );
  OAI31D0BWP12T U27 ( .A1(i_5_control_opcode[2]), .A2(i_5_control_opcode[1]), 
        .A3(n8), .B(n14), .ZN(N356) );
  IND4D1BWP12T U28 ( .A1(n8), .B1(n7), .B2(n6), .B3(i_5_control_opcode[0]), 
        .ZN(n11) );
  TPND2D0BWP12T U29 ( .A1(n10), .A2(n11), .ZN(N360) );
  OA31D0BWP12T U30 ( .A1(i_5_control_opcode[0]), .A2(i_5_control_opcode[2]), 
        .A3(i_5_control_opcode[1]), .B(n9), .Z(N363) );
  INVD1BWP12T U31 ( .I(n10), .ZN(N342) );
  AO21D1BWP12T U32 ( .A1(n12), .A2(i_8_control_imm[2]), .B(N350), .Z(N349) );
  AO21D1BWP12T U33 ( .A1(n12), .A2(i_8_control_imm[0]), .B(N350), .Z(N347) );
  IOA21D1BWP12T U34 ( .A1(N342), .A2(i_5_control_opcode[3]), .B(n11), .ZN(N359) );
  INVD0BWP12T U35 ( .I(n12), .ZN(n13) );
  IND3D1BWP12T U36 ( .A1(N357), .B1(n14), .B2(n13), .ZN(N355) );
  IOA21D1BWP12T U37 ( .A1(N352), .A2(i_8_control_imm[3]), .B(n15), .ZN(N346)
         );
  IOA21D1BWP12T U38 ( .A1(N352), .A2(i_8_control_imm[2]), .B(n15), .ZN(N345)
         );
  IOA21D1BWP12T U39 ( .A1(N352), .A2(i_8_control_imm[0]), .B(n15), .ZN(N343)
         );
endmodule


module decode_control_REG_WIDTH16 ( clk, rst, i_16_data_mem2cpu, i_R_pcplus, 
        i_R_alu_out, i_1_mem2reg_sel, i_4_reg_wr_addr, i_1_reg_wr_en, 
        o_4_fwd_wr_addr_from_cu, o_4_rd1_addr_from_cu, o_1_rd1_addr_sel, 
        o_1_rd2_addr_sel, o_2_fwd_wr_sel, o_1_alu_in2_sel, o_5_alu_control, 
        o_1_branch, o_1_mem_wr_en, o_1_mem2reg_sel, o_1_reg_wr_en, 
        o_1_mem_addr_sel, or_4_rd1_addr1, or_4_rd2_addr1, or_4_rd2_addr2, 
        or_R_wr_data, or_4_reg_wr_addr, or_1_reg_wr_en, or_4_fwd_wr_addr1, 
        or_4_fwd_wr_addr2, or_11_imm, or_R_pcplus );
  input [15:0] i_16_data_mem2cpu;
  input [15:0] i_R_pcplus;
  input [15:0] i_R_alu_out;
  input [3:0] i_4_reg_wr_addr;
  output [3:0] o_4_fwd_wr_addr_from_cu;
  output [3:0] o_4_rd1_addr_from_cu;
  output [1:0] o_2_fwd_wr_sel;
  output [4:0] o_5_alu_control;
  output [3:0] or_4_rd1_addr1;
  output [3:0] or_4_rd2_addr1;
  output [3:0] or_4_rd2_addr2;
  output [15:0] or_R_wr_data;
  output [3:0] or_4_reg_wr_addr;
  output [3:0] or_4_fwd_wr_addr1;
  output [3:0] or_4_fwd_wr_addr2;
  output [10:0] or_11_imm;
  output [15:0] or_R_pcplus;
  input clk, rst, i_1_mem2reg_sel, i_1_reg_wr_en;
  output o_1_rd1_addr_sel, o_1_rd2_addr_sel, o_1_alu_in2_sel, o_1_branch,
         o_1_mem_wr_en, o_1_mem2reg_sel, o_1_reg_wr_en, o_1_mem_addr_sel,
         or_1_reg_wr_en;
  wire   N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43, N44, N45, N46,
         N47, N48, n1, n2, n19;
  wire   [15:0] w_16_data_mem2cpu;
  wire   [4:0] w_5_decoded_opcode;
  wire   [7:0] w_8_decoded_imm;

  decode u_decode ( .decode_in(w_16_data_mem2cpu), .decoded_opcode(
        w_5_decoded_opcode), .decoded_imm(w_8_decoded_imm) );
  control u_control ( .clk(clk), .rst(rst), .i_5_control_opcode(
        w_5_decoded_opcode), .i_8_control_imm(w_8_decoded_imm), 
        .or_4_fwd_wr_addr_from_cu(o_4_fwd_wr_addr_from_cu), 
        .or_4_rd1_addr_from_cu(o_4_rd1_addr_from_cu), .or_1_rd1_addr_sel(
        o_1_rd1_addr_sel), .or_1_rd2_addr_sel(o_1_rd2_addr_sel), 
        .or_2_fwd_wr_sel(o_2_fwd_wr_sel), .or_1_alu_in2_sel(o_1_alu_in2_sel), 
        .or_5_alu_control(o_5_alu_control), .or_1_branch(o_1_branch), 
        .or_1_mem_wr_en(o_1_mem_wr_en), .or_1_mem2reg_sel(o_1_mem2reg_sel), 
        .or_1_reg_wr_en(o_1_reg_wr_en), .or_1_mem_addr_sel(o_1_mem_addr_sel)
         );
  DFKCNQD1BWP12T or_R_pcplus_reg_15_ ( .CN(n19), .D(i_R_pcplus[15]), .CP(clk), 
        .Q(or_R_pcplus[15]) );
  DFKCNQD1BWP12T or_R_pcplus_reg_14_ ( .CN(n19), .D(i_R_pcplus[14]), .CP(clk), 
        .Q(or_R_pcplus[14]) );
  DFKCNQD1BWP12T or_R_pcplus_reg_13_ ( .CN(n19), .D(i_R_pcplus[13]), .CP(clk), 
        .Q(or_R_pcplus[13]) );
  DFKCNQD1BWP12T or_R_pcplus_reg_12_ ( .CN(n19), .D(i_R_pcplus[12]), .CP(clk), 
        .Q(or_R_pcplus[12]) );
  DFKCNQD1BWP12T or_R_pcplus_reg_11_ ( .CN(n19), .D(i_R_pcplus[11]), .CP(clk), 
        .Q(or_R_pcplus[11]) );
  DFKCNQD1BWP12T or_R_pcplus_reg_10_ ( .CN(n19), .D(i_R_pcplus[10]), .CP(clk), 
        .Q(or_R_pcplus[10]) );
  DFKCNQD1BWP12T or_R_pcplus_reg_9_ ( .CN(n19), .D(i_R_pcplus[9]), .CP(clk), 
        .Q(or_R_pcplus[9]) );
  DFKCNQD1BWP12T or_R_pcplus_reg_8_ ( .CN(n19), .D(i_R_pcplus[8]), .CP(clk), 
        .Q(or_R_pcplus[8]) );
  DFKCNQD1BWP12T or_R_pcplus_reg_7_ ( .CN(n19), .D(i_R_pcplus[7]), .CP(clk), 
        .Q(or_R_pcplus[7]) );
  DFKCNQD1BWP12T or_R_pcplus_reg_6_ ( .CN(n19), .D(i_R_pcplus[6]), .CP(clk), 
        .Q(or_R_pcplus[6]) );
  DFKCNQD1BWP12T or_R_pcplus_reg_5_ ( .CN(n19), .D(i_R_pcplus[5]), .CP(clk), 
        .Q(or_R_pcplus[5]) );
  DFKCNQD1BWP12T or_R_pcplus_reg_4_ ( .CN(n19), .D(i_R_pcplus[4]), .CP(clk), 
        .Q(or_R_pcplus[4]) );
  DFKCNQD1BWP12T or_R_pcplus_reg_3_ ( .CN(n19), .D(i_R_pcplus[3]), .CP(clk), 
        .Q(or_R_pcplus[3]) );
  DFKCNQD1BWP12T or_R_pcplus_reg_2_ ( .CN(n19), .D(i_R_pcplus[2]), .CP(clk), 
        .Q(or_R_pcplus[2]) );
  DFKCNQD1BWP12T or_R_pcplus_reg_1_ ( .CN(n19), .D(i_R_pcplus[1]), .CP(clk), 
        .Q(or_R_pcplus[1]) );
  DFKCNQD1BWP12T or_R_pcplus_reg_0_ ( .CN(n19), .D(i_R_pcplus[0]), .CP(clk), 
        .Q(or_R_pcplus[0]) );
  DFQD1BWP12T or_R_wr_data_reg_15_ ( .D(N48), .CP(clk), .Q(or_R_wr_data[15])
         );
  DFQD1BWP12T or_R_wr_data_reg_14_ ( .D(N47), .CP(clk), .Q(or_R_wr_data[14])
         );
  DFQD1BWP12T or_R_wr_data_reg_13_ ( .D(N46), .CP(clk), .Q(or_R_wr_data[13])
         );
  DFQD1BWP12T or_R_wr_data_reg_12_ ( .D(N45), .CP(clk), .Q(or_R_wr_data[12])
         );
  DFQD1BWP12T or_R_wr_data_reg_11_ ( .D(N44), .CP(clk), .Q(or_R_wr_data[11])
         );
  DFQD1BWP12T or_R_wr_data_reg_10_ ( .D(N43), .CP(clk), .Q(or_R_wr_data[10])
         );
  DFQD1BWP12T or_R_wr_data_reg_9_ ( .D(N42), .CP(clk), .Q(or_R_wr_data[9]) );
  DFQD1BWP12T or_R_wr_data_reg_8_ ( .D(N41), .CP(clk), .Q(or_R_wr_data[8]) );
  DFQD1BWP12T or_R_wr_data_reg_7_ ( .D(N40), .CP(clk), .Q(or_R_wr_data[7]) );
  DFQD1BWP12T or_R_wr_data_reg_6_ ( .D(N39), .CP(clk), .Q(or_R_wr_data[6]) );
  DFQD1BWP12T or_R_wr_data_reg_5_ ( .D(N38), .CP(clk), .Q(or_R_wr_data[5]) );
  DFQD1BWP12T or_R_wr_data_reg_4_ ( .D(N37), .CP(clk), .Q(or_R_wr_data[4]) );
  DFQD1BWP12T or_R_wr_data_reg_3_ ( .D(N36), .CP(clk), .Q(or_R_wr_data[3]) );
  DFQD1BWP12T or_R_wr_data_reg_2_ ( .D(N35), .CP(clk), .Q(or_R_wr_data[2]) );
  DFQD1BWP12T or_R_wr_data_reg_1_ ( .D(N34), .CP(clk), .Q(or_R_wr_data[1]) );
  DFQD1BWP12T or_R_wr_data_reg_0_ ( .D(N33), .CP(clk), .Q(or_R_wr_data[0]) );
  DFKCNQD1BWP12T or_4_reg_wr_addr_reg_3_ ( .CN(n19), .D(i_4_reg_wr_addr[3]), 
        .CP(clk), .Q(or_4_reg_wr_addr[3]) );
  DFKCNQD1BWP12T or_4_reg_wr_addr_reg_2_ ( .CN(n19), .D(i_4_reg_wr_addr[2]), 
        .CP(clk), .Q(or_4_reg_wr_addr[2]) );
  DFKCNQD1BWP12T or_4_reg_wr_addr_reg_1_ ( .CN(n19), .D(i_4_reg_wr_addr[1]), 
        .CP(clk), .Q(or_4_reg_wr_addr[1]) );
  DFKCNQD1BWP12T or_4_reg_wr_addr_reg_0_ ( .CN(n19), .D(i_4_reg_wr_addr[0]), 
        .CP(clk), .Q(or_4_reg_wr_addr[0]) );
  DFKCNQD1BWP12T or_1_reg_wr_en_reg ( .CN(n19), .D(i_1_reg_wr_en), .CP(clk), 
        .Q(or_1_reg_wr_en) );
  DFKCNQD1BWP12T or_11_imm_reg_10_ ( .CN(w_16_data_mem2cpu[10]), .D(n19), .CP(
        clk), .Q(or_4_fwd_wr_addr2[2]) );
  DFKCNQD1BWP12T or_11_imm_reg_9_ ( .CN(w_16_data_mem2cpu[9]), .D(n19), .CP(
        clk), .Q(or_4_fwd_wr_addr2[1]) );
  DFKCNQD1BWP12T or_11_imm_reg_8_ ( .CN(w_16_data_mem2cpu[8]), .D(n19), .CP(
        clk), .Q(or_4_fwd_wr_addr2[0]) );
  DFKCNQD1BWP12T or_11_imm_reg_7_ ( .CN(w_16_data_mem2cpu[7]), .D(n19), .CP(
        clk), .Q(or_11_imm[7]) );
  DFKCNQD1BWP12T or_11_imm_reg_6_ ( .CN(w_16_data_mem2cpu[6]), .D(n19), .CP(
        clk), .Q(or_4_rd2_addr1[3]) );
  DFKCNQD1BWP12T or_11_imm_reg_5_ ( .CN(w_16_data_mem2cpu[5]), .D(n19), .CP(
        clk), .Q(or_4_rd1_addr1[2]) );
  DFKCNQD1BWP12T or_11_imm_reg_4_ ( .CN(w_16_data_mem2cpu[4]), .D(n19), .CP(
        clk), .Q(or_4_rd2_addr1[1]) );
  DFKCNQD1BWP12T or_11_imm_reg_3_ ( .CN(w_16_data_mem2cpu[3]), .D(n19), .CP(
        clk), .Q(or_4_rd1_addr1[0]) );
  DFKCNQD1BWP12T or_11_imm_reg_2_ ( .CN(w_16_data_mem2cpu[2]), .D(n19), .CP(
        clk), .Q(or_4_rd2_addr2[2]) );
  DFKCNQD1BWP12T or_11_imm_reg_1_ ( .CN(w_16_data_mem2cpu[1]), .D(n19), .CP(
        clk), .Q(or_4_rd2_addr2[1]) );
  DFKCNQD1BWP12T or_11_imm_reg_0_ ( .CN(w_16_data_mem2cpu[0]), .D(n19), .CP(
        clk), .Q(or_4_rd2_addr2[0]) );
  CKBD1BWP12T U3 ( .I(or_4_rd1_addr1[0]), .Z(or_4_rd2_addr1[0]) );
  CKBD1BWP12T U4 ( .I(or_4_rd1_addr1[2]), .Z(or_4_rd2_addr1[2]) );
  CKBD1BWP12T U5 ( .I(or_4_rd2_addr1[1]), .Z(or_4_rd1_addr1[1]) );
  INR2D1BWP12T U6 ( .A1(i_16_data_mem2cpu[12]), .B1(i_1_mem2reg_sel), .ZN(
        w_16_data_mem2cpu[12]) );
  INR2D1BWP12T U7 ( .A1(i_16_data_mem2cpu[11]), .B1(i_1_mem2reg_sel), .ZN(
        w_16_data_mem2cpu[11]) );
  NR2D1BWP12T U8 ( .A1(rst), .A2(i_1_mem2reg_sel), .ZN(n1) );
  CKBD1BWP12T U9 ( .I(or_4_rd2_addr2[0]), .Z(or_11_imm[0]) );
  CKBD1BWP12T U10 ( .I(or_4_rd2_addr2[2]), .Z(or_11_imm[2]) );
  CKBD1BWP12T U11 ( .I(or_4_fwd_wr_addr2[0]), .Z(or_11_imm[8]) );
  CKBD1BWP12T U12 ( .I(or_4_fwd_wr_addr2[1]), .Z(or_11_imm[9]) );
  CKBD1BWP12T U13 ( .I(or_4_fwd_wr_addr2[2]), .Z(or_11_imm[10]) );
  INR2D0BWP12T U14 ( .A1(i_16_data_mem2cpu[7]), .B1(i_1_mem2reg_sel), .ZN(
        w_16_data_mem2cpu[7]) );
  INR2D0BWP12T U15 ( .A1(i_16_data_mem2cpu[8]), .B1(i_1_mem2reg_sel), .ZN(
        w_16_data_mem2cpu[8]) );
  INR2D0BWP12T U16 ( .A1(i_16_data_mem2cpu[6]), .B1(i_1_mem2reg_sel), .ZN(
        w_16_data_mem2cpu[6]) );
  INR2D0BWP12T U17 ( .A1(i_16_data_mem2cpu[9]), .B1(i_1_mem2reg_sel), .ZN(
        w_16_data_mem2cpu[9]) );
  INR2D0BWP12T U18 ( .A1(i_16_data_mem2cpu[5]), .B1(i_1_mem2reg_sel), .ZN(
        w_16_data_mem2cpu[5]) );
  INR2D0BWP12T U19 ( .A1(i_16_data_mem2cpu[4]), .B1(i_1_mem2reg_sel), .ZN(
        w_16_data_mem2cpu[4]) );
  INR2D0BWP12T U20 ( .A1(i_16_data_mem2cpu[3]), .B1(i_1_mem2reg_sel), .ZN(
        w_16_data_mem2cpu[3]) );
  CKND1BWP12T U21 ( .I(rst), .ZN(n19) );
  AN2XD1BWP12T U22 ( .A1(i_1_mem2reg_sel), .A2(n19), .Z(n2) );
  AO22XD1BWP12T U23 ( .A1(i_16_data_mem2cpu[0]), .A2(n2), .B1(n1), .B2(
        i_R_alu_out[0]), .Z(N33) );
  INR2D0BWP12T U24 ( .A1(i_16_data_mem2cpu[2]), .B1(i_1_mem2reg_sel), .ZN(
        w_16_data_mem2cpu[2]) );
  INR2D0BWP12T U25 ( .A1(i_16_data_mem2cpu[1]), .B1(i_1_mem2reg_sel), .ZN(
        w_16_data_mem2cpu[1]) );
  AO22XD1BWP12T U26 ( .A1(n2), .A2(i_16_data_mem2cpu[1]), .B1(n1), .B2(
        i_R_alu_out[1]), .Z(N34) );
  INR2D0BWP12T U27 ( .A1(i_16_data_mem2cpu[0]), .B1(i_1_mem2reg_sel), .ZN(
        w_16_data_mem2cpu[0]) );
  AO22XD1BWP12T U28 ( .A1(n2), .A2(i_16_data_mem2cpu[3]), .B1(n1), .B2(
        i_R_alu_out[3]), .Z(N36) );
  AO22XD1BWP12T U29 ( .A1(n2), .A2(i_16_data_mem2cpu[4]), .B1(n1), .B2(
        i_R_alu_out[4]), .Z(N37) );
  AO22XD1BWP12T U30 ( .A1(n2), .A2(i_16_data_mem2cpu[5]), .B1(n1), .B2(
        i_R_alu_out[5]), .Z(N38) );
  AO22XD1BWP12T U31 ( .A1(n2), .A2(i_16_data_mem2cpu[6]), .B1(n1), .B2(
        i_R_alu_out[6]), .Z(N39) );
  AO22XD1BWP12T U32 ( .A1(n2), .A2(i_16_data_mem2cpu[7]), .B1(n1), .B2(
        i_R_alu_out[7]), .Z(N40) );
  AO22XD1BWP12T U33 ( .A1(n2), .A2(i_16_data_mem2cpu[8]), .B1(n1), .B2(
        i_R_alu_out[8]), .Z(N41) );
  AO22XD1BWP12T U34 ( .A1(n2), .A2(i_16_data_mem2cpu[9]), .B1(n1), .B2(
        i_R_alu_out[9]), .Z(N42) );
  AO22XD0BWP12T U35 ( .A1(n2), .A2(i_16_data_mem2cpu[10]), .B1(n1), .B2(
        i_R_alu_out[10]), .Z(N43) );
  AO22XD0BWP12T U36 ( .A1(n2), .A2(i_16_data_mem2cpu[11]), .B1(n1), .B2(
        i_R_alu_out[11]), .Z(N44) );
  AO22D0BWP12T U37 ( .A1(n2), .A2(i_16_data_mem2cpu[12]), .B1(n1), .B2(
        i_R_alu_out[12]), .Z(N45) );
  AO22XD0BWP12T U38 ( .A1(n2), .A2(i_16_data_mem2cpu[13]), .B1(n1), .B2(
        i_R_alu_out[13]), .Z(N46) );
  AO22D0BWP12T U39 ( .A1(n2), .A2(i_16_data_mem2cpu[14]), .B1(n1), .B2(
        i_R_alu_out[14]), .Z(N47) );
  AO22D0BWP12T U40 ( .A1(n2), .A2(i_16_data_mem2cpu[15]), .B1(n1), .B2(
        i_R_alu_out[15]), .Z(N48) );
  AO22XD1BWP12T U41 ( .A1(n2), .A2(i_16_data_mem2cpu[2]), .B1(n1), .B2(
        i_R_alu_out[2]), .Z(N35) );
  BUFFXD0BWP12T U42 ( .I(or_4_rd2_addr2[1]), .Z(or_4_fwd_wr_addr1[1]) );
  BUFFD1BWP12T U43 ( .I(or_4_rd2_addr2[1]), .Z(or_11_imm[1]) );
  BUFFD1BWP12T U44 ( .I(or_4_rd1_addr1[0]), .Z(or_11_imm[3]) );
  BUFFD1BWP12T U45 ( .I(or_4_rd2_addr1[1]), .Z(or_11_imm[4]) );
  BUFFD1BWP12T U46 ( .I(or_4_rd1_addr1[2]), .Z(or_11_imm[5]) );
  BUFFD1BWP12T U47 ( .I(or_4_rd2_addr1[3]), .Z(or_11_imm[6]) );
  CKBD0BWP12T U48 ( .I(or_4_rd2_addr2[2]), .Z(or_4_fwd_wr_addr1[2]) );
  CKBD0BWP12T U49 ( .I(or_4_rd2_addr2[0]), .Z(or_4_fwd_wr_addr1[0]) );
  INR2D1BWP12T U50 ( .A1(i_16_data_mem2cpu[10]), .B1(i_1_mem2reg_sel), .ZN(
        w_16_data_mem2cpu[10]) );
  INR2D1BWP12T U51 ( .A1(i_16_data_mem2cpu[15]), .B1(i_1_mem2reg_sel), .ZN(
        w_16_data_mem2cpu[15]) );
  INR2D1BWP12T U52 ( .A1(i_16_data_mem2cpu[13]), .B1(i_1_mem2reg_sel), .ZN(
        w_16_data_mem2cpu[13]) );
  INR2D1BWP12T U53 ( .A1(i_16_data_mem2cpu[14]), .B1(i_1_mem2reg_sel), .ZN(
        w_16_data_mem2cpu[14]) );
endmodule


module registers_REG_WIDTH16 ( clk, rst, i_4_rd1_addr, i_4_rd2_addr, 
        i_4_wr_addr, i_R_wr_data, i_1_reg_wr_en, i_R_pcplus, or_R_rd1_data, 
        or_R_rd2_data );
  input [3:0] i_4_rd1_addr;
  input [3:0] i_4_rd2_addr;
  input [3:0] i_4_wr_addr;
  input [15:0] i_R_wr_data;
  input [15:0] i_R_pcplus;
  output [15:0] or_R_rd1_data;
  output [15:0] or_R_rd2_data;
  input clk, rst, i_1_reg_wr_en;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n572, n573, n574, n575, n576, n577, n578, n579, n580, n581, n582,
         n583, n584, n585, n587, n666, n667, n668, n669, n670, n671, n672,
         n673, n674, n675, n676, n677, n678, n679, n680, n681, n682, n683,
         n684, n685, n686, n687, n688, n689, n690, n691, n692, n693, n694,
         n695, n696, n697, n698, n699, n700, n701, n702, n703, n704, n705,
         n706, n707, n708, n709, n710, n711, n712, n713, n714, n715, n716,
         n717, n718, n719, n720, n721, n722, n723, n724, n725, n726, n727,
         n728, n729, n730, n731, n732, n733, n734, n735, n736, n737, n738,
         n739, n740, n741, n742, n743, n744, n745, n746, n747, n748, n749,
         n750, n751, n752, n753, n754, n755, n756, n757, n758, n759, n760,
         n761, n762, n763, n764, n765, n766, n767, n768, n769, n770, n771,
         n772, n773, n774, n775, n776, n777, n778, n779, n780, n781, n782,
         n783, n784, n785, n786, n787, n788, n789, n790, n791, n792, n793,
         n794, n795, n796, n797, n798, n799, n800, n801, n802, n803, n804,
         n805, n806, n807, n808, n809, n810, n811, n812, n813, n814, n815,
         n816, n817, n818, n819, n820, n821, n822, n823, n824, n825, n826,
         n827, n828, n829, n830, n831, n832, n833, n834, n835, n836, n837,
         n838, n839, n840, n841, n842, n843, n844, n845, n846, n847, n848,
         n849, n850, n851, n852, n853, n854, n855, n856, n857, n858, n859,
         n860, n861, n862, n863, n864, n865, n866, n867, n868, n869, n870,
         n871, n872, n873, n874, n875, n876, n877, n878, n879, n880, n881,
         n882, n883, n884, n885, n886, n887, n888, n889, n890, n891, n892,
         n893, n894, n895, n896, n897, n898, n899, n900, n901, n902, n903,
         n904, n905, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n255, n256, n257, n258, n259, n260, n261, n262, n263,
         n264, n265, n266, n267, n268, n269, n270, n271, n272, n273, n274,
         n275, n276, n277, n278, n279, n280, n281, n282, n283, n284, n285,
         n286, n287, n288, n289, n290, n291, n292, n293, n294, n295, n296,
         n297, n298, n299, n300, n301, n302, n303, n304, n305, n306, n307,
         n308, n309, n310, n311, n312, n313, n314, n315, n316, n317, n318,
         n319, n320, n321, n322, n323, n324, n325, n326, n327, n328, n329,
         n330, n331, n332, n333, n334, n335, n336, n337, n338, n339, n340,
         n341, n342, n343, n344, n345, n346, n347, n348, n349, n350, n351,
         n352, n353, n354, n355, n356, n357, n358, n359, n360, n361, n362,
         n363, n364, n365, n366, n367, n368, n369, n370, n371, n372, n373,
         n374, n375, n376, n377, n378, n379, n380, n381, n382, n383, n384,
         n385, n386, n387, n388, n389, n390, n391, n392, n393, n394, n395,
         n396, n397, n398, n399, n400, n401, n402, n403, n404, n405, n406,
         n407, n408, n409, n410, n411, n412, n413, n414, n415, n416, n417,
         n418, n419, n420, n421, n422, n423, n424, n425, n426, n427, n428,
         n429, n430, n431, n432, n433, n434, n435, n436, n437, n438, n439,
         n440, n441, n442, n443, n444, n445, n446, n447, n448, n449, n450,
         n451, n452, n453, n454, n455, n456, n457, n458, n459, n460, n461,
         n462, n463, n464, n465, n466, n467, n468, n469, n470, n471, n472,
         n473, n474, n475, n476, n477, n478, n479, n480, n481, n482, n483;
  wire   [223:0] reg_array;

  DFQD1BWP12T reg_array_reg_14__15_ ( .D(n905), .CP(clk), .Q(reg_array[223])
         );
  DFQD1BWP12T reg_array_reg_14__14_ ( .D(n904), .CP(clk), .Q(reg_array[222])
         );
  DFQD1BWP12T reg_array_reg_14__13_ ( .D(n903), .CP(clk), .Q(reg_array[221])
         );
  DFQD1BWP12T reg_array_reg_14__12_ ( .D(n902), .CP(clk), .Q(reg_array[220])
         );
  DFQD1BWP12T reg_array_reg_14__11_ ( .D(n901), .CP(clk), .Q(reg_array[219])
         );
  DFQD1BWP12T reg_array_reg_14__10_ ( .D(n900), .CP(clk), .Q(reg_array[218])
         );
  DFQD1BWP12T reg_array_reg_14__9_ ( .D(n899), .CP(clk), .Q(reg_array[217]) );
  DFQD1BWP12T reg_array_reg_14__8_ ( .D(n898), .CP(clk), .Q(reg_array[216]) );
  DFQD1BWP12T reg_array_reg_14__7_ ( .D(n897), .CP(clk), .Q(reg_array[215]) );
  DFQD1BWP12T reg_array_reg_14__6_ ( .D(n896), .CP(clk), .Q(reg_array[214]) );
  DFQD1BWP12T reg_array_reg_14__5_ ( .D(n895), .CP(clk), .Q(reg_array[213]) );
  DFQD1BWP12T reg_array_reg_14__4_ ( .D(n894), .CP(clk), .Q(reg_array[212]) );
  DFQD1BWP12T reg_array_reg_14__3_ ( .D(n893), .CP(clk), .Q(reg_array[211]) );
  DFQD1BWP12T reg_array_reg_14__2_ ( .D(n892), .CP(clk), .Q(reg_array[210]) );
  DFQD1BWP12T reg_array_reg_14__1_ ( .D(n891), .CP(clk), .Q(reg_array[209]) );
  DFQD1BWP12T reg_array_reg_14__0_ ( .D(n890), .CP(clk), .Q(reg_array[208]) );
  DFQD1BWP12T reg_array_reg_13__15_ ( .D(n889), .CP(clk), .Q(reg_array[207])
         );
  DFQD1BWP12T reg_array_reg_13__14_ ( .D(n888), .CP(clk), .Q(reg_array[206])
         );
  DFQD1BWP12T reg_array_reg_13__13_ ( .D(n887), .CP(clk), .Q(reg_array[205])
         );
  DFQD1BWP12T reg_array_reg_13__12_ ( .D(n886), .CP(clk), .Q(reg_array[204])
         );
  DFQD1BWP12T reg_array_reg_13__11_ ( .D(n885), .CP(clk), .Q(reg_array[203])
         );
  DFQD1BWP12T reg_array_reg_13__10_ ( .D(n884), .CP(clk), .Q(reg_array[202])
         );
  DFQD1BWP12T reg_array_reg_13__9_ ( .D(n883), .CP(clk), .Q(reg_array[201]) );
  DFQD1BWP12T reg_array_reg_13__8_ ( .D(n882), .CP(clk), .Q(reg_array[200]) );
  DFQD1BWP12T reg_array_reg_13__7_ ( .D(n881), .CP(clk), .Q(reg_array[199]) );
  DFQD1BWP12T reg_array_reg_13__6_ ( .D(n880), .CP(clk), .Q(reg_array[198]) );
  DFQD1BWP12T reg_array_reg_13__5_ ( .D(n879), .CP(clk), .Q(reg_array[197]) );
  DFQD1BWP12T reg_array_reg_13__4_ ( .D(n878), .CP(clk), .Q(reg_array[196]) );
  DFQD1BWP12T reg_array_reg_13__3_ ( .D(n877), .CP(clk), .Q(reg_array[195]) );
  DFQD1BWP12T reg_array_reg_13__2_ ( .D(n876), .CP(clk), .Q(reg_array[194]) );
  DFQD1BWP12T reg_array_reg_13__1_ ( .D(n875), .CP(clk), .Q(reg_array[193]) );
  DFQD1BWP12T reg_array_reg_13__0_ ( .D(n874), .CP(clk), .Q(reg_array[192]) );
  DFQD1BWP12T reg_array_reg_12__15_ ( .D(n873), .CP(clk), .Q(reg_array[191])
         );
  DFQD1BWP12T reg_array_reg_12__14_ ( .D(n872), .CP(clk), .Q(reg_array[190])
         );
  DFQD1BWP12T reg_array_reg_12__13_ ( .D(n871), .CP(clk), .Q(reg_array[189])
         );
  DFQD1BWP12T reg_array_reg_12__12_ ( .D(n870), .CP(clk), .Q(reg_array[188])
         );
  DFQD1BWP12T reg_array_reg_12__11_ ( .D(n869), .CP(clk), .Q(reg_array[187])
         );
  DFQD1BWP12T reg_array_reg_12__10_ ( .D(n868), .CP(clk), .Q(reg_array[186])
         );
  DFQD1BWP12T reg_array_reg_12__9_ ( .D(n867), .CP(clk), .Q(reg_array[185]) );
  DFQD1BWP12T reg_array_reg_12__8_ ( .D(n866), .CP(clk), .Q(reg_array[184]) );
  DFQD1BWP12T reg_array_reg_12__7_ ( .D(n865), .CP(clk), .Q(reg_array[183]) );
  DFQD1BWP12T reg_array_reg_12__6_ ( .D(n864), .CP(clk), .Q(reg_array[182]) );
  DFQD1BWP12T reg_array_reg_12__5_ ( .D(n863), .CP(clk), .Q(reg_array[181]) );
  DFQD1BWP12T reg_array_reg_12__4_ ( .D(n862), .CP(clk), .Q(reg_array[180]) );
  DFQD1BWP12T reg_array_reg_12__3_ ( .D(n861), .CP(clk), .Q(reg_array[179]) );
  DFQD1BWP12T reg_array_reg_12__2_ ( .D(n860), .CP(clk), .Q(reg_array[178]) );
  DFQD1BWP12T reg_array_reg_12__1_ ( .D(n859), .CP(clk), .Q(reg_array[177]) );
  DFQD1BWP12T reg_array_reg_12__0_ ( .D(n858), .CP(clk), .Q(reg_array[176]) );
  DFQD1BWP12T reg_array_reg_11__15_ ( .D(n857), .CP(clk), .Q(reg_array[175])
         );
  DFQD1BWP12T reg_array_reg_11__14_ ( .D(n856), .CP(clk), .Q(reg_array[174])
         );
  DFQD1BWP12T reg_array_reg_11__13_ ( .D(n855), .CP(clk), .Q(reg_array[173])
         );
  DFQD1BWP12T reg_array_reg_11__12_ ( .D(n854), .CP(clk), .Q(reg_array[172])
         );
  DFQD1BWP12T reg_array_reg_11__11_ ( .D(n853), .CP(clk), .Q(reg_array[171])
         );
  DFQD1BWP12T reg_array_reg_11__10_ ( .D(n852), .CP(clk), .Q(reg_array[170])
         );
  DFQD1BWP12T reg_array_reg_11__9_ ( .D(n851), .CP(clk), .Q(reg_array[169]) );
  DFQD1BWP12T reg_array_reg_11__8_ ( .D(n850), .CP(clk), .Q(reg_array[168]) );
  DFQD1BWP12T reg_array_reg_11__7_ ( .D(n849), .CP(clk), .Q(reg_array[167]) );
  DFQD1BWP12T reg_array_reg_11__6_ ( .D(n848), .CP(clk), .Q(reg_array[166]) );
  DFQD1BWP12T reg_array_reg_11__5_ ( .D(n847), .CP(clk), .Q(reg_array[165]) );
  DFQD1BWP12T reg_array_reg_11__4_ ( .D(n846), .CP(clk), .Q(reg_array[164]) );
  DFQD1BWP12T reg_array_reg_11__3_ ( .D(n845), .CP(clk), .Q(reg_array[163]) );
  DFQD1BWP12T reg_array_reg_11__2_ ( .D(n844), .CP(clk), .Q(reg_array[162]) );
  DFQD1BWP12T reg_array_reg_11__1_ ( .D(n843), .CP(clk), .Q(reg_array[161]) );
  DFQD1BWP12T reg_array_reg_11__0_ ( .D(n842), .CP(clk), .Q(reg_array[160]) );
  DFQD1BWP12T reg_array_reg_10__15_ ( .D(n841), .CP(clk), .Q(reg_array[159])
         );
  DFQD1BWP12T reg_array_reg_10__14_ ( .D(n840), .CP(clk), .Q(reg_array[158])
         );
  DFQD1BWP12T reg_array_reg_10__13_ ( .D(n839), .CP(clk), .Q(reg_array[157])
         );
  DFQD1BWP12T reg_array_reg_10__12_ ( .D(n838), .CP(clk), .Q(reg_array[156])
         );
  DFQD1BWP12T reg_array_reg_10__11_ ( .D(n837), .CP(clk), .Q(reg_array[155])
         );
  DFQD1BWP12T reg_array_reg_10__10_ ( .D(n836), .CP(clk), .Q(reg_array[154])
         );
  DFQD1BWP12T reg_array_reg_10__9_ ( .D(n835), .CP(clk), .Q(reg_array[153]) );
  DFQD1BWP12T reg_array_reg_10__8_ ( .D(n834), .CP(clk), .Q(reg_array[152]) );
  DFQD1BWP12T reg_array_reg_10__7_ ( .D(n833), .CP(clk), .Q(reg_array[151]) );
  DFQD1BWP12T reg_array_reg_10__6_ ( .D(n832), .CP(clk), .Q(reg_array[150]) );
  DFQD1BWP12T reg_array_reg_10__5_ ( .D(n831), .CP(clk), .Q(reg_array[149]) );
  DFQD1BWP12T reg_array_reg_10__4_ ( .D(n830), .CP(clk), .Q(reg_array[148]) );
  DFQD1BWP12T reg_array_reg_10__3_ ( .D(n829), .CP(clk), .Q(reg_array[147]) );
  DFQD1BWP12T reg_array_reg_10__2_ ( .D(n828), .CP(clk), .Q(reg_array[146]) );
  DFQD1BWP12T reg_array_reg_10__1_ ( .D(n827), .CP(clk), .Q(reg_array[145]) );
  DFQD1BWP12T reg_array_reg_10__0_ ( .D(n826), .CP(clk), .Q(reg_array[144]) );
  DFQD1BWP12T reg_array_reg_9__15_ ( .D(n825), .CP(clk), .Q(reg_array[143]) );
  DFQD1BWP12T reg_array_reg_9__14_ ( .D(n824), .CP(clk), .Q(reg_array[142]) );
  DFQD1BWP12T reg_array_reg_9__13_ ( .D(n823), .CP(clk), .Q(reg_array[141]) );
  DFQD1BWP12T reg_array_reg_9__12_ ( .D(n822), .CP(clk), .Q(reg_array[140]) );
  DFQD1BWP12T reg_array_reg_9__11_ ( .D(n821), .CP(clk), .Q(reg_array[139]) );
  DFQD1BWP12T reg_array_reg_9__10_ ( .D(n820), .CP(clk), .Q(reg_array[138]) );
  DFQD1BWP12T reg_array_reg_9__9_ ( .D(n819), .CP(clk), .Q(reg_array[137]) );
  DFQD1BWP12T reg_array_reg_9__8_ ( .D(n818), .CP(clk), .Q(reg_array[136]) );
  DFQD1BWP12T reg_array_reg_9__7_ ( .D(n817), .CP(clk), .Q(reg_array[135]) );
  DFQD1BWP12T reg_array_reg_9__6_ ( .D(n816), .CP(clk), .Q(reg_array[134]) );
  DFQD1BWP12T reg_array_reg_9__5_ ( .D(n815), .CP(clk), .Q(reg_array[133]) );
  DFQD1BWP12T reg_array_reg_9__4_ ( .D(n814), .CP(clk), .Q(reg_array[132]) );
  DFQD1BWP12T reg_array_reg_9__3_ ( .D(n813), .CP(clk), .Q(reg_array[131]) );
  DFQD1BWP12T reg_array_reg_9__2_ ( .D(n812), .CP(clk), .Q(reg_array[130]) );
  DFQD1BWP12T reg_array_reg_9__1_ ( .D(n811), .CP(clk), .Q(reg_array[129]) );
  DFQD1BWP12T reg_array_reg_9__0_ ( .D(n810), .CP(clk), .Q(reg_array[128]) );
  DFQD1BWP12T reg_array_reg_8__15_ ( .D(n809), .CP(clk), .Q(reg_array[127]) );
  DFQD1BWP12T reg_array_reg_8__14_ ( .D(n808), .CP(clk), .Q(reg_array[126]) );
  DFQD1BWP12T reg_array_reg_8__13_ ( .D(n807), .CP(clk), .Q(reg_array[125]) );
  DFQD1BWP12T reg_array_reg_8__12_ ( .D(n806), .CP(clk), .Q(reg_array[124]) );
  DFQD1BWP12T reg_array_reg_8__11_ ( .D(n805), .CP(clk), .Q(reg_array[123]) );
  DFQD1BWP12T reg_array_reg_8__10_ ( .D(n804), .CP(clk), .Q(reg_array[122]) );
  DFQD1BWP12T reg_array_reg_8__9_ ( .D(n803), .CP(clk), .Q(reg_array[121]) );
  DFQD1BWP12T reg_array_reg_8__8_ ( .D(n802), .CP(clk), .Q(reg_array[120]) );
  DFQD1BWP12T reg_array_reg_8__7_ ( .D(n801), .CP(clk), .Q(reg_array[119]) );
  DFQD1BWP12T reg_array_reg_8__6_ ( .D(n800), .CP(clk), .Q(reg_array[118]) );
  DFQD1BWP12T reg_array_reg_8__5_ ( .D(n799), .CP(clk), .Q(reg_array[117]) );
  DFQD1BWP12T reg_array_reg_8__4_ ( .D(n798), .CP(clk), .Q(reg_array[116]) );
  DFQD1BWP12T reg_array_reg_8__3_ ( .D(n797), .CP(clk), .Q(reg_array[115]) );
  DFQD1BWP12T reg_array_reg_8__2_ ( .D(n796), .CP(clk), .Q(reg_array[114]) );
  DFQD1BWP12T reg_array_reg_8__1_ ( .D(n795), .CP(clk), .Q(reg_array[113]) );
  DFQD1BWP12T reg_array_reg_8__0_ ( .D(n794), .CP(clk), .Q(reg_array[112]) );
  DFQD1BWP12T reg_array_reg_7__0_ ( .D(n793), .CP(clk), .Q(reg_array[96]) );
  DFQD1BWP12T reg_array_reg_6__15_ ( .D(n792), .CP(clk), .Q(reg_array[95]) );
  DFQD1BWP12T reg_array_reg_6__14_ ( .D(n791), .CP(clk), .Q(reg_array[94]) );
  DFQD1BWP12T reg_array_reg_6__13_ ( .D(n790), .CP(clk), .Q(reg_array[93]) );
  DFQD1BWP12T reg_array_reg_6__12_ ( .D(n789), .CP(clk), .Q(reg_array[92]) );
  DFQD1BWP12T reg_array_reg_6__11_ ( .D(n788), .CP(clk), .Q(reg_array[91]) );
  DFQD1BWP12T reg_array_reg_6__10_ ( .D(n787), .CP(clk), .Q(reg_array[90]) );
  DFQD1BWP12T reg_array_reg_6__9_ ( .D(n786), .CP(clk), .Q(reg_array[89]) );
  DFQD1BWP12T reg_array_reg_6__8_ ( .D(n785), .CP(clk), .Q(reg_array[88]) );
  DFQD1BWP12T reg_array_reg_6__7_ ( .D(n784), .CP(clk), .Q(reg_array[87]) );
  DFQD1BWP12T reg_array_reg_6__6_ ( .D(n783), .CP(clk), .Q(reg_array[86]) );
  DFQD1BWP12T reg_array_reg_6__5_ ( .D(n782), .CP(clk), .Q(reg_array[85]) );
  DFQD1BWP12T reg_array_reg_6__4_ ( .D(n781), .CP(clk), .Q(reg_array[84]) );
  DFQD1BWP12T reg_array_reg_6__3_ ( .D(n780), .CP(clk), .Q(reg_array[83]) );
  DFQD1BWP12T reg_array_reg_6__2_ ( .D(n779), .CP(clk), .Q(reg_array[82]) );
  DFQD1BWP12T reg_array_reg_6__1_ ( .D(n778), .CP(clk), .Q(reg_array[81]) );
  DFQD1BWP12T reg_array_reg_5__0_ ( .D(n777), .CP(clk), .Q(reg_array[79]) );
  DFQD1BWP12T reg_array_reg_4__15_ ( .D(n776), .CP(clk), .Q(reg_array[78]) );
  DFQD1BWP12T reg_array_reg_4__14_ ( .D(n775), .CP(clk), .Q(reg_array[77]) );
  DFQD1BWP12T reg_array_reg_4__13_ ( .D(n774), .CP(clk), .Q(reg_array[76]) );
  DFQD1BWP12T reg_array_reg_4__12_ ( .D(n773), .CP(clk), .Q(reg_array[75]) );
  DFQD1BWP12T reg_array_reg_4__11_ ( .D(n772), .CP(clk), .Q(reg_array[74]) );
  DFQD1BWP12T reg_array_reg_4__10_ ( .D(n771), .CP(clk), .Q(reg_array[73]) );
  DFQD1BWP12T reg_array_reg_4__9_ ( .D(n770), .CP(clk), .Q(reg_array[72]) );
  DFQD1BWP12T reg_array_reg_4__8_ ( .D(n769), .CP(clk), .Q(reg_array[71]) );
  DFQD1BWP12T reg_array_reg_4__7_ ( .D(n768), .CP(clk), .Q(reg_array[70]) );
  DFQD1BWP12T reg_array_reg_4__6_ ( .D(n767), .CP(clk), .Q(reg_array[69]) );
  DFQD1BWP12T reg_array_reg_4__5_ ( .D(n766), .CP(clk), .Q(reg_array[68]) );
  DFQD1BWP12T reg_array_reg_4__4_ ( .D(n765), .CP(clk), .Q(reg_array[67]) );
  DFQD1BWP12T reg_array_reg_4__3_ ( .D(n764), .CP(clk), .Q(reg_array[66]) );
  DFQD1BWP12T reg_array_reg_4__2_ ( .D(n763), .CP(clk), .Q(reg_array[65]) );
  DFQD1BWP12T reg_array_reg_4__1_ ( .D(n762), .CP(clk), .Q(reg_array[64]) );
  DFQD1BWP12T reg_array_reg_3__15_ ( .D(n761), .CP(clk), .Q(reg_array[63]) );
  DFQD1BWP12T reg_array_reg_3__14_ ( .D(n760), .CP(clk), .Q(reg_array[62]) );
  DFQD1BWP12T reg_array_reg_3__13_ ( .D(n759), .CP(clk), .Q(reg_array[61]) );
  DFQD1BWP12T reg_array_reg_3__12_ ( .D(n758), .CP(clk), .Q(reg_array[60]) );
  DFQD1BWP12T reg_array_reg_3__11_ ( .D(n757), .CP(clk), .Q(reg_array[59]) );
  DFQD1BWP12T reg_array_reg_3__10_ ( .D(n756), .CP(clk), .Q(reg_array[58]) );
  DFQD1BWP12T reg_array_reg_3__9_ ( .D(n755), .CP(clk), .Q(reg_array[57]) );
  DFQD1BWP12T reg_array_reg_3__8_ ( .D(n754), .CP(clk), .Q(reg_array[56]) );
  DFQD1BWP12T reg_array_reg_3__7_ ( .D(n753), .CP(clk), .Q(reg_array[55]) );
  DFQD1BWP12T reg_array_reg_3__6_ ( .D(n752), .CP(clk), .Q(reg_array[54]) );
  DFQD1BWP12T reg_array_reg_3__5_ ( .D(n751), .CP(clk), .Q(reg_array[53]) );
  DFQD1BWP12T reg_array_reg_3__4_ ( .D(n750), .CP(clk), .Q(reg_array[52]) );
  DFQD1BWP12T reg_array_reg_3__3_ ( .D(n749), .CP(clk), .Q(reg_array[51]) );
  DFQD1BWP12T reg_array_reg_3__2_ ( .D(n748), .CP(clk), .Q(reg_array[50]) );
  DFQD1BWP12T reg_array_reg_3__1_ ( .D(n747), .CP(clk), .Q(reg_array[49]) );
  DFQD1BWP12T reg_array_reg_3__0_ ( .D(n746), .CP(clk), .Q(reg_array[48]) );
  DFQD1BWP12T reg_array_reg_2__15_ ( .D(n745), .CP(clk), .Q(reg_array[47]) );
  DFQD1BWP12T reg_array_reg_2__14_ ( .D(n744), .CP(clk), .Q(reg_array[46]) );
  DFQD1BWP12T reg_array_reg_2__13_ ( .D(n743), .CP(clk), .Q(reg_array[45]) );
  DFQD1BWP12T reg_array_reg_2__12_ ( .D(n742), .CP(clk), .Q(reg_array[44]) );
  DFQD1BWP12T reg_array_reg_2__11_ ( .D(n741), .CP(clk), .Q(reg_array[43]) );
  DFQD1BWP12T reg_array_reg_2__10_ ( .D(n740), .CP(clk), .Q(reg_array[42]) );
  DFQD1BWP12T reg_array_reg_2__9_ ( .D(n739), .CP(clk), .Q(reg_array[41]) );
  DFQD1BWP12T reg_array_reg_2__8_ ( .D(n738), .CP(clk), .Q(reg_array[40]) );
  DFQD1BWP12T reg_array_reg_2__7_ ( .D(n737), .CP(clk), .Q(reg_array[39]) );
  DFQD1BWP12T reg_array_reg_2__6_ ( .D(n736), .CP(clk), .Q(reg_array[38]) );
  DFQD1BWP12T reg_array_reg_2__5_ ( .D(n735), .CP(clk), .Q(reg_array[37]) );
  DFQD1BWP12T reg_array_reg_2__4_ ( .D(n734), .CP(clk), .Q(reg_array[36]) );
  DFQD1BWP12T reg_array_reg_2__3_ ( .D(n733), .CP(clk), .Q(reg_array[35]) );
  DFQD1BWP12T reg_array_reg_2__2_ ( .D(n732), .CP(clk), .Q(reg_array[34]) );
  DFQD1BWP12T reg_array_reg_2__1_ ( .D(n731), .CP(clk), .Q(reg_array[33]) );
  DFQD1BWP12T reg_array_reg_2__0_ ( .D(n730), .CP(clk), .Q(reg_array[32]) );
  DFQD1BWP12T reg_array_reg_1__15_ ( .D(n729), .CP(clk), .Q(reg_array[31]) );
  DFQD1BWP12T reg_array_reg_1__14_ ( .D(n728), .CP(clk), .Q(reg_array[30]) );
  DFQD1BWP12T reg_array_reg_1__13_ ( .D(n727), .CP(clk), .Q(reg_array[29]) );
  DFQD1BWP12T reg_array_reg_1__12_ ( .D(n726), .CP(clk), .Q(reg_array[28]) );
  DFQD1BWP12T reg_array_reg_1__11_ ( .D(n725), .CP(clk), .Q(reg_array[27]) );
  DFQD1BWP12T reg_array_reg_1__10_ ( .D(n724), .CP(clk), .Q(reg_array[26]) );
  DFQD1BWP12T reg_array_reg_1__9_ ( .D(n723), .CP(clk), .Q(reg_array[25]) );
  DFQD1BWP12T reg_array_reg_1__8_ ( .D(n722), .CP(clk), .Q(reg_array[24]) );
  DFQD1BWP12T reg_array_reg_1__7_ ( .D(n721), .CP(clk), .Q(reg_array[23]) );
  DFQD1BWP12T reg_array_reg_1__6_ ( .D(n720), .CP(clk), .Q(reg_array[22]) );
  DFQD1BWP12T reg_array_reg_1__5_ ( .D(n719), .CP(clk), .Q(reg_array[21]) );
  DFQD1BWP12T reg_array_reg_1__4_ ( .D(n718), .CP(clk), .Q(reg_array[20]) );
  DFQD1BWP12T reg_array_reg_1__3_ ( .D(n717), .CP(clk), .Q(reg_array[19]) );
  DFQD1BWP12T reg_array_reg_1__2_ ( .D(n716), .CP(clk), .Q(reg_array[18]) );
  DFQD1BWP12T reg_array_reg_1__1_ ( .D(n715), .CP(clk), .Q(reg_array[17]) );
  DFQD1BWP12T reg_array_reg_1__0_ ( .D(n714), .CP(clk), .Q(reg_array[16]) );
  DFQD1BWP12T reg_array_reg_0__15_ ( .D(n713), .CP(clk), .Q(reg_array[15]) );
  DFQD1BWP12T reg_array_reg_0__14_ ( .D(n712), .CP(clk), .Q(reg_array[14]) );
  DFQD1BWP12T reg_array_reg_0__13_ ( .D(n711), .CP(clk), .Q(reg_array[13]) );
  DFQD1BWP12T reg_array_reg_0__12_ ( .D(n710), .CP(clk), .Q(reg_array[12]) );
  DFQD1BWP12T reg_array_reg_0__11_ ( .D(n709), .CP(clk), .Q(reg_array[11]) );
  DFQD1BWP12T reg_array_reg_0__10_ ( .D(n708), .CP(clk), .Q(reg_array[10]) );
  DFQD1BWP12T reg_array_reg_0__9_ ( .D(n707), .CP(clk), .Q(reg_array[9]) );
  DFQD1BWP12T reg_array_reg_0__8_ ( .D(n706), .CP(clk), .Q(reg_array[8]) );
  DFQD1BWP12T reg_array_reg_0__7_ ( .D(n705), .CP(clk), .Q(reg_array[7]) );
  DFQD1BWP12T reg_array_reg_0__6_ ( .D(n704), .CP(clk), .Q(reg_array[6]) );
  DFQD1BWP12T reg_array_reg_0__5_ ( .D(n703), .CP(clk), .Q(reg_array[5]) );
  DFQD1BWP12T reg_array_reg_0__4_ ( .D(n702), .CP(clk), .Q(reg_array[4]) );
  DFQD1BWP12T reg_array_reg_0__3_ ( .D(n701), .CP(clk), .Q(reg_array[3]) );
  DFQD1BWP12T reg_array_reg_0__2_ ( .D(n700), .CP(clk), .Q(reg_array[2]) );
  DFQD1BWP12T reg_array_reg_0__1_ ( .D(n699), .CP(clk), .Q(reg_array[1]) );
  DFQD1BWP12T reg_array_reg_0__0_ ( .D(n698), .CP(clk), .Q(reg_array[0]) );
  DFQD1BWP12T or_R_rd1_data_reg_15_ ( .D(n697), .CP(clk), .Q(or_R_rd1_data[15]) );
  DFQD1BWP12T or_R_rd1_data_reg_14_ ( .D(n696), .CP(clk), .Q(or_R_rd1_data[14]) );
  DFQD1BWP12T or_R_rd1_data_reg_13_ ( .D(n695), .CP(clk), .Q(or_R_rd1_data[13]) );
  DFQD1BWP12T or_R_rd1_data_reg_12_ ( .D(n694), .CP(clk), .Q(or_R_rd1_data[12]) );
  DFQD1BWP12T or_R_rd1_data_reg_11_ ( .D(n693), .CP(clk), .Q(or_R_rd1_data[11]) );
  DFQD1BWP12T or_R_rd1_data_reg_10_ ( .D(n692), .CP(clk), .Q(or_R_rd1_data[10]) );
  DFQD1BWP12T or_R_rd1_data_reg_9_ ( .D(n691), .CP(clk), .Q(or_R_rd1_data[9])
         );
  DFQD1BWP12T or_R_rd1_data_reg_8_ ( .D(n690), .CP(clk), .Q(or_R_rd1_data[8])
         );
  DFQD1BWP12T or_R_rd1_data_reg_7_ ( .D(n689), .CP(clk), .Q(or_R_rd1_data[7])
         );
  DFQD1BWP12T or_R_rd1_data_reg_6_ ( .D(n688), .CP(clk), .Q(or_R_rd1_data[6])
         );
  DFQD1BWP12T or_R_rd1_data_reg_5_ ( .D(n687), .CP(clk), .Q(or_R_rd1_data[5])
         );
  DFQD1BWP12T or_R_rd1_data_reg_4_ ( .D(n686), .CP(clk), .Q(or_R_rd1_data[4])
         );
  DFQD1BWP12T or_R_rd1_data_reg_3_ ( .D(n685), .CP(clk), .Q(or_R_rd1_data[3])
         );
  DFQD1BWP12T or_R_rd1_data_reg_2_ ( .D(n684), .CP(clk), .Q(or_R_rd1_data[2])
         );
  DFQD1BWP12T or_R_rd1_data_reg_1_ ( .D(n683), .CP(clk), .Q(or_R_rd1_data[1])
         );
  DFQD1BWP12T or_R_rd1_data_reg_0_ ( .D(n682), .CP(clk), .Q(or_R_rd1_data[0])
         );
  DFQD1BWP12T or_R_rd2_data_reg_15_ ( .D(n681), .CP(clk), .Q(or_R_rd2_data[15]) );
  DFQD1BWP12T or_R_rd2_data_reg_14_ ( .D(n680), .CP(clk), .Q(or_R_rd2_data[14]) );
  DFQD1BWP12T or_R_rd2_data_reg_13_ ( .D(n679), .CP(clk), .Q(or_R_rd2_data[13]) );
  DFQD1BWP12T or_R_rd2_data_reg_12_ ( .D(n678), .CP(clk), .Q(or_R_rd2_data[12]) );
  DFQD1BWP12T or_R_rd2_data_reg_11_ ( .D(n677), .CP(clk), .Q(or_R_rd2_data[11]) );
  DFQD1BWP12T or_R_rd2_data_reg_10_ ( .D(n676), .CP(clk), .Q(or_R_rd2_data[10]) );
  DFQD1BWP12T or_R_rd2_data_reg_9_ ( .D(n675), .CP(clk), .Q(or_R_rd2_data[9])
         );
  DFQD1BWP12T or_R_rd2_data_reg_8_ ( .D(n674), .CP(clk), .Q(or_R_rd2_data[8])
         );
  DFQD1BWP12T or_R_rd2_data_reg_7_ ( .D(n673), .CP(clk), .Q(or_R_rd2_data[7])
         );
  DFQD1BWP12T or_R_rd2_data_reg_6_ ( .D(n672), .CP(clk), .Q(or_R_rd2_data[6])
         );
  DFQD1BWP12T or_R_rd2_data_reg_5_ ( .D(n671), .CP(clk), .Q(or_R_rd2_data[5])
         );
  DFQD1BWP12T or_R_rd2_data_reg_4_ ( .D(n670), .CP(clk), .Q(or_R_rd2_data[4])
         );
  DFQD1BWP12T or_R_rd2_data_reg_3_ ( .D(n669), .CP(clk), .Q(or_R_rd2_data[3])
         );
  DFQD1BWP12T or_R_rd2_data_reg_2_ ( .D(n668), .CP(clk), .Q(or_R_rd2_data[2])
         );
  DFQD1BWP12T or_R_rd2_data_reg_1_ ( .D(n667), .CP(clk), .Q(or_R_rd2_data[1])
         );
  DFQD1BWP12T or_R_rd2_data_reg_0_ ( .D(n666), .CP(clk), .Q(or_R_rd2_data[0])
         );
  EDFD1BWP12T reg_array_reg_4__0_ ( .D(n1), .E(n483), .CP(clk), .Q(n479) );
  EDFD1BWP12T reg_array_reg_5__15_ ( .D(n16), .E(n481), .CP(clk), .QN(n587) );
  EDFD1BWP12T reg_array_reg_5__14_ ( .D(n15), .E(n481), .CP(clk), .QN(n585) );
  EDFD1BWP12T reg_array_reg_5__13_ ( .D(n14), .E(n481), .CP(clk), .QN(n584) );
  EDFD1BWP12T reg_array_reg_5__12_ ( .D(n13), .E(n481), .CP(clk), .QN(n583) );
  EDFD1BWP12T reg_array_reg_5__11_ ( .D(n12), .E(n481), .CP(clk), .QN(n582) );
  EDFD1BWP12T reg_array_reg_5__10_ ( .D(n11), .E(n481), .CP(clk), .QN(n581) );
  EDFD1BWP12T reg_array_reg_5__9_ ( .D(n10), .E(n481), .CP(clk), .QN(n580) );
  EDFD1BWP12T reg_array_reg_5__8_ ( .D(n9), .E(n481), .CP(clk), .QN(n579) );
  EDFD1BWP12T reg_array_reg_5__7_ ( .D(n8), .E(n481), .CP(clk), .QN(n578) );
  EDFD1BWP12T reg_array_reg_5__6_ ( .D(n7), .E(n481), .CP(clk), .QN(n577) );
  EDFD1BWP12T reg_array_reg_5__5_ ( .D(n6), .E(n481), .CP(clk), .QN(n576) );
  EDFD1BWP12T reg_array_reg_5__4_ ( .D(n5), .E(n481), .CP(clk), .QN(n575) );
  EDFD1BWP12T reg_array_reg_5__3_ ( .D(n4), .E(n481), .CP(clk), .QN(n574) );
  EDFD1BWP12T reg_array_reg_5__2_ ( .D(n3), .E(n481), .CP(clk), .QN(n573) );
  EDFD1BWP12T reg_array_reg_5__1_ ( .D(n2), .E(n481), .CP(clk), .QN(n572) );
  EDFXD1BWP12T reg_array_reg_6__0_ ( .D(n1), .E(n482), .CP(clk), .Q(
        reg_array[80]) );
  EDFXD1BWP12T reg_array_reg_7__15_ ( .D(n16), .E(n480), .CP(clk), .Q(
        reg_array[111]) );
  EDFXD1BWP12T reg_array_reg_7__14_ ( .D(n15), .E(n480), .CP(clk), .Q(
        reg_array[110]) );
  EDFXD1BWP12T reg_array_reg_7__13_ ( .D(n14), .E(n480), .CP(clk), .Q(
        reg_array[109]) );
  EDFXD1BWP12T reg_array_reg_7__12_ ( .D(n13), .E(n480), .CP(clk), .Q(
        reg_array[108]) );
  EDFXD1BWP12T reg_array_reg_7__11_ ( .D(n12), .E(n480), .CP(clk), .Q(
        reg_array[107]) );
  EDFXD1BWP12T reg_array_reg_7__10_ ( .D(n11), .E(n480), .CP(clk), .Q(
        reg_array[106]) );
  EDFXD1BWP12T reg_array_reg_7__9_ ( .D(n10), .E(n480), .CP(clk), .Q(
        reg_array[105]) );
  EDFXD1BWP12T reg_array_reg_7__8_ ( .D(n9), .E(n480), .CP(clk), .Q(
        reg_array[104]) );
  EDFXD1BWP12T reg_array_reg_7__7_ ( .D(n8), .E(n480), .CP(clk), .Q(
        reg_array[103]) );
  EDFXD1BWP12T reg_array_reg_7__6_ ( .D(n7), .E(n480), .CP(clk), .Q(
        reg_array[102]) );
  EDFXD1BWP12T reg_array_reg_7__5_ ( .D(n6), .E(n480), .CP(clk), .Q(
        reg_array[101]) );
  EDFXD1BWP12T reg_array_reg_7__4_ ( .D(n5), .E(n480), .CP(clk), .Q(
        reg_array[100]) );
  EDFXD1BWP12T reg_array_reg_7__3_ ( .D(n4), .E(n480), .CP(clk), .Q(
        reg_array[99]) );
  EDFXD1BWP12T reg_array_reg_7__2_ ( .D(n3), .E(n480), .CP(clk), .Q(
        reg_array[98]) );
  EDFXD1BWP12T reg_array_reg_7__1_ ( .D(n2), .E(n480), .CP(clk), .Q(
        reg_array[97]) );
  INVD1BWP12T U3 ( .I(i_4_wr_addr[3]), .ZN(n19) );
  ND2D1BWP12T U4 ( .A1(i_4_rd2_addr[0]), .A2(i_4_rd2_addr[2]), .ZN(n250) );
  ND2D1BWP12T U5 ( .A1(i_4_rd1_addr[0]), .A2(i_4_rd1_addr[2]), .ZN(n41) );
  INVD1BWP12T U6 ( .I(i_4_wr_addr[2]), .ZN(n30) );
  NR2D1BWP12T U7 ( .A1(i_4_wr_addr[2]), .A2(n456), .ZN(n460) );
  NR2D1BWP12T U8 ( .A1(n18), .A2(n29), .ZN(n458) );
  INVD1BWP12T U9 ( .I(i_4_wr_addr[1]), .ZN(n456) );
  NR2D1BWP12T U10 ( .A1(i_4_wr_addr[0]), .A2(n29), .ZN(n461) );
  AOI31D1BWP12T U11 ( .A1(i_1_reg_wr_en), .A2(n19), .A3(n18), .B(rst), .ZN(n24) );
  INVD1BWP12T U12 ( .I(i_4_rd2_addr[1]), .ZN(n251) );
  IND2D1BWP12T U13 ( .A1(i_4_rd2_addr[0]), .B1(i_4_rd2_addr[2]), .ZN(n432) );
  ND2D1BWP12T U14 ( .A1(n252), .A2(n251), .ZN(n428) );
  NR2D1BWP12T U15 ( .A1(n251), .A2(n432), .ZN(n443) );
  NR2D1BWP12T U16 ( .A1(n251), .A2(n244), .ZN(n442) );
  NR2D1BWP12T U17 ( .A1(i_4_rd2_addr[1]), .A2(n432), .ZN(n439) );
  INVD1BWP12T U18 ( .I(n428), .ZN(n438) );
  NR2D1BWP12T U19 ( .A1(i_4_rd2_addr[1]), .A2(n244), .ZN(n441) );
  NR3D1BWP12T U20 ( .A1(i_4_rd2_addr[1]), .A2(i_4_rd2_addr[0]), .A3(
        i_4_rd2_addr[2]), .ZN(n440) );
  NR3D1BWP12T U21 ( .A1(i_4_rd2_addr[0]), .A2(i_4_rd2_addr[2]), .A3(n251), 
        .ZN(n448) );
  NR2D1BWP12T U22 ( .A1(n251), .A2(n250), .ZN(n435) );
  AN2D1BWP12T U23 ( .A1(n249), .A2(i_4_rd2_addr[3]), .Z(n449) );
  AN2D1BWP12T U24 ( .A1(n449), .A2(n435), .Z(n436) );
  INVD1BWP12T U25 ( .I(i_4_rd1_addr[1]), .ZN(n42) );
  IND2D1BWP12T U26 ( .A1(i_4_rd1_addr[0]), .B1(i_4_rd1_addr[2]), .ZN(n223) );
  ND2D1BWP12T U27 ( .A1(n43), .A2(n42), .ZN(n219) );
  NR2D1BWP12T U28 ( .A1(n42), .A2(n223), .ZN(n233) );
  NR2D1BWP12T U29 ( .A1(n42), .A2(n36), .ZN(n232) );
  NR2D1BWP12T U30 ( .A1(i_4_rd1_addr[1]), .A2(n223), .ZN(n229) );
  INVD1BWP12T U31 ( .I(n219), .ZN(n228) );
  NR2D1BWP12T U32 ( .A1(i_4_rd1_addr[1]), .A2(n36), .ZN(n231) );
  NR3D1BWP12T U33 ( .A1(i_4_rd1_addr[1]), .A2(i_4_rd1_addr[0]), .A3(
        i_4_rd1_addr[2]), .ZN(n230) );
  NR3D1BWP12T U34 ( .A1(i_4_rd1_addr[0]), .A2(i_4_rd1_addr[2]), .A3(n42), .ZN(
        n239) );
  NR2D1BWP12T U35 ( .A1(n42), .A2(n41), .ZN(n226) );
  AN2D1BWP12T U36 ( .A1(n249), .A2(i_4_rd1_addr[3]), .Z(n238) );
  AN2D1BWP12T U37 ( .A1(n238), .A2(n226), .Z(n227) );
  INR2D2BWP12T U38 ( .A1(i_1_reg_wr_en), .B1(rst), .ZN(n437) );
  NR2D1BWP12T U39 ( .A1(n26), .A2(n24), .ZN(n28) );
  NR2D1BWP12T U40 ( .A1(n26), .A2(n25), .ZN(n27) );
  OR2XD1BWP12T U41 ( .A1(n24), .A2(n20), .Z(n21) );
  INVD1BWP12T U42 ( .I(n21), .ZN(n33) );
  INVD1BWP12T U43 ( .I(n17), .ZN(n32) );
  AO31D1BWP12T U44 ( .A1(n456), .A2(n30), .A3(n461), .B(rst), .Z(n34) );
  AO31D1BWP12T U45 ( .A1(n30), .A2(n456), .A3(n458), .B(rst), .Z(n35) );
  AOI21D1BWP12T U46 ( .A1(n461), .A2(n460), .B(rst), .ZN(n478) );
  AOI21D1BWP12T U47 ( .A1(n458), .A2(n460), .B(rst), .ZN(n459) );
  AOI31D1BWP12T U48 ( .A1(i_4_wr_addr[2]), .A2(n461), .A3(n456), .B(rst), .ZN(
        n457) );
  INVD1BWP12T U49 ( .I(n455), .ZN(n31) );
  AOI31D1BWP12T U50 ( .A1(i_4_wr_addr[2]), .A2(n458), .A3(n456), .B(rst), .ZN(
        n455) );
  ND2D1BWP12T U51 ( .A1(n437), .A2(i_R_wr_data[0]), .ZN(n477) );
  ND2D1BWP12T U52 ( .A1(n437), .A2(i_R_wr_data[1]), .ZN(n476) );
  ND2D1BWP12T U53 ( .A1(n437), .A2(i_R_wr_data[2]), .ZN(n475) );
  ND2D1BWP12T U54 ( .A1(n437), .A2(i_R_wr_data[3]), .ZN(n474) );
  ND2D1BWP12T U55 ( .A1(n437), .A2(i_R_wr_data[4]), .ZN(n473) );
  ND2D1BWP12T U56 ( .A1(n437), .A2(i_R_wr_data[5]), .ZN(n472) );
  ND2D1BWP12T U57 ( .A1(n437), .A2(i_R_wr_data[6]), .ZN(n471) );
  ND2D1BWP12T U58 ( .A1(n437), .A2(i_R_wr_data[7]), .ZN(n470) );
  ND2D1BWP12T U59 ( .A1(n437), .A2(i_R_wr_data[8]), .ZN(n469) );
  ND2D1BWP12T U60 ( .A1(n437), .A2(i_R_wr_data[9]), .ZN(n468) );
  ND2D1BWP12T U61 ( .A1(n437), .A2(i_R_wr_data[10]), .ZN(n467) );
  ND2D1BWP12T U62 ( .A1(n437), .A2(i_R_wr_data[11]), .ZN(n466) );
  ND2D1BWP12T U63 ( .A1(n437), .A2(i_R_wr_data[12]), .ZN(n465) );
  ND2D1BWP12T U64 ( .A1(n437), .A2(i_R_wr_data[13]), .ZN(n464) );
  ND2D1BWP12T U65 ( .A1(n437), .A2(i_R_wr_data[14]), .ZN(n463) );
  AOI31D1BWP12T U66 ( .A1(i_4_wr_addr[2]), .A2(i_4_wr_addr[1]), .A3(n461), .B(
        rst), .ZN(n454) );
  ND2D1BWP12T U67 ( .A1(n437), .A2(i_R_wr_data[15]), .ZN(n462) );
  NR2D1BWP12T U68 ( .A1(n25), .A2(n22), .ZN(n480) );
  NR2D1BWP12T U69 ( .A1(n22), .A2(n24), .ZN(n482) );
  INVD1BWP12T U70 ( .I(n476), .ZN(n2) );
  INVD1BWP12T U71 ( .I(n475), .ZN(n3) );
  INVD1BWP12T U72 ( .I(n474), .ZN(n4) );
  INVD1BWP12T U73 ( .I(n473), .ZN(n5) );
  INVD1BWP12T U74 ( .I(n472), .ZN(n6) );
  INVD1BWP12T U75 ( .I(n471), .ZN(n7) );
  INVD1BWP12T U76 ( .I(n470), .ZN(n8) );
  INVD1BWP12T U77 ( .I(n469), .ZN(n9) );
  INVD1BWP12T U78 ( .I(n468), .ZN(n10) );
  INVD1BWP12T U79 ( .I(n467), .ZN(n11) );
  INVD1BWP12T U80 ( .I(n466), .ZN(n12) );
  INVD1BWP12T U81 ( .I(n465), .ZN(n13) );
  INVD1BWP12T U82 ( .I(n464), .ZN(n14) );
  INVD1BWP12T U83 ( .I(n463), .ZN(n15) );
  NR2D1BWP12T U84 ( .A1(n23), .A2(n25), .ZN(n481) );
  INVD1BWP12T U85 ( .I(n462), .ZN(n16) );
  NR2D1BWP12T U86 ( .A1(n23), .A2(n24), .ZN(n483) );
  INVD1BWP12T U87 ( .I(n477), .ZN(n1) );
  IAO21D0BWP12T U88 ( .A1(i_4_wr_addr[2]), .A2(i_4_wr_addr[1]), .B(rst), .ZN(
        n26) );
  IAO21D0BWP12T U89 ( .A1(n30), .A2(n456), .B(rst), .ZN(n22) );
  IAO21D0BWP12T U90 ( .A1(i_4_wr_addr[1]), .A2(n30), .B(rst), .ZN(n23) );
  INVD1BWP12T U91 ( .I(i_4_wr_addr[0]), .ZN(n18) );
  CKND2D1BWP12T U92 ( .A1(n437), .A2(i_4_wr_addr[3]), .ZN(n29) );
  OA32D0BWP12T U93 ( .A1(rst), .A2(n455), .A3(n8), .B1(reg_array[199]), .B2(
        n31), .Z(n881) );
  OA32D0BWP12T U94 ( .A1(rst), .A2(n455), .A3(n6), .B1(reg_array[197]), .B2(
        n31), .Z(n879) );
  AOI31D1BWP12T U95 ( .A1(i_1_reg_wr_en), .A2(i_4_wr_addr[0]), .A3(n19), .B(
        rst), .ZN(n25) );
  NR2D1BWP12T U96 ( .A1(rst), .A2(n460), .ZN(n20) );
  OR2XD1BWP12T U97 ( .A1(n25), .A2(n20), .Z(n17) );
  OA32D0BWP12T U98 ( .A1(rst), .A2(n17), .A3(n1), .B1(reg_array[48]), .B2(n32), 
        .Z(n746) );
  OA32D0BWP12T U99 ( .A1(rst), .A2(n21), .A3(n1), .B1(reg_array[32]), .B2(n33), 
        .Z(n730) );
  MAOI22D0BWP12T U100 ( .A1(n28), .A2(n477), .B1(n28), .B2(reg_array[0]), .ZN(
        n698) );
  MAOI22D0BWP12T U101 ( .A1(n27), .A2(n477), .B1(n27), .B2(reg_array[16]), 
        .ZN(n714) );
  MAOI22D0BWP12T U102 ( .A1(n27), .A2(n470), .B1(n27), .B2(reg_array[23]), 
        .ZN(n721) );
  MAOI22D0BWP12T U103 ( .A1(n28), .A2(n470), .B1(n28), .B2(reg_array[7]), .ZN(
        n705) );
  MAOI22D0BWP12T U104 ( .A1(n483), .A2(n472), .B1(n483), .B2(reg_array[68]), 
        .ZN(n766) );
  MAOI22D0BWP12T U105 ( .A1(n27), .A2(n472), .B1(n27), .B2(reg_array[21]), 
        .ZN(n719) );
  MAOI22D0BWP12T U106 ( .A1(n28), .A2(n472), .B1(n28), .B2(reg_array[5]), .ZN(
        n703) );
  MAOI22D0BWP12T U107 ( .A1(n482), .A2(n472), .B1(n482), .B2(reg_array[85]), 
        .ZN(n782) );
  MAOI22D0BWP12T U108 ( .A1(n483), .A2(n470), .B1(n483), .B2(reg_array[70]), 
        .ZN(n768) );
  MAOI22D0BWP12T U109 ( .A1(n482), .A2(n470), .B1(n482), .B2(reg_array[87]), 
        .ZN(n784) );
  MAOI22D0BWP12T U110 ( .A1(n28), .A2(n476), .B1(n28), .B2(reg_array[1]), .ZN(
        n699) );
  MAOI22D0BWP12T U111 ( .A1(n28), .A2(n471), .B1(n28), .B2(reg_array[6]), .ZN(
        n704) );
  MAOI22D0BWP12T U112 ( .A1(n482), .A2(n476), .B1(n482), .B2(reg_array[81]), 
        .ZN(n778) );
  MAOI22D0BWP12T U113 ( .A1(n482), .A2(n474), .B1(n482), .B2(reg_array[83]), 
        .ZN(n780) );
  MAOI22D0BWP12T U114 ( .A1(n27), .A2(n476), .B1(n27), .B2(reg_array[17]), 
        .ZN(n715) );
  MAOI22D0BWP12T U115 ( .A1(n27), .A2(n471), .B1(n27), .B2(reg_array[22]), 
        .ZN(n720) );
  MAOI22D0BWP12T U116 ( .A1(n28), .A2(n474), .B1(n28), .B2(reg_array[3]), .ZN(
        n701) );
  MAOI22D0BWP12T U117 ( .A1(n28), .A2(n473), .B1(n28), .B2(reg_array[4]), .ZN(
        n702) );
  MAOI22D0BWP12T U118 ( .A1(n483), .A2(n471), .B1(n483), .B2(reg_array[69]), 
        .ZN(n767) );
  MAOI22D0BWP12T U119 ( .A1(n482), .A2(n475), .B1(n482), .B2(reg_array[82]), 
        .ZN(n779) );
  MAOI22D0BWP12T U120 ( .A1(n27), .A2(n475), .B1(n27), .B2(reg_array[18]), 
        .ZN(n716) );
  MAOI22D0BWP12T U121 ( .A1(n27), .A2(n474), .B1(n27), .B2(reg_array[19]), 
        .ZN(n717) );
  MAOI22D0BWP12T U122 ( .A1(n28), .A2(n475), .B1(n28), .B2(reg_array[2]), .ZN(
        n700) );
  MAOI22D0BWP12T U123 ( .A1(n27), .A2(n473), .B1(n27), .B2(reg_array[20]), 
        .ZN(n718) );
  MAOI22D0BWP12T U124 ( .A1(n482), .A2(n471), .B1(n482), .B2(reg_array[86]), 
        .ZN(n783) );
  MAOI22D0BWP12T U125 ( .A1(n482), .A2(n473), .B1(n482), .B2(reg_array[84]), 
        .ZN(n781) );
  MAOI22D0BWP12T U126 ( .A1(n483), .A2(n475), .B1(n483), .B2(reg_array[65]), 
        .ZN(n763) );
  MAOI22D0BWP12T U127 ( .A1(n483), .A2(n474), .B1(n483), .B2(reg_array[66]), 
        .ZN(n764) );
  MAOI22D0BWP12T U128 ( .A1(n483), .A2(n476), .B1(n483), .B2(reg_array[64]), 
        .ZN(n762) );
  MAOI22D0BWP12T U129 ( .A1(n483), .A2(n473), .B1(n483), .B2(reg_array[67]), 
        .ZN(n765) );
  MAOI22D0BWP12T U130 ( .A1(n482), .A2(n464), .B1(n482), .B2(reg_array[93]), 
        .ZN(n790) );
  MAOI22D0BWP12T U131 ( .A1(n482), .A2(n469), .B1(n482), .B2(reg_array[88]), 
        .ZN(n785) );
  MAOI22D0BWP12T U132 ( .A1(n483), .A2(n462), .B1(n483), .B2(reg_array[78]), 
        .ZN(n776) );
  MAOI22D0BWP12T U133 ( .A1(n482), .A2(n465), .B1(n482), .B2(reg_array[92]), 
        .ZN(n789) );
  MAOI22D0BWP12T U134 ( .A1(n483), .A2(n464), .B1(n483), .B2(reg_array[76]), 
        .ZN(n774) );
  MAOI22D0BWP12T U135 ( .A1(n483), .A2(n465), .B1(n483), .B2(reg_array[75]), 
        .ZN(n773) );
  MAOI22D0BWP12T U136 ( .A1(n483), .A2(n463), .B1(n483), .B2(reg_array[77]), 
        .ZN(n775) );
  MAOI22D0BWP12T U137 ( .A1(n482), .A2(n462), .B1(n482), .B2(reg_array[95]), 
        .ZN(n792) );
  MAOI22D0BWP12T U138 ( .A1(n482), .A2(n463), .B1(n482), .B2(reg_array[94]), 
        .ZN(n791) );
  MAOI22D0BWP12T U139 ( .A1(n482), .A2(n466), .B1(n482), .B2(reg_array[91]), 
        .ZN(n788) );
  MAOI22D0BWP12T U140 ( .A1(n482), .A2(n467), .B1(n482), .B2(reg_array[90]), 
        .ZN(n787) );
  MAOI22D0BWP12T U141 ( .A1(n482), .A2(n468), .B1(n482), .B2(reg_array[89]), 
        .ZN(n786) );
  MAOI22D0BWP12T U142 ( .A1(n483), .A2(n466), .B1(n483), .B2(reg_array[74]), 
        .ZN(n772) );
  MAOI22D0BWP12T U143 ( .A1(n483), .A2(n467), .B1(n483), .B2(reg_array[73]), 
        .ZN(n771) );
  MAOI22D0BWP12T U144 ( .A1(n483), .A2(n468), .B1(n483), .B2(reg_array[72]), 
        .ZN(n770) );
  MAOI22D0BWP12T U145 ( .A1(n27), .A2(n462), .B1(n27), .B2(reg_array[31]), 
        .ZN(n729) );
  MAOI22D0BWP12T U146 ( .A1(n27), .A2(n463), .B1(n27), .B2(reg_array[30]), 
        .ZN(n728) );
  MAOI22D0BWP12T U147 ( .A1(n27), .A2(n464), .B1(n27), .B2(reg_array[29]), 
        .ZN(n727) );
  MAOI22D0BWP12T U148 ( .A1(n27), .A2(n465), .B1(n27), .B2(reg_array[28]), 
        .ZN(n726) );
  MAOI22D0BWP12T U149 ( .A1(n27), .A2(n466), .B1(n27), .B2(reg_array[27]), 
        .ZN(n725) );
  MAOI22D0BWP12T U150 ( .A1(n27), .A2(n467), .B1(n27), .B2(reg_array[26]), 
        .ZN(n724) );
  MAOI22D0BWP12T U151 ( .A1(n27), .A2(n468), .B1(n27), .B2(reg_array[25]), 
        .ZN(n723) );
  MAOI22D0BWP12T U152 ( .A1(n27), .A2(n469), .B1(n27), .B2(reg_array[24]), 
        .ZN(n722) );
  MAOI22D0BWP12T U153 ( .A1(n28), .A2(n462), .B1(n28), .B2(reg_array[15]), 
        .ZN(n713) );
  MAOI22D0BWP12T U154 ( .A1(n28), .A2(n463), .B1(n28), .B2(reg_array[14]), 
        .ZN(n712) );
  MAOI22D0BWP12T U155 ( .A1(n28), .A2(n464), .B1(n28), .B2(reg_array[13]), 
        .ZN(n711) );
  MAOI22D0BWP12T U156 ( .A1(n28), .A2(n465), .B1(n28), .B2(reg_array[12]), 
        .ZN(n710) );
  MAOI22D0BWP12T U157 ( .A1(n28), .A2(n466), .B1(n28), .B2(reg_array[11]), 
        .ZN(n709) );
  MAOI22D0BWP12T U158 ( .A1(n28), .A2(n467), .B1(n28), .B2(reg_array[10]), 
        .ZN(n708) );
  MAOI22D0BWP12T U159 ( .A1(n28), .A2(n468), .B1(n28), .B2(reg_array[9]), .ZN(
        n707) );
  MAOI22D0BWP12T U160 ( .A1(n28), .A2(n469), .B1(n28), .B2(reg_array[8]), .ZN(
        n706) );
  MAOI22D0BWP12T U161 ( .A1(n483), .A2(n469), .B1(n483), .B2(reg_array[71]), 
        .ZN(n769) );
  MAOI22D0BWP12T U162 ( .A1(n481), .A2(n477), .B1(n481), .B2(reg_array[79]), 
        .ZN(n777) );
  MAOI22D0BWP12T U163 ( .A1(n480), .A2(n477), .B1(n480), .B2(reg_array[96]), 
        .ZN(n793) );
  MAOI22D0BWP12T U164 ( .A1(n31), .A2(n477), .B1(n31), .B2(reg_array[192]), 
        .ZN(n874) );
  MAOI22D0BWP12T U165 ( .A1(n34), .A2(n477), .B1(n34), .B2(reg_array[112]), 
        .ZN(n794) );
  MAOI22D0BWP12T U166 ( .A1(n35), .A2(n477), .B1(n35), .B2(reg_array[128]), 
        .ZN(n810) );
  MAOI22D0BWP12T U167 ( .A1(n34), .A2(n472), .B1(n34), .B2(reg_array[117]), 
        .ZN(n799) );
  MAOI22D0BWP12T U168 ( .A1(n33), .A2(n472), .B1(n33), .B2(reg_array[37]), 
        .ZN(n735) );
  MAOI22D0BWP12T U169 ( .A1(n33), .A2(n470), .B1(n33), .B2(reg_array[39]), 
        .ZN(n737) );
  MAOI22D0BWP12T U170 ( .A1(n35), .A2(n470), .B1(n35), .B2(reg_array[135]), 
        .ZN(n817) );
  MAOI22D0BWP12T U171 ( .A1(n35), .A2(n472), .B1(n35), .B2(reg_array[133]), 
        .ZN(n815) );
  MAOI22D0BWP12T U172 ( .A1(n32), .A2(n470), .B1(n32), .B2(reg_array[55]), 
        .ZN(n753) );
  MAOI22D0BWP12T U173 ( .A1(n32), .A2(n472), .B1(n32), .B2(reg_array[53]), 
        .ZN(n751) );
  MAOI22D0BWP12T U174 ( .A1(n34), .A2(n470), .B1(n34), .B2(reg_array[119]), 
        .ZN(n801) );
  MAOI22D0BWP12T U175 ( .A1(n34), .A2(n471), .B1(n34), .B2(reg_array[118]), 
        .ZN(n800) );
  MAOI22D0BWP12T U176 ( .A1(n35), .A2(n475), .B1(n35), .B2(reg_array[130]), 
        .ZN(n812) );
  MAOI22D0BWP12T U177 ( .A1(n34), .A2(n473), .B1(n34), .B2(reg_array[116]), 
        .ZN(n798) );
  MAOI22D0BWP12T U178 ( .A1(n35), .A2(n471), .B1(n35), .B2(reg_array[134]), 
        .ZN(n816) );
  MAOI22D0BWP12T U179 ( .A1(n33), .A2(n476), .B1(n33), .B2(reg_array[33]), 
        .ZN(n731) );
  MAOI22D0BWP12T U180 ( .A1(n33), .A2(n475), .B1(n33), .B2(reg_array[34]), 
        .ZN(n732) );
  MAOI22D0BWP12T U181 ( .A1(n33), .A2(n474), .B1(n33), .B2(reg_array[35]), 
        .ZN(n733) );
  MAOI22D0BWP12T U182 ( .A1(n33), .A2(n473), .B1(n33), .B2(reg_array[36]), 
        .ZN(n734) );
  MAOI22D0BWP12T U183 ( .A1(n33), .A2(n471), .B1(n33), .B2(reg_array[38]), 
        .ZN(n736) );
  MAOI22D0BWP12T U184 ( .A1(n32), .A2(n474), .B1(n32), .B2(reg_array[51]), 
        .ZN(n749) );
  MAOI22D0BWP12T U185 ( .A1(n35), .A2(n476), .B1(n35), .B2(reg_array[129]), 
        .ZN(n811) );
  MAOI22D0BWP12T U186 ( .A1(n31), .A2(n476), .B1(n31), .B2(reg_array[193]), 
        .ZN(n875) );
  MAOI22D0BWP12T U187 ( .A1(n31), .A2(n475), .B1(n31), .B2(reg_array[194]), 
        .ZN(n876) );
  MAOI22D0BWP12T U188 ( .A1(n31), .A2(n474), .B1(n31), .B2(reg_array[195]), 
        .ZN(n877) );
  MAOI22D0BWP12T U189 ( .A1(n31), .A2(n473), .B1(n31), .B2(reg_array[196]), 
        .ZN(n878) );
  MAOI22D0BWP12T U190 ( .A1(n32), .A2(n473), .B1(n32), .B2(reg_array[52]), 
        .ZN(n750) );
  MAOI22D0BWP12T U191 ( .A1(n31), .A2(n471), .B1(n31), .B2(reg_array[198]), 
        .ZN(n880) );
  MAOI22D0BWP12T U192 ( .A1(n34), .A2(n474), .B1(n34), .B2(reg_array[115]), 
        .ZN(n797) );
  MAOI22D0BWP12T U193 ( .A1(n34), .A2(n475), .B1(n34), .B2(reg_array[114]), 
        .ZN(n796) );
  MAOI22D0BWP12T U194 ( .A1(n34), .A2(n476), .B1(n34), .B2(reg_array[113]), 
        .ZN(n795) );
  MAOI22D0BWP12T U195 ( .A1(n32), .A2(n475), .B1(n32), .B2(reg_array[50]), 
        .ZN(n748) );
  MAOI22D0BWP12T U196 ( .A1(n32), .A2(n471), .B1(n32), .B2(reg_array[54]), 
        .ZN(n752) );
  MAOI22D0BWP12T U197 ( .A1(n32), .A2(n476), .B1(n32), .B2(reg_array[49]), 
        .ZN(n747) );
  MAOI22D0BWP12T U198 ( .A1(n35), .A2(n473), .B1(n35), .B2(reg_array[132]), 
        .ZN(n814) );
  MAOI22D0BWP12T U199 ( .A1(n35), .A2(n474), .B1(n35), .B2(reg_array[131]), 
        .ZN(n813) );
  MAOI22D0BWP12T U200 ( .A1(n35), .A2(n462), .B1(n35), .B2(reg_array[143]), 
        .ZN(n825) );
  MAOI22D0BWP12T U201 ( .A1(n34), .A2(n469), .B1(n34), .B2(reg_array[120]), 
        .ZN(n802) );
  MAOI22D0BWP12T U202 ( .A1(n32), .A2(n462), .B1(n32), .B2(reg_array[63]), 
        .ZN(n761) );
  MAOI22D0BWP12T U203 ( .A1(n32), .A2(n463), .B1(n32), .B2(reg_array[62]), 
        .ZN(n760) );
  MAOI22D0BWP12T U204 ( .A1(n32), .A2(n464), .B1(n32), .B2(reg_array[61]), 
        .ZN(n759) );
  MAOI22D0BWP12T U205 ( .A1(n32), .A2(n465), .B1(n32), .B2(reg_array[60]), 
        .ZN(n758) );
  MAOI22D0BWP12T U206 ( .A1(n32), .A2(n466), .B1(n32), .B2(reg_array[59]), 
        .ZN(n757) );
  MAOI22D0BWP12T U207 ( .A1(n32), .A2(n467), .B1(n32), .B2(reg_array[58]), 
        .ZN(n756) );
  MAOI22D0BWP12T U208 ( .A1(n32), .A2(n468), .B1(n32), .B2(reg_array[57]), 
        .ZN(n755) );
  MAOI22D0BWP12T U209 ( .A1(n32), .A2(n469), .B1(n32), .B2(reg_array[56]), 
        .ZN(n754) );
  MAOI22D0BWP12T U210 ( .A1(n33), .A2(n462), .B1(n33), .B2(reg_array[47]), 
        .ZN(n745) );
  MAOI22D0BWP12T U211 ( .A1(n33), .A2(n463), .B1(n33), .B2(reg_array[46]), 
        .ZN(n744) );
  MAOI22D0BWP12T U212 ( .A1(n33), .A2(n464), .B1(n33), .B2(reg_array[45]), 
        .ZN(n743) );
  MAOI22D0BWP12T U213 ( .A1(n33), .A2(n465), .B1(n33), .B2(reg_array[44]), 
        .ZN(n742) );
  MAOI22D0BWP12T U214 ( .A1(n33), .A2(n466), .B1(n33), .B2(reg_array[43]), 
        .ZN(n741) );
  MAOI22D0BWP12T U215 ( .A1(n33), .A2(n467), .B1(n33), .B2(reg_array[42]), 
        .ZN(n740) );
  MAOI22D0BWP12T U216 ( .A1(n33), .A2(n468), .B1(n33), .B2(reg_array[41]), 
        .ZN(n739) );
  MAOI22D0BWP12T U217 ( .A1(n33), .A2(n469), .B1(n33), .B2(reg_array[40]), 
        .ZN(n738) );
  MAOI22D0BWP12T U218 ( .A1(n34), .A2(n464), .B1(n34), .B2(reg_array[125]), 
        .ZN(n807) );
  MAOI22D0BWP12T U219 ( .A1(n34), .A2(n463), .B1(n34), .B2(reg_array[126]), 
        .ZN(n808) );
  MAOI22D0BWP12T U220 ( .A1(n34), .A2(n462), .B1(n34), .B2(reg_array[127]), 
        .ZN(n809) );
  MAOI22D0BWP12T U221 ( .A1(n35), .A2(n464), .B1(n35), .B2(reg_array[141]), 
        .ZN(n823) );
  MAOI22D0BWP12T U222 ( .A1(n35), .A2(n468), .B1(n35), .B2(reg_array[137]), 
        .ZN(n819) );
  MAOI22D0BWP12T U223 ( .A1(n35), .A2(n467), .B1(n35), .B2(reg_array[138]), 
        .ZN(n820) );
  MAOI22D0BWP12T U224 ( .A1(n35), .A2(n463), .B1(n35), .B2(reg_array[142]), 
        .ZN(n824) );
  MAOI22D0BWP12T U225 ( .A1(n34), .A2(n466), .B1(n34), .B2(reg_array[123]), 
        .ZN(n805) );
  MAOI22D0BWP12T U226 ( .A1(n34), .A2(n465), .B1(n34), .B2(reg_array[124]), 
        .ZN(n806) );
  MAOI22D0BWP12T U227 ( .A1(n35), .A2(n465), .B1(n35), .B2(reg_array[140]), 
        .ZN(n822) );
  MAOI22D0BWP12T U228 ( .A1(n34), .A2(n468), .B1(n34), .B2(reg_array[121]), 
        .ZN(n803) );
  MAOI22D0BWP12T U229 ( .A1(n34), .A2(n467), .B1(n34), .B2(reg_array[122]), 
        .ZN(n804) );
  MAOI22D0BWP12T U230 ( .A1(n35), .A2(n469), .B1(n35), .B2(reg_array[136]), 
        .ZN(n818) );
  MAOI22D0BWP12T U231 ( .A1(n35), .A2(n466), .B1(n35), .B2(reg_array[139]), 
        .ZN(n821) );
  IND2XD1BWP12T U232 ( .A1(i_4_rd1_addr[2]), .B1(i_4_rd1_addr[0]), .ZN(n36) );
  AOI22D0BWP12T U233 ( .A1(n231), .A2(reg_array[16]), .B1(n230), .B2(
        reg_array[0]), .ZN(n40) );
  AOI22D0BWP12T U234 ( .A1(n232), .A2(reg_array[48]), .B1(n239), .B2(
        reg_array[32]), .ZN(n39) );
  AOI22D0BWP12T U235 ( .A1(n233), .A2(reg_array[80]), .B1(n479), .B2(n229), 
        .ZN(n38) );
  INVD1BWP12T U236 ( .I(n41), .ZN(n43) );
  OAI221D0BWP12T U237 ( .A1(i_4_rd1_addr[1]), .A2(reg_array[79]), .B1(n42), 
        .B2(reg_array[96]), .C(n43), .ZN(n37) );
  AN4XD1BWP12T U238 ( .A1(n40), .A2(n39), .A3(n38), .A4(n37), .Z(n50) );
  NR2XD0BWP12T U239 ( .A1(rst), .A2(i_1_reg_wr_en), .ZN(n249) );
  IND2D1BWP12T U240 ( .A1(i_4_rd1_addr[3]), .B1(n249), .ZN(n242) );
  AOI22D0BWP12T U241 ( .A1(n227), .A2(i_R_pcplus[0]), .B1(n437), .B2(
        or_R_rd1_data[0]), .ZN(n49) );
  AOI22D0BWP12T U242 ( .A1(n229), .A2(reg_array[176]), .B1(n228), .B2(
        reg_array[192]), .ZN(n46) );
  AOI22D0BWP12T U243 ( .A1(n231), .A2(reg_array[128]), .B1(n230), .B2(
        reg_array[112]), .ZN(n45) );
  AOI22D0BWP12T U244 ( .A1(n233), .A2(reg_array[208]), .B1(n232), .B2(
        reg_array[160]), .ZN(n44) );
  ND3D1BWP12T U245 ( .A1(n46), .A2(n45), .A3(n44), .ZN(n47) );
  AOI32D0BWP12T U246 ( .A1(n239), .A2(n238), .A3(reg_array[144]), .B1(n47), 
        .B2(n238), .ZN(n48) );
  OAI211D1BWP12T U247 ( .A1(n50), .A2(n242), .B(n49), .C(n48), .ZN(n682) );
  NR2D0BWP12T U248 ( .A1(n583), .A2(n219), .ZN(n55) );
  OAI22D0BWP12T U249 ( .A1(n233), .A2(reg_array[75]), .B1(n229), .B2(
        reg_array[92]), .ZN(n53) );
  AOI22D0BWP12T U250 ( .A1(n231), .A2(reg_array[28]), .B1(n230), .B2(
        reg_array[12]), .ZN(n52) );
  AOI22D0BWP12T U251 ( .A1(n232), .A2(reg_array[60]), .B1(n239), .B2(
        reg_array[44]), .ZN(n51) );
  OAI211D0BWP12T U252 ( .A1(n223), .A2(n53), .B(n52), .C(n51), .ZN(n54) );
  AOI211D0BWP12T U253 ( .A1(n226), .A2(reg_array[108]), .B(n55), .C(n54), .ZN(
        n62) );
  AOI22D0BWP12T U254 ( .A1(n227), .A2(i_R_pcplus[12]), .B1(n437), .B2(
        or_R_rd1_data[12]), .ZN(n61) );
  AOI22D0BWP12T U255 ( .A1(n229), .A2(reg_array[188]), .B1(n228), .B2(
        reg_array[204]), .ZN(n58) );
  AOI22D0BWP12T U256 ( .A1(n231), .A2(reg_array[140]), .B1(n230), .B2(
        reg_array[124]), .ZN(n57) );
  AOI22D0BWP12T U257 ( .A1(n233), .A2(reg_array[220]), .B1(n232), .B2(
        reg_array[172]), .ZN(n56) );
  ND3D1BWP12T U258 ( .A1(n58), .A2(n57), .A3(n56), .ZN(n59) );
  AOI32D0BWP12T U259 ( .A1(n239), .A2(n238), .A3(reg_array[156]), .B1(n59), 
        .B2(n238), .ZN(n60) );
  OAI211D1BWP12T U260 ( .A1(n62), .A2(n242), .B(n61), .C(n60), .ZN(n694) );
  NR2D0BWP12T U261 ( .A1(n572), .A2(n219), .ZN(n67) );
  OAI22D0BWP12T U262 ( .A1(n233), .A2(reg_array[64]), .B1(n229), .B2(
        reg_array[81]), .ZN(n65) );
  AOI22D0BWP12T U263 ( .A1(n231), .A2(reg_array[17]), .B1(n230), .B2(
        reg_array[1]), .ZN(n64) );
  AOI22D0BWP12T U264 ( .A1(n232), .A2(reg_array[49]), .B1(n239), .B2(
        reg_array[33]), .ZN(n63) );
  OAI211D0BWP12T U265 ( .A1(n223), .A2(n65), .B(n64), .C(n63), .ZN(n66) );
  AOI211D0BWP12T U266 ( .A1(n226), .A2(reg_array[97]), .B(n67), .C(n66), .ZN(
        n74) );
  AOI22D0BWP12T U267 ( .A1(n227), .A2(i_R_pcplus[1]), .B1(n437), .B2(
        or_R_rd1_data[1]), .ZN(n73) );
  AOI22D0BWP12T U268 ( .A1(n229), .A2(reg_array[177]), .B1(n228), .B2(
        reg_array[193]), .ZN(n70) );
  AOI22D0BWP12T U269 ( .A1(n231), .A2(reg_array[129]), .B1(n230), .B2(
        reg_array[113]), .ZN(n69) );
  AOI22D0BWP12T U270 ( .A1(n233), .A2(reg_array[209]), .B1(n232), .B2(
        reg_array[161]), .ZN(n68) );
  ND3D1BWP12T U271 ( .A1(n70), .A2(n69), .A3(n68), .ZN(n71) );
  AOI32D0BWP12T U272 ( .A1(n239), .A2(n238), .A3(reg_array[145]), .B1(n71), 
        .B2(n238), .ZN(n72) );
  OAI211D1BWP12T U273 ( .A1(n74), .A2(n242), .B(n73), .C(n72), .ZN(n683) );
  NR2D0BWP12T U274 ( .A1(n585), .A2(n219), .ZN(n79) );
  OAI22D0BWP12T U275 ( .A1(n233), .A2(reg_array[77]), .B1(n229), .B2(
        reg_array[94]), .ZN(n77) );
  AOI22D0BWP12T U276 ( .A1(n231), .A2(reg_array[30]), .B1(n230), .B2(
        reg_array[14]), .ZN(n76) );
  AOI22D0BWP12T U277 ( .A1(n232), .A2(reg_array[62]), .B1(n239), .B2(
        reg_array[46]), .ZN(n75) );
  OAI211D0BWP12T U278 ( .A1(n223), .A2(n77), .B(n76), .C(n75), .ZN(n78) );
  AOI211D0BWP12T U279 ( .A1(n226), .A2(reg_array[110]), .B(n79), .C(n78), .ZN(
        n86) );
  AOI22D0BWP12T U280 ( .A1(n227), .A2(i_R_pcplus[14]), .B1(n437), .B2(
        or_R_rd1_data[14]), .ZN(n85) );
  AOI22D0BWP12T U281 ( .A1(n229), .A2(reg_array[190]), .B1(n228), .B2(
        reg_array[206]), .ZN(n82) );
  AOI22D0BWP12T U282 ( .A1(n231), .A2(reg_array[142]), .B1(n230), .B2(
        reg_array[126]), .ZN(n81) );
  AOI22D0BWP12T U283 ( .A1(n233), .A2(reg_array[222]), .B1(n232), .B2(
        reg_array[174]), .ZN(n80) );
  ND3D1BWP12T U284 ( .A1(n82), .A2(n81), .A3(n80), .ZN(n83) );
  AOI32D0BWP12T U285 ( .A1(n239), .A2(n238), .A3(reg_array[158]), .B1(n83), 
        .B2(n238), .ZN(n84) );
  OAI211D1BWP12T U286 ( .A1(n86), .A2(n242), .B(n85), .C(n84), .ZN(n696) );
  NR2D0BWP12T U287 ( .A1(n573), .A2(n219), .ZN(n91) );
  OAI22D0BWP12T U288 ( .A1(n233), .A2(reg_array[65]), .B1(n229), .B2(
        reg_array[82]), .ZN(n89) );
  AOI22D0BWP12T U289 ( .A1(n231), .A2(reg_array[18]), .B1(n230), .B2(
        reg_array[2]), .ZN(n88) );
  AOI22D0BWP12T U290 ( .A1(n232), .A2(reg_array[50]), .B1(n239), .B2(
        reg_array[34]), .ZN(n87) );
  OAI211D0BWP12T U291 ( .A1(n223), .A2(n89), .B(n88), .C(n87), .ZN(n90) );
  AOI211D0BWP12T U292 ( .A1(n226), .A2(reg_array[98]), .B(n91), .C(n90), .ZN(
        n98) );
  AOI22D0BWP12T U293 ( .A1(n227), .A2(i_R_pcplus[2]), .B1(n437), .B2(
        or_R_rd1_data[2]), .ZN(n97) );
  AOI22D0BWP12T U294 ( .A1(n229), .A2(reg_array[178]), .B1(n228), .B2(
        reg_array[194]), .ZN(n94) );
  AOI22D0BWP12T U295 ( .A1(n231), .A2(reg_array[130]), .B1(n230), .B2(
        reg_array[114]), .ZN(n93) );
  AOI22D0BWP12T U296 ( .A1(n233), .A2(reg_array[210]), .B1(n232), .B2(
        reg_array[162]), .ZN(n92) );
  ND3D1BWP12T U297 ( .A1(n94), .A2(n93), .A3(n92), .ZN(n95) );
  AOI32D0BWP12T U298 ( .A1(n239), .A2(n238), .A3(reg_array[146]), .B1(n95), 
        .B2(n238), .ZN(n96) );
  OAI211D1BWP12T U299 ( .A1(n98), .A2(n242), .B(n97), .C(n96), .ZN(n684) );
  NR2D0BWP12T U300 ( .A1(n574), .A2(n219), .ZN(n103) );
  OAI22D0BWP12T U301 ( .A1(n233), .A2(reg_array[66]), .B1(n229), .B2(
        reg_array[83]), .ZN(n101) );
  AOI22D0BWP12T U302 ( .A1(n231), .A2(reg_array[19]), .B1(n230), .B2(
        reg_array[3]), .ZN(n100) );
  AOI22D0BWP12T U303 ( .A1(n232), .A2(reg_array[51]), .B1(n239), .B2(
        reg_array[35]), .ZN(n99) );
  OAI211D0BWP12T U304 ( .A1(n223), .A2(n101), .B(n100), .C(n99), .ZN(n102) );
  AOI211D0BWP12T U305 ( .A1(n226), .A2(reg_array[99]), .B(n103), .C(n102), 
        .ZN(n110) );
  AOI22D0BWP12T U306 ( .A1(n227), .A2(i_R_pcplus[3]), .B1(n437), .B2(
        or_R_rd1_data[3]), .ZN(n109) );
  AOI22D0BWP12T U307 ( .A1(n229), .A2(reg_array[179]), .B1(n228), .B2(
        reg_array[195]), .ZN(n106) );
  AOI22D0BWP12T U308 ( .A1(n231), .A2(reg_array[131]), .B1(n230), .B2(
        reg_array[115]), .ZN(n105) );
  AOI22D0BWP12T U309 ( .A1(n233), .A2(reg_array[211]), .B1(n232), .B2(
        reg_array[163]), .ZN(n104) );
  ND3D1BWP12T U310 ( .A1(n106), .A2(n105), .A3(n104), .ZN(n107) );
  AOI32D0BWP12T U311 ( .A1(n239), .A2(n238), .A3(reg_array[147]), .B1(n107), 
        .B2(n238), .ZN(n108) );
  OAI211D1BWP12T U312 ( .A1(n110), .A2(n242), .B(n109), .C(n108), .ZN(n685) );
  NR2D0BWP12T U313 ( .A1(n580), .A2(n219), .ZN(n115) );
  OAI22D0BWP12T U314 ( .A1(n233), .A2(reg_array[72]), .B1(n229), .B2(
        reg_array[89]), .ZN(n113) );
  AOI22D0BWP12T U315 ( .A1(n231), .A2(reg_array[25]), .B1(n230), .B2(
        reg_array[9]), .ZN(n112) );
  AOI22D0BWP12T U316 ( .A1(n232), .A2(reg_array[57]), .B1(n239), .B2(
        reg_array[41]), .ZN(n111) );
  OAI211D0BWP12T U317 ( .A1(n223), .A2(n113), .B(n112), .C(n111), .ZN(n114) );
  AOI211D0BWP12T U318 ( .A1(n226), .A2(reg_array[105]), .B(n115), .C(n114), 
        .ZN(n122) );
  AOI22D0BWP12T U319 ( .A1(n227), .A2(i_R_pcplus[9]), .B1(n437), .B2(
        or_R_rd1_data[9]), .ZN(n121) );
  AOI22D0BWP12T U320 ( .A1(n229), .A2(reg_array[185]), .B1(n228), .B2(
        reg_array[201]), .ZN(n118) );
  AOI22D0BWP12T U321 ( .A1(n231), .A2(reg_array[137]), .B1(n230), .B2(
        reg_array[121]), .ZN(n117) );
  AOI22D0BWP12T U322 ( .A1(n233), .A2(reg_array[217]), .B1(n232), .B2(
        reg_array[169]), .ZN(n116) );
  ND3D1BWP12T U323 ( .A1(n118), .A2(n117), .A3(n116), .ZN(n119) );
  AOI32D0BWP12T U324 ( .A1(n239), .A2(n238), .A3(reg_array[153]), .B1(n119), 
        .B2(n238), .ZN(n120) );
  OAI211D1BWP12T U325 ( .A1(n122), .A2(n242), .B(n121), .C(n120), .ZN(n691) );
  NR2D0BWP12T U326 ( .A1(n575), .A2(n219), .ZN(n127) );
  OAI22D0BWP12T U327 ( .A1(n233), .A2(reg_array[67]), .B1(n229), .B2(
        reg_array[84]), .ZN(n125) );
  AOI22D0BWP12T U328 ( .A1(n231), .A2(reg_array[20]), .B1(n230), .B2(
        reg_array[4]), .ZN(n124) );
  AOI22D0BWP12T U329 ( .A1(n232), .A2(reg_array[52]), .B1(n239), .B2(
        reg_array[36]), .ZN(n123) );
  OAI211D0BWP12T U330 ( .A1(n223), .A2(n125), .B(n124), .C(n123), .ZN(n126) );
  AOI211D0BWP12T U331 ( .A1(n226), .A2(reg_array[100]), .B(n127), .C(n126), 
        .ZN(n134) );
  AOI22D0BWP12T U332 ( .A1(n227), .A2(i_R_pcplus[4]), .B1(n437), .B2(
        or_R_rd1_data[4]), .ZN(n133) );
  AOI22D0BWP12T U333 ( .A1(n229), .A2(reg_array[180]), .B1(n228), .B2(
        reg_array[196]), .ZN(n130) );
  AOI22D0BWP12T U334 ( .A1(n231), .A2(reg_array[132]), .B1(n230), .B2(
        reg_array[116]), .ZN(n129) );
  AOI22D0BWP12T U335 ( .A1(n233), .A2(reg_array[212]), .B1(n232), .B2(
        reg_array[164]), .ZN(n128) );
  ND3D1BWP12T U336 ( .A1(n130), .A2(n129), .A3(n128), .ZN(n131) );
  AOI32D0BWP12T U337 ( .A1(n239), .A2(n238), .A3(reg_array[148]), .B1(n131), 
        .B2(n238), .ZN(n132) );
  OAI211D1BWP12T U338 ( .A1(n134), .A2(n242), .B(n133), .C(n132), .ZN(n686) );
  NR2D0BWP12T U339 ( .A1(n582), .A2(n219), .ZN(n139) );
  OAI22D0BWP12T U340 ( .A1(n233), .A2(reg_array[74]), .B1(n229), .B2(
        reg_array[91]), .ZN(n137) );
  AOI22D0BWP12T U341 ( .A1(n231), .A2(reg_array[27]), .B1(n230), .B2(
        reg_array[11]), .ZN(n136) );
  AOI22D0BWP12T U342 ( .A1(n232), .A2(reg_array[59]), .B1(n239), .B2(
        reg_array[43]), .ZN(n135) );
  OAI211D0BWP12T U343 ( .A1(n223), .A2(n137), .B(n136), .C(n135), .ZN(n138) );
  AOI211D0BWP12T U344 ( .A1(n226), .A2(reg_array[107]), .B(n139), .C(n138), 
        .ZN(n146) );
  AOI22D0BWP12T U345 ( .A1(n227), .A2(i_R_pcplus[11]), .B1(n437), .B2(
        or_R_rd1_data[11]), .ZN(n145) );
  AOI22D0BWP12T U346 ( .A1(n229), .A2(reg_array[187]), .B1(n228), .B2(
        reg_array[203]), .ZN(n142) );
  AOI22D0BWP12T U347 ( .A1(n231), .A2(reg_array[139]), .B1(n230), .B2(
        reg_array[123]), .ZN(n141) );
  AOI22D0BWP12T U348 ( .A1(n233), .A2(reg_array[219]), .B1(n232), .B2(
        reg_array[171]), .ZN(n140) );
  ND3D1BWP12T U349 ( .A1(n142), .A2(n141), .A3(n140), .ZN(n143) );
  AOI32D0BWP12T U350 ( .A1(n239), .A2(n238), .A3(reg_array[155]), .B1(n143), 
        .B2(n238), .ZN(n144) );
  OAI211D1BWP12T U351 ( .A1(n146), .A2(n242), .B(n145), .C(n144), .ZN(n693) );
  NR2D0BWP12T U352 ( .A1(n576), .A2(n219), .ZN(n151) );
  OAI22D0BWP12T U353 ( .A1(n233), .A2(reg_array[68]), .B1(n229), .B2(
        reg_array[85]), .ZN(n149) );
  AOI22D0BWP12T U354 ( .A1(n231), .A2(reg_array[21]), .B1(n230), .B2(
        reg_array[5]), .ZN(n148) );
  AOI22D0BWP12T U355 ( .A1(n232), .A2(reg_array[53]), .B1(n239), .B2(
        reg_array[37]), .ZN(n147) );
  OAI211D0BWP12T U356 ( .A1(n223), .A2(n149), .B(n148), .C(n147), .ZN(n150) );
  AOI211D0BWP12T U357 ( .A1(n226), .A2(reg_array[101]), .B(n151), .C(n150), 
        .ZN(n158) );
  AOI22D0BWP12T U358 ( .A1(n227), .A2(i_R_pcplus[5]), .B1(n437), .B2(
        or_R_rd1_data[5]), .ZN(n157) );
  AOI22D0BWP12T U359 ( .A1(n229), .A2(reg_array[181]), .B1(n228), .B2(
        reg_array[197]), .ZN(n154) );
  AOI22D0BWP12T U360 ( .A1(n231), .A2(reg_array[133]), .B1(n230), .B2(
        reg_array[117]), .ZN(n153) );
  AOI22D0BWP12T U361 ( .A1(n233), .A2(reg_array[213]), .B1(n232), .B2(
        reg_array[165]), .ZN(n152) );
  ND3D1BWP12T U362 ( .A1(n154), .A2(n153), .A3(n152), .ZN(n155) );
  AOI32D0BWP12T U363 ( .A1(n239), .A2(n238), .A3(reg_array[149]), .B1(n155), 
        .B2(n238), .ZN(n156) );
  OAI211D1BWP12T U364 ( .A1(n158), .A2(n242), .B(n157), .C(n156), .ZN(n687) );
  NR2D0BWP12T U365 ( .A1(n577), .A2(n219), .ZN(n163) );
  OAI22D0BWP12T U366 ( .A1(n233), .A2(reg_array[69]), .B1(n229), .B2(
        reg_array[86]), .ZN(n161) );
  AOI22D0BWP12T U367 ( .A1(n231), .A2(reg_array[22]), .B1(n230), .B2(
        reg_array[6]), .ZN(n160) );
  AOI22D0BWP12T U368 ( .A1(n232), .A2(reg_array[54]), .B1(n239), .B2(
        reg_array[38]), .ZN(n159) );
  OAI211D0BWP12T U369 ( .A1(n223), .A2(n161), .B(n160), .C(n159), .ZN(n162) );
  AOI211D0BWP12T U370 ( .A1(n226), .A2(reg_array[102]), .B(n163), .C(n162), 
        .ZN(n170) );
  AOI22D0BWP12T U371 ( .A1(n227), .A2(i_R_pcplus[6]), .B1(n437), .B2(
        or_R_rd1_data[6]), .ZN(n169) );
  AOI22D0BWP12T U372 ( .A1(n229), .A2(reg_array[182]), .B1(n228), .B2(
        reg_array[198]), .ZN(n166) );
  AOI22D0BWP12T U373 ( .A1(n231), .A2(reg_array[134]), .B1(n230), .B2(
        reg_array[118]), .ZN(n165) );
  AOI22D0BWP12T U374 ( .A1(n233), .A2(reg_array[214]), .B1(n232), .B2(
        reg_array[166]), .ZN(n164) );
  ND3D1BWP12T U375 ( .A1(n166), .A2(n165), .A3(n164), .ZN(n167) );
  AOI32D0BWP12T U376 ( .A1(n239), .A2(n238), .A3(reg_array[150]), .B1(n167), 
        .B2(n238), .ZN(n168) );
  OAI211D1BWP12T U377 ( .A1(n170), .A2(n242), .B(n169), .C(n168), .ZN(n688) );
  NR2D0BWP12T U378 ( .A1(n578), .A2(n219), .ZN(n175) );
  OAI22D0BWP12T U379 ( .A1(n233), .A2(reg_array[70]), .B1(n229), .B2(
        reg_array[87]), .ZN(n173) );
  AOI22D0BWP12T U380 ( .A1(n231), .A2(reg_array[23]), .B1(n230), .B2(
        reg_array[7]), .ZN(n172) );
  AOI22D0BWP12T U381 ( .A1(n232), .A2(reg_array[55]), .B1(n239), .B2(
        reg_array[39]), .ZN(n171) );
  OAI211D0BWP12T U382 ( .A1(n223), .A2(n173), .B(n172), .C(n171), .ZN(n174) );
  AOI211D0BWP12T U383 ( .A1(n226), .A2(reg_array[103]), .B(n175), .C(n174), 
        .ZN(n182) );
  AOI22D0BWP12T U384 ( .A1(n227), .A2(i_R_pcplus[7]), .B1(n437), .B2(
        or_R_rd1_data[7]), .ZN(n181) );
  AOI22D0BWP12T U385 ( .A1(n229), .A2(reg_array[183]), .B1(n228), .B2(
        reg_array[199]), .ZN(n178) );
  AOI22D0BWP12T U386 ( .A1(n231), .A2(reg_array[135]), .B1(n230), .B2(
        reg_array[119]), .ZN(n177) );
  AOI22D0BWP12T U387 ( .A1(n233), .A2(reg_array[215]), .B1(n232), .B2(
        reg_array[167]), .ZN(n176) );
  ND3D1BWP12T U388 ( .A1(n178), .A2(n177), .A3(n176), .ZN(n179) );
  AOI32D0BWP12T U389 ( .A1(n239), .A2(n238), .A3(reg_array[151]), .B1(n179), 
        .B2(n238), .ZN(n180) );
  OAI211D1BWP12T U390 ( .A1(n182), .A2(n242), .B(n181), .C(n180), .ZN(n689) );
  NR2D0BWP12T U391 ( .A1(n579), .A2(n219), .ZN(n187) );
  OAI22D0BWP12T U392 ( .A1(n233), .A2(reg_array[71]), .B1(n229), .B2(
        reg_array[88]), .ZN(n185) );
  AOI22D0BWP12T U393 ( .A1(n231), .A2(reg_array[24]), .B1(n230), .B2(
        reg_array[8]), .ZN(n184) );
  AOI22D0BWP12T U394 ( .A1(n232), .A2(reg_array[56]), .B1(n239), .B2(
        reg_array[40]), .ZN(n183) );
  OAI211D0BWP12T U395 ( .A1(n223), .A2(n185), .B(n184), .C(n183), .ZN(n186) );
  AOI211D0BWP12T U396 ( .A1(n226), .A2(reg_array[104]), .B(n187), .C(n186), 
        .ZN(n194) );
  AOI22D0BWP12T U397 ( .A1(n227), .A2(i_R_pcplus[8]), .B1(n437), .B2(
        or_R_rd1_data[8]), .ZN(n193) );
  AOI22D0BWP12T U398 ( .A1(n229), .A2(reg_array[184]), .B1(n228), .B2(
        reg_array[200]), .ZN(n190) );
  AOI22D0BWP12T U399 ( .A1(n231), .A2(reg_array[136]), .B1(n230), .B2(
        reg_array[120]), .ZN(n189) );
  AOI22D0BWP12T U400 ( .A1(n233), .A2(reg_array[216]), .B1(n232), .B2(
        reg_array[168]), .ZN(n188) );
  ND3D1BWP12T U401 ( .A1(n190), .A2(n189), .A3(n188), .ZN(n191) );
  AOI32D0BWP12T U402 ( .A1(n239), .A2(n238), .A3(reg_array[152]), .B1(n191), 
        .B2(n238), .ZN(n192) );
  OAI211D1BWP12T U403 ( .A1(n194), .A2(n242), .B(n193), .C(n192), .ZN(n690) );
  NR2D0BWP12T U404 ( .A1(n581), .A2(n219), .ZN(n199) );
  OAI22D0BWP12T U405 ( .A1(n233), .A2(reg_array[73]), .B1(n229), .B2(
        reg_array[90]), .ZN(n197) );
  AOI22D0BWP12T U406 ( .A1(n231), .A2(reg_array[26]), .B1(n230), .B2(
        reg_array[10]), .ZN(n196) );
  AOI22D0BWP12T U407 ( .A1(n232), .A2(reg_array[58]), .B1(n239), .B2(
        reg_array[42]), .ZN(n195) );
  OAI211D0BWP12T U408 ( .A1(n223), .A2(n197), .B(n196), .C(n195), .ZN(n198) );
  AOI211D0BWP12T U409 ( .A1(n226), .A2(reg_array[106]), .B(n199), .C(n198), 
        .ZN(n206) );
  AOI22D0BWP12T U410 ( .A1(n227), .A2(i_R_pcplus[10]), .B1(n437), .B2(
        or_R_rd1_data[10]), .ZN(n205) );
  AOI22D0BWP12T U411 ( .A1(n229), .A2(reg_array[186]), .B1(n228), .B2(
        reg_array[202]), .ZN(n202) );
  AOI22D0BWP12T U412 ( .A1(n231), .A2(reg_array[138]), .B1(n230), .B2(
        reg_array[122]), .ZN(n201) );
  AOI22D0BWP12T U413 ( .A1(n233), .A2(reg_array[218]), .B1(n232), .B2(
        reg_array[170]), .ZN(n200) );
  ND3D1BWP12T U414 ( .A1(n202), .A2(n201), .A3(n200), .ZN(n203) );
  AOI32D0BWP12T U415 ( .A1(n239), .A2(n238), .A3(reg_array[154]), .B1(n203), 
        .B2(n238), .ZN(n204) );
  OAI211D1BWP12T U416 ( .A1(n206), .A2(n242), .B(n205), .C(n204), .ZN(n692) );
  NR2D0BWP12T U417 ( .A1(n584), .A2(n219), .ZN(n211) );
  OAI22D0BWP12T U418 ( .A1(n233), .A2(reg_array[76]), .B1(n229), .B2(
        reg_array[93]), .ZN(n209) );
  AOI22D0BWP12T U419 ( .A1(n231), .A2(reg_array[29]), .B1(n230), .B2(
        reg_array[13]), .ZN(n208) );
  AOI22D0BWP12T U420 ( .A1(n232), .A2(reg_array[61]), .B1(n239), .B2(
        reg_array[45]), .ZN(n207) );
  OAI211D0BWP12T U421 ( .A1(n223), .A2(n209), .B(n208), .C(n207), .ZN(n210) );
  AOI211D0BWP12T U422 ( .A1(n226), .A2(reg_array[109]), .B(n211), .C(n210), 
        .ZN(n218) );
  AOI22D0BWP12T U423 ( .A1(n227), .A2(i_R_pcplus[13]), .B1(n437), .B2(
        or_R_rd1_data[13]), .ZN(n217) );
  AOI22D0BWP12T U424 ( .A1(n229), .A2(reg_array[189]), .B1(n228), .B2(
        reg_array[205]), .ZN(n214) );
  AOI22D0BWP12T U425 ( .A1(n231), .A2(reg_array[141]), .B1(n230), .B2(
        reg_array[125]), .ZN(n213) );
  AOI22D0BWP12T U426 ( .A1(n233), .A2(reg_array[221]), .B1(n232), .B2(
        reg_array[173]), .ZN(n212) );
  ND3D1BWP12T U427 ( .A1(n214), .A2(n213), .A3(n212), .ZN(n215) );
  AOI32D0BWP12T U428 ( .A1(n239), .A2(n238), .A3(reg_array[157]), .B1(n215), 
        .B2(n238), .ZN(n216) );
  OAI211D1BWP12T U429 ( .A1(n218), .A2(n242), .B(n217), .C(n216), .ZN(n695) );
  NR2D0BWP12T U430 ( .A1(n587), .A2(n219), .ZN(n225) );
  OAI22D0BWP12T U431 ( .A1(reg_array[78]), .A2(n233), .B1(reg_array[95]), .B2(
        n229), .ZN(n222) );
  AOI22D0BWP12T U432 ( .A1(reg_array[31]), .A2(n231), .B1(reg_array[15]), .B2(
        n230), .ZN(n221) );
  AOI22D0BWP12T U433 ( .A1(reg_array[63]), .A2(n232), .B1(reg_array[47]), .B2(
        n239), .ZN(n220) );
  OAI211D0BWP12T U434 ( .A1(n223), .A2(n222), .B(n221), .C(n220), .ZN(n224) );
  AOI211D0BWP12T U435 ( .A1(n226), .A2(reg_array[111]), .B(n225), .C(n224), 
        .ZN(n243) );
  AOI22D0BWP12T U436 ( .A1(i_R_pcplus[15]), .A2(n227), .B1(n437), .B2(
        or_R_rd1_data[15]), .ZN(n241) );
  AOI22D0BWP12T U437 ( .A1(n229), .A2(reg_array[191]), .B1(n228), .B2(
        reg_array[207]), .ZN(n236) );
  AOI22D0BWP12T U438 ( .A1(n231), .A2(reg_array[143]), .B1(n230), .B2(
        reg_array[127]), .ZN(n235) );
  AOI22D0BWP12T U439 ( .A1(n233), .A2(reg_array[223]), .B1(n232), .B2(
        reg_array[175]), .ZN(n234) );
  ND3D1BWP12T U440 ( .A1(n236), .A2(n235), .A3(n234), .ZN(n237) );
  AOI32D0BWP12T U441 ( .A1(n239), .A2(n238), .A3(reg_array[159]), .B1(n237), 
        .B2(n238), .ZN(n240) );
  OAI211D1BWP12T U442 ( .A1(n243), .A2(n242), .B(n241), .C(n240), .ZN(n697) );
  IND2XD1BWP12T U443 ( .A1(i_4_rd2_addr[2]), .B1(i_4_rd2_addr[0]), .ZN(n244)
         );
  AOI22D0BWP12T U444 ( .A1(reg_array[16]), .A2(n441), .B1(reg_array[0]), .B2(
        n440), .ZN(n248) );
  AOI22D0BWP12T U445 ( .A1(reg_array[48]), .A2(n442), .B1(reg_array[32]), .B2(
        n448), .ZN(n247) );
  AOI22D0BWP12T U446 ( .A1(n443), .A2(reg_array[80]), .B1(n479), .B2(n439), 
        .ZN(n246) );
  INVD1BWP12T U447 ( .I(n250), .ZN(n252) );
  OAI221D0BWP12T U448 ( .A1(i_4_rd2_addr[1]), .A2(reg_array[79]), .B1(n251), 
        .B2(reg_array[96]), .C(n252), .ZN(n245) );
  AN4XD1BWP12T U449 ( .A1(n248), .A2(n247), .A3(n246), .A4(n245), .Z(n259) );
  IND2D1BWP12T U450 ( .A1(i_4_rd2_addr[3]), .B1(n249), .ZN(n452) );
  AOI22D0BWP12T U451 ( .A1(n437), .A2(or_R_rd2_data[0]), .B1(i_R_pcplus[0]), 
        .B2(n436), .ZN(n258) );
  AOI22D0BWP12T U452 ( .A1(reg_array[176]), .A2(n439), .B1(reg_array[192]), 
        .B2(n438), .ZN(n255) );
  AOI22D0BWP12T U453 ( .A1(reg_array[128]), .A2(n441), .B1(reg_array[112]), 
        .B2(n440), .ZN(n254) );
  AOI22D0BWP12T U454 ( .A1(reg_array[208]), .A2(n443), .B1(reg_array[160]), 
        .B2(n442), .ZN(n253) );
  ND3D1BWP12T U455 ( .A1(n255), .A2(n254), .A3(n253), .ZN(n256) );
  AOI32D0BWP12T U456 ( .A1(reg_array[144]), .A2(n449), .A3(n448), .B1(n256), 
        .B2(n449), .ZN(n257) );
  OAI211D1BWP12T U457 ( .A1(n259), .A2(n452), .B(n258), .C(n257), .ZN(n666) );
  NR2D0BWP12T U458 ( .A1(n572), .A2(n428), .ZN(n264) );
  OAI22D0BWP12T U459 ( .A1(reg_array[64]), .A2(n443), .B1(reg_array[81]), .B2(
        n439), .ZN(n262) );
  AOI22D0BWP12T U460 ( .A1(reg_array[17]), .A2(n441), .B1(reg_array[1]), .B2(
        n440), .ZN(n261) );
  AOI22D0BWP12T U461 ( .A1(reg_array[49]), .A2(n442), .B1(reg_array[33]), .B2(
        n448), .ZN(n260) );
  OAI211D0BWP12T U462 ( .A1(n432), .A2(n262), .B(n261), .C(n260), .ZN(n263) );
  AOI211D0BWP12T U463 ( .A1(n435), .A2(reg_array[97]), .B(n264), .C(n263), 
        .ZN(n271) );
  AOI22D0BWP12T U464 ( .A1(n437), .A2(or_R_rd2_data[1]), .B1(i_R_pcplus[1]), 
        .B2(n436), .ZN(n270) );
  AOI22D0BWP12T U465 ( .A1(reg_array[177]), .A2(n439), .B1(reg_array[193]), 
        .B2(n438), .ZN(n267) );
  AOI22D0BWP12T U466 ( .A1(reg_array[129]), .A2(n441), .B1(reg_array[113]), 
        .B2(n440), .ZN(n266) );
  AOI22D0BWP12T U467 ( .A1(reg_array[209]), .A2(n443), .B1(reg_array[161]), 
        .B2(n442), .ZN(n265) );
  ND3D1BWP12T U468 ( .A1(n267), .A2(n266), .A3(n265), .ZN(n268) );
  AOI32D0BWP12T U469 ( .A1(reg_array[145]), .A2(n449), .A3(n448), .B1(n268), 
        .B2(n449), .ZN(n269) );
  OAI211D1BWP12T U470 ( .A1(n271), .A2(n452), .B(n270), .C(n269), .ZN(n667) );
  NR2D0BWP12T U471 ( .A1(n580), .A2(n428), .ZN(n276) );
  OAI22D0BWP12T U472 ( .A1(reg_array[72]), .A2(n443), .B1(reg_array[89]), .B2(
        n439), .ZN(n274) );
  AOI22D0BWP12T U473 ( .A1(reg_array[25]), .A2(n441), .B1(reg_array[9]), .B2(
        n440), .ZN(n273) );
  AOI22D0BWP12T U474 ( .A1(reg_array[57]), .A2(n442), .B1(reg_array[41]), .B2(
        n448), .ZN(n272) );
  OAI211D0BWP12T U475 ( .A1(n432), .A2(n274), .B(n273), .C(n272), .ZN(n275) );
  AOI211D0BWP12T U476 ( .A1(n435), .A2(reg_array[105]), .B(n276), .C(n275), 
        .ZN(n283) );
  AOI22D0BWP12T U477 ( .A1(n437), .A2(or_R_rd2_data[9]), .B1(i_R_pcplus[9]), 
        .B2(n436), .ZN(n282) );
  AOI22D0BWP12T U478 ( .A1(reg_array[185]), .A2(n439), .B1(reg_array[201]), 
        .B2(n438), .ZN(n279) );
  AOI22D0BWP12T U479 ( .A1(reg_array[137]), .A2(n441), .B1(reg_array[121]), 
        .B2(n440), .ZN(n278) );
  AOI22D0BWP12T U480 ( .A1(reg_array[217]), .A2(n443), .B1(reg_array[169]), 
        .B2(n442), .ZN(n277) );
  ND3D1BWP12T U481 ( .A1(n279), .A2(n278), .A3(n277), .ZN(n280) );
  AOI32D0BWP12T U482 ( .A1(reg_array[153]), .A2(n449), .A3(n448), .B1(n280), 
        .B2(n449), .ZN(n281) );
  OAI211D1BWP12T U483 ( .A1(n283), .A2(n452), .B(n282), .C(n281), .ZN(n675) );
  NR2D0BWP12T U484 ( .A1(n585), .A2(n428), .ZN(n288) );
  OAI22D0BWP12T U485 ( .A1(reg_array[77]), .A2(n443), .B1(reg_array[94]), .B2(
        n439), .ZN(n286) );
  AOI22D0BWP12T U486 ( .A1(reg_array[30]), .A2(n441), .B1(reg_array[14]), .B2(
        n440), .ZN(n285) );
  AOI22D0BWP12T U487 ( .A1(reg_array[62]), .A2(n442), .B1(reg_array[46]), .B2(
        n448), .ZN(n284) );
  OAI211D0BWP12T U488 ( .A1(n432), .A2(n286), .B(n285), .C(n284), .ZN(n287) );
  AOI211D0BWP12T U489 ( .A1(n435), .A2(reg_array[110]), .B(n288), .C(n287), 
        .ZN(n295) );
  AOI22D0BWP12T U490 ( .A1(n437), .A2(or_R_rd2_data[14]), .B1(i_R_pcplus[14]), 
        .B2(n436), .ZN(n294) );
  AOI22D0BWP12T U491 ( .A1(reg_array[190]), .A2(n439), .B1(reg_array[206]), 
        .B2(n438), .ZN(n291) );
  AOI22D0BWP12T U492 ( .A1(reg_array[142]), .A2(n441), .B1(reg_array[126]), 
        .B2(n440), .ZN(n290) );
  AOI22D0BWP12T U493 ( .A1(reg_array[222]), .A2(n443), .B1(reg_array[174]), 
        .B2(n442), .ZN(n289) );
  ND3D1BWP12T U494 ( .A1(n291), .A2(n290), .A3(n289), .ZN(n292) );
  AOI32D0BWP12T U495 ( .A1(reg_array[158]), .A2(n449), .A3(n448), .B1(n292), 
        .B2(n449), .ZN(n293) );
  OAI211D1BWP12T U496 ( .A1(n295), .A2(n452), .B(n294), .C(n293), .ZN(n680) );
  NR2D0BWP12T U497 ( .A1(n578), .A2(n428), .ZN(n300) );
  OAI22D0BWP12T U498 ( .A1(reg_array[70]), .A2(n443), .B1(reg_array[87]), .B2(
        n439), .ZN(n298) );
  AOI22D0BWP12T U499 ( .A1(reg_array[23]), .A2(n441), .B1(reg_array[7]), .B2(
        n440), .ZN(n297) );
  AOI22D0BWP12T U500 ( .A1(reg_array[55]), .A2(n442), .B1(reg_array[39]), .B2(
        n448), .ZN(n296) );
  OAI211D0BWP12T U501 ( .A1(n432), .A2(n298), .B(n297), .C(n296), .ZN(n299) );
  AOI211D0BWP12T U502 ( .A1(n435), .A2(reg_array[103]), .B(n300), .C(n299), 
        .ZN(n307) );
  AOI22D0BWP12T U503 ( .A1(n437), .A2(or_R_rd2_data[7]), .B1(i_R_pcplus[7]), 
        .B2(n436), .ZN(n306) );
  AOI22D0BWP12T U504 ( .A1(reg_array[183]), .A2(n439), .B1(reg_array[199]), 
        .B2(n438), .ZN(n303) );
  AOI22D0BWP12T U505 ( .A1(reg_array[135]), .A2(n441), .B1(reg_array[119]), 
        .B2(n440), .ZN(n302) );
  AOI22D0BWP12T U506 ( .A1(reg_array[215]), .A2(n443), .B1(reg_array[167]), 
        .B2(n442), .ZN(n301) );
  ND3D1BWP12T U507 ( .A1(n303), .A2(n302), .A3(n301), .ZN(n304) );
  AOI32D0BWP12T U508 ( .A1(reg_array[151]), .A2(n449), .A3(n448), .B1(n304), 
        .B2(n449), .ZN(n305) );
  OAI211D1BWP12T U509 ( .A1(n307), .A2(n452), .B(n306), .C(n305), .ZN(n673) );
  NR2D0BWP12T U510 ( .A1(n577), .A2(n428), .ZN(n312) );
  OAI22D0BWP12T U511 ( .A1(reg_array[69]), .A2(n443), .B1(reg_array[86]), .B2(
        n439), .ZN(n310) );
  AOI22D0BWP12T U512 ( .A1(reg_array[22]), .A2(n441), .B1(reg_array[6]), .B2(
        n440), .ZN(n309) );
  AOI22D0BWP12T U513 ( .A1(reg_array[54]), .A2(n442), .B1(reg_array[38]), .B2(
        n448), .ZN(n308) );
  OAI211D0BWP12T U514 ( .A1(n432), .A2(n310), .B(n309), .C(n308), .ZN(n311) );
  AOI211D0BWP12T U515 ( .A1(n435), .A2(reg_array[102]), .B(n312), .C(n311), 
        .ZN(n319) );
  AOI22D0BWP12T U516 ( .A1(n437), .A2(or_R_rd2_data[6]), .B1(i_R_pcplus[6]), 
        .B2(n436), .ZN(n318) );
  AOI22D0BWP12T U517 ( .A1(reg_array[182]), .A2(n439), .B1(reg_array[198]), 
        .B2(n438), .ZN(n315) );
  AOI22D0BWP12T U518 ( .A1(reg_array[134]), .A2(n441), .B1(reg_array[118]), 
        .B2(n440), .ZN(n314) );
  AOI22D0BWP12T U519 ( .A1(reg_array[214]), .A2(n443), .B1(reg_array[166]), 
        .B2(n442), .ZN(n313) );
  ND3D1BWP12T U520 ( .A1(n315), .A2(n314), .A3(n313), .ZN(n316) );
  AOI32D0BWP12T U521 ( .A1(reg_array[150]), .A2(n449), .A3(n448), .B1(n316), 
        .B2(n449), .ZN(n317) );
  OAI211D1BWP12T U522 ( .A1(n319), .A2(n452), .B(n318), .C(n317), .ZN(n672) );
  NR2D0BWP12T U523 ( .A1(n576), .A2(n428), .ZN(n324) );
  OAI22D0BWP12T U524 ( .A1(reg_array[68]), .A2(n443), .B1(reg_array[85]), .B2(
        n439), .ZN(n322) );
  AOI22D0BWP12T U525 ( .A1(reg_array[21]), .A2(n441), .B1(reg_array[5]), .B2(
        n440), .ZN(n321) );
  AOI22D0BWP12T U526 ( .A1(reg_array[53]), .A2(n442), .B1(reg_array[37]), .B2(
        n448), .ZN(n320) );
  OAI211D0BWP12T U527 ( .A1(n432), .A2(n322), .B(n321), .C(n320), .ZN(n323) );
  AOI211D0BWP12T U528 ( .A1(n435), .A2(reg_array[101]), .B(n324), .C(n323), 
        .ZN(n331) );
  AOI22D0BWP12T U529 ( .A1(n437), .A2(or_R_rd2_data[5]), .B1(i_R_pcplus[5]), 
        .B2(n436), .ZN(n330) );
  AOI22D0BWP12T U530 ( .A1(reg_array[181]), .A2(n439), .B1(reg_array[197]), 
        .B2(n438), .ZN(n327) );
  AOI22D0BWP12T U531 ( .A1(reg_array[133]), .A2(n441), .B1(reg_array[117]), 
        .B2(n440), .ZN(n326) );
  AOI22D0BWP12T U532 ( .A1(reg_array[213]), .A2(n443), .B1(reg_array[165]), 
        .B2(n442), .ZN(n325) );
  ND3D1BWP12T U533 ( .A1(n327), .A2(n326), .A3(n325), .ZN(n328) );
  AOI32D0BWP12T U534 ( .A1(reg_array[149]), .A2(n449), .A3(n448), .B1(n328), 
        .B2(n449), .ZN(n329) );
  OAI211D1BWP12T U535 ( .A1(n331), .A2(n452), .B(n330), .C(n329), .ZN(n671) );
  NR2D0BWP12T U536 ( .A1(n582), .A2(n428), .ZN(n336) );
  OAI22D0BWP12T U537 ( .A1(reg_array[74]), .A2(n443), .B1(reg_array[91]), .B2(
        n439), .ZN(n334) );
  AOI22D0BWP12T U538 ( .A1(reg_array[27]), .A2(n441), .B1(reg_array[11]), .B2(
        n440), .ZN(n333) );
  AOI22D0BWP12T U539 ( .A1(reg_array[59]), .A2(n442), .B1(reg_array[43]), .B2(
        n448), .ZN(n332) );
  OAI211D0BWP12T U540 ( .A1(n432), .A2(n334), .B(n333), .C(n332), .ZN(n335) );
  AOI211D0BWP12T U541 ( .A1(n435), .A2(reg_array[107]), .B(n336), .C(n335), 
        .ZN(n343) );
  AOI22D0BWP12T U542 ( .A1(n437), .A2(or_R_rd2_data[11]), .B1(i_R_pcplus[11]), 
        .B2(n436), .ZN(n342) );
  AOI22D0BWP12T U543 ( .A1(reg_array[187]), .A2(n439), .B1(reg_array[203]), 
        .B2(n438), .ZN(n339) );
  AOI22D0BWP12T U544 ( .A1(reg_array[139]), .A2(n441), .B1(reg_array[123]), 
        .B2(n440), .ZN(n338) );
  AOI22D0BWP12T U545 ( .A1(reg_array[219]), .A2(n443), .B1(reg_array[171]), 
        .B2(n442), .ZN(n337) );
  ND3D1BWP12T U546 ( .A1(n339), .A2(n338), .A3(n337), .ZN(n340) );
  AOI32D0BWP12T U547 ( .A1(reg_array[155]), .A2(n449), .A3(n448), .B1(n340), 
        .B2(n449), .ZN(n341) );
  OAI211D1BWP12T U548 ( .A1(n343), .A2(n452), .B(n342), .C(n341), .ZN(n677) );
  NR2D0BWP12T U549 ( .A1(n581), .A2(n428), .ZN(n348) );
  OAI22D0BWP12T U550 ( .A1(reg_array[73]), .A2(n443), .B1(reg_array[90]), .B2(
        n439), .ZN(n346) );
  AOI22D0BWP12T U551 ( .A1(reg_array[26]), .A2(n441), .B1(reg_array[10]), .B2(
        n440), .ZN(n345) );
  AOI22D0BWP12T U552 ( .A1(reg_array[58]), .A2(n442), .B1(reg_array[42]), .B2(
        n448), .ZN(n344) );
  OAI211D0BWP12T U553 ( .A1(n432), .A2(n346), .B(n345), .C(n344), .ZN(n347) );
  AOI211D0BWP12T U554 ( .A1(n435), .A2(reg_array[106]), .B(n348), .C(n347), 
        .ZN(n355) );
  AOI22D0BWP12T U555 ( .A1(n437), .A2(or_R_rd2_data[10]), .B1(i_R_pcplus[10]), 
        .B2(n436), .ZN(n354) );
  AOI22D0BWP12T U556 ( .A1(reg_array[186]), .A2(n439), .B1(reg_array[202]), 
        .B2(n438), .ZN(n351) );
  AOI22D0BWP12T U557 ( .A1(reg_array[138]), .A2(n441), .B1(reg_array[122]), 
        .B2(n440), .ZN(n350) );
  AOI22D0BWP12T U558 ( .A1(reg_array[218]), .A2(n443), .B1(reg_array[170]), 
        .B2(n442), .ZN(n349) );
  ND3D1BWP12T U559 ( .A1(n351), .A2(n350), .A3(n349), .ZN(n352) );
  AOI32D0BWP12T U560 ( .A1(reg_array[154]), .A2(n449), .A3(n448), .B1(n352), 
        .B2(n449), .ZN(n353) );
  OAI211D1BWP12T U561 ( .A1(n355), .A2(n452), .B(n354), .C(n353), .ZN(n676) );
  NR2D0BWP12T U562 ( .A1(n573), .A2(n428), .ZN(n360) );
  OAI22D0BWP12T U563 ( .A1(reg_array[65]), .A2(n443), .B1(reg_array[82]), .B2(
        n439), .ZN(n358) );
  AOI22D0BWP12T U564 ( .A1(reg_array[18]), .A2(n441), .B1(reg_array[2]), .B2(
        n440), .ZN(n357) );
  AOI22D0BWP12T U565 ( .A1(reg_array[50]), .A2(n442), .B1(reg_array[34]), .B2(
        n448), .ZN(n356) );
  OAI211D0BWP12T U566 ( .A1(n432), .A2(n358), .B(n357), .C(n356), .ZN(n359) );
  AOI211D0BWP12T U567 ( .A1(n435), .A2(reg_array[98]), .B(n360), .C(n359), 
        .ZN(n367) );
  AOI22D0BWP12T U568 ( .A1(n437), .A2(or_R_rd2_data[2]), .B1(i_R_pcplus[2]), 
        .B2(n436), .ZN(n366) );
  AOI22D0BWP12T U569 ( .A1(reg_array[178]), .A2(n439), .B1(reg_array[194]), 
        .B2(n438), .ZN(n363) );
  AOI22D0BWP12T U570 ( .A1(reg_array[130]), .A2(n441), .B1(reg_array[114]), 
        .B2(n440), .ZN(n362) );
  AOI22D0BWP12T U571 ( .A1(reg_array[210]), .A2(n443), .B1(reg_array[162]), 
        .B2(n442), .ZN(n361) );
  ND3D1BWP12T U572 ( .A1(n363), .A2(n362), .A3(n361), .ZN(n364) );
  AOI32D0BWP12T U573 ( .A1(reg_array[146]), .A2(n449), .A3(n448), .B1(n364), 
        .B2(n449), .ZN(n365) );
  OAI211D1BWP12T U574 ( .A1(n367), .A2(n452), .B(n366), .C(n365), .ZN(n668) );
  NR2D0BWP12T U575 ( .A1(n579), .A2(n428), .ZN(n372) );
  OAI22D0BWP12T U576 ( .A1(reg_array[71]), .A2(n443), .B1(reg_array[88]), .B2(
        n439), .ZN(n370) );
  AOI22D0BWP12T U577 ( .A1(reg_array[24]), .A2(n441), .B1(reg_array[8]), .B2(
        n440), .ZN(n369) );
  AOI22D0BWP12T U578 ( .A1(reg_array[56]), .A2(n442), .B1(reg_array[40]), .B2(
        n448), .ZN(n368) );
  OAI211D0BWP12T U579 ( .A1(n432), .A2(n370), .B(n369), .C(n368), .ZN(n371) );
  AOI211D0BWP12T U580 ( .A1(n435), .A2(reg_array[104]), .B(n372), .C(n371), 
        .ZN(n379) );
  AOI22D0BWP12T U581 ( .A1(n437), .A2(or_R_rd2_data[8]), .B1(i_R_pcplus[8]), 
        .B2(n436), .ZN(n378) );
  AOI22D0BWP12T U582 ( .A1(reg_array[184]), .A2(n439), .B1(reg_array[200]), 
        .B2(n438), .ZN(n375) );
  AOI22D0BWP12T U583 ( .A1(reg_array[136]), .A2(n441), .B1(reg_array[120]), 
        .B2(n440), .ZN(n374) );
  AOI22D0BWP12T U584 ( .A1(reg_array[216]), .A2(n443), .B1(reg_array[168]), 
        .B2(n442), .ZN(n373) );
  ND3D1BWP12T U585 ( .A1(n375), .A2(n374), .A3(n373), .ZN(n376) );
  AOI32D0BWP12T U586 ( .A1(reg_array[152]), .A2(n449), .A3(n448), .B1(n376), 
        .B2(n449), .ZN(n377) );
  OAI211D1BWP12T U587 ( .A1(n379), .A2(n452), .B(n378), .C(n377), .ZN(n674) );
  NR2D0BWP12T U588 ( .A1(n584), .A2(n428), .ZN(n384) );
  OAI22D0BWP12T U589 ( .A1(reg_array[76]), .A2(n443), .B1(reg_array[93]), .B2(
        n439), .ZN(n382) );
  AOI22D0BWP12T U590 ( .A1(reg_array[29]), .A2(n441), .B1(reg_array[13]), .B2(
        n440), .ZN(n381) );
  AOI22D0BWP12T U591 ( .A1(reg_array[61]), .A2(n442), .B1(reg_array[45]), .B2(
        n448), .ZN(n380) );
  OAI211D0BWP12T U592 ( .A1(n432), .A2(n382), .B(n381), .C(n380), .ZN(n383) );
  AOI211D0BWP12T U593 ( .A1(n435), .A2(reg_array[109]), .B(n384), .C(n383), 
        .ZN(n391) );
  AOI22D0BWP12T U594 ( .A1(n437), .A2(or_R_rd2_data[13]), .B1(i_R_pcplus[13]), 
        .B2(n436), .ZN(n390) );
  AOI22D0BWP12T U595 ( .A1(reg_array[189]), .A2(n439), .B1(reg_array[205]), 
        .B2(n438), .ZN(n387) );
  AOI22D0BWP12T U596 ( .A1(reg_array[141]), .A2(n441), .B1(reg_array[125]), 
        .B2(n440), .ZN(n386) );
  AOI22D0BWP12T U597 ( .A1(reg_array[221]), .A2(n443), .B1(reg_array[173]), 
        .B2(n442), .ZN(n385) );
  ND3D1BWP12T U598 ( .A1(n387), .A2(n386), .A3(n385), .ZN(n388) );
  AOI32D0BWP12T U599 ( .A1(reg_array[157]), .A2(n449), .A3(n448), .B1(n388), 
        .B2(n449), .ZN(n389) );
  OAI211D1BWP12T U600 ( .A1(n391), .A2(n452), .B(n390), .C(n389), .ZN(n679) );
  NR2D0BWP12T U601 ( .A1(n587), .A2(n428), .ZN(n396) );
  OAI22D0BWP12T U602 ( .A1(reg_array[78]), .A2(n443), .B1(reg_array[95]), .B2(
        n439), .ZN(n394) );
  AOI22D0BWP12T U603 ( .A1(reg_array[31]), .A2(n441), .B1(reg_array[15]), .B2(
        n440), .ZN(n393) );
  AOI22D0BWP12T U604 ( .A1(reg_array[63]), .A2(n442), .B1(reg_array[47]), .B2(
        n448), .ZN(n392) );
  OAI211D0BWP12T U605 ( .A1(n432), .A2(n394), .B(n393), .C(n392), .ZN(n395) );
  AOI211D0BWP12T U606 ( .A1(n435), .A2(reg_array[111]), .B(n396), .C(n395), 
        .ZN(n403) );
  AOI22D0BWP12T U607 ( .A1(i_R_pcplus[15]), .A2(n436), .B1(n437), .B2(
        or_R_rd2_data[15]), .ZN(n402) );
  AOI22D0BWP12T U608 ( .A1(reg_array[191]), .A2(n439), .B1(reg_array[207]), 
        .B2(n438), .ZN(n399) );
  AOI22D0BWP12T U609 ( .A1(reg_array[143]), .A2(n441), .B1(reg_array[127]), 
        .B2(n440), .ZN(n398) );
  AOI22D0BWP12T U610 ( .A1(reg_array[223]), .A2(n443), .B1(reg_array[175]), 
        .B2(n442), .ZN(n397) );
  ND3D1BWP12T U611 ( .A1(n399), .A2(n398), .A3(n397), .ZN(n400) );
  AOI32D0BWP12T U612 ( .A1(reg_array[159]), .A2(n449), .A3(n448), .B1(n400), 
        .B2(n449), .ZN(n401) );
  OAI211D1BWP12T U613 ( .A1(n403), .A2(n452), .B(n402), .C(n401), .ZN(n681) );
  NR2D0BWP12T U614 ( .A1(n583), .A2(n428), .ZN(n408) );
  OAI22D0BWP12T U615 ( .A1(reg_array[75]), .A2(n443), .B1(reg_array[92]), .B2(
        n439), .ZN(n406) );
  AOI22D0BWP12T U616 ( .A1(reg_array[28]), .A2(n441), .B1(reg_array[12]), .B2(
        n440), .ZN(n405) );
  AOI22D0BWP12T U617 ( .A1(reg_array[60]), .A2(n442), .B1(reg_array[44]), .B2(
        n448), .ZN(n404) );
  OAI211D0BWP12T U618 ( .A1(n432), .A2(n406), .B(n405), .C(n404), .ZN(n407) );
  AOI211D0BWP12T U619 ( .A1(n435), .A2(reg_array[108]), .B(n408), .C(n407), 
        .ZN(n415) );
  AOI22D0BWP12T U620 ( .A1(n437), .A2(or_R_rd2_data[12]), .B1(i_R_pcplus[12]), 
        .B2(n436), .ZN(n414) );
  AOI22D0BWP12T U621 ( .A1(reg_array[188]), .A2(n439), .B1(reg_array[204]), 
        .B2(n438), .ZN(n411) );
  AOI22D0BWP12T U622 ( .A1(reg_array[140]), .A2(n441), .B1(reg_array[124]), 
        .B2(n440), .ZN(n410) );
  AOI22D0BWP12T U623 ( .A1(reg_array[220]), .A2(n443), .B1(reg_array[172]), 
        .B2(n442), .ZN(n409) );
  ND3D1BWP12T U624 ( .A1(n411), .A2(n410), .A3(n409), .ZN(n412) );
  AOI32D0BWP12T U625 ( .A1(reg_array[156]), .A2(n449), .A3(n448), .B1(n412), 
        .B2(n449), .ZN(n413) );
  OAI211D1BWP12T U626 ( .A1(n415), .A2(n452), .B(n414), .C(n413), .ZN(n678) );
  NR2D0BWP12T U627 ( .A1(n575), .A2(n428), .ZN(n420) );
  OAI22D0BWP12T U628 ( .A1(reg_array[67]), .A2(n443), .B1(reg_array[84]), .B2(
        n439), .ZN(n418) );
  AOI22D0BWP12T U629 ( .A1(reg_array[20]), .A2(n441), .B1(reg_array[4]), .B2(
        n440), .ZN(n417) );
  AOI22D0BWP12T U630 ( .A1(reg_array[52]), .A2(n442), .B1(reg_array[36]), .B2(
        n448), .ZN(n416) );
  OAI211D0BWP12T U631 ( .A1(n432), .A2(n418), .B(n417), .C(n416), .ZN(n419) );
  AOI211D0BWP12T U632 ( .A1(n435), .A2(reg_array[100]), .B(n420), .C(n419), 
        .ZN(n427) );
  AOI22D0BWP12T U633 ( .A1(n437), .A2(or_R_rd2_data[4]), .B1(i_R_pcplus[4]), 
        .B2(n436), .ZN(n426) );
  AOI22D0BWP12T U634 ( .A1(reg_array[180]), .A2(n439), .B1(reg_array[196]), 
        .B2(n438), .ZN(n423) );
  AOI22D0BWP12T U635 ( .A1(reg_array[132]), .A2(n441), .B1(reg_array[116]), 
        .B2(n440), .ZN(n422) );
  AOI22D0BWP12T U636 ( .A1(reg_array[212]), .A2(n443), .B1(reg_array[164]), 
        .B2(n442), .ZN(n421) );
  ND3D1BWP12T U637 ( .A1(n423), .A2(n422), .A3(n421), .ZN(n424) );
  AOI32D0BWP12T U638 ( .A1(reg_array[148]), .A2(n449), .A3(n448), .B1(n424), 
        .B2(n449), .ZN(n425) );
  OAI211D1BWP12T U639 ( .A1(n427), .A2(n452), .B(n426), .C(n425), .ZN(n670) );
  NR2D0BWP12T U640 ( .A1(n574), .A2(n428), .ZN(n434) );
  OAI22D0BWP12T U641 ( .A1(reg_array[66]), .A2(n443), .B1(reg_array[83]), .B2(
        n439), .ZN(n431) );
  AOI22D0BWP12T U642 ( .A1(reg_array[19]), .A2(n441), .B1(reg_array[3]), .B2(
        n440), .ZN(n430) );
  AOI22D0BWP12T U643 ( .A1(reg_array[51]), .A2(n442), .B1(reg_array[35]), .B2(
        n448), .ZN(n429) );
  OAI211D0BWP12T U644 ( .A1(n432), .A2(n431), .B(n430), .C(n429), .ZN(n433) );
  AOI211D0BWP12T U645 ( .A1(n435), .A2(reg_array[99]), .B(n434), .C(n433), 
        .ZN(n453) );
  AOI22D0BWP12T U646 ( .A1(n437), .A2(or_R_rd2_data[3]), .B1(i_R_pcplus[3]), 
        .B2(n436), .ZN(n451) );
  AOI22D0BWP12T U647 ( .A1(reg_array[179]), .A2(n439), .B1(reg_array[195]), 
        .B2(n438), .ZN(n446) );
  AOI22D0BWP12T U648 ( .A1(reg_array[131]), .A2(n441), .B1(reg_array[115]), 
        .B2(n440), .ZN(n445) );
  AOI22D0BWP12T U649 ( .A1(reg_array[211]), .A2(n443), .B1(reg_array[163]), 
        .B2(n442), .ZN(n444) );
  ND3D1BWP12T U650 ( .A1(n446), .A2(n445), .A3(n444), .ZN(n447) );
  AOI32D0BWP12T U651 ( .A1(reg_array[147]), .A2(n449), .A3(n448), .B1(n447), 
        .B2(n449), .ZN(n450) );
  OAI211D1BWP12T U652 ( .A1(n453), .A2(n452), .B(n451), .C(n450), .ZN(n669) );
  MOAI22D0BWP12T U653 ( .A1(n454), .A2(n462), .B1(n454), .B2(reg_array[223]), 
        .ZN(n905) );
  MOAI22D0BWP12T U654 ( .A1(n454), .A2(n463), .B1(n454), .B2(reg_array[222]), 
        .ZN(n904) );
  MOAI22D0BWP12T U655 ( .A1(n454), .A2(n464), .B1(n454), .B2(reg_array[221]), 
        .ZN(n903) );
  MOAI22D0BWP12T U656 ( .A1(n454), .A2(n465), .B1(n454), .B2(reg_array[220]), 
        .ZN(n902) );
  MOAI22D0BWP12T U657 ( .A1(n454), .A2(n466), .B1(n454), .B2(reg_array[219]), 
        .ZN(n901) );
  MOAI22D0BWP12T U658 ( .A1(n454), .A2(n467), .B1(n454), .B2(reg_array[218]), 
        .ZN(n900) );
  MOAI22D0BWP12T U659 ( .A1(n454), .A2(n468), .B1(n454), .B2(reg_array[217]), 
        .ZN(n899) );
  MOAI22D0BWP12T U660 ( .A1(n454), .A2(n469), .B1(n454), .B2(reg_array[216]), 
        .ZN(n898) );
  MOAI22D0BWP12T U661 ( .A1(n454), .A2(n470), .B1(n454), .B2(reg_array[215]), 
        .ZN(n897) );
  MOAI22D0BWP12T U662 ( .A1(n454), .A2(n471), .B1(n454), .B2(reg_array[214]), 
        .ZN(n896) );
  MOAI22D0BWP12T U663 ( .A1(n454), .A2(n472), .B1(n454), .B2(reg_array[213]), 
        .ZN(n895) );
  MOAI22D0BWP12T U664 ( .A1(n454), .A2(n473), .B1(n454), .B2(reg_array[212]), 
        .ZN(n894) );
  MOAI22D0BWP12T U665 ( .A1(n454), .A2(n474), .B1(n454), .B2(reg_array[211]), 
        .ZN(n893) );
  MOAI22D0BWP12T U666 ( .A1(n454), .A2(n475), .B1(n454), .B2(reg_array[210]), 
        .ZN(n892) );
  MOAI22D0BWP12T U667 ( .A1(n454), .A2(n476), .B1(n454), .B2(reg_array[209]), 
        .ZN(n891) );
  MOAI22D0BWP12T U668 ( .A1(n454), .A2(n477), .B1(n454), .B2(reg_array[208]), 
        .ZN(n890) );
  MOAI22D0BWP12T U669 ( .A1(n455), .A2(n462), .B1(n455), .B2(reg_array[207]), 
        .ZN(n889) );
  MOAI22D0BWP12T U670 ( .A1(n455), .A2(n463), .B1(n455), .B2(reg_array[206]), 
        .ZN(n888) );
  MOAI22D0BWP12T U671 ( .A1(n455), .A2(n464), .B1(n455), .B2(reg_array[205]), 
        .ZN(n887) );
  MOAI22D0BWP12T U672 ( .A1(n455), .A2(n465), .B1(n455), .B2(reg_array[204]), 
        .ZN(n886) );
  MOAI22D0BWP12T U673 ( .A1(n455), .A2(n466), .B1(n455), .B2(reg_array[203]), 
        .ZN(n885) );
  MOAI22D0BWP12T U674 ( .A1(n455), .A2(n467), .B1(n455), .B2(reg_array[202]), 
        .ZN(n884) );
  MOAI22D0BWP12T U675 ( .A1(n455), .A2(n468), .B1(n455), .B2(reg_array[201]), 
        .ZN(n883) );
  MOAI22D0BWP12T U676 ( .A1(n455), .A2(n469), .B1(n455), .B2(reg_array[200]), 
        .ZN(n882) );
  MOAI22D0BWP12T U677 ( .A1(n457), .A2(n462), .B1(n457), .B2(reg_array[191]), 
        .ZN(n873) );
  MOAI22D0BWP12T U678 ( .A1(n457), .A2(n463), .B1(n457), .B2(reg_array[190]), 
        .ZN(n872) );
  MOAI22D0BWP12T U679 ( .A1(n457), .A2(n464), .B1(n457), .B2(reg_array[189]), 
        .ZN(n871) );
  MOAI22D0BWP12T U680 ( .A1(n457), .A2(n465), .B1(n457), .B2(reg_array[188]), 
        .ZN(n870) );
  MOAI22D0BWP12T U681 ( .A1(n457), .A2(n466), .B1(n457), .B2(reg_array[187]), 
        .ZN(n869) );
  MOAI22D0BWP12T U682 ( .A1(n457), .A2(n467), .B1(n457), .B2(reg_array[186]), 
        .ZN(n868) );
  MOAI22D0BWP12T U683 ( .A1(n457), .A2(n468), .B1(n457), .B2(reg_array[185]), 
        .ZN(n867) );
  MOAI22D0BWP12T U684 ( .A1(n457), .A2(n469), .B1(n457), .B2(reg_array[184]), 
        .ZN(n866) );
  MOAI22D0BWP12T U685 ( .A1(n457), .A2(n470), .B1(n457), .B2(reg_array[183]), 
        .ZN(n865) );
  MOAI22D0BWP12T U686 ( .A1(n457), .A2(n471), .B1(n457), .B2(reg_array[182]), 
        .ZN(n864) );
  MOAI22D0BWP12T U687 ( .A1(n457), .A2(n472), .B1(n457), .B2(reg_array[181]), 
        .ZN(n863) );
  MOAI22D0BWP12T U688 ( .A1(n457), .A2(n473), .B1(n457), .B2(reg_array[180]), 
        .ZN(n862) );
  MOAI22D0BWP12T U689 ( .A1(n457), .A2(n474), .B1(n457), .B2(reg_array[179]), 
        .ZN(n861) );
  MOAI22D0BWP12T U690 ( .A1(n457), .A2(n475), .B1(n457), .B2(reg_array[178]), 
        .ZN(n860) );
  MOAI22D0BWP12T U691 ( .A1(n457), .A2(n476), .B1(n457), .B2(reg_array[177]), 
        .ZN(n859) );
  MOAI22D0BWP12T U692 ( .A1(n457), .A2(n477), .B1(n457), .B2(reg_array[176]), 
        .ZN(n858) );
  MOAI22D0BWP12T U693 ( .A1(n459), .A2(n462), .B1(n459), .B2(reg_array[175]), 
        .ZN(n857) );
  MOAI22D0BWP12T U694 ( .A1(n459), .A2(n463), .B1(n459), .B2(reg_array[174]), 
        .ZN(n856) );
  MOAI22D0BWP12T U695 ( .A1(n459), .A2(n464), .B1(n459), .B2(reg_array[173]), 
        .ZN(n855) );
  MOAI22D0BWP12T U696 ( .A1(n459), .A2(n465), .B1(n459), .B2(reg_array[172]), 
        .ZN(n854) );
  MOAI22D0BWP12T U697 ( .A1(n459), .A2(n466), .B1(n459), .B2(reg_array[171]), 
        .ZN(n853) );
  MOAI22D0BWP12T U698 ( .A1(n459), .A2(n467), .B1(n459), .B2(reg_array[170]), 
        .ZN(n852) );
  MOAI22D0BWP12T U699 ( .A1(n459), .A2(n468), .B1(n459), .B2(reg_array[169]), 
        .ZN(n851) );
  MOAI22D0BWP12T U700 ( .A1(n459), .A2(n469), .B1(n459), .B2(reg_array[168]), 
        .ZN(n850) );
  MOAI22D0BWP12T U701 ( .A1(n459), .A2(n470), .B1(n459), .B2(reg_array[167]), 
        .ZN(n849) );
  MOAI22D0BWP12T U702 ( .A1(n459), .A2(n471), .B1(n459), .B2(reg_array[166]), 
        .ZN(n848) );
  MOAI22D0BWP12T U703 ( .A1(n459), .A2(n472), .B1(n459), .B2(reg_array[165]), 
        .ZN(n847) );
  MOAI22D0BWP12T U704 ( .A1(n459), .A2(n473), .B1(n459), .B2(reg_array[164]), 
        .ZN(n846) );
  MOAI22D0BWP12T U705 ( .A1(n459), .A2(n474), .B1(n459), .B2(reg_array[163]), 
        .ZN(n845) );
  MOAI22D0BWP12T U706 ( .A1(n459), .A2(n475), .B1(n459), .B2(reg_array[162]), 
        .ZN(n844) );
  MOAI22D0BWP12T U707 ( .A1(n459), .A2(n476), .B1(n459), .B2(reg_array[161]), 
        .ZN(n843) );
  MOAI22D0BWP12T U708 ( .A1(n459), .A2(n477), .B1(n459), .B2(reg_array[160]), 
        .ZN(n842) );
  MOAI22D0BWP12T U709 ( .A1(n478), .A2(n462), .B1(n478), .B2(reg_array[159]), 
        .ZN(n841) );
  MOAI22D0BWP12T U710 ( .A1(n478), .A2(n463), .B1(n478), .B2(reg_array[158]), 
        .ZN(n840) );
  MOAI22D0BWP12T U711 ( .A1(n478), .A2(n464), .B1(n478), .B2(reg_array[157]), 
        .ZN(n839) );
  MOAI22D0BWP12T U712 ( .A1(n478), .A2(n465), .B1(n478), .B2(reg_array[156]), 
        .ZN(n838) );
  MOAI22D0BWP12T U713 ( .A1(n478), .A2(n466), .B1(n478), .B2(reg_array[155]), 
        .ZN(n837) );
  MOAI22D0BWP12T U714 ( .A1(n478), .A2(n467), .B1(n478), .B2(reg_array[154]), 
        .ZN(n836) );
  MOAI22D0BWP12T U715 ( .A1(n478), .A2(n468), .B1(n478), .B2(reg_array[153]), 
        .ZN(n835) );
  MOAI22D0BWP12T U716 ( .A1(n478), .A2(n469), .B1(n478), .B2(reg_array[152]), 
        .ZN(n834) );
  MOAI22D0BWP12T U717 ( .A1(n478), .A2(n470), .B1(n478), .B2(reg_array[151]), 
        .ZN(n833) );
  MOAI22D0BWP12T U718 ( .A1(n478), .A2(n471), .B1(n478), .B2(reg_array[150]), 
        .ZN(n832) );
  MOAI22D0BWP12T U719 ( .A1(n478), .A2(n472), .B1(n478), .B2(reg_array[149]), 
        .ZN(n831) );
  MOAI22D0BWP12T U720 ( .A1(n478), .A2(n473), .B1(n478), .B2(reg_array[148]), 
        .ZN(n830) );
  MOAI22D0BWP12T U721 ( .A1(n478), .A2(n474), .B1(n478), .B2(reg_array[147]), 
        .ZN(n829) );
  MOAI22D0BWP12T U722 ( .A1(n478), .A2(n475), .B1(n478), .B2(reg_array[146]), 
        .ZN(n828) );
  MOAI22D0BWP12T U723 ( .A1(n478), .A2(n476), .B1(n478), .B2(reg_array[145]), 
        .ZN(n827) );
  MOAI22D0BWP12T U724 ( .A1(n478), .A2(n477), .B1(n478), .B2(reg_array[144]), 
        .ZN(n826) );
endmodule


module reg_rd_wr_REG_WIDTH16 ( clk, rst, i_4_fwd_wr_addr_from_cu, 
        i_4_rd1_addr_from_cu, i_1_rd1_addr_sel, i_1_rd2_addr_sel, 
        i_2_fwd_wr_sel, i_1_alu_in2_sel, i_5_alu_control, i_1_branch, 
        i_1_mem_wr_en, i_1_mem2reg_sel, i_1_reg_wr_en, i_1_mem_addr_sel, 
        or_1_alu_in2_sel, or_5_alu_control, or_1_branch, or_1_mem_wr_en, 
        or_1_mem2reg_sel, or_1_reg_wr_en, or_1_mem_addr_sel, i_4_rd1_addr1, 
        i_4_rd2_addr1, i_4_rd2_addr2, i_R_wr_data, i_4_reg_wr_addr, 
        i_1_reg_wr_en_2, i_4_fwd_wr_addr1, i_4_fwd_wr_addr2, i_11_imm, 
        i_R_pcplus, o_R_rd1_data, o_R_rd2_data, or_4_reg_wr_addr, 
        or_R_sign_imm, or_R_pcplus );
  input [3:0] i_4_fwd_wr_addr_from_cu;
  input [3:0] i_4_rd1_addr_from_cu;
  input [1:0] i_2_fwd_wr_sel;
  input [4:0] i_5_alu_control;
  output [4:0] or_5_alu_control;
  input [3:0] i_4_rd1_addr1;
  input [3:0] i_4_rd2_addr1;
  input [3:0] i_4_rd2_addr2;
  input [15:0] i_R_wr_data;
  input [3:0] i_4_reg_wr_addr;
  input [3:0] i_4_fwd_wr_addr1;
  input [3:0] i_4_fwd_wr_addr2;
  input [10:0] i_11_imm;
  input [15:0] i_R_pcplus;
  output [15:0] o_R_rd1_data;
  output [15:0] o_R_rd2_data;
  output [3:0] or_4_reg_wr_addr;
  output [15:0] or_R_sign_imm;
  output [15:0] or_R_pcplus;
  input clk, rst, i_1_rd1_addr_sel, i_1_rd2_addr_sel, i_1_alu_in2_sel,
         i_1_branch, i_1_mem_wr_en, i_1_mem2reg_sel, i_1_reg_wr_en,
         i_1_mem_addr_sel, i_1_reg_wr_en_2;
  output or_1_alu_in2_sel, or_1_branch, or_1_mem_wr_en, or_1_mem2reg_sel,
         or_1_reg_wr_en, or_1_mem_addr_sel;
  wire   N29, N30, N31, N32, n1, n2, n3, n4, n5, n6, n7;
  wire   [3:0] w_4_rd1_addr;
  wire   [3:0] w_4_rd2_addr;

  registers_REG_WIDTH16 u_registers ( .clk(clk), .rst(rst), .i_4_rd1_addr(
        w_4_rd1_addr), .i_4_rd2_addr(w_4_rd2_addr), .i_4_wr_addr(
        i_4_reg_wr_addr), .i_R_wr_data(i_R_wr_data), .i_1_reg_wr_en(
        i_1_reg_wr_en_2), .i_R_pcplus(i_R_pcplus), .or_R_rd1_data(o_R_rd1_data), .or_R_rd2_data(o_R_rd2_data) );
  DFKCNQD1BWP12T or_R_pcplus_reg_15_ ( .CN(n7), .D(i_R_pcplus[15]), .CP(clk), 
        .Q(or_R_pcplus[15]) );
  DFKCNQD1BWP12T or_R_pcplus_reg_14_ ( .CN(n7), .D(i_R_pcplus[14]), .CP(clk), 
        .Q(or_R_pcplus[14]) );
  DFKCNQD1BWP12T or_R_pcplus_reg_13_ ( .CN(n7), .D(i_R_pcplus[13]), .CP(clk), 
        .Q(or_R_pcplus[13]) );
  DFKCNQD1BWP12T or_R_pcplus_reg_12_ ( .CN(n7), .D(i_R_pcplus[12]), .CP(clk), 
        .Q(or_R_pcplus[12]) );
  DFKCNQD1BWP12T or_R_pcplus_reg_11_ ( .CN(n7), .D(i_R_pcplus[11]), .CP(clk), 
        .Q(or_R_pcplus[11]) );
  DFKCNQD1BWP12T or_R_pcplus_reg_10_ ( .CN(n7), .D(i_R_pcplus[10]), .CP(clk), 
        .Q(or_R_pcplus[10]) );
  DFKCNQD1BWP12T or_R_pcplus_reg_9_ ( .CN(n7), .D(i_R_pcplus[9]), .CP(clk), 
        .Q(or_R_pcplus[9]) );
  DFKCNQD1BWP12T or_R_pcplus_reg_8_ ( .CN(n7), .D(i_R_pcplus[8]), .CP(clk), 
        .Q(or_R_pcplus[8]) );
  DFKCNQD1BWP12T or_R_pcplus_reg_7_ ( .CN(n7), .D(i_R_pcplus[7]), .CP(clk), 
        .Q(or_R_pcplus[7]) );
  DFKCNQD1BWP12T or_R_pcplus_reg_6_ ( .CN(n7), .D(i_R_pcplus[6]), .CP(clk), 
        .Q(or_R_pcplus[6]) );
  DFKCNQD1BWP12T or_R_pcplus_reg_5_ ( .CN(n7), .D(i_R_pcplus[5]), .CP(clk), 
        .Q(or_R_pcplus[5]) );
  DFKCNQD1BWP12T or_R_pcplus_reg_4_ ( .CN(n7), .D(i_R_pcplus[4]), .CP(clk), 
        .Q(or_R_pcplus[4]) );
  DFKCNQD1BWP12T or_R_pcplus_reg_3_ ( .CN(n7), .D(i_R_pcplus[3]), .CP(clk), 
        .Q(or_R_pcplus[3]) );
  DFKCNQD1BWP12T or_R_pcplus_reg_2_ ( .CN(n7), .D(i_R_pcplus[2]), .CP(clk), 
        .Q(or_R_pcplus[2]) );
  DFKCNQD1BWP12T or_R_pcplus_reg_1_ ( .CN(n7), .D(i_R_pcplus[1]), .CP(clk), 
        .Q(or_R_pcplus[1]) );
  DFKCNQD1BWP12T or_R_pcplus_reg_0_ ( .CN(n7), .D(i_R_pcplus[0]), .CP(clk), 
        .Q(or_R_pcplus[0]) );
  DFKCNQD1BWP12T or_1_alu_in2_sel_reg ( .CN(n7), .D(i_1_alu_in2_sel), .CP(clk), 
        .Q(or_1_alu_in2_sel) );
  DFKCNQD1BWP12T or_5_alu_control_reg_4_ ( .CN(n7), .D(i_5_alu_control[4]), 
        .CP(clk), .Q(or_5_alu_control[4]) );
  DFKCNQD1BWP12T or_5_alu_control_reg_3_ ( .CN(n7), .D(i_5_alu_control[3]), 
        .CP(clk), .Q(or_5_alu_control[3]) );
  DFKCNQD1BWP12T or_5_alu_control_reg_2_ ( .CN(n7), .D(i_5_alu_control[2]), 
        .CP(clk), .Q(or_5_alu_control[2]) );
  DFKCNQD1BWP12T or_5_alu_control_reg_1_ ( .CN(n7), .D(i_5_alu_control[1]), 
        .CP(clk), .Q(or_5_alu_control[1]) );
  DFKCNQD1BWP12T or_5_alu_control_reg_0_ ( .CN(n7), .D(i_5_alu_control[0]), 
        .CP(clk), .Q(or_5_alu_control[0]) );
  DFKCNQD1BWP12T or_1_branch_reg ( .CN(n7), .D(i_1_branch), .CP(clk), .Q(
        or_1_branch) );
  DFKCNQD1BWP12T or_1_mem_wr_en_reg ( .CN(n7), .D(i_1_mem_wr_en), .CP(clk), 
        .Q(or_1_mem_wr_en) );
  DFKCNQD1BWP12T or_1_mem2reg_sel_reg ( .CN(n7), .D(i_1_mem2reg_sel), .CP(clk), 
        .Q(or_1_mem2reg_sel) );
  DFKCNQD1BWP12T or_1_reg_wr_en_reg ( .CN(n7), .D(i_1_reg_wr_en), .CP(clk), 
        .Q(or_1_reg_wr_en) );
  DFKCNQD1BWP12T or_1_mem_addr_sel_reg ( .CN(n7), .D(i_1_mem_addr_sel), .CP(
        clk), .Q(or_1_mem_addr_sel) );
  DFQD1BWP12T or_4_reg_wr_addr_reg_3_ ( .D(N32), .CP(clk), .Q(
        or_4_reg_wr_addr[3]) );
  DFQD1BWP12T or_4_reg_wr_addr_reg_2_ ( .D(N31), .CP(clk), .Q(
        or_4_reg_wr_addr[2]) );
  DFQD1BWP12T or_4_reg_wr_addr_reg_1_ ( .D(N30), .CP(clk), .Q(
        or_4_reg_wr_addr[1]) );
  DFQD1BWP12T or_4_reg_wr_addr_reg_0_ ( .D(N29), .CP(clk), .Q(
        or_4_reg_wr_addr[0]) );
  DFKCNQD1BWP12T or_R_sign_imm_reg_10_ ( .CN(n7), .D(i_11_imm[10]), .CP(clk), 
        .Q(or_R_sign_imm[10]) );
  DFKCNQD1BWP12T or_R_sign_imm_reg_9_ ( .CN(n7), .D(i_11_imm[9]), .CP(clk), 
        .Q(or_R_sign_imm[9]) );
  DFKCNQD1BWP12T or_R_sign_imm_reg_8_ ( .CN(n7), .D(i_11_imm[8]), .CP(clk), 
        .Q(or_R_sign_imm[8]) );
  DFKCNQD1BWP12T or_R_sign_imm_reg_7_ ( .CN(n7), .D(i_11_imm[7]), .CP(clk), 
        .Q(or_R_sign_imm[7]) );
  DFKCNQD1BWP12T or_R_sign_imm_reg_6_ ( .CN(n7), .D(i_11_imm[6]), .CP(clk), 
        .Q(or_R_sign_imm[6]) );
  DFKCNQD1BWP12T or_R_sign_imm_reg_5_ ( .CN(n7), .D(i_11_imm[5]), .CP(clk), 
        .Q(or_R_sign_imm[5]) );
  DFKCNQD1BWP12T or_R_sign_imm_reg_4_ ( .CN(n7), .D(i_11_imm[4]), .CP(clk), 
        .Q(or_R_sign_imm[4]) );
  DFKCNQD1BWP12T or_R_sign_imm_reg_3_ ( .CN(n7), .D(i_11_imm[3]), .CP(clk), 
        .Q(or_R_sign_imm[3]) );
  DFKCNQD1BWP12T or_R_sign_imm_reg_2_ ( .CN(n7), .D(i_11_imm[2]), .CP(clk), 
        .Q(or_R_sign_imm[2]) );
  DFKCNQD1BWP12T or_R_sign_imm_reg_1_ ( .CN(n7), .D(i_11_imm[1]), .CP(clk), 
        .Q(or_R_sign_imm[1]) );
  DFKCNQD1BWP12T or_R_sign_imm_reg_0_ ( .CN(n7), .D(i_11_imm[0]), .CP(clk), 
        .Q(or_R_sign_imm[0]) );
  MUX2D1BWP12T U3 ( .I0(i_4_rd2_addr2[0]), .I1(i_4_rd2_addr1[0]), .S(
        i_1_rd2_addr_sel), .Z(w_4_rd2_addr[0]) );
  MUX2D1BWP12T U4 ( .I0(i_4_rd2_addr2[2]), .I1(i_4_rd2_addr1[2]), .S(
        i_1_rd2_addr_sel), .Z(w_4_rd2_addr[2]) );
  AN2D1BWP12T U5 ( .A1(i_1_rd2_addr_sel), .A2(i_4_rd2_addr1[3]), .Z(
        w_4_rd2_addr[3]) );
  MUX2D1BWP12T U6 ( .I0(i_4_rd1_addr1[0]), .I1(i_4_rd1_addr_from_cu[0]), .S(
        i_1_rd1_addr_sel), .Z(w_4_rd1_addr[0]) );
  MUX2D1BWP12T U7 ( .I0(i_4_rd1_addr1[2]), .I1(i_4_rd1_addr_from_cu[2]), .S(
        i_1_rd1_addr_sel), .Z(w_4_rd1_addr[2]) );
  AN2D1BWP12T U8 ( .A1(i_1_rd1_addr_sel), .A2(i_4_rd1_addr_from_cu[3]), .Z(
        w_4_rd1_addr[3]) );
  MUX2D1BWP12T U9 ( .I0(i_4_rd2_addr2[1]), .I1(i_4_rd2_addr1[1]), .S(
        i_1_rd2_addr_sel), .Z(w_4_rd2_addr[1]) );
  MUX2D1BWP12T U10 ( .I0(i_4_rd1_addr1[1]), .I1(i_4_rd1_addr_from_cu[1]), .S(
        i_1_rd1_addr_sel), .Z(w_4_rd1_addr[1]) );
  INR2D1BWP12T U11 ( .A1(i_2_fwd_wr_sel[0]), .B1(i_2_fwd_wr_sel[1]), .ZN(n5)
         );
  NR2D1BWP12T U12 ( .A1(n6), .A2(n5), .ZN(n4) );
  INR2D1BWP12T U13 ( .A1(i_2_fwd_wr_sel[1]), .B1(i_2_fwd_wr_sel[0]), .ZN(n6)
         );
  AN3XD1BWP12T U14 ( .A1(n6), .A2(i_4_fwd_wr_addr_from_cu[3]), .A3(n7), .Z(N32) );
  AOI222D0BWP12T U15 ( .A1(n6), .A2(i_4_fwd_wr_addr_from_cu[0]), .B1(n5), .B2(
        i_4_fwd_wr_addr2[0]), .C1(n4), .C2(i_4_fwd_wr_addr1[0]), .ZN(n1) );
  NR2D0BWP12T U16 ( .A1(rst), .A2(n1), .ZN(N29) );
  AOI222D0BWP12T U17 ( .A1(n6), .A2(i_4_fwd_wr_addr_from_cu[1]), .B1(n5), .B2(
        i_4_fwd_wr_addr2[1]), .C1(n4), .C2(i_4_fwd_wr_addr1[1]), .ZN(n2) );
  NR2D0BWP12T U18 ( .A1(rst), .A2(n2), .ZN(N30) );
  AOI222D0BWP12T U19 ( .A1(n6), .A2(i_4_fwd_wr_addr_from_cu[2]), .B1(n5), .B2(
        i_4_fwd_wr_addr2[2]), .C1(n4), .C2(i_4_fwd_wr_addr1[2]), .ZN(n3) );
  NR2D0BWP12T U20 ( .A1(rst), .A2(n3), .ZN(N31) );
  INVD1BWP12T U21 ( .I(rst), .ZN(n7) );
endmodule


module alu_REG_WIDTH16 ( clk, i_R_alu_in1, i_R_alu_in2, i_5_alu_opcode, 
        or_R_alu_out, or_1_alu_zero );
  input [15:0] i_R_alu_in1;
  input [15:0] i_R_alu_in2;
  input [4:0] i_5_alu_opcode;
  output [15:0] or_R_alu_out;
  input clk;
  output or_1_alu_zero;
  wire   N195, N196, N197, N198, N199, N200, N201, N202, N203, N204, N205,
         N206, N207, N208, N209, N210, N211, n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266;

  DFQD1BWP12T or_1_alu_zero_reg ( .D(N211), .CP(clk), .Q(or_1_alu_zero) );
  DFQD1BWP12T or_R_alu_out_reg_15_ ( .D(N210), .CP(clk), .Q(or_R_alu_out[15])
         );
  DFQD1BWP12T or_R_alu_out_reg_14_ ( .D(N209), .CP(clk), .Q(or_R_alu_out[14])
         );
  DFQD1BWP12T or_R_alu_out_reg_13_ ( .D(N208), .CP(clk), .Q(or_R_alu_out[13])
         );
  DFQD1BWP12T or_R_alu_out_reg_12_ ( .D(N207), .CP(clk), .Q(or_R_alu_out[12])
         );
  DFQD1BWP12T or_R_alu_out_reg_11_ ( .D(N206), .CP(clk), .Q(or_R_alu_out[11])
         );
  DFQD1BWP12T or_R_alu_out_reg_10_ ( .D(N205), .CP(clk), .Q(or_R_alu_out[10])
         );
  DFQD1BWP12T or_R_alu_out_reg_9_ ( .D(N204), .CP(clk), .Q(or_R_alu_out[9]) );
  DFQD1BWP12T or_R_alu_out_reg_8_ ( .D(N203), .CP(clk), .Q(or_R_alu_out[8]) );
  DFQD1BWP12T or_R_alu_out_reg_7_ ( .D(N202), .CP(clk), .Q(or_R_alu_out[7]) );
  DFQD1BWP12T or_R_alu_out_reg_6_ ( .D(N201), .CP(clk), .Q(or_R_alu_out[6]) );
  DFQD1BWP12T or_R_alu_out_reg_5_ ( .D(N200), .CP(clk), .Q(or_R_alu_out[5]) );
  DFQD1BWP12T or_R_alu_out_reg_4_ ( .D(N199), .CP(clk), .Q(or_R_alu_out[4]) );
  DFQD1BWP12T or_R_alu_out_reg_3_ ( .D(N198), .CP(clk), .Q(or_R_alu_out[3]) );
  DFQD1BWP12T or_R_alu_out_reg_2_ ( .D(N197), .CP(clk), .Q(or_R_alu_out[2]) );
  DFQD1BWP12T or_R_alu_out_reg_1_ ( .D(N196), .CP(clk), .Q(or_R_alu_out[1]) );
  DFQD1BWP12T or_R_alu_out_reg_0_ ( .D(N195), .CP(clk), .Q(or_R_alu_out[0]) );
  INVD1BWP12T U3 ( .I(i_R_alu_in2[3]), .ZN(n41) );
  INVD1BWP12T U4 ( .I(n33), .ZN(n34) );
  NR3D1BWP12T U5 ( .A1(n140), .A2(n125), .A3(n119), .ZN(n143) );
  ND2D1BWP12T U6 ( .A1(i_R_alu_in1[6]), .A2(n131), .ZN(n114) );
  NR2D1BWP12T U7 ( .A1(n145), .A2(n155), .ZN(n193) );
  ND2D1BWP12T U8 ( .A1(i_R_alu_in1[12]), .A2(n194), .ZN(n222) );
  INVD1BWP12T U9 ( .I(n195), .ZN(n194) );
  NR2D1BWP12T U10 ( .A1(n47), .A2(n44), .ZN(n40) );
  OR2XD1BWP12T U11 ( .A1(i_5_alu_opcode[1]), .A2(n265), .Z(n43) );
  NR2D1BWP12T U12 ( .A1(n223), .A2(n222), .ZN(n224) );
  NR2D1BWP12T U13 ( .A1(n215), .A2(n214), .ZN(n232) );
  ND2D1BWP12T U14 ( .A1(n50), .A2(i_5_alu_opcode[2]), .ZN(n44) );
  NR2D1BWP12T U15 ( .A1(i_5_alu_opcode[3]), .A2(i_5_alu_opcode[4]), .ZN(n50)
         );
  ND2D1BWP12T U16 ( .A1(i_5_alu_opcode[1]), .A2(n265), .ZN(n47) );
  NR2D1BWP12T U17 ( .A1(n45), .A2(n43), .ZN(n48) );
  NR2D1BWP12T U18 ( .A1(i_R_alu_in1[2]), .A2(n247), .ZN(n82) );
  MOAI22D0BWP12T U19 ( .A1(n37), .A2(n81), .B1(n37), .B2(n81), .ZN(n92) );
  INVD1BWP12T U20 ( .I(n92), .ZN(n84) );
  INVD1BWP12T U21 ( .I(n42), .ZN(n80) );
  NR2D1BWP12T U22 ( .A1(n253), .A2(n80), .ZN(n79) );
  MAOI22D0BWP12T U23 ( .A1(i_R_alu_in1[4]), .A2(n251), .B1(n251), .B2(
        i_R_alu_in1[4]), .ZN(n72) );
  MOAI22D0BWP12T U24 ( .A1(n35), .A2(n103), .B1(n35), .B2(n103), .ZN(n101) );
  INVD1BWP12T U25 ( .I(n101), .ZN(n99) );
  NR2D1BWP12T U26 ( .A1(n84), .A2(n93), .ZN(n97) );
  INVD1BWP12T U27 ( .I(n106), .ZN(n104) );
  ND2D1BWP12T U28 ( .A1(i_R_alu_in1[4]), .A2(n79), .ZN(n107) );
  FA1D0BWP12T U29 ( .A(i_R_alu_in2[9]), .B(i_R_alu_in1[5]), .CI(n94), .CO(n126), .S(n96) );
  AOI21D1BWP12T U30 ( .A1(n40), .A2(n39), .B(n48), .ZN(n226) );
  INVD1BWP12T U31 ( .I(n68), .ZN(n102) );
  INVD1BWP12T U32 ( .I(n134), .ZN(n95) );
  NR2D1BWP12T U33 ( .A1(n257), .A2(n107), .ZN(n131) );
  INVD1BWP12T U34 ( .I(n130), .ZN(n128) );
  INVD1BWP12T U35 ( .I(n121), .ZN(n119) );
  AOI22D1BWP12T U36 ( .A1(n34), .A2(n129), .B1(n33), .B2(n127), .ZN(n140) );
  ND3D1BWP12T U37 ( .A1(n99), .A2(n102), .A3(n97), .ZN(n125) );
  FA1D0BWP12T U38 ( .A(i_R_alu_in2[10]), .B(i_R_alu_in1[6]), .CI(n126), .CO(
        n115), .S(n137) );
  INVD1BWP12T U39 ( .I(n226), .ZN(n144) );
  INVD1BWP12T U40 ( .I(i_R_alu_in1[8]), .ZN(n160) );
  ND2D1BWP12T U41 ( .A1(i_R_alu_in1[7]), .A2(n115), .ZN(n157) );
  ND2D1BWP12T U42 ( .A1(n112), .A2(n261), .ZN(n158) );
  FA1D0BWP12T U43 ( .A(i_R_alu_in2[6]), .B(i_R_alu_in1[8]), .CI(n31), .CO(n38), 
        .S(n164) );
  INVD1BWP12T U44 ( .I(n146), .ZN(n155) );
  FA1D0BWP12T U45 ( .A(i_R_alu_in2[7]), .B(i_R_alu_in1[9]), .CI(n38), .CO(n172), .S(n146) );
  NR2D1BWP12T U46 ( .A1(n160), .A2(n157), .ZN(n147) );
  MOAI22D0BWP12T U47 ( .A1(n171), .A2(n217), .B1(n213), .B2(n158), .ZN(n165)
         );
  NR3D1BWP12T U48 ( .A1(n261), .A2(n160), .A3(n114), .ZN(n171) );
  NR3D1BWP12T U49 ( .A1(i_R_alu_in1[8]), .A2(i_R_alu_in1[9]), .A3(n158), .ZN(
        n175) );
  INVD1BWP12T U50 ( .I(n211), .ZN(n215) );
  ND2D1BWP12T U51 ( .A1(i_R_alu_in1[11]), .A2(i_R_alu_in1[10]), .ZN(n176) );
  IND2D1BWP12T U52 ( .A1(n176), .B1(n172), .ZN(n195) );
  ND3D1BWP12T U53 ( .A1(n175), .A2(n189), .A3(n174), .ZN(n190) );
  MOAI22D0BWP12T U54 ( .A1(i_R_alu_in1[10]), .A2(n172), .B1(i_R_alu_in1[10]), 
        .B2(n172), .ZN(n181) );
  INVD1BWP12T U55 ( .I(n193), .ZN(n180) );
  ND2D1BWP12T U56 ( .A1(i_R_alu_in1[9]), .A2(n147), .ZN(n173) );
  INVD1BWP12T U57 ( .I(i_R_alu_in1[11]), .ZN(n189) );
  INVD1BWP12T U58 ( .I(n181), .ZN(n192) );
  MOAI22D0BWP12T U59 ( .A1(n175), .A2(n210), .B1(n188), .B2(n238), .ZN(n183)
         );
  INVD1BWP12T U60 ( .I(n213), .ZN(n210) );
  NR2D1BWP12T U61 ( .A1(n176), .A2(n173), .ZN(n200) );
  MAOI22D0BWP12T U62 ( .A1(i_R_alu_in1[13]), .A2(n222), .B1(i_R_alu_in1[13]), 
        .B2(n222), .ZN(n197) );
  INVD1BWP12T U63 ( .I(n197), .ZN(n220) );
  NR2D1BWP12T U64 ( .A1(n206), .A2(n196), .ZN(n221) );
  INVD1BWP12T U65 ( .I(n238), .ZN(n217) );
  OAI21D1BWP12T U66 ( .A1(n205), .A2(n245), .B(n226), .ZN(n204) );
  INR2D1BWP12T U67 ( .A1(n40), .B1(n39), .ZN(n227) );
  INVD1BWP12T U68 ( .I(i_R_alu_in1[13]), .ZN(n223) );
  INVD1BWP12T U69 ( .I(i_R_alu_in1[12]), .ZN(n207) );
  NR3D1BWP12T U70 ( .A1(n189), .A2(n207), .A3(n188), .ZN(n237) );
  NR2D1BWP12T U71 ( .A1(n44), .A2(n43), .ZN(n238) );
  ND2D1BWP12T U72 ( .A1(n221), .A2(n220), .ZN(n244) );
  MOAI22D0BWP12T U73 ( .A1(n236), .A2(n224), .B1(n236), .B2(n224), .ZN(n246)
         );
  INVD1BWP12T U74 ( .I(n227), .ZN(n245) );
  NR2D1BWP12T U75 ( .A1(n44), .A2(n46), .ZN(n211) );
  NR2D1BWP12T U76 ( .A1(n47), .A2(n45), .ZN(n213) );
  INVD1BWP12T U77 ( .I(i_R_alu_in1[14]), .ZN(n236) );
  NR3D1BWP12T U78 ( .A1(i_5_alu_opcode[0]), .A2(i_5_alu_opcode[1]), .A3(n44), 
        .ZN(n233) );
  INVD1BWP12T U79 ( .I(i_R_alu_in1[15]), .ZN(n230) );
  INVD1BWP12T U80 ( .I(i_R_alu_in2[4]), .ZN(n255) );
  INVD1BWP12T U81 ( .I(i_R_alu_in2[0]), .ZN(n247) );
  INVD1BWP12T U82 ( .I(i_R_alu_in2[2]), .ZN(n251) );
  INVD1BWP12T U83 ( .I(i_R_alu_in1[3]), .ZN(n253) );
  INVD1BWP12T U84 ( .I(i_R_alu_in1[7]), .ZN(n261) );
  INVD1BWP12T U85 ( .I(i_R_alu_in1[1]), .ZN(n248) );
  INVD1BWP12T U86 ( .I(i_R_alu_in1[5]), .ZN(n257) );
  INVD1BWP12T U87 ( .I(i_5_alu_opcode[0]), .ZN(n265) );
  INVD1BWP12T U88 ( .I(n54), .ZN(n52) );
  IOA21D0BWP12T U89 ( .A1(i_R_alu_in1[10]), .A2(n172), .B(n189), .ZN(n191) );
  OAI32D0BWP12T U90 ( .A1(n245), .A2(n244), .A3(i_R_alu_in1[15]), .B1(n246), 
        .B2(n245), .ZN(n1) );
  MOAI22D0BWP12T U91 ( .A1(i_R_alu_in1[15]), .A2(n225), .B1(i_R_alu_in1[15]), 
        .B2(n225), .ZN(n2) );
  AOI222D0BWP12T U92 ( .A1(n1), .A2(n2), .B1(n1), .B2(n246), .C1(n2), .C2(n234), .ZN(n228) );
  NR3D0BWP12T U93 ( .A1(n180), .A2(n192), .A3(n245), .ZN(n3) );
  IAO21D0BWP12T U94 ( .A1(n181), .A2(n187), .B(n3), .ZN(n4) );
  MOAI22D0BWP12T U95 ( .A1(n173), .A2(n215), .B1(n175), .B2(n213), .ZN(n5) );
  AOI22D0BWP12T U96 ( .A1(n233), .A2(i_R_alu_in2[10]), .B1(n174), .B2(n5), 
        .ZN(n6) );
  ND4D0BWP12T U97 ( .A1(n238), .A2(i_R_alu_in1[9]), .A3(n171), .A4(n174), .ZN(
        n7) );
  AOI32D0BWP12T U98 ( .A1(n211), .A2(i_R_alu_in1[10]), .A3(n173), .B1(n183), 
        .B2(i_R_alu_in1[10]), .ZN(n8) );
  ND4D0BWP12T U99 ( .A1(n4), .A2(n6), .A3(n7), .A4(n8), .ZN(N205) );
  AOI21D0BWP12T U100 ( .A1(n199), .A2(n211), .B(n198), .ZN(n9) );
  AOI22D0BWP12T U101 ( .A1(n201), .A2(n213), .B1(n200), .B2(n211), .ZN(n10) );
  MOAI22D0BWP12T U102 ( .A1(i_R_alu_in1[12]), .A2(n10), .B1(i_R_alu_in2[12]), 
        .B2(n233), .ZN(n11) );
  AOI31D0BWP12T U103 ( .A1(i_R_alu_in1[11]), .A2(n202), .A3(n203), .B(n11), 
        .ZN(n12) );
  CKND0BWP12T U104 ( .I(n206), .ZN(n13) );
  AOI32D0BWP12T U105 ( .A1(n205), .A2(n206), .A3(n227), .B1(n204), .B2(n13), 
        .ZN(n14) );
  OAI211D0BWP12T U106 ( .A1(n207), .A2(n9), .B(n12), .C(n14), .ZN(N207) );
  MAOI222D0BWP12T U107 ( .A(n55), .B(n118), .C(n248), .ZN(n15) );
  MAOI222D0BWP12T U108 ( .A(i_R_alu_in1[2]), .B(i_R_alu_in2[8]), .C(n15), .ZN(
        n16) );
  CKND0BWP12T U109 ( .I(n16), .ZN(n42) );
  MAOI22D0BWP12T U110 ( .A1(i_R_alu_in1[2]), .A2(i_R_alu_in2[8]), .B1(
        i_R_alu_in1[2]), .B2(i_R_alu_in2[8]), .ZN(n17) );
  MAOI22D0BWP12T U111 ( .A1(n17), .A2(n15), .B1(n17), .B2(n15), .ZN(n63) );
  MAOI22D0BWP12T U112 ( .A1(n36), .A2(n72), .B1(n36), .B2(n72), .ZN(n68) );
  MAOI222D0BWP12T U113 ( .A(n255), .B(n32), .C(n34), .ZN(n18) );
  MAOI222D0BWP12T U114 ( .A(i_R_alu_in1[7]), .B(i_R_alu_in2[5]), .C(n18), .ZN(
        n19) );
  CKND0BWP12T U115 ( .I(n19), .ZN(n31) );
  MAOI22D0BWP12T U116 ( .A1(i_R_alu_in1[7]), .A2(i_R_alu_in2[5]), .B1(
        i_R_alu_in1[7]), .B2(i_R_alu_in2[5]), .ZN(n20) );
  MAOI22D0BWP12T U117 ( .A1(n20), .A2(n18), .B1(n20), .B2(n18), .ZN(n121) );
  OAI22D0BWP12T U118 ( .A1(n206), .A2(n197), .B1(n220), .B2(n221), .ZN(n21) );
  CKND0BWP12T U119 ( .I(n227), .ZN(n22) );
  AOI22D0BWP12T U120 ( .A1(i_R_alu_in1[13]), .A2(n198), .B1(n220), .B2(n204), 
        .ZN(n23) );
  CKND0BWP12T U121 ( .I(n212), .ZN(n24) );
  OAI21D0BWP12T U122 ( .A1(n207), .A2(n223), .B(n24), .ZN(n25) );
  OAI32D0BWP12T U123 ( .A1(n209), .A2(n207), .A3(n199), .B1(n223), .B2(n209), 
        .ZN(n26) );
  CKND0BWP12T U124 ( .I(n223), .ZN(n27) );
  CKND2D0BWP12T U125 ( .A1(n233), .A2(i_R_alu_in2[13]), .ZN(n28) );
  OAI31D0BWP12T U126 ( .A1(n217), .A2(n202), .A3(n27), .B(n28), .ZN(n29) );
  AOI211D0BWP12T U127 ( .A1(n213), .A2(n25), .B(n26), .C(n29), .ZN(n30) );
  OAI211D0BWP12T U128 ( .A1(n21), .A2(n22), .B(n23), .C(n30), .ZN(N208) );
  INVD1BWP12T U129 ( .I(i_R_alu_in2[1]), .ZN(n60) );
  CKND2D1BWP12T U130 ( .A1(i_R_alu_in1[2]), .A2(i_R_alu_in2[0]), .ZN(n37) );
  MAOI222D1BWP12T U131 ( .A(n253), .B(n60), .C(n37), .ZN(n36) );
  MAOI222D1BWP12T U132 ( .A(n36), .B(i_R_alu_in1[4]), .C(i_R_alu_in2[2]), .ZN(
        n35) );
  MAOI222D1BWP12T U133 ( .A(n257), .B(n41), .C(n35), .ZN(n33) );
  INVD1BWP12T U134 ( .I(i_R_alu_in1[6]), .ZN(n32) );
  AOI21D1BWP12T U135 ( .A1(n247), .A2(i_R_alu_in2[3]), .B(i_R_alu_in2[1]), 
        .ZN(n39) );
  OAI22D1BWP12T U136 ( .A1(n32), .A2(n255), .B1(i_R_alu_in2[4]), .B2(
        i_R_alu_in1[6]), .ZN(n127) );
  INVD1BWP12T U137 ( .I(n127), .ZN(n129) );
  OAI22D0BWP12T U138 ( .A1(n257), .A2(i_R_alu_in2[3]), .B1(n41), .B2(
        i_R_alu_in1[5]), .ZN(n105) );
  INVD1BWP12T U139 ( .I(n105), .ZN(n103) );
  AOI22D0BWP12T U140 ( .A1(i_R_alu_in1[3]), .A2(i_R_alu_in2[1]), .B1(n60), 
        .B2(n253), .ZN(n81) );
  AOI21D1BWP12T U141 ( .A1(n247), .A2(i_R_alu_in1[2]), .B(n82), .ZN(n64) );
  IND2XD1BWP12T U142 ( .A1(n64), .B1(i_R_alu_in1[1]), .ZN(n93) );
  CKND2D1BWP12T U143 ( .A1(n164), .A2(n143), .ZN(n145) );
  IND2D1BWP12T U144 ( .A1(i_5_alu_opcode[2]), .B1(n50), .ZN(n45) );
  AOI21D1BWP12T U145 ( .A1(n180), .A2(n227), .B(n144), .ZN(n187) );
  INVD1BWP12T U146 ( .I(i_R_alu_in1[10]), .ZN(n174) );
  CKND2D1BWP12T U147 ( .A1(i_5_alu_opcode[0]), .A2(i_5_alu_opcode[1]), .ZN(n46) );
  INVD1BWP12T U148 ( .I(i_R_alu_in2[7]), .ZN(n118) );
  ND2XD0BWP12T U149 ( .A1(i_R_alu_in1[2]), .A2(i_R_alu_in2[6]), .ZN(n78) );
  MAOI222D0BWP12T U150 ( .A(n253), .B(n118), .C(n78), .ZN(n66) );
  MAOI222D0BWP12T U151 ( .A(i_R_alu_in2[1]), .B(n82), .C(n253), .ZN(n71) );
  MAOI222D1BWP12T U152 ( .A(i_R_alu_in1[4]), .B(n251), .C(n71), .ZN(n106) );
  MAOI222D1BWP12T U153 ( .A(n41), .B(n104), .C(i_R_alu_in1[5]), .ZN(n130) );
  MAOI222D1BWP12T U154 ( .A(i_R_alu_in1[6]), .B(n255), .C(n128), .ZN(n112) );
  CKND2D1BWP12T U155 ( .A1(i_R_alu_in2[6]), .A2(i_R_alu_in1[0]), .ZN(n55) );
  ND3D1BWP12T U156 ( .A1(i_R_alu_in1[9]), .A2(i_R_alu_in1[10]), .A3(n171), 
        .ZN(n188) );
  IAO21D1BWP12T U157 ( .A1(n46), .A2(n45), .B(n233), .ZN(n134) );
  CKND0BWP12T U158 ( .I(n47), .ZN(n49) );
  ND2D1BWP12T U159 ( .A1(n238), .A2(n55), .ZN(n54) );
  AOI211D0BWP12T U160 ( .A1(n50), .A2(n49), .B(n48), .C(n52), .ZN(n51) );
  CKND2D1BWP12T U161 ( .A1(n51), .A2(n215), .ZN(n53) );
  AO222D1BWP12T U162 ( .A1(n95), .A2(i_R_alu_in2[0]), .B1(n53), .B2(
        i_R_alu_in1[0]), .C1(n52), .C2(i_R_alu_in2[6]), .Z(N195) );
  OAI32D0BWP12T U163 ( .A1(i_R_alu_in2[7]), .A2(n217), .A3(n55), .B1(n54), 
        .B2(n118), .ZN(n58) );
  OAI32D0BWP12T U164 ( .A1(n217), .A2(n118), .A3(n55), .B1(n54), .B2(
        i_R_alu_in2[7]), .ZN(n56) );
  IND4D0BWP12T U165 ( .A1(n56), .B1(n226), .B2(n210), .B3(n215), .ZN(n57) );
  OAI32D1BWP12T U166 ( .A1(i_R_alu_in1[1]), .A2(n227), .A3(n58), .B1(n248), 
        .B2(n57), .ZN(n59) );
  OAI21D1BWP12T U167 ( .A1(n134), .A2(n60), .B(n59), .ZN(N196) );
  RCAOI21D0BWP12T U168 ( .A1(n227), .A2(n248), .B(n144), .ZN(n87) );
  OA211D0BWP12T U169 ( .A1(i_R_alu_in1[2]), .A2(i_R_alu_in2[6]), .B(n78), .C(
        n211), .Z(n62) );
  TPND2D0BWP12T U170 ( .A1(n227), .A2(n64), .ZN(n85) );
  TPOAI22D0BWP12T U171 ( .A1(n134), .A2(n251), .B1(n248), .B2(n85), .ZN(n61)
         );
  AOI211D1BWP12T U172 ( .A1(n63), .A2(n238), .B(n62), .C(n61), .ZN(n65) );
  AOI32D1BWP12T U173 ( .A1(n87), .A2(n65), .A3(n210), .B1(n64), .B2(n65), .ZN(
        N197) );
  FA1D0BWP12T U174 ( .A(i_R_alu_in2[8]), .B(i_R_alu_in1[4]), .CI(n66), .CO(n94), .S(n67) );
  AOI22D0BWP12T U175 ( .A1(n211), .A2(n67), .B1(i_R_alu_in2[4]), .B2(n95), 
        .ZN(n76) );
  OAI21D0BWP12T U176 ( .A1(n97), .A2(n245), .B(n226), .ZN(n69) );
  INR2D1BWP12T U177 ( .A1(n97), .B1(n245), .ZN(n100) );
  AOI22D1BWP12T U178 ( .A1(n102), .A2(n69), .B1(n100), .B2(n68), .ZN(n75) );
  CKND2D0BWP12T U179 ( .A1(n72), .A2(n71), .ZN(n70) );
  OAI211D0BWP12T U180 ( .A1(n72), .A2(n71), .B(n213), .C(n70), .ZN(n74) );
  OAI211D0BWP12T U181 ( .A1(i_R_alu_in1[4]), .A2(n79), .B(n238), .C(n107), 
        .ZN(n73) );
  ND4D1BWP12T U182 ( .A1(n76), .A2(n75), .A3(n74), .A4(n73), .ZN(N199) );
  OAI22D0BWP12T U183 ( .A1(n253), .A2(n118), .B1(i_R_alu_in2[7]), .B2(
        i_R_alu_in1[3]), .ZN(n77) );
  MAOI22D0BWP12T U184 ( .A1(n78), .A2(n77), .B1(n78), .B2(n77), .ZN(n90) );
  AOI211XD0BWP12T U185 ( .A1(n253), .A2(n80), .B(n79), .C(n217), .ZN(n89) );
  MAOI22D0BWP12T U186 ( .A1(n82), .A2(n81), .B1(n82), .B2(n81), .ZN(n83) );
  AOI22D0BWP12T U187 ( .A1(n213), .A2(n83), .B1(i_R_alu_in2[3]), .B2(n95), 
        .ZN(n86) );
  AOI32D0BWP12T U188 ( .A1(n87), .A2(n86), .A3(n85), .B1(n84), .B2(n86), .ZN(
        n88) );
  RCAOI211D0BWP12T U189 ( .A1(n211), .A2(n90), .B(n89), .C(n88), .ZN(n91) );
  OAI31D1BWP12T U190 ( .A1(n245), .A2(n93), .A3(n92), .B(n91), .ZN(N198) );
  RCAOI22D0BWP12T U191 ( .A1(n211), .A2(n96), .B1(i_R_alu_in2[5]), .B2(n95), 
        .ZN(n111) );
  AOI32D0BWP12T U192 ( .A1(n102), .A2(n226), .A3(n97), .B1(n245), .B2(n226), 
        .ZN(n98) );
  AOI32D1BWP12T U193 ( .A1(n102), .A2(n101), .A3(n100), .B1(n99), .B2(n98), 
        .ZN(n110) );
  OAI221D0BWP12T U194 ( .A1(n106), .A2(n105), .B1(n104), .B2(n103), .C(n213), 
        .ZN(n109) );
  AO211D0BWP12T U195 ( .A1(n257), .A2(n107), .B(n131), .C(n217), .Z(n108) );
  ND4D1BWP12T U196 ( .A1(n111), .A2(n110), .A3(n109), .A4(n108), .ZN(N200) );
  CKND2D1BWP12T U197 ( .A1(n157), .A2(n211), .ZN(n113) );
  ND2D0BWP12T U198 ( .A1(n238), .A2(n114), .ZN(n132) );
  OAI211D0BWP12T U199 ( .A1(n112), .A2(n210), .B(n113), .C(n132), .ZN(n124) );
  INVD1BWP12T U200 ( .I(n113), .ZN(n166) );
  NR2XD0BWP12T U201 ( .A1(n217), .A2(n114), .ZN(n156) );
  AOI22D0BWP12T U202 ( .A1(n166), .A2(n115), .B1(n156), .B2(n261), .ZN(n117)
         );
  IND2D0BWP12T U203 ( .A1(n158), .B1(n213), .ZN(n116) );
  OAI211D1BWP12T U204 ( .A1(n134), .A2(n118), .B(n117), .C(n116), .ZN(n123) );
  IND2XD1BWP12T U205 ( .A1(n125), .B1(n227), .ZN(n141) );
  OAI32D0BWP12T U206 ( .A1(n144), .A2(n140), .A3(n125), .B1(n227), .B2(n144), 
        .ZN(n120) );
  OAI32D1BWP12T U207 ( .A1(n121), .A2(n140), .A3(n141), .B1(n120), .B2(n119), 
        .ZN(n122) );
  AO211D1BWP12T U208 ( .A1(i_R_alu_in1[7]), .A2(n124), .B(n123), .C(n122), .Z(
        N202) );
  INVD0BWP12T U209 ( .I(n140), .ZN(n142) );
  AOI21D0BWP12T U210 ( .A1(n227), .A2(n125), .B(n144), .ZN(n139) );
  AOI221D1BWP12T U211 ( .A1(n130), .A2(n129), .B1(n128), .B2(n127), .C(n210), 
        .ZN(n136) );
  CKND0BWP12T U212 ( .I(i_R_alu_in2[6]), .ZN(n259) );
  NR2D0BWP12T U213 ( .A1(i_R_alu_in1[6]), .A2(n131), .ZN(n133) );
  OAI22D1BWP12T U214 ( .A1(n134), .A2(n259), .B1(n133), .B2(n132), .ZN(n135)
         );
  RCAOI211D0BWP12T U215 ( .A1(n211), .A2(n137), .B(n136), .C(n135), .ZN(n138)
         );
  OAI221D1BWP12T U216 ( .A1(n142), .A2(n141), .B1(n140), .B2(n139), .C(n138), 
        .ZN(N201) );
  INVD1BWP12T U217 ( .I(n143), .ZN(n163) );
  AOI21D1BWP12T U218 ( .A1(n163), .A2(n227), .B(n144), .ZN(n162) );
  AOI221D1BWP12T U219 ( .A1(n164), .A2(n146), .B1(n145), .B2(n155), .C(n245), 
        .ZN(n152) );
  CKND2D0BWP12T U220 ( .A1(n238), .A2(n171), .ZN(n150) );
  OAI211D0BWP12T U221 ( .A1(i_R_alu_in1[9]), .A2(n147), .B(n211), .C(n173), 
        .ZN(n149) );
  CKND2D0BWP12T U222 ( .A1(n213), .A2(n175), .ZN(n148) );
  OAI211D0BWP12T U223 ( .A1(i_R_alu_in1[9]), .A2(n150), .B(n149), .C(n148), 
        .ZN(n151) );
  AOI211D1BWP12T U224 ( .A1(n233), .A2(i_R_alu_in2[9]), .B(n152), .C(n151), 
        .ZN(n154) );
  AOI32D0BWP12T U225 ( .A1(i_R_alu_in1[8]), .A2(i_R_alu_in1[9]), .A3(n213), 
        .B1(n165), .B2(i_R_alu_in1[9]), .ZN(n153) );
  OAI211D1BWP12T U226 ( .A1(n162), .A2(n155), .B(n154), .C(n153), .ZN(N204) );
  TPND2D0BWP12T U227 ( .A1(i_R_alu_in1[7]), .A2(n156), .ZN(n170) );
  OAI22D0BWP12T U228 ( .A1(n210), .A2(n158), .B1(n215), .B2(n157), .ZN(n159)
         );
  AOI22D0BWP12T U229 ( .A1(i_R_alu_in2[8]), .A2(n233), .B1(n160), .B2(n159), 
        .ZN(n169) );
  INVD1BWP12T U230 ( .I(n164), .ZN(n161) );
  OAI32D1BWP12T U231 ( .A1(n164), .A2(n245), .A3(n163), .B1(n162), .B2(n161), 
        .ZN(n167) );
  OAI32D1BWP12T U232 ( .A1(n167), .A2(n166), .A3(n165), .B1(i_R_alu_in1[8]), 
        .B2(n167), .ZN(n168) );
  OAI211D1BWP12T U233 ( .A1(n171), .A2(n170), .B(n169), .C(n168), .ZN(N203) );
  CKND2D1BWP12T U234 ( .A1(n195), .A2(n191), .ZN(n186) );
  INVD1BWP12T U235 ( .I(n200), .ZN(n199) );
  OAI21D0BWP12T U236 ( .A1(n174), .A2(n173), .B(n189), .ZN(n179) );
  NR2XD0BWP12T U237 ( .A1(n217), .A2(n188), .ZN(n203) );
  AOI22D1BWP12T U238 ( .A1(i_R_alu_in2[11]), .A2(n233), .B1(n203), .B2(n189), 
        .ZN(n177) );
  AOI32D1BWP12T U239 ( .A1(n190), .A2(n177), .A3(n176), .B1(n210), .B2(n177), 
        .ZN(n178) );
  AOI31D1BWP12T U240 ( .A1(n211), .A2(n199), .A3(n179), .B(n178), .ZN(n185) );
  OAI32D1BWP12T U241 ( .A1(n181), .A2(n191), .A3(n180), .B1(n192), .B2(n186), 
        .ZN(n182) );
  AOI22D1BWP12T U242 ( .A1(i_R_alu_in1[11]), .A2(n183), .B1(n227), .B2(n182), 
        .ZN(n184) );
  OAI211D1BWP12T U243 ( .A1(n187), .A2(n186), .B(n185), .C(n184), .ZN(N206) );
  INVD1BWP12T U244 ( .I(n237), .ZN(n202) );
  ND3D1BWP12T U245 ( .A1(i_R_alu_in1[13]), .A2(i_R_alu_in1[12]), .A3(n200), 
        .ZN(n214) );
  ND2D1BWP12T U246 ( .A1(n211), .A2(n214), .ZN(n209) );
  NR3D1BWP12T U247 ( .A1(i_R_alu_in1[13]), .A2(i_R_alu_in1[12]), .A3(n190), 
        .ZN(n212) );
  INVD1BWP12T U248 ( .I(n190), .ZN(n201) );
  OAI22D1BWP12T U249 ( .A1(n201), .A2(n210), .B1(n237), .B2(n217), .ZN(n198)
         );
  ND3D1BWP12T U250 ( .A1(n193), .A2(n192), .A3(n191), .ZN(n196) );
  INVD1BWP12T U251 ( .I(n196), .ZN(n205) );
  AOI22D1BWP12T U252 ( .A1(i_R_alu_in1[12]), .A2(n195), .B1(n207), .B2(n194), 
        .ZN(n206) );
  ND3XD0BWP12T U253 ( .A1(i_R_alu_in1[14]), .A2(i_R_alu_in1[13]), .A3(n237), 
        .ZN(n218) );
  ND2D0BWP12T U254 ( .A1(n238), .A2(n218), .ZN(n208) );
  OAI211D1BWP12T U255 ( .A1(n212), .A2(n210), .B(n209), .C(n208), .ZN(n235) );
  AOI221D0BWP12T U256 ( .A1(n213), .A2(i_R_alu_in1[14]), .B1(n211), .B2(n236), 
        .C(n235), .ZN(n231) );
  ND3D1BWP12T U257 ( .A1(n213), .A2(n212), .A3(n236), .ZN(n240) );
  TPND2D0BWP12T U258 ( .A1(i_R_alu_in1[14]), .A2(n232), .ZN(n216) );
  OAI211D1BWP12T U259 ( .A1(n218), .A2(n217), .B(n240), .C(n216), .ZN(n219) );
  AOI22D1BWP12T U260 ( .A1(i_R_alu_in2[15]), .A2(n233), .B1(n230), .B2(n219), 
        .ZN(n229) );
  CKND2D1BWP12T U261 ( .A1(i_R_alu_in1[14]), .A2(n224), .ZN(n225) );
  IOA21D1BWP12T U262 ( .A1(n244), .A2(n227), .B(n226), .ZN(n234) );
  OAI211D1BWP12T U263 ( .A1(n231), .A2(n230), .B(n229), .C(n228), .ZN(N210) );
  AOI22D1BWP12T U264 ( .A1(i_R_alu_in2[14]), .A2(n233), .B1(n232), .B2(n236), 
        .ZN(n242) );
  AOI22D1BWP12T U265 ( .A1(i_R_alu_in1[14]), .A2(n235), .B1(n246), .B2(n234), 
        .ZN(n241) );
  ND4D1BWP12T U266 ( .A1(i_R_alu_in1[13]), .A2(n238), .A3(n237), .A4(n236), 
        .ZN(n239) );
  AN4XD1BWP12T U267 ( .A1(n242), .A2(n241), .A3(n240), .A4(n239), .Z(n243) );
  OAI31D1BWP12T U268 ( .A1(n246), .A2(n245), .A3(n244), .B(n243), .ZN(N209) );
  CKND0BWP12T U269 ( .I(i_5_alu_opcode[3]), .ZN(n264) );
  NR2D0BWP12T U270 ( .A1(i_R_alu_in1[0]), .A2(n247), .ZN(n249) );
  MAOI222D0BWP12T U271 ( .A(i_R_alu_in2[1]), .B(n249), .C(n248), .ZN(n250) );
  MAOI222D0BWP12T U272 ( .A(i_R_alu_in1[2]), .B(n251), .C(n250), .ZN(n252) );
  MAOI222D0BWP12T U273 ( .A(i_R_alu_in2[3]), .B(n253), .C(n252), .ZN(n254) );
  MAOI222D0BWP12T U274 ( .A(i_R_alu_in1[4]), .B(n255), .C(n254), .ZN(n256) );
  MAOI222D0BWP12T U275 ( .A(i_R_alu_in2[5]), .B(n257), .C(n256), .ZN(n258) );
  MAOI222D0BWP12T U276 ( .A(i_R_alu_in1[6]), .B(n259), .C(n258), .ZN(n260) );
  MAOI222D0BWP12T U277 ( .A(i_R_alu_in2[7]), .B(n261), .C(n260), .ZN(n262) );
  OAI211D0BWP12T U278 ( .A1(i_5_alu_opcode[3]), .A2(n262), .B(
        i_5_alu_opcode[4]), .C(n265), .ZN(n263) );
  OAI31D0BWP12T U279 ( .A1(i_5_alu_opcode[4]), .A2(n265), .A3(n264), .B(n263), 
        .ZN(n266) );
  INR3D0BWP12T U280 ( .A1(n266), .B1(i_5_alu_opcode[1]), .B2(i_5_alu_opcode[2]), .ZN(N211) );
endmodule


module execute_REG_WIDTH16 ( clk, rst, i_1_alu_in2_sel, i_5_alu_control, 
        i_1_branch, i_1_mem_wr_en, i_1_mem2reg_sel, i_1_reg_wr_en, 
        i_1_mem_addr_sel, i_R_rd1_data, i_R_rd2_data, i_4_reg_wr_addr, 
        i_R_sign_imm, i_R_pcplus, o_1_alu_zero, o_R_alu_out, or_R_wr_data, 
        or_4_reg_wr_addr, or_R_pc_branch, or_1_mem_addr_sel, or_1_reg_wr_en, 
        or_1_mem2reg_sel, or_1_mem_wr_en, or_1_branch );
  input [4:0] i_5_alu_control;
  input [15:0] i_R_rd1_data;
  input [15:0] i_R_rd2_data;
  input [3:0] i_4_reg_wr_addr;
  input [15:0] i_R_sign_imm;
  input [15:0] i_R_pcplus;
  output [15:0] o_R_alu_out;
  output [15:0] or_R_wr_data;
  output [3:0] or_4_reg_wr_addr;
  output [15:0] or_R_pc_branch;
  input clk, rst, i_1_alu_in2_sel, i_1_branch, i_1_mem_wr_en, i_1_mem2reg_sel,
         i_1_reg_wr_en, i_1_mem_addr_sel;
  output o_1_alu_zero, or_1_mem_addr_sel, or_1_reg_wr_en, or_1_mem2reg_sel,
         or_1_mem_wr_en, or_1_branch;
  wire   N127, N128, N129, N130, N131, N132, N133, N134, N135, N136, N137,
         N138, N139, N140, N141, N142, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88;
  wire   [15:0] w_R_alu_in2;

  alu_REG_WIDTH16 u_alu ( .clk(clk), .i_R_alu_in1(i_R_rd1_data), .i_R_alu_in2(
        w_R_alu_in2), .i_5_alu_opcode(i_5_alu_control), .or_R_alu_out(
        o_R_alu_out), .or_1_alu_zero(o_1_alu_zero) );
  DFKCNQD1BWP12T or_1_branch_reg ( .CN(n88), .D(i_1_branch), .CP(clk), .Q(
        or_1_branch) );
  DFKCNQD1BWP12T or_R_wr_data_reg_15_ ( .CN(i_R_rd2_data[15]), .D(n88), .CP(
        clk), .Q(or_R_wr_data[15]) );
  DFKCNQD1BWP12T or_R_wr_data_reg_14_ ( .CN(n88), .D(i_R_rd2_data[14]), .CP(
        clk), .Q(or_R_wr_data[14]) );
  DFKCNQD1BWP12T or_R_wr_data_reg_13_ ( .CN(n88), .D(i_R_rd2_data[13]), .CP(
        clk), .Q(or_R_wr_data[13]) );
  DFKCNQD1BWP12T or_R_wr_data_reg_12_ ( .CN(n88), .D(i_R_rd2_data[12]), .CP(
        clk), .Q(or_R_wr_data[12]) );
  DFKCNQD1BWP12T or_R_wr_data_reg_11_ ( .CN(n88), .D(i_R_rd2_data[11]), .CP(
        clk), .Q(or_R_wr_data[11]) );
  DFKCNQD1BWP12T or_R_wr_data_reg_10_ ( .CN(n88), .D(i_R_rd2_data[10]), .CP(
        clk), .Q(or_R_wr_data[10]) );
  DFKCNQD1BWP12T or_R_wr_data_reg_9_ ( .CN(n88), .D(i_R_rd2_data[9]), .CP(clk), 
        .Q(or_R_wr_data[9]) );
  DFKCNQD1BWP12T or_R_wr_data_reg_8_ ( .CN(n88), .D(i_R_rd2_data[8]), .CP(clk), 
        .Q(or_R_wr_data[8]) );
  DFKCNQD1BWP12T or_R_wr_data_reg_7_ ( .CN(n88), .D(i_R_rd2_data[7]), .CP(clk), 
        .Q(or_R_wr_data[7]) );
  DFKCNQD1BWP12T or_R_wr_data_reg_6_ ( .CN(n88), .D(i_R_rd2_data[6]), .CP(clk), 
        .Q(or_R_wr_data[6]) );
  DFKCNQD1BWP12T or_R_wr_data_reg_5_ ( .CN(n88), .D(i_R_rd2_data[5]), .CP(clk), 
        .Q(or_R_wr_data[5]) );
  DFKCNQD1BWP12T or_R_wr_data_reg_4_ ( .CN(n88), .D(i_R_rd2_data[4]), .CP(clk), 
        .Q(or_R_wr_data[4]) );
  DFKCNQD1BWP12T or_R_wr_data_reg_3_ ( .CN(n88), .D(i_R_rd2_data[3]), .CP(clk), 
        .Q(or_R_wr_data[3]) );
  DFKCNQD1BWP12T or_R_wr_data_reg_2_ ( .CN(n88), .D(i_R_rd2_data[2]), .CP(clk), 
        .Q(or_R_wr_data[2]) );
  DFKCNQD1BWP12T or_R_wr_data_reg_1_ ( .CN(n88), .D(i_R_rd2_data[1]), .CP(clk), 
        .Q(or_R_wr_data[1]) );
  DFKCNQD1BWP12T or_R_wr_data_reg_0_ ( .CN(n88), .D(i_R_rd2_data[0]), .CP(clk), 
        .Q(or_R_wr_data[0]) );
  DFKCNQD1BWP12T or_4_reg_wr_addr_reg_3_ ( .CN(n88), .D(i_4_reg_wr_addr[3]), 
        .CP(clk), .Q(or_4_reg_wr_addr[3]) );
  DFKCNQD1BWP12T or_4_reg_wr_addr_reg_2_ ( .CN(n88), .D(i_4_reg_wr_addr[2]), 
        .CP(clk), .Q(or_4_reg_wr_addr[2]) );
  DFKCNQD1BWP12T or_4_reg_wr_addr_reg_1_ ( .CN(n88), .D(i_4_reg_wr_addr[1]), 
        .CP(clk), .Q(or_4_reg_wr_addr[1]) );
  DFKCNQD1BWP12T or_4_reg_wr_addr_reg_0_ ( .CN(n88), .D(i_4_reg_wr_addr[0]), 
        .CP(clk), .Q(or_4_reg_wr_addr[0]) );
  DFQD1BWP12T or_R_pc_branch_reg_15_ ( .D(N142), .CP(clk), .Q(
        or_R_pc_branch[15]) );
  DFQD1BWP12T or_R_pc_branch_reg_14_ ( .D(N141), .CP(clk), .Q(
        or_R_pc_branch[14]) );
  DFQD1BWP12T or_R_pc_branch_reg_13_ ( .D(N140), .CP(clk), .Q(
        or_R_pc_branch[13]) );
  DFQD1BWP12T or_R_pc_branch_reg_12_ ( .D(N139), .CP(clk), .Q(
        or_R_pc_branch[12]) );
  DFQD1BWP12T or_R_pc_branch_reg_11_ ( .D(N138), .CP(clk), .Q(
        or_R_pc_branch[11]) );
  DFQD1BWP12T or_R_pc_branch_reg_10_ ( .D(N137), .CP(clk), .Q(
        or_R_pc_branch[10]) );
  DFQD1BWP12T or_R_pc_branch_reg_9_ ( .D(N136), .CP(clk), .Q(or_R_pc_branch[9]) );
  DFQD1BWP12T or_R_pc_branch_reg_8_ ( .D(N135), .CP(clk), .Q(or_R_pc_branch[8]) );
  DFQD1BWP12T or_R_pc_branch_reg_7_ ( .D(N134), .CP(clk), .Q(or_R_pc_branch[7]) );
  DFQD1BWP12T or_R_pc_branch_reg_6_ ( .D(N133), .CP(clk), .Q(or_R_pc_branch[6]) );
  DFQD1BWP12T or_R_pc_branch_reg_5_ ( .D(N132), .CP(clk), .Q(or_R_pc_branch[5]) );
  DFQD1BWP12T or_R_pc_branch_reg_4_ ( .D(N131), .CP(clk), .Q(or_R_pc_branch[4]) );
  DFQD1BWP12T or_R_pc_branch_reg_3_ ( .D(N130), .CP(clk), .Q(or_R_pc_branch[3]) );
  DFQD1BWP12T or_R_pc_branch_reg_2_ ( .D(N129), .CP(clk), .Q(or_R_pc_branch[2]) );
  DFQD1BWP12T or_R_pc_branch_reg_1_ ( .D(N128), .CP(clk), .Q(or_R_pc_branch[1]) );
  DFQD1BWP12T or_R_pc_branch_reg_0_ ( .D(N127), .CP(clk), .Q(or_R_pc_branch[0]) );
  DFKCNQD1BWP12T or_1_mem_addr_sel_reg ( .CN(n88), .D(i_1_mem_addr_sel), .CP(
        clk), .Q(or_1_mem_addr_sel) );
  DFKCNQD1BWP12T or_1_reg_wr_en_reg ( .CN(n88), .D(i_1_reg_wr_en), .CP(clk), 
        .Q(or_1_reg_wr_en) );
  DFKCNQD1BWP12T or_1_mem2reg_sel_reg ( .CN(n88), .D(i_1_mem2reg_sel), .CP(clk), .Q(or_1_mem2reg_sel) );
  DFKCNQD1BWP12T or_1_mem_wr_en_reg ( .CN(n88), .D(i_1_mem_wr_en), .CP(clk), 
        .Q(or_1_mem_wr_en) );
  MAOI22D0BWP12T U3 ( .A1(i_1_alu_in2_sel), .A2(n83), .B1(i_1_alu_in2_sel), 
        .B2(i_R_rd2_data[0]), .ZN(w_R_alu_in2[0]) );
  INVD1BWP12T U4 ( .I(i_5_alu_control[4]), .ZN(n41) );
  HA1D0BWP12T U5 ( .A(i_R_pcplus[1]), .B(i_R_pcplus[2]), .CO(n39), .S(n79) );
  HA1D0BWP12T U6 ( .A(n39), .B(i_R_pcplus[3]), .CO(n38), .S(n76) );
  FA1D0BWP12T U7 ( .A(n76), .B(i_R_sign_imm[2]), .CI(n75), .CO(n72), .S(n77)
         );
  HA1D0BWP12T U8 ( .A(n38), .B(i_R_pcplus[4]), .CO(n37), .S(n73) );
  FA1D0BWP12T U9 ( .A(n73), .B(i_R_sign_imm[3]), .CI(n72), .CO(n69), .S(n74)
         );
  HA1D0BWP12T U10 ( .A(n37), .B(i_R_pcplus[5]), .CO(n36), .S(n70) );
  FA1D0BWP12T U11 ( .A(n70), .B(i_R_sign_imm[4]), .CI(n69), .CO(n66), .S(n71)
         );
  HA1D0BWP12T U12 ( .A(n36), .B(i_R_pcplus[6]), .CO(n35), .S(n67) );
  FA1D0BWP12T U13 ( .A(n67), .B(i_R_sign_imm[5]), .CI(n66), .CO(n63), .S(n68)
         );
  HA1D0BWP12T U14 ( .A(n35), .B(i_R_pcplus[7]), .CO(n34), .S(n64) );
  FA1D0BWP12T U15 ( .A(n64), .B(i_R_sign_imm[6]), .CI(n63), .CO(n60), .S(n65)
         );
  HA1D0BWP12T U16 ( .A(n34), .B(i_R_pcplus[8]), .CO(n33), .S(n61) );
  FA1D0BWP12T U17 ( .A(n61), .B(i_R_sign_imm[7]), .CI(n60), .CO(n57), .S(n62)
         );
  HA1D0BWP12T U18 ( .A(n33), .B(i_R_pcplus[9]), .CO(n32), .S(n58) );
  HA1D0BWP12T U19 ( .A(n32), .B(i_R_pcplus[10]), .CO(n31), .S(n55) );
  HA1D0BWP12T U20 ( .A(n31), .B(i_R_pcplus[11]), .CO(n30), .S(n52) );
  HA1D0BWP12T U21 ( .A(n30), .B(i_R_pcplus[12]), .CO(n29), .S(n49) );
  FA1D0BWP12T U22 ( .A(n49), .B(i_5_alu_control[4]), .CI(n48), .CO(n45), .S(
        n50) );
  HA1D0BWP12T U23 ( .A(n29), .B(i_R_pcplus[13]), .CO(n28), .S(n46) );
  FA1D0BWP12T U24 ( .A(n46), .B(i_5_alu_control[4]), .CI(n45), .CO(n42), .S(
        n47) );
  HA1D0BWP12T U25 ( .A(n28), .B(i_R_pcplus[14]), .CO(n27), .S(n43) );
  FA1D0BWP12T U26 ( .A(n43), .B(i_5_alu_control[4]), .CI(n42), .CO(n40), .S(
        n44) );
  NR3D1BWP12T U27 ( .A1(rst), .A2(i_5_alu_control[3]), .A3(n41), .ZN(n80) );
  AO22D1BWP12T U28 ( .A1(n65), .A2(n81), .B1(n80), .B2(n64), .Z(N134) );
  AO22D1BWP12T U29 ( .A1(n62), .A2(n81), .B1(n80), .B2(n61), .Z(N135) );
  AO22D1BWP12T U30 ( .A1(n59), .A2(n81), .B1(n80), .B2(n58), .Z(N136) );
  AO22D1BWP12T U31 ( .A1(n56), .A2(n81), .B1(n80), .B2(n55), .Z(N137) );
  AO22D1BWP12T U32 ( .A1(n53), .A2(n81), .B1(n80), .B2(n52), .Z(N138) );
  AO22D1BWP12T U33 ( .A1(n50), .A2(n81), .B1(n80), .B2(n49), .Z(N139) );
  AO22D1BWP12T U34 ( .A1(n47), .A2(n81), .B1(n80), .B2(n46), .Z(N140) );
  AO22D1BWP12T U35 ( .A1(n44), .A2(n81), .B1(n80), .B2(n43), .Z(N141) );
  CKND0BWP12T U36 ( .I(i_R_sign_imm[1]), .ZN(n1) );
  MAOI22D0BWP12T U37 ( .A1(i_1_alu_in2_sel), .A2(n1), .B1(i_1_alu_in2_sel), 
        .B2(i_R_rd2_data[1]), .ZN(w_R_alu_in2[1]) );
  NR2D0BWP12T U38 ( .A1(i_R_sign_imm[8]), .A2(i_5_alu_control[4]), .ZN(n2) );
  CKND0BWP12T U39 ( .I(n58), .ZN(n3) );
  CKND0BWP12T U40 ( .I(n57), .ZN(n4) );
  MAOI222D0BWP12T U41 ( .A(n2), .B(n3), .C(n4), .ZN(n54) );
  MAOI22D0BWP12T U42 ( .A1(n2), .A2(n3), .B1(n2), .B2(n3), .ZN(n5) );
  MAOI22D0BWP12T U43 ( .A1(n57), .A2(n5), .B1(n57), .B2(n5), .ZN(n59) );
  CKND0BWP12T U44 ( .I(i_R_sign_imm[3]), .ZN(n6) );
  MAOI22D0BWP12T U45 ( .A1(i_1_alu_in2_sel), .A2(n6), .B1(i_1_alu_in2_sel), 
        .B2(i_R_rd2_data[3]), .ZN(w_R_alu_in2[3]) );
  NR2D0BWP12T U46 ( .A1(i_R_sign_imm[9]), .A2(i_5_alu_control[4]), .ZN(n7) );
  CKND0BWP12T U47 ( .I(n55), .ZN(n8) );
  CKND0BWP12T U48 ( .I(n54), .ZN(n9) );
  MAOI222D0BWP12T U49 ( .A(n7), .B(n8), .C(n9), .ZN(n51) );
  MAOI22D0BWP12T U50 ( .A1(n7), .A2(n8), .B1(n7), .B2(n8), .ZN(n10) );
  MAOI22D0BWP12T U51 ( .A1(n54), .A2(n10), .B1(n54), .B2(n10), .ZN(n56) );
  CKND0BWP12T U52 ( .I(i_R_sign_imm[5]), .ZN(n11) );
  MAOI22D0BWP12T U53 ( .A1(i_1_alu_in2_sel), .A2(n11), .B1(i_1_alu_in2_sel), 
        .B2(i_R_rd2_data[5]), .ZN(w_R_alu_in2[5]) );
  IAO21D0BWP12T U54 ( .A1(i_5_alu_control[3]), .A2(n41), .B(rst), .ZN(n81) );
  CKND0BWP12T U55 ( .I(i_R_sign_imm[6]), .ZN(n12) );
  MAOI22D0BWP12T U56 ( .A1(i_1_alu_in2_sel), .A2(n12), .B1(i_1_alu_in2_sel), 
        .B2(i_R_rd2_data[6]), .ZN(w_R_alu_in2[6]) );
  CKND0BWP12T U57 ( .I(i_R_sign_imm[4]), .ZN(n13) );
  MAOI22D0BWP12T U58 ( .A1(i_1_alu_in2_sel), .A2(n13), .B1(i_1_alu_in2_sel), 
        .B2(i_R_rd2_data[4]), .ZN(w_R_alu_in2[4]) );
  CKND0BWP12T U59 ( .I(i_R_sign_imm[7]), .ZN(n14) );
  MAOI22D0BWP12T U60 ( .A1(i_1_alu_in2_sel), .A2(n14), .B1(i_1_alu_in2_sel), 
        .B2(i_R_rd2_data[7]), .ZN(w_R_alu_in2[7]) );
  NR2D0BWP12T U61 ( .A1(i_R_sign_imm[10]), .A2(i_5_alu_control[4]), .ZN(n15)
         );
  CKND0BWP12T U62 ( .I(n52), .ZN(n16) );
  CKND0BWP12T U63 ( .I(n51), .ZN(n17) );
  MAOI222D0BWP12T U64 ( .A(n15), .B(n16), .C(n17), .ZN(n48) );
  MAOI22D0BWP12T U65 ( .A1(n15), .A2(n16), .B1(n15), .B2(n16), .ZN(n18) );
  MAOI22D0BWP12T U66 ( .A1(n51), .A2(n18), .B1(n51), .B2(n18), .ZN(n53) );
  INR2D0BWP12T U67 ( .A1(i_R_rd2_data[12]), .B1(i_1_alu_in2_sel), .ZN(
        w_R_alu_in2[12]) );
  MAOI22D0BWP12T U68 ( .A1(i_R_sign_imm[0]), .A2(n78), .B1(i_R_sign_imm[0]), 
        .B2(n78), .ZN(n19) );
  AO22D0BWP12T U69 ( .A1(n78), .A2(n80), .B1(n81), .B2(n19), .Z(N128) );
  CKND0BWP12T U70 ( .I(i_R_sign_imm[1]), .ZN(n20) );
  CKND0BWP12T U71 ( .I(n79), .ZN(n21) );
  CKND2D0BWP12T U72 ( .A1(i_R_sign_imm[0]), .A2(n78), .ZN(n22) );
  MAOI222D0BWP12T U73 ( .A(n20), .B(n21), .C(n22), .ZN(n75) );
  AOI22D0BWP12T U74 ( .A1(i_R_sign_imm[1]), .A2(n21), .B1(n79), .B2(n20), .ZN(
        n23) );
  MAOI22D0BWP12T U75 ( .A1(n22), .A2(n23), .B1(n22), .B2(n23), .ZN(n82) );
  INR2D0BWP12T U76 ( .A1(i_R_rd2_data[13]), .B1(i_1_alu_in2_sel), .ZN(
        w_R_alu_in2[13]) );
  MAOI22D0BWP12T U77 ( .A1(i_R_pcplus[15]), .A2(n27), .B1(i_R_pcplus[15]), 
        .B2(n27), .ZN(n24) );
  MAOI22D0BWP12T U78 ( .A1(i_5_alu_control[4]), .A2(n24), .B1(
        i_5_alu_control[4]), .B2(n24), .ZN(n25) );
  MAOI22D0BWP12T U79 ( .A1(n25), .A2(n40), .B1(n25), .B2(n40), .ZN(n26) );
  AO22D0BWP12T U80 ( .A1(n24), .A2(n80), .B1(n81), .B2(n26), .Z(N142) );
  INVD1BWP12T U81 ( .I(i_R_pcplus[1]), .ZN(n78) );
  AO22XD1BWP12T U82 ( .A1(n68), .A2(n81), .B1(n80), .B2(n67), .Z(N133) );
  AO22XD1BWP12T U83 ( .A1(n71), .A2(n81), .B1(n80), .B2(n70), .Z(N132) );
  AO22XD1BWP12T U84 ( .A1(n74), .A2(n81), .B1(n80), .B2(n73), .Z(N131) );
  AO22XD1BWP12T U85 ( .A1(n77), .A2(n81), .B1(n80), .B2(n76), .Z(N130) );
  AO22XD1BWP12T U86 ( .A1(n81), .A2(i_R_pcplus[0]), .B1(n80), .B2(
        i_R_pcplus[0]), .Z(N127) );
  AO22XD1BWP12T U87 ( .A1(n82), .A2(n81), .B1(n80), .B2(n79), .Z(N129) );
  INVD1BWP12T U88 ( .I(i_R_sign_imm[0]), .ZN(n83) );
  INR2D0BWP12T U89 ( .A1(i_R_rd2_data[15]), .B1(i_1_alu_in2_sel), .ZN(
        w_R_alu_in2[15]) );
  INR2D0BWP12T U90 ( .A1(i_R_rd2_data[14]), .B1(i_1_alu_in2_sel), .ZN(
        w_R_alu_in2[14]) );
  INR2D0BWP12T U91 ( .A1(i_R_rd2_data[11]), .B1(i_1_alu_in2_sel), .ZN(
        w_R_alu_in2[11]) );
  INVD1BWP12T U92 ( .I(i_R_sign_imm[8]), .ZN(n84) );
  MAOI22D0BWP12T U93 ( .A1(i_1_alu_in2_sel), .A2(n84), .B1(i_1_alu_in2_sel), 
        .B2(i_R_rd2_data[8]), .ZN(w_R_alu_in2[8]) );
  INVD0BWP12T U94 ( .I(i_R_sign_imm[9]), .ZN(n85) );
  MAOI22D0BWP12T U95 ( .A1(i_1_alu_in2_sel), .A2(n85), .B1(i_1_alu_in2_sel), 
        .B2(i_R_rd2_data[9]), .ZN(w_R_alu_in2[9]) );
  INVD0BWP12T U96 ( .I(i_R_sign_imm[10]), .ZN(n86) );
  MAOI22D0BWP12T U97 ( .A1(i_1_alu_in2_sel), .A2(n86), .B1(i_1_alu_in2_sel), 
        .B2(i_R_rd2_data[10]), .ZN(w_R_alu_in2[10]) );
  INVD1BWP12T U98 ( .I(i_R_sign_imm[2]), .ZN(n87) );
  MAOI22D0BWP12T U99 ( .A1(i_1_alu_in2_sel), .A2(n87), .B1(i_1_alu_in2_sel), 
        .B2(i_R_rd2_data[2]), .ZN(w_R_alu_in2[2]) );
  INVD1BWP12T U100 ( .I(rst), .ZN(n88) );
endmodule


module cpu ( clk, rst, data_mem2cpu, data_cpu2mem, addr_cpu2mem, mem_en, 
        mem_rd_en, mem_wr_en );
  input [15:0] data_mem2cpu;
  output [15:0] data_cpu2mem;
  output [11:0] addr_cpu2mem;
  input clk, rst;
  output mem_en, mem_rd_en, mem_wr_en;
  wire   w_1_f_d_mem2reg_sel, w_1_f_d_reg_wr_en, w_1_e_f_alu_zero,
         w_1_e_f_mem_addr_sel, w_1_e_f_reg_wr_en, w_1_e_f_mem2reg_sel,
         w_1_e_f_mem_wr_en, w_1_e_f_branch, w_1_d_r_rd1_addr_sel,
         w_1_d_r_rd2_addr_sel, w_1_d_r_alu_in2_sel, w_1_d_r_branch,
         w_1_d_r_mem_wr_en, w_1_d_r_mem2reg_sel, w_1_d_r_reg_wr_en,
         w_1_d_r_mem_addr_sel, w_1_d_r_reg_wr_en_2, w_1_r_e_alu_in2_sel,
         w_1_r_e_branch, w_1_r_e_mem_wr_en, w_1_r_e_mem2reg_sel,
         w_1_r_e_reg_wr_en, w_1_r_e_mem_addr_sel, n3, n4,
         SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4,
         SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6,
         SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8,
         SYNOPSYS_UNCONNECTED_9, SYNOPSYS_UNCONNECTED_10;
  wire   [15:0] w_16_f_d_data_mem2cpu;
  wire   [15:0] w_R_f_d_pcplus;
  wire   [15:0] w_R_f_d_alu_out;
  wire   [3:0] w_4_f_d_reg_wr_addr;
  wire   [15:0] w_R_e_f_alu_out;
  wire   [15:0] w_R_e_f_wr_data;
  wire   [3:0] w_4_e_f_reg_wr_addr;
  wire   [15:0] w_R_e_f_pc_branch;
  wire   [3:0] w_4_d_r_fwd_wr_addr_from_cu;
  wire   [3:0] w_4_d_r_rd1_addr_from_cu;
  wire   [1:0] w_2_d_r_fwd_wr_sel;
  wire   [4:0] w_5_d_r_alu_control;
  wire   [2:0] w_4_d_r_rd1_addr1;
  wire   [3:0] w_4_d_r_rd2_addr1;
  wire   [2:0] w_4_d_r_rd2_addr2;
  wire   [15:0] w_R_d_r_wr_data;
  wire   [3:0] w_4_d_r_reg_wr_addr;
  wire   [2:0] w_4_d_r_fwd_wr_addr1;
  wire   [2:0] w_4_d_r_fwd_wr_addr2;
  wire   [10:0] w_11_d_r_imm;
  wire   [15:0] w_R_d_r_pcplus;
  wire   [4:0] w_5_r_e_alu_control;
  wire   [15:0] w_R_r_e_rd1_data;
  wire   [15:0] w_R_r_e_rd2_data;
  wire   [3:0] w_4_r_e_reg_wr_addr;
  wire   [10:0] w_R_r_e_sign_imm;
  wire   [15:0] w_R_r_e_pcplus;

  fetch_mem_wr_ADDR_WIDTH12_REG_WIDTH16 u_fetch_mem_wr ( .clk(clk), .rst(rst), 
        .o_16_data_mem2cpu(w_16_f_d_data_mem2cpu), .or_R_pcplus(w_R_f_d_pcplus), .or_R_alu_out(w_R_f_d_alu_out), .or_1_mem2reg_sel(w_1_f_d_mem2reg_sel), 
        .or_4_reg_wr_addr(w_4_f_d_reg_wr_addr), .or_1_reg_wr_en(
        w_1_f_d_reg_wr_en), .i_1_alu_zero(w_1_e_f_alu_zero), .i_R_alu_out(
        w_R_e_f_alu_out), .i_R_wr_data(w_R_e_f_wr_data), .i_4_reg_wr_addr(
        w_4_e_f_reg_wr_addr), .i_R_pc_branch(w_R_e_f_pc_branch), 
        .i_1_mem_addr_sel(w_1_e_f_mem_addr_sel), .i_1_reg_wr_en(
        w_1_e_f_reg_wr_en), .i_1_mem2reg_sel(w_1_e_f_mem2reg_sel), 
        .i_1_mem_wr_en(w_1_e_f_mem_wr_en), .i_1_branch(w_1_e_f_branch), 
        .i_16_data_mem2cpu(data_mem2cpu), .o_1_mem_rd_en(mem_rd_en), 
        .o_1_mem_wr_en(mem_wr_en), .o_16_data_cpu2mem(data_cpu2mem), 
        .o_A_addr_cpu2mem({SYNOPSYS_UNCONNECTED_1, addr_cpu2mem[10:0]}) );
  decode_control_REG_WIDTH16 u_decode_control ( .clk(clk), .rst(rst), 
        .i_16_data_mem2cpu(w_16_f_d_data_mem2cpu), .i_R_pcplus(w_R_f_d_pcplus), 
        .i_R_alu_out(w_R_f_d_alu_out), .i_1_mem2reg_sel(w_1_f_d_mem2reg_sel), 
        .i_4_reg_wr_addr(w_4_f_d_reg_wr_addr), .i_1_reg_wr_en(
        w_1_f_d_reg_wr_en), .o_4_fwd_wr_addr_from_cu(
        w_4_d_r_fwd_wr_addr_from_cu), .o_4_rd1_addr_from_cu(
        w_4_d_r_rd1_addr_from_cu), .o_1_rd1_addr_sel(w_1_d_r_rd1_addr_sel), 
        .o_1_rd2_addr_sel(w_1_d_r_rd2_addr_sel), .o_2_fwd_wr_sel(
        w_2_d_r_fwd_wr_sel), .o_1_alu_in2_sel(w_1_d_r_alu_in2_sel), 
        .o_5_alu_control(w_5_d_r_alu_control), .o_1_branch(w_1_d_r_branch), 
        .o_1_mem_wr_en(w_1_d_r_mem_wr_en), .o_1_mem2reg_sel(
        w_1_d_r_mem2reg_sel), .o_1_reg_wr_en(w_1_d_r_reg_wr_en), 
        .o_1_mem_addr_sel(w_1_d_r_mem_addr_sel), .or_4_rd1_addr1({
        SYNOPSYS_UNCONNECTED_2, w_4_d_r_rd1_addr1}), .or_4_rd2_addr1(
        w_4_d_r_rd2_addr1), .or_4_rd2_addr2({SYNOPSYS_UNCONNECTED_3, 
        w_4_d_r_rd2_addr2}), .or_R_wr_data(w_R_d_r_wr_data), 
        .or_4_reg_wr_addr(w_4_d_r_reg_wr_addr), .or_1_reg_wr_en(
        w_1_d_r_reg_wr_en_2), .or_4_fwd_wr_addr1({SYNOPSYS_UNCONNECTED_4, 
        w_4_d_r_fwd_wr_addr1}), .or_4_fwd_wr_addr2({SYNOPSYS_UNCONNECTED_5, 
        w_4_d_r_fwd_wr_addr2}), .or_11_imm(w_11_d_r_imm), .or_R_pcplus(
        w_R_d_r_pcplus) );
  reg_rd_wr_REG_WIDTH16 u_reg_rd_wr ( .clk(clk), .rst(rst), 
        .i_4_fwd_wr_addr_from_cu(w_4_d_r_fwd_wr_addr_from_cu), 
        .i_4_rd1_addr_from_cu(w_4_d_r_rd1_addr_from_cu), .i_1_rd1_addr_sel(
        w_1_d_r_rd1_addr_sel), .i_1_rd2_addr_sel(w_1_d_r_rd2_addr_sel), 
        .i_2_fwd_wr_sel(w_2_d_r_fwd_wr_sel), .i_1_alu_in2_sel(
        w_1_d_r_alu_in2_sel), .i_5_alu_control(w_5_d_r_alu_control), 
        .i_1_branch(w_1_d_r_branch), .i_1_mem_wr_en(w_1_d_r_mem_wr_en), 
        .i_1_mem2reg_sel(w_1_d_r_mem2reg_sel), .i_1_reg_wr_en(
        w_1_d_r_reg_wr_en), .i_1_mem_addr_sel(w_1_d_r_mem_addr_sel), 
        .or_1_alu_in2_sel(w_1_r_e_alu_in2_sel), .or_5_alu_control(
        w_5_r_e_alu_control), .or_1_branch(w_1_r_e_branch), .or_1_mem_wr_en(
        w_1_r_e_mem_wr_en), .or_1_mem2reg_sel(w_1_r_e_mem2reg_sel), 
        .or_1_reg_wr_en(w_1_r_e_reg_wr_en), .or_1_mem_addr_sel(
        w_1_r_e_mem_addr_sel), .i_4_rd1_addr1({n4, w_4_d_r_rd1_addr1}), 
        .i_4_rd2_addr1(w_4_d_r_rd2_addr1), .i_4_rd2_addr2({n4, 
        w_4_d_r_rd2_addr2}), .i_R_wr_data(w_R_d_r_wr_data), .i_4_reg_wr_addr(
        w_4_d_r_reg_wr_addr), .i_1_reg_wr_en_2(w_1_d_r_reg_wr_en_2), 
        .i_4_fwd_wr_addr1({n4, w_4_d_r_fwd_wr_addr1}), .i_4_fwd_wr_addr2({n4, 
        w_4_d_r_fwd_wr_addr2}), .i_11_imm(w_11_d_r_imm), .i_R_pcplus(
        w_R_d_r_pcplus), .o_R_rd1_data(w_R_r_e_rd1_data), .o_R_rd2_data(
        w_R_r_e_rd2_data), .or_4_reg_wr_addr(w_4_r_e_reg_wr_addr), 
        .or_R_sign_imm({SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7, 
        SYNOPSYS_UNCONNECTED_8, SYNOPSYS_UNCONNECTED_9, 
        SYNOPSYS_UNCONNECTED_10, w_R_r_e_sign_imm}), .or_R_pcplus(
        w_R_r_e_pcplus) );
  execute_REG_WIDTH16 u_execute ( .clk(clk), .rst(rst), .i_1_alu_in2_sel(
        w_1_r_e_alu_in2_sel), .i_5_alu_control(w_5_r_e_alu_control), 
        .i_1_branch(w_1_r_e_branch), .i_1_mem_wr_en(w_1_r_e_mem_wr_en), 
        .i_1_mem2reg_sel(w_1_r_e_mem2reg_sel), .i_1_reg_wr_en(
        w_1_r_e_reg_wr_en), .i_1_mem_addr_sel(w_1_r_e_mem_addr_sel), 
        .i_R_rd1_data(w_R_r_e_rd1_data), .i_R_rd2_data(w_R_r_e_rd2_data), 
        .i_4_reg_wr_addr(w_4_r_e_reg_wr_addr), .i_R_sign_imm({n4, n4, n4, n4, 
        n4, w_R_r_e_sign_imm}), .i_R_pcplus(w_R_r_e_pcplus), .o_1_alu_zero(
        w_1_e_f_alu_zero), .o_R_alu_out(w_R_e_f_alu_out), .or_R_wr_data(
        w_R_e_f_wr_data), .or_4_reg_wr_addr(w_4_e_f_reg_wr_addr), 
        .or_R_pc_branch(w_R_e_f_pc_branch), .or_1_mem_addr_sel(
        w_1_e_f_mem_addr_sel), .or_1_reg_wr_en(w_1_e_f_reg_wr_en), 
        .or_1_mem2reg_sel(w_1_e_f_mem2reg_sel), .or_1_mem_wr_en(
        w_1_e_f_mem_wr_en), .or_1_branch(w_1_e_f_branch) );
  TIELBWP12T U1 ( .ZN(n4) );
  TIEHBWP12T U2 ( .Z(n3) );
  INVD1BWP12T U3 ( .I(n4), .ZN(mem_en) );
  INVD1BWP12T U4 ( .I(n3), .ZN(addr_cpu2mem[11]) );
endmodule

