`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: 
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module color_space_cw_stub
(
  ce,
  clk,// clock period = 10.0 ns (100.0 Mhz)
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

  input  ce;
  input  clk;// clock period = 10.0 ns (100.0 Mhz)
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

color_space_cw color_space_cw_i (
  .ce(ce),
  .clk(clk),
  .gateway_in(gateway_in),
  .gateway_in1(gateway_in1),
  .gateway_in2(gateway_in2),
  .gateway_in3(gateway_in3),
  .gateway_out(gateway_out),
  .gateway_out1(gateway_out1),
  .gateway_out2(gateway_out2),
  .gateway_out3(gateway_out3),
  .gateway_out4(gateway_out4),
  .gateway_out5(gateway_out5));

endmodule 
