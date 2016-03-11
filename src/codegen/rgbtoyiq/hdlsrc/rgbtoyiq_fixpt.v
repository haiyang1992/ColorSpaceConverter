// -------------------------------------------------------------
// 
// File Name: C:\Users\Sechw\Documents\MATLAB\4440\codegen\rgbtoyiq\hdlsrc\rgbtoyiq_fixpt.v
// Created: 2014-12-04 01:19:32
// 
// Generated by MATLAB 8.2, MATLAB Coder 2.5 and HDL Coder 3.3
// 
// 
// 
// -- -------------------------------------------------------------
// -- Rate and Clocking Details
// -- -------------------------------------------------------------
// Design base rate: 1
// 
// 
// Clock Enable  Sample Time
// -- -------------------------------------------------------------
// ce_out        1
// -- -------------------------------------------------------------
// 
// 
// Output Signal                 Clock Enable  Sample Time
// -- -------------------------------------------------------------
// y                             ce_out        1
// i                             ce_out        1
// q                             ce_out        1
// -- -------------------------------------------------------------
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: rgbtoyiq_fixpt
// Source Path: rgbtoyiq_fixpt
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module rgbtoyiq_fixpt
          (
           clk,
           reset,
           ce,
           r,
           g,
           b,
           ce_out,
           y,
           i,
           q
          );


  input   clk;
  input   reset;
  input   ce;
  input   [7:0] r;  // ufix8
  input   [7:0] g;  // ufix8
  input   [7:0] b;  // ufix8
  output  ce_out;
  output  [7:0] y;  // ufix8
  output  [7:0] i;  // ufix8
  output  [7:0] q;  // ufix8


  wire enb;
  wire [21:0] rgbtoyiq_fixpt_mul_temp;  // ufix22_En15
  wire [23:0] rgbtoyiq_fixpt_add_cast;  // ufix24_En15
  wire [21:0] rgbtoyiq_fixpt_mul_temp_1;  // ufix22_En14
  wire [23:0] rgbtoyiq_fixpt_add_cast_1;  // ufix24_En15
  wire [23:0] rgbtoyiq_fixpt_add_temp;  // ufix24_En15
  wire [26:0] rgbtoyiq_fixpt_add_cast_2;  // ufix27_En17
  wire [21:0] rgbtoyiq_fixpt_mul_temp_2;  // ufix22_En17
  wire [26:0] rgbtoyiq_fixpt_add_cast_3;  // ufix27_En17
  wire [26:0] rgbtoyiq_fixpt_add_temp_1;  // ufix27_En17
  wire [7:0] rgbtoyiq_fixpt_cast;  // uint8
  wire [21:0] rgbtoyiq_fixpt_mul_temp_3;  // ufix22_En14
  wire signed [24:0] rgbtoyiq_fixpt_sub_cast;  // sfix25_En15
  wire [21:0] rgbtoyiq_fixpt_mul_temp_4;  // ufix22_En15
  wire signed [24:0] rgbtoyiq_fixpt_sub_cast_1;  // sfix25_En15
  wire signed [24:0] rgbtoyiq_fixpt_sub_temp;  // sfix25_En15
  wire [23:0] rgbtoyiq_fixpt_sub_cast_2;  // ufix24_En15
  wire signed [25:0] rgbtoyiq_fixpt_sub_cast_3;  // sfix26_En15
  wire [21:0] rgbtoyiq_fixpt_mul_temp_5;  // ufix22_En15
  wire signed [25:0] rgbtoyiq_fixpt_sub_cast_4;  // sfix26_En15
  wire signed [25:0] rgbtoyiq_fixpt_sub_temp_1;  // sfix26_En15
  wire [7:0] rgbtoyiq_fixpt_cast_1;  // uint8
  wire [21:0] rgbtoyiq_fixpt_mul_temp_6;  // ufix22_En16
  wire signed [25:0] rgbtoyiq_fixpt_sub_cast_5;  // sfix26_En16
  wire [21:0] rgbtoyiq_fixpt_mul_temp_7;  // ufix22_En14
  wire signed [25:0] rgbtoyiq_fixpt_sub_cast_6;  // sfix26_En16
  wire signed [25:0] rgbtoyiq_fixpt_sub_temp_2;  // sfix26_En16
  wire [24:0] rgbtoyiq_fixpt_add_cast_4;  // ufix25_En16
  wire [25:0] rgbtoyiq_fixpt_add_cast_5;  // ufix26_En16
  wire [21:0] rgbtoyiq_fixpt_mul_temp_8;  // ufix22_En15
  wire [25:0] rgbtoyiq_fixpt_add_cast_6;  // ufix26_En16
  wire [25:0] rgbtoyiq_fixpt_add_temp_2;  // ufix26_En16
  wire [7:0] rgbtoyiq_fixpt_cast_2;  // uint8


  assign enb = ce;

  //HDL code generation from MATLAB function: rgbtoyiq_fixpt
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  //                                                                          %
  //       Generated by MATLAB 8.2, MATLAB Coder 2.5 and HDL Coder 3.3        %
  //                                                                          %
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  //'rgbtoyiq_fixpt:9' fm = fimath('RoundingMethod', 'Floor', 'OverflowAction', 'Saturate', 'ProductMode', 'FullPrecision', 'SumMode', 'FullPrecision');
  //'rgbtoyiq_fixpt:10' y = fi(uint8( fi(0.2989, 0, 14, 15)*r + fi(0.5870, 0, 14, 14)*g + fi(0.1140, 0, 14, 17)*b ), 0, 8, 0, fm);
  //'rgbtoyiq_fixpt:11' i = fi(uint8( fi(0.596, 0, 14, 14, fm)*r - fi(0.274, 0, 14, 15, fm)*g - fi(0.322, 0, 14, 15, fm)*b ), 0, 8, 0, fm);
  //'rgbtoyiq_fixpt:12' q = fi(uint8( fi(0.211, 0, 14, 16, fm)*r - fi(0.523, 0, 14, 14, fm)*g + fi(0.312, 0, 14, 15, fm)*b ), 0, 8, 0, fm);
  assign rgbtoyiq_fixpt_mul_temp = 9794 * r;
  assign rgbtoyiq_fixpt_add_cast = rgbtoyiq_fixpt_mul_temp;
  assign rgbtoyiq_fixpt_mul_temp_1 = 9617 * g;
  assign rgbtoyiq_fixpt_add_cast_1 = {rgbtoyiq_fixpt_mul_temp_1, 1'b0};
  assign rgbtoyiq_fixpt_add_temp = rgbtoyiq_fixpt_add_cast + rgbtoyiq_fixpt_add_cast_1;
  assign rgbtoyiq_fixpt_add_cast_2 = {rgbtoyiq_fixpt_add_temp, 2'b00};
  assign rgbtoyiq_fixpt_mul_temp_2 = 14942 * b;
  assign rgbtoyiq_fixpt_add_cast_3 = rgbtoyiq_fixpt_mul_temp_2;
  assign rgbtoyiq_fixpt_add_temp_1 = rgbtoyiq_fixpt_add_cast_2 + rgbtoyiq_fixpt_add_cast_3;
  assign rgbtoyiq_fixpt_cast = ((rgbtoyiq_fixpt_add_temp_1[26:25] != 2'b00) || ((rgbtoyiq_fixpt_add_temp_1[26] == 1'b0) && (rgbtoyiq_fixpt_add_temp_1[24:17] == 8'b11111111)) ? 8'b11111111 :
              rgbtoyiq_fixpt_add_temp_1[24:17] + rgbtoyiq_fixpt_add_temp_1[16]);
  assign y = rgbtoyiq_fixpt_cast;
  assign rgbtoyiq_fixpt_mul_temp_3 = 9764 * r;
  assign rgbtoyiq_fixpt_sub_cast = {rgbtoyiq_fixpt_mul_temp_3, 1'b0};
  assign rgbtoyiq_fixpt_mul_temp_4 = 8978 * g;
  assign rgbtoyiq_fixpt_sub_cast_1 = rgbtoyiq_fixpt_mul_temp_4;
  assign rgbtoyiq_fixpt_sub_temp = rgbtoyiq_fixpt_sub_cast - rgbtoyiq_fixpt_sub_cast_1;
  assign rgbtoyiq_fixpt_sub_cast_2 = (rgbtoyiq_fixpt_sub_temp[24] == 1'b1 ? 24'b000000000000000000000000 :
              rgbtoyiq_fixpt_sub_temp[23:0]);
  assign rgbtoyiq_fixpt_sub_cast_3 = rgbtoyiq_fixpt_sub_cast_2;
  assign rgbtoyiq_fixpt_mul_temp_5 = 10551 * b;
  assign rgbtoyiq_fixpt_sub_cast_4 = rgbtoyiq_fixpt_mul_temp_5;
  assign rgbtoyiq_fixpt_sub_temp_1 = rgbtoyiq_fixpt_sub_cast_3 - rgbtoyiq_fixpt_sub_cast_4;
  assign rgbtoyiq_fixpt_cast_1 = (((rgbtoyiq_fixpt_sub_temp_1[25] == 1'b0) && (rgbtoyiq_fixpt_sub_temp_1[24:23] != 2'b00)) || ((rgbtoyiq_fixpt_sub_temp_1[25] == 1'b0) && (rgbtoyiq_fixpt_sub_temp_1[22:15] == 8'b11111111)) ? 8'b11111111 :
              (rgbtoyiq_fixpt_sub_temp_1[25] == 1'b1 ? 8'b00000000 :
              rgbtoyiq_fixpt_sub_temp_1[22:15] + (rgbtoyiq_fixpt_sub_temp_1[14] & (( ~ rgbtoyiq_fixpt_sub_temp_1[25]) | (|rgbtoyiq_fixpt_sub_temp_1[13:0])))));
  assign i = rgbtoyiq_fixpt_cast_1;
  assign rgbtoyiq_fixpt_mul_temp_6 = 13828 * r;
  assign rgbtoyiq_fixpt_sub_cast_5 = rgbtoyiq_fixpt_mul_temp_6;
  assign rgbtoyiq_fixpt_mul_temp_7 = 8568 * g;
  assign rgbtoyiq_fixpt_sub_cast_6 = {rgbtoyiq_fixpt_mul_temp_7, 2'b00};
  assign rgbtoyiq_fixpt_sub_temp_2 = rgbtoyiq_fixpt_sub_cast_5 - rgbtoyiq_fixpt_sub_cast_6;
  assign rgbtoyiq_fixpt_add_cast_4 = (rgbtoyiq_fixpt_sub_temp_2[25] == 1'b1 ? 25'b0000000000000000000000000 :
              rgbtoyiq_fixpt_sub_temp_2[24:0]);
  assign rgbtoyiq_fixpt_add_cast_5 = rgbtoyiq_fixpt_add_cast_4;
  assign rgbtoyiq_fixpt_mul_temp_8 = 10223 * b;
  assign rgbtoyiq_fixpt_add_cast_6 = {rgbtoyiq_fixpt_mul_temp_8, 1'b0};
  assign rgbtoyiq_fixpt_add_temp_2 = rgbtoyiq_fixpt_add_cast_5 + rgbtoyiq_fixpt_add_cast_6;
  assign rgbtoyiq_fixpt_cast_2 = ((rgbtoyiq_fixpt_add_temp_2[25:24] != 2'b00) || ((rgbtoyiq_fixpt_add_temp_2[25] == 1'b0) && (rgbtoyiq_fixpt_add_temp_2[23:16] == 8'b11111111)) ? 8'b11111111 :
              rgbtoyiq_fixpt_add_temp_2[23:16] + rgbtoyiq_fixpt_add_temp_2[15]);
  assign q = rgbtoyiq_fixpt_cast_2;



  assign ce_out = ce;

endmodule  // rgbtoyiq_fixpt
