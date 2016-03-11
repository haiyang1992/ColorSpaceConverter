// Generated from Simulink block "Color_Space"

(* core_generation_info = "Color_Space,sysgen_core,{black_box_isim_used=1,clock_period=10.00000000,clocking=Clock_Enables,compilation=HDL_Netlist,sample_periods=1.00000000000,testbench=0,total_blocks=122,xilinx_black_box_block=6,xilinx_bus_multiplexer_block=6,xilinx_constant_block_block=6,xilinx_gateway_in_block=4,xilinx_gateway_out_block=6,xilinx_system_generator_block=1,}" *)
module color_space (
  ce_1,
  clk_1,
  gateway_in,
  gateway_in1,
  gateway_in2,
  gateway_in3,
  gateway_out,
  gateway_out1,
  gateway_out2,
  gateway_out3,
  gateway_out4,
  gateway_out5
);

  input [0:0] ce_1;
  input [0:0] clk_1;
  input [7:0] gateway_in;
  input [7:0] gateway_in1;
  input [7:0] gateway_in2;
  input [1:0] gateway_in3;
  output [7:0] gateway_out;
  output [7:0] gateway_out1;
  output [7:0] gateway_out2;
  output [7:0] gateway_out3;
  output [7:0] gateway_out4;
  output [7:0] gateway_out5;

  wire [0:0] ce_1_sg_x0;
  wire [0:0] clk_1_sg_x0;
  wire [0:0] constant1_op_net;
  wire [0:0] constant2_op_net;
  wire [0:0] constant3_op_net;
  wire [0:0] constant4_op_net;
  wire [0:0] constant9_op_net;
  wire [0:0] constant_op_net;
  wire [7:0] gateway_in1_net;
  wire [7:0] gateway_in2_net;
  wire [1:0] gateway_in3_net;
  wire [7:0] gateway_in_net;
  wire [7:0] gateway_out1_net;
  wire [7:0] gateway_out2_net;
  wire [7:0] gateway_out3_net;
  wire [7:0] gateway_out4_net;
  wire [7:0] gateway_out5_net;
  wire [7:0] gateway_out_net;
  wire [7:0] hsv_to_rgb_b_u_net;
  wire  hsv_to_rgb_ce_out_net;
  wire [7:0] hsv_to_rgb_g_u_net;
  wire [7:0] hsv_to_rgb_r_u_net;
  wire  rgb_to_hsv_ce_out_net;
  wire [7:0] rgb_to_hsv_h_net;
  wire [7:0] rgb_to_hsv_s_net;
  wire [7:0] rgb_to_hsv_v_net;
  wire  rgb_to_xyz_ce_out_net;
  wire [7:0] rgb_to_xyz_x_net;
  wire [7:0] rgb_to_xyz_y_net;
  wire [7:0] rgb_to_xyz_z_net;
  wire  rgb_to_yiq_ce_out_net;
  wire [7:0] rgb_to_yiq_i_net;
  wire [7:0] rgb_to_yiq_q_net;
  wire [7:0] rgb_to_yiq_y_net;
  wire [7:0] xyz_to_rgb_b_net;
  wire  xyz_to_rgb_ce_out_net;
  wire [7:0] xyz_to_rgb_g_net;
  wire [7:0] xyz_to_rgb_r_net;
  wire [7:0] yiq_to_rgb_b_net;
  wire  yiq_to_rgb_ce_out_net;
  wire [7:0] yiq_to_rgb_g_net;
  wire [7:0] yiq_to_rgb_r_net;

  assign ce_1_sg_x0 = ce_1;
  assign clk_1_sg_x0 = clk_1;
  assign gateway_in_net = gateway_in;
  assign gateway_in1_net = gateway_in1;
  assign gateway_in2_net = gateway_in2;
  assign gateway_in3_net = gateway_in3;
  assign gateway_out = gateway_out_net;
  assign gateway_out1 = gateway_out1_net;
  assign gateway_out2 = gateway_out2_net;
  assign gateway_out3 = gateway_out3_net;
  assign gateway_out4 = gateway_out4_net;
  assign gateway_out5 = gateway_out5_net;


  constant_ae323e07fc  constant1 (
    .ce(1'b0),
    .clk(1'b0),
    .clr(1'b0),
    .op(constant1_op_net)
  );

  constant_ae323e07fc  constant2 (
    .ce(1'b0),
    .clk(1'b0),
    .clr(1'b0),
    .op(constant2_op_net)
  );

  constant_ae323e07fc  constant3 (
    .ce(1'b0),
    .clk(1'b0),
    .clr(1'b0),
    .op(constant3_op_net)
  );

  constant_ae323e07fc  constant4 (
    .ce(1'b0),
    .clk(1'b0),
    .clr(1'b0),
    .op(constant4_op_net)
  );

  constant_ae323e07fc  constant9 (
    .ce(1'b0),
    .clk(1'b0),
    .clr(1'b0),
    .op(constant9_op_net)
  );

  constant_ae323e07fc  constant_x0 (
    .ce(1'b0),
    .clk(1'b0),
    .clr(1'b0),
    .op(constant_op_net)
  );

  hsvtorgb_fixpt  hsv_to_rgb (
    .ce(ce_1_sg_x0),
    .clk(clk_1_sg_x0),
    .h(rgb_to_hsv_h_net),
    .reset(constant4_op_net),
    .s(rgb_to_hsv_s_net),
    .v(rgb_to_hsv_v_net),
    .b_u(hsv_to_rgb_b_u_net),
    .ce_out(hsv_to_rgb_ce_out_net),
    .g_u(hsv_to_rgb_g_u_net),
    .r_u(hsv_to_rgb_r_u_net)
  );

  mux_1495816f5f  mux (
    .ce(1'b0),
    .clk(1'b0),
    .clr(1'b0),
    .d0(rgb_to_hsv_h_net),
    .d1(rgb_to_yiq_y_net),
    .d2(rgb_to_xyz_x_net),
    .sel(gateway_in3_net),
    .y(gateway_out_net)
  );

  mux_1495816f5f  mux1 (
    .ce(1'b0),
    .clk(1'b0),
    .clr(1'b0),
    .d0(rgb_to_hsv_s_net),
    .d1(rgb_to_yiq_i_net),
    .d2(rgb_to_xyz_y_net),
    .sel(gateway_in3_net),
    .y(gateway_out1_net)
  );

  mux_1495816f5f  mux2 (
    .ce(1'b0),
    .clk(1'b0),
    .clr(1'b0),
    .d0(rgb_to_hsv_v_net),
    .d1(rgb_to_yiq_q_net),
    .d2(rgb_to_xyz_z_net),
    .sel(gateway_in3_net),
    .y(gateway_out2_net)
  );

  mux_1495816f5f  mux3 (
    .ce(1'b0),
    .clk(1'b0),
    .clr(1'b0),
    .d0(hsv_to_rgb_r_u_net),
    .d1(yiq_to_rgb_r_net),
    .d2(xyz_to_rgb_r_net),
    .sel(gateway_in3_net),
    .y(gateway_out3_net)
  );

  mux_1495816f5f  mux4 (
    .ce(1'b0),
    .clk(1'b0),
    .clr(1'b0),
    .d0(hsv_to_rgb_g_u_net),
    .d1(yiq_to_rgb_g_net),
    .d2(xyz_to_rgb_g_net),
    .sel(gateway_in3_net),
    .y(gateway_out4_net)
  );

  mux_1495816f5f  mux5 (
    .ce(1'b0),
    .clk(1'b0),
    .clr(1'b0),
    .d0(hsv_to_rgb_b_u_net),
    .d1(yiq_to_rgb_b_net),
    .d2(xyz_to_rgb_b_net),
    .sel(gateway_in3_net),
    .y(gateway_out5_net)
  );

  rgbtohsv_fixpt  rgb_to_hsv (
    .b(gateway_in2_net),
    .ce(ce_1_sg_x0),
    .clk(clk_1_sg_x0),
    .g(gateway_in1_net),
    .r(gateway_in_net),
    .reset(constant3_op_net),
    .ce_out(rgb_to_hsv_ce_out_net),
    .h(rgb_to_hsv_h_net),
    .s(rgb_to_hsv_s_net),
    .v(rgb_to_hsv_v_net)
  );

  rgbtoxyz_fixpt  rgb_to_xyz (
    .b(gateway_in2_net),
    .ce(ce_1_sg_x0),
    .clk(clk_1_sg_x0),
    .g(gateway_in1_net),
    .r(gateway_in_net),
    .reset(constant2_op_net),
    .ce_out(rgb_to_xyz_ce_out_net),
    .x(rgb_to_xyz_x_net),
    .y(rgb_to_xyz_y_net),
    .z(rgb_to_xyz_z_net)
  );

  rgbtoyiq_fixpt  rgb_to_yiq (
    .b(gateway_in2_net),
    .ce(ce_1_sg_x0),
    .clk(clk_1_sg_x0),
    .g(gateway_in1_net),
    .r(gateway_in_net),
    .reset(constant_op_net),
    .ce_out(rgb_to_yiq_ce_out_net),
    .i(rgb_to_yiq_i_net),
    .q(rgb_to_yiq_q_net),
    .y(rgb_to_yiq_y_net)
  );

  xyztorgb_fixpt  xyz_to_rgb (
    .ce(ce_1_sg_x0),
    .clk(clk_1_sg_x0),
    .reset(constant9_op_net),
    .x(rgb_to_xyz_x_net),
    .y(rgb_to_xyz_y_net),
    .z(rgb_to_xyz_z_net),
    .b(xyz_to_rgb_b_net),
    .ce_out(xyz_to_rgb_ce_out_net),
    .g(xyz_to_rgb_g_net),
    .r(xyz_to_rgb_r_net)
  );

  yiqtorgb_fixpt  yiq_to_rgb (
    .ce(ce_1_sg_x0),
    .clk(clk_1_sg_x0),
    .i(rgb_to_yiq_i_net),
    .q(rgb_to_yiq_q_net),
    .reset(constant1_op_net),
    .y(rgb_to_yiq_y_net),
    .b(yiq_to_rgb_b_net),
    .ce_out(yiq_to_rgb_ce_out_net),
    .g(yiq_to_rgb_g_net),
    .r(yiq_to_rgb_r_net)
  );
endmodule
