// -------------------------------------------------------------
// 
// File Name: C:\Users\Sechw\Documents\MATLAB\4440\codegen\hsvtorgb\hdlsrc\hsvtorgb_fixpt.v
// Created: 2014-12-16 00:45:39
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
// r_u                           ce_out        1
// g_u                           ce_out        1
// b_u                           ce_out        1
// -- -------------------------------------------------------------
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: hsvtorgb_fixpt
// Source Path: hsvtorgb_fixpt
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module hsvtorgb_fixpt
          (
           clk,
           reset,
           ce,
           h,
           s,
           v,
           ce_out,
           r_u,
           g_u,
           b_u
          );


  input   clk;
  input   reset;
  input   ce;
  input   [7:0] h;  // ufix8
  input   [7:0] s;  // ufix8
  input   [7:0] v;  // ufix8
  output  ce_out;
  output  [7:0] r_u;  // ufix8
  output  [7:0] g_u;  // ufix8
  output  [7:0] b_u;  // ufix8


  wire enb;
  reg [7:0] r_u_1;  // ufix8
  reg [7:0] g_u_1;  // ufix8
  reg [7:0] b_u_1;  // ufix8
  reg [13:0] hsvtorgb_fixpt_s_d_1;  // ufix14_En5
  reg [13:0] hsvtorgb_fixpt_v_d_1;  // ufix14_En5
  reg [2:0] hsvtorgb_fixpt_i_1;  // ufix3
  reg [13:0] hsvtorgb_fixpt_p_1;  // ufix14_En13
  reg [13:0] hsvtorgb_fixpt_q_1;  // ufix14_En13
  reg [13:0] hsvtorgb_fixpt_t_1;  // ufix14_En13
  reg [13:0] hsvtorgb_fixpt_tmp_1;  // ufix14_En13
  reg [13:0] hsvtorgb_fixpt_tmp_0_1;  // ufix14_En13
  reg signed [31:0] hsvtorgb_fixpt_cast_15;  // int32
  reg [13:0] hsvtorgb_fixpt_cast_0_1;  // ufix14_En5
  reg [27:0] hsvtorgb_fixpt_mul_temp_11;  // ufix28_En26
  reg signed [31:0] hsvtorgb_fixpt_cast_1_1;  // int32
  reg [13:0] hsvtorgb_fixpt_cast_2_1;  // ufix14_En5
  reg [27:0] hsvtorgb_fixpt_mul_temp_0_1;  // ufix28_En26
  reg signed [31:0] hsvtorgb_fixpt_cast_3_1;  // int32
  reg [13:0] hsvtorgb_fixpt_cast_4_1;  // ufix14_En5
  reg [27:0] hsvtorgb_fixpt_mul_temp_1_1;  // ufix28_En26
  reg [13:0] hsvtorgb_fixpt_cast_5_1;  // ufix14_En5
  reg [16:0] hsvtorgb_fixpt_mul_temp_2_1;  // ufix17_En5
  reg [13:0] hsvtorgb_fixpt_cast_6_1;  // ufix14_En5
  reg [8:0] hsvtorgb_fixpt_cast_7_1;  // ufix9
  reg signed [15:0] hsvtorgb_fixpt_sub_cast_3;  // sfix16_En5
  reg signed [15:0] hsvtorgb_fixpt_sub_temp_3;  // sfix16_En5
  reg [14:0] hsvtorgb_fixpt_cast_8_1;  // ufix15_En5
  reg [28:0] hsvtorgb_fixpt_mul_temp_3_1;  // ufix29_En10
  reg [27:0] hsvtorgb_fixpt_mul_temp_4_1;  // ufix28_En18
  reg signed [29:0] hsvtorgb_fixpt_sub_cast_0_1;  // sfix30_En18
  reg signed [29:0] hsvtorgb_fixpt_sub_temp_0_1;  // sfix30_En18
  reg [28:0] hsvtorgb_fixpt_cast_9_1;  // ufix29_En18
  reg [42:0] hsvtorgb_fixpt_mul_temp_5_1;  // ufix43_En23
  reg signed [15:0] hsvtorgb_fixpt_sub_cast_1_1;  // sfix16_En13
  reg signed [15:0] hsvtorgb_fixpt_sub_temp_1_1;  // sfix16_En13
  reg [14:0] hsvtorgb_fixpt_cast_10_1;  // ufix15_En13
  reg [28:0] hsvtorgb_fixpt_mul_temp_6_1;  // ufix29_En18
  reg signed [30:0] hsvtorgb_fixpt_sub_cast_2_1;  // sfix31_En18
  reg signed [30:0] hsvtorgb_fixpt_sub_temp_2_1;  // sfix31_En18
  reg [29:0] hsvtorgb_fixpt_cast_11_1;  // ufix30_En18
  reg [43:0] hsvtorgb_fixpt_mul_temp_7_1;  // ufix44_En23
  reg [22:0] hsvtorgb_fixpt_mul_temp_8_1;  // ufix23_En13
  reg [7:0] hsvtorgb_fixpt_cast_12_1;  // uint8
  reg [22:0] hsvtorgb_fixpt_mul_temp_9_1;  // ufix23_En13
  reg [7:0] hsvtorgb_fixpt_cast_13_1;  // uint8
  reg [22:0] hsvtorgb_fixpt_mul_temp_10_1;  // ufix23_En13
  reg [7:0] hsvtorgb_fixpt_cast_14_1;  // uint8


  assign enb = ce;

  always @(h, s, v) begin
    //HDL code generation from MATLAB function: hsvtorgb_fixpt
    //'hsvtorgb_fixpt:46' b = fi(q, 0, 14, 13, fm);
    //'hsvtorgb_fixpt:45' g = fi(p, 0, 14, 13, fm);
    //'hsvtorgb_fixpt:44' r = fi(v_d, 0, 14, 13, fm);
    //'hsvtorgb_fixpt:43' case 5
    //'hsvtorgb_fixpt:42' b = fi(v_d, 0, 14, 13, fm);
    //'hsvtorgb_fixpt:41' g = fi(p, 0, 14, 13, fm);
    //'hsvtorgb_fixpt:40' r = fi(t, 0, 14, 13, fm);
    //'hsvtorgb_fixpt:39' case 4
    //'hsvtorgb_fixpt:38' b = fi(v_d, 0, 14, 13, fm);
    //'hsvtorgb_fixpt:37' g = fi(q, 0, 14, 13, fm);
    //'hsvtorgb_fixpt:36' r = fi(p, 0, 14, 13, fm);
    //'hsvtorgb_fixpt:35' case 3
    //'hsvtorgb_fixpt:34' b = fi(t, 0, 14, 13, fm);
    //'hsvtorgb_fixpt:33' g = fi(v_d, 0, 14, 13, fm);
    //'hsvtorgb_fixpt:32' r = fi(p, 0, 14, 13, fm);
    //'hsvtorgb_fixpt:31' case 2
    //'hsvtorgb_fixpt:30' b = fi(p, 0, 14, 13, fm);
    //'hsvtorgb_fixpt:29' g = fi(v_d, 0, 14, 13, fm);
    //'hsvtorgb_fixpt:28' r = fi(q, 0, 14, 13, fm);
    //'hsvtorgb_fixpt:27' case 1
    //'hsvtorgb_fixpt:26' b = fi(p, 0, 14, 13, fm);
    //'hsvtorgb_fixpt:25' g = fi(t, 0, 14, 13, fm);
    //'hsvtorgb_fixpt:24' r = fi(v_d, 0, 14, 13, fm);
    //'hsvtorgb_fixpt:23' case 0
    //'hsvtorgb_fixpt:50' b = fi(p, 0, 14, 13, fm);
    //'hsvtorgb_fixpt:49' g = fi(t, 0, 14, 13, fm);
    //'hsvtorgb_fixpt:48' r = fi(v_d, 0, 14, 13, fm);
    //'hsvtorgb_fixpt:47' otherwise
    //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    //                                                                          %
    //       Generated by MATLAB 8.2, MATLAB Coder 2.5 and HDL Coder 3.3        %
    //                                                                          %
    //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    //'hsvtorgb_fixpt:9' fm = fimath('RoundingMethod', 'Floor', 'OverflowAction', 'Saturate', 'ProductMode', 'FullPrecision', 'SumMode', 'FullPrecision');
    //'hsvtorgb_fixpt:10' h_d = fi(double( h ), 0, 14, 5, fm);
    //'hsvtorgb_fixpt:11' s_d = fi(double( s ), 0, 14, 5, fm);
    //'hsvtorgb_fixpt:12' v_d = fi(double( v ), 0, 14, 5, fm);
    //'hsvtorgb_fixpt:13' h_d = fi(h_d*fi(1/255, 0, 14, 21, fm), 0, 14, 5, fm);
    //'hsvtorgb_fixpt:14' s_d = fi(s_d*fi(1/255, 0, 14, 21, fm), 0, 14, 5, fm);
    hsvtorgb_fixpt_cast_15 = s;
    if ((hsvtorgb_fixpt_cast_15[31] == 1'b0) && (hsvtorgb_fixpt_cast_15[30:9] != 22'b0000000000000000000000)) begin
      hsvtorgb_fixpt_cast_0_1 = 14'b11111111111111;
    end
    else if (hsvtorgb_fixpt_cast_15[31] == 1'b1) begin
      hsvtorgb_fixpt_cast_0_1 = 14'b00000000000000;
    end
    else begin
      hsvtorgb_fixpt_cast_0_1 = {hsvtorgb_fixpt_cast_15[8:0], 5'b00000};
    end
    hsvtorgb_fixpt_mul_temp_11 = hsvtorgb_fixpt_cast_0_1 * 8224;
    hsvtorgb_fixpt_s_d_1 = hsvtorgb_fixpt_mul_temp_11[27:21];
    //'hsvtorgb_fixpt:15' v_d = fi(v_d*fi(1/255, 0, 14, 21, fm), 0, 14, 5, fm);
    hsvtorgb_fixpt_cast_1_1 = v;
    if ((hsvtorgb_fixpt_cast_1_1[31] == 1'b0) && (hsvtorgb_fixpt_cast_1_1[30:9] != 22'b0000000000000000000000)) begin
      hsvtorgb_fixpt_cast_2_1 = 14'b11111111111111;
    end
    else if (hsvtorgb_fixpt_cast_1_1[31] == 1'b1) begin
      hsvtorgb_fixpt_cast_2_1 = 14'b00000000000000;
    end
    else begin
      hsvtorgb_fixpt_cast_2_1 = {hsvtorgb_fixpt_cast_1_1[8:0], 5'b00000};
    end
    hsvtorgb_fixpt_mul_temp_0_1 = hsvtorgb_fixpt_cast_2_1 * 8224;
    hsvtorgb_fixpt_v_d_1 = hsvtorgb_fixpt_mul_temp_0_1[27:21];
    //'hsvtorgb_fixpt:16' h_d = fi(h_d*fi(6, 0, 3, 0, fm), 0, 14, 5, fm);
    //'hsvtorgb_fixpt:17' i = fi(floor( h_d ), 0, 3, 0, fm);
    hsvtorgb_fixpt_cast_3_1 = h;
    if ((hsvtorgb_fixpt_cast_3_1[31] == 1'b0) && (hsvtorgb_fixpt_cast_3_1[30:9] != 22'b0000000000000000000000)) begin
      hsvtorgb_fixpt_cast_4_1 = 14'b11111111111111;
    end
    else if (hsvtorgb_fixpt_cast_3_1[31] == 1'b1) begin
      hsvtorgb_fixpt_cast_4_1 = 14'b00000000000000;
    end
    else begin
      hsvtorgb_fixpt_cast_4_1 = {hsvtorgb_fixpt_cast_3_1[8:0], 5'b00000};
    end
    hsvtorgb_fixpt_mul_temp_1_1 = hsvtorgb_fixpt_cast_4_1 * 8224;
    hsvtorgb_fixpt_cast_5_1 = hsvtorgb_fixpt_mul_temp_1_1[27:21];
    hsvtorgb_fixpt_mul_temp_2_1 = hsvtorgb_fixpt_cast_5_1 * 6;
    if (hsvtorgb_fixpt_mul_temp_2_1[16:14] != 3'b000) begin
      hsvtorgb_fixpt_cast_6_1 = 14'b11111111111111;
    end
    else begin
      hsvtorgb_fixpt_cast_6_1 = hsvtorgb_fixpt_mul_temp_2_1[13:0];
    end
    if (hsvtorgb_fixpt_cast_6_1[13:5] == 9'b111111111) begin
      hsvtorgb_fixpt_cast_7_1 = 9'b111111111;
    end
    else begin
      hsvtorgb_fixpt_cast_7_1 = hsvtorgb_fixpt_cast_6_1[13:5];
    end
    if (hsvtorgb_fixpt_cast_7_1[8:3] != 6'b000000) begin
      hsvtorgb_fixpt_i_1 = 3'b111;
    end
    else begin
      hsvtorgb_fixpt_i_1 = hsvtorgb_fixpt_cast_7_1[2:0];
    end
    //'hsvtorgb_fixpt:18' f = fi(h_d - i, 0, 14, 13, fm);
    //'hsvtorgb_fixpt:19' p = fi(v_d*(fi(1, 0, 1, 0, fm) - s_d), 0, 14, 13, fm);
    hsvtorgb_fixpt_sub_cast_3 = hsvtorgb_fixpt_s_d_1;
    hsvtorgb_fixpt_sub_temp_3 = 32 - hsvtorgb_fixpt_sub_cast_3;
    if (hsvtorgb_fixpt_sub_temp_3[15] == 1'b1) begin
      hsvtorgb_fixpt_cast_8_1 = 15'b000000000000000;
    end
    else begin
      hsvtorgb_fixpt_cast_8_1 = hsvtorgb_fixpt_sub_temp_3[14:0];
    end
    hsvtorgb_fixpt_mul_temp_3_1 = hsvtorgb_fixpt_v_d_1 * hsvtorgb_fixpt_cast_8_1;
    if (hsvtorgb_fixpt_mul_temp_3_1[28:11] != 18'b000000000000000000) begin
      hsvtorgb_fixpt_p_1 = 14'b11111111111111;
    end
    else begin
      hsvtorgb_fixpt_p_1 = {hsvtorgb_fixpt_mul_temp_3_1[10:0], 3'b000};
    end
    //'hsvtorgb_fixpt:20' q = fi(v_d*(fi(1, 0, 1, 0, fm) - s_d*p), 0, 14, 13, fm);
    hsvtorgb_fixpt_mul_temp_4_1 = hsvtorgb_fixpt_s_d_1 * hsvtorgb_fixpt_p_1;
    hsvtorgb_fixpt_sub_cast_0_1 = hsvtorgb_fixpt_mul_temp_4_1;
    hsvtorgb_fixpt_sub_temp_0_1 = 262144 - hsvtorgb_fixpt_sub_cast_0_1;
    if (hsvtorgb_fixpt_sub_temp_0_1[29] == 1'b1) begin
      hsvtorgb_fixpt_cast_9_1 = 29'b00000000000000000000000000000;
    end
    else begin
      hsvtorgb_fixpt_cast_9_1 = hsvtorgb_fixpt_sub_temp_0_1[28:0];
    end
    hsvtorgb_fixpt_mul_temp_5_1 = hsvtorgb_fixpt_v_d_1 * hsvtorgb_fixpt_cast_9_1;
    if (hsvtorgb_fixpt_mul_temp_5_1[42:24] != 19'b0000000000000000000) begin
      hsvtorgb_fixpt_q_1 = 14'b11111111111111;
    end
    else begin
      hsvtorgb_fixpt_q_1 = hsvtorgb_fixpt_mul_temp_5_1[23:10];
    end
    //'hsvtorgb_fixpt:21' t = fi(v_d*(fi(1, 0, 1, 0, fm) - (s_d*(fi(1, 0, 1, 0, fm) - p))), 0, 14, 13, fm);
    hsvtorgb_fixpt_sub_cast_1_1 = hsvtorgb_fixpt_p_1;
    hsvtorgb_fixpt_sub_temp_1_1 = 8192 - hsvtorgb_fixpt_sub_cast_1_1;
    if (hsvtorgb_fixpt_sub_temp_1_1[15] == 1'b1) begin
      hsvtorgb_fixpt_cast_10_1 = 15'b000000000000000;
    end
    else begin
      hsvtorgb_fixpt_cast_10_1 = hsvtorgb_fixpt_sub_temp_1_1[14:0];
    end
    hsvtorgb_fixpt_mul_temp_6_1 = hsvtorgb_fixpt_s_d_1 * hsvtorgb_fixpt_cast_10_1;
    hsvtorgb_fixpt_sub_cast_2_1 = hsvtorgb_fixpt_mul_temp_6_1;
    hsvtorgb_fixpt_sub_temp_2_1 = 262144 - hsvtorgb_fixpt_sub_cast_2_1;
    if (hsvtorgb_fixpt_sub_temp_2_1[30] == 1'b1) begin
      hsvtorgb_fixpt_cast_11_1 = 30'b000000000000000000000000000000;
    end
    else begin
      hsvtorgb_fixpt_cast_11_1 = hsvtorgb_fixpt_sub_temp_2_1[29:0];
    end
    hsvtorgb_fixpt_mul_temp_7_1 = hsvtorgb_fixpt_v_d_1 * hsvtorgb_fixpt_cast_11_1;
    if (hsvtorgb_fixpt_mul_temp_7_1[43:24] != 20'b00000000000000000000) begin
      hsvtorgb_fixpt_t_1 = 14'b11111111111111;
    end
    else begin
      hsvtorgb_fixpt_t_1 = hsvtorgb_fixpt_mul_temp_7_1[23:10];
    end
    //'hsvtorgb_fixpt:22' switch i

    case ( hsvtorgb_fixpt_i_1)
      32'sd0 :
        begin
          hsvtorgb_fixpt_tmp_0_1 = hsvtorgb_fixpt_p_1;
        end
      32'sd1 :
        begin
          hsvtorgb_fixpt_tmp_0_1 = hsvtorgb_fixpt_p_1;
        end
      32'sd2 :
        begin
          hsvtorgb_fixpt_tmp_0_1 = hsvtorgb_fixpt_t_1;
        end
      32'sd3 :
        begin
          if (hsvtorgb_fixpt_v_d_1[13:6] != 8'b00000000) begin
            hsvtorgb_fixpt_tmp_0_1 = 14'b11111111111111;
          end
          else begin
            hsvtorgb_fixpt_tmp_0_1 = {hsvtorgb_fixpt_v_d_1[5:0], 8'b00000000};
          end
        end
      32'sd4 :
        begin
          if (hsvtorgb_fixpt_v_d_1[13:6] != 8'b00000000) begin
            hsvtorgb_fixpt_tmp_0_1 = 14'b11111111111111;
          end
          else begin
            hsvtorgb_fixpt_tmp_0_1 = {hsvtorgb_fixpt_v_d_1[5:0], 8'b00000000};
          end
        end
      32'sd5 :
        begin
          hsvtorgb_fixpt_tmp_0_1 = hsvtorgb_fixpt_q_1;
        end
      default :
        begin
          hsvtorgb_fixpt_tmp_0_1 = hsvtorgb_fixpt_p_1;
        end
    endcase


    case ( hsvtorgb_fixpt_i_1)
      32'sd0 :
        begin
          hsvtorgb_fixpt_tmp_1 = hsvtorgb_fixpt_t_1;
        end
      32'sd1 :
        begin
          if (hsvtorgb_fixpt_v_d_1[13:6] != 8'b00000000) begin
            hsvtorgb_fixpt_tmp_1 = 14'b11111111111111;
          end
          else begin
            hsvtorgb_fixpt_tmp_1 = {hsvtorgb_fixpt_v_d_1[5:0], 8'b00000000};
          end
        end
      32'sd2 :
        begin
          if (hsvtorgb_fixpt_v_d_1[13:6] != 8'b00000000) begin
            hsvtorgb_fixpt_tmp_1 = 14'b11111111111111;
          end
          else begin
            hsvtorgb_fixpt_tmp_1 = {hsvtorgb_fixpt_v_d_1[5:0], 8'b00000000};
          end
        end
      32'sd3 :
        begin
          hsvtorgb_fixpt_tmp_1 = hsvtorgb_fixpt_q_1;
        end
      32'sd4 :
        begin
          hsvtorgb_fixpt_tmp_1 = hsvtorgb_fixpt_p_1;
        end
      32'sd5 :
        begin
          hsvtorgb_fixpt_tmp_1 = hsvtorgb_fixpt_p_1;
        end
      default :
        begin
          hsvtorgb_fixpt_tmp_1 = hsvtorgb_fixpt_t_1;
        end
    endcase


    case ( hsvtorgb_fixpt_i_1)
      32'sd0 :
        begin
          if (hsvtorgb_fixpt_v_d_1[13:6] != 8'b00000000) begin
            hsvtorgb_fixpt_q_1 = 14'b11111111111111;
          end
          else begin
            hsvtorgb_fixpt_q_1 = {hsvtorgb_fixpt_v_d_1[5:0], 8'b00000000};
          end
        end
      32'sd1 :
        begin
        end
      32'sd2 :
        begin
          hsvtorgb_fixpt_q_1 = hsvtorgb_fixpt_p_1;
        end
      32'sd3 :
        begin
          hsvtorgb_fixpt_q_1 = hsvtorgb_fixpt_p_1;
        end
      32'sd4 :
        begin
          hsvtorgb_fixpt_q_1 = hsvtorgb_fixpt_t_1;
        end
      32'sd5 :
        begin
          if (hsvtorgb_fixpt_v_d_1[13:6] != 8'b00000000) begin
            hsvtorgb_fixpt_q_1 = 14'b11111111111111;
          end
          else begin
            hsvtorgb_fixpt_q_1 = {hsvtorgb_fixpt_v_d_1[5:0], 8'b00000000};
          end
        end
      default :
        begin
          if (hsvtorgb_fixpt_v_d_1[13:6] != 8'b00000000) begin
            hsvtorgb_fixpt_q_1 = 14'b11111111111111;
          end
          else begin
            hsvtorgb_fixpt_q_1 = {hsvtorgb_fixpt_v_d_1[5:0], 8'b00000000};
          end
        end
    endcase

    //'hsvtorgb_fixpt:52' r_u = fi(uint8( r*fi(255, 0, 9, 0, fm) ), 0, 8, 0, fm);
    //'hsvtorgb_fixpt:53' g_u = fi(uint8( g*fi(255, 0, 9, 0, fm) ), 0, 8, 0, fm);
    //'hsvtorgb_fixpt:54' b_u = fi(uint8( b*fi(255, 0, 9, 0, fm) ), 0, 8, 0, fm);
    hsvtorgb_fixpt_mul_temp_8_1 = hsvtorgb_fixpt_q_1 * 255;
    if ((hsvtorgb_fixpt_mul_temp_8_1[22:21] != 2'b00) || ((hsvtorgb_fixpt_mul_temp_8_1[22] == 1'b0) && (hsvtorgb_fixpt_mul_temp_8_1[20:13] == 8'b11111111))) begin
      hsvtorgb_fixpt_cast_12_1 = 8'b11111111;
    end
    else begin
      hsvtorgb_fixpt_cast_12_1 = hsvtorgb_fixpt_mul_temp_8_1[20:13] + hsvtorgb_fixpt_mul_temp_8_1[12];
    end
    r_u_1 = hsvtorgb_fixpt_cast_12_1;
    hsvtorgb_fixpt_mul_temp_9_1 = hsvtorgb_fixpt_tmp_1 * 255;
    if ((hsvtorgb_fixpt_mul_temp_9_1[22:21] != 2'b00) || ((hsvtorgb_fixpt_mul_temp_9_1[22] == 1'b0) && (hsvtorgb_fixpt_mul_temp_9_1[20:13] == 8'b11111111))) begin
      hsvtorgb_fixpt_cast_13_1 = 8'b11111111;
    end
    else begin
      hsvtorgb_fixpt_cast_13_1 = hsvtorgb_fixpt_mul_temp_9_1[20:13] + hsvtorgb_fixpt_mul_temp_9_1[12];
    end
    g_u_1 = hsvtorgb_fixpt_cast_13_1;
    hsvtorgb_fixpt_mul_temp_10_1 = hsvtorgb_fixpt_tmp_0_1 * 255;
    if ((hsvtorgb_fixpt_mul_temp_10_1[22:21] != 2'b00) || ((hsvtorgb_fixpt_mul_temp_10_1[22] == 1'b0) && (hsvtorgb_fixpt_mul_temp_10_1[20:13] == 8'b11111111))) begin
      hsvtorgb_fixpt_cast_14_1 = 8'b11111111;
    end
    else begin
      hsvtorgb_fixpt_cast_14_1 = hsvtorgb_fixpt_mul_temp_10_1[20:13] + hsvtorgb_fixpt_mul_temp_10_1[12];
    end
    b_u_1 = hsvtorgb_fixpt_cast_14_1;
  end



  assign ce_out = ce;

  assign r_u = r_u_1;

  assign g_u = g_u_1;

  assign b_u = b_u_1;

endmodule  // hsvtorgb_fixpt
