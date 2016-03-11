
//-----------------------------------------------------------------
// System Generator version 14.6 VERILOG source file.
//
// Copyright(C) 2013 by Xilinx, Inc.  All rights reserved.  This
// text/file contains proprietary, confidential information of Xilinx,
// Inc., is distributed under license from Xilinx, Inc., and may be used,
// copied and/or disclosed only pursuant to the terms of a valid license
// agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
// this text/file solely for design, simulation, implementation and
// creation of design files limited to Xilinx devices or technologies.
// Use with non-Xilinx devices or technologies is expressly prohibited
// and immediately terminates your license unless covered by a separate
// agreement.
//
// Xilinx is providing this design, code, or information "as is" solely
// for use in developing programs and solutions for Xilinx devices.  By
// providing this design, code, or information as one possible
// implementation of this feature, application or standard, Xilinx is
// making no representation that this implementation is free from any
// claims of infringement.  You are responsible for obtaining any rights
// you may require for your implementation.  Xilinx expressly disclaims
// any warranty whatsoever with respect to the adequacy of the
// implementation, including but not limited to warranties of
// merchantability or fitness for a particular purpose.
//
// Xilinx products are not intended for use in life support appliances,
// devices, or systems.  Use in such applications is expressly prohibited.
//
// Any modifications that are made to the source code are done at the user's
// sole risk and will be unsupported.
//
// This copyright and support notice must be retained as part of this
// text at all times.  (c) Copyright 1995-2013 Xilinx, Inc.  All rights
// reserved.
//-----------------------------------------------------------------
// synopsys translate_off
`ifndef simulating
  `define simulating 1
`endif
// synopsys translate_on
`ifndef simulating
  `define simulating 0
`endif
`ifndef xlUnsigned
 `define xlUnsigned 1
`endif
`ifndef xlSigned
 `define xlSigned 2
`endif
`ifndef xlFloat
 `define xlFloat 3
`endif
`ifndef xlWrap
 `define xlWrap 1
`endif
`ifndef xlSaturate
 `define xlSaturate 2
`endif
`ifndef xlTruncate
 `define xlTruncate 1
`endif
`ifndef xlRound
 `define xlRound 2
`endif
`ifndef xlRoundBanker
 `define xlRoundBanker 3
`endif
`ifndef xlAddMode
 `define xlAddMode 1
`endif
`ifndef xlSubMode
 `define xlSubMode 2
`endif
`ifndef xlConvPkgIncluded
 `define xlConvPkgIncluded 1
`endif

//-----------------------------------------------------------------
// System Generator version 14.6 VERILOG source file.
//
// Copyright(C) 2013 by Xilinx, Inc.  All rights reserved.  This
// text/file contains proprietary, confidential information of Xilinx,
// Inc., is distributed under license from Xilinx, Inc., and may be used,
// copied and/or disclosed only pursuant to the terms of a valid license
// agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
// this text/file solely for design, simulation, implementation and
// creation of design files limited to Xilinx devices or technologies.
// Use with non-Xilinx devices or technologies is expressly prohibited
// and immediately terminates your license unless covered by a separate
// agreement.
//
// Xilinx is providing this design, code, or information "as is" solely
// for use in developing programs and solutions for Xilinx devices.  By
// providing this design, code, or information as one possible
// implementation of this feature, application or standard, Xilinx is
// making no representation that this implementation is free from any
// claims of infringement.  You are responsible for obtaining any rights
// you may require for your implementation.  Xilinx expressly disclaims
// any warranty whatsoever with respect to the adequacy of the
// implementation, including but not limited to warranties of
// merchantability or fitness for a particular purpose.
//
// Xilinx products are not intended for use in life support appliances,
// devices, or systems.  Use in such applications is expressly prohibited.
//
// Any modifications that are made to the source code are done at the user's
// sole risk and will be unsupported.
//
// This copyright and support notice must be retained as part of this
// text at all times.  (c) Copyright 1995-2013 Xilinx, Inc.  All rights
// reserved.
//-----------------------------------------------------------------
`timescale 1 ns / 10 ps
module srl17e (clk, ce, d, q);
    parameter width = 16;
    parameter latency = 8;
    input clk, ce;
    input [width-1:0] d;
    output [width-1:0] q;
    parameter signed [5:0] a = latency - 2;
    wire[width - 1:0] #0.2 d_delayed;
    wire[width - 1:0] srl16_out;
    genvar i;
    assign d_delayed = d ;
    generate
      for(i=0; i<width; i=i+1)
      begin:reg_array
            if (latency > 1)
                begin: has_2_latency
                 SRL16E u1 (.CLK(clk), .D(d_delayed[i]), .Q(srl16_out[i]), .CE(ce), .A0(a[0]), .A1(a[1]), .A2(a[2]), .A3(a[3]));
                end
            if (latency <= 1)
                begin: has_1_latency
                 assign srl16_out[i] = d_delayed[i];
                end
            if (latency != 0)
                begin: has_latency
                 FDE u2 (.C(clk), .D(srl16_out[i]), .Q(q[i]), .CE(ce));
                end
            if (latency == 0)
                begin:has_0_latency
                 assign q[i] = srl16_out[i];
                end
        end
    endgenerate
endmodule
module synth_reg (i, ce, clr, clk, o);
   parameter width  = 8;
   parameter latency  = 1;
   input[width - 1:0] i;
   input ce,clr,clk;
   output[width - 1:0] o;
   parameter complete_num_srl17es = latency/17;
   parameter remaining_latency = latency%17;
   parameter temp_num_srl17es = (latency/17) + ((latency%17)?1:0);
   parameter num_srl17es = temp_num_srl17es ? temp_num_srl17es : 1;
   wire [width - 1:0] z [0:num_srl17es-1];
   genvar t;
    generate
      if (latency <= 17)
          begin:has_only_1
              srl17e #(width, latency) srl17e_array0(.clk(clk), .ce(ce), .d(i), .q(o));
          end
     endgenerate
    generate
     if (latency > 17)
        begin:has_1
             assign o = z[num_srl17es-1];
             srl17e #(width, 17) srl17e_array0(.clk(clk), .ce(ce), .d(i), .q(z[0]));
        end
   endgenerate
   generate
      if (latency > 17)
          begin:more_than_1
              for (t=1; t < complete_num_srl17es; t=t+1)
                begin:left_complete_ones
                   srl17e #(width, 17) srl17e_array(.clk(clk), .ce(ce), .d(z[t-1]), .q(z[t]));
                end
          end
   endgenerate
   generate
     if ((remaining_latency > 0) && (latency>17))
          begin:remaining_ones
             srl17e #(width, (latency%17)) last_srl17e (.clk(clk), .ce(ce), .d(z[num_srl17es-2]), .q(z[num_srl17es-1]));
          end
   endgenerate
endmodule
module synth_reg_reg (i, ce, clr, clk, o);
   parameter width  = 8;
   parameter latency  = 1;
   input[width - 1:0] i;
   input ce, clr, clk;
   output[width - 1:0] o;
   wire[width - 1:0] o;
   genvar idx;
   reg[width - 1:0] reg_bank [latency:0];
   integer j;
   initial
     begin
        for (j=0; j < latency+1; j=j+1)
          begin
             reg_bank[j] = {width{1'b0}};
          end
     end

   generate
     if (latency == 0)
        begin:has_0_latency
         assign o = i;
       end
   endgenerate

   always @(i)
        begin
             reg_bank[0] = i;
         end
   generate
     if (latency > 0)
        begin:more_than_1
            assign o = reg_bank[latency];
         for (idx=0; idx < latency; idx=idx+1) begin:sync_loop
            always @(posedge clk)
                begin
                 if(clr)
                    begin
                      for (j=0; j < latency+1; j=j+1)
                        begin
                          reg_bank[j] = {width{1'b0}};
                       end
                    end
                 else if (ce)
                    begin
                        reg_bank[idx+1] <= reg_bank[idx] ;
                    end
               end
        end
      end
   endgenerate
endmodule

//-----------------------------------------------------------------
// System Generator version 14.6 VERILOG source file.
//
// Copyright(C) 2013 by Xilinx, Inc.  All rights reserved.  This
// text/file contains proprietary, confidential information of Xilinx,
// Inc., is distributed under license from Xilinx, Inc., and may be used,
// copied and/or disclosed only pursuant to the terms of a valid license
// agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
// this text/file solely for design, simulation, implementation and
// creation of design files limited to Xilinx devices or technologies.
// Use with non-Xilinx devices or technologies is expressly prohibited
// and immediately terminates your license unless covered by a separate
// agreement.
//
// Xilinx is providing this design, code, or information "as is" solely
// for use in developing programs and solutions for Xilinx devices.  By
// providing this design, code, or information as one possible
// implementation of this feature, application or standard, Xilinx is
// making no representation that this implementation is free from any
// claims of infringement.  You are responsible for obtaining any rights
// you may require for your implementation.  Xilinx expressly disclaims
// any warranty whatsoever with respect to the adequacy of the
// implementation, including but not limited to warranties of
// merchantability or fitness for a particular purpose.
//
// Xilinx products are not intended for use in life support appliances,
// devices, or systems.  Use in such applications is expressly prohibited.
//
// Any modifications that are made to the source code are done at the user's
// sole risk and will be unsupported.
//
// This copyright and support notice must be retained as part of this
// text at all times.  (c) Copyright 1995-2013 Xilinx, Inc.  All rights
// reserved.
//-----------------------------------------------------------------
`timescale 1 ns / 10 ps
module synth_reg_w_init (i, ce, clr, clk, o);
   parameter width  = 8;
   parameter init_index  = 0;
   parameter [width-1 : 0] init_value  = 'b0000;
   parameter latency  = 1;

   input[width - 1:0] i;
   input ce, clr, clk;
   output[width - 1:0] o;
   wire[(latency + 1) * width - 1:0] dly_i;
   wire #0.2 dly_clr;
   genvar index;

   generate
     if (latency == 0)
        begin:has_0_latency
         assign o = i;
        end
     else
        begin:has_latency
         assign dly_i[(latency + 1) * width - 1:latency * width] = i ;
         assign dly_clr = clr ;
         for (index=1; index<=latency; index=index+1)
           begin:fd_array
// synopsys translate_off
             defparam reg_comp_1.width = width;
             defparam reg_comp_1.init_index = init_index;
             defparam reg_comp_1.init_value = init_value;
// synopsys translate_on
             single_reg_w_init #(width, init_index, init_value)
               reg_comp_1(.clk(clk),
                          .i(dly_i[(index + 1)*width-1:index*width]),
                          .o(dly_i[index * width - 1:(index - 1) * width]),
                          .ce(ce),
                          .clr(dly_clr));
             end
        assign o = dly_i[width-1:0];
       end
   endgenerate
endmodule
module single_reg_w_init (i, ce, clr, clk, o);
   parameter width  = 8;
   parameter init_index  = 0;
   parameter [width-1 : 0] init_value  = 8'b00000000;
   input[width - 1:0] i;
   input ce;
   input clr;
   input clk;
   output[width - 1:0] o;
   parameter [0:0] init_index_val = (init_index ==  1) ? 1'b1 : 1'b0;
   parameter [width-1:0] result = (width > 1) ? { {(width-1){1'b0}}, init_index_val } : init_index_val;
   parameter [width-1:0] init_const = (init_index > 1) ? init_value : result;
   wire[width - 1:0] o;
   genvar index;

   generate
     for (index=0;index < width; index=index+1) begin:fd_prim_array
          if (init_const[index] == 0)
            begin:rst_comp
              FDRE fdre_comp(.C(clk),
                             .D(i[index]),
                             .Q(o[index]),
                             .CE(ce),
                             .R(clr));
            end
          else
            begin:set_comp
             FDSE fdse_comp(.C(clk),
                            .D(i[index]),
                            .Q(o[index]),
                            .CE(ce),
                            .S(clr));
            end
    end
   endgenerate
endmodule

//-----------------------------------------------------------------
// System Generator version 14.6 VERILOG source file.
//
// Copyright(C) 2013 by Xilinx, Inc.  All rights reserved.  This
// text/file contains proprietary, confidential information of Xilinx,
// Inc., is distributed under license from Xilinx, Inc., and may be used,
// copied and/or disclosed only pursuant to the terms of a valid license
// agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
// this text/file solely for design, simulation, implementation and
// creation of design files limited to Xilinx devices or technologies.
// Use with non-Xilinx devices or technologies is expressly prohibited
// and immediately terminates your license unless covered by a separate
// agreement.
//
// Xilinx is providing this design, code, or information "as is" solely
// for use in developing programs and solutions for Xilinx devices.  By
// providing this design, code, or information as one possible
// implementation of this feature, application or standard, Xilinx is
// making no representation that this implementation is free from any
// claims of infringement.  You are responsible for obtaining any rights
// you may require for your implementation.  Xilinx expressly disclaims
// any warranty whatsoever with respect to the adequacy of the
// implementation, including but not limited to warranties of
// merchantability or fitness for a particular purpose.
//
// Xilinx products are not intended for use in life support appliances,
// devices, or systems.  Use in such applications is expressly prohibited.
//
// Any modifications that are made to the source code are done at the user's
// sole risk and will be unsupported.
//
// This copyright and support notice must be retained as part of this
// text at all times.  (c) Copyright 1995-2013 Xilinx, Inc.  All rights
// reserved.
//-----------------------------------------------------------------
`ifndef xlConvPkgIncluded
`include "conv_pkg.v"
`endif
`ifndef xlConvertType
 `define xlConvertType
 `timescale 1 ns / 10 ps
module cast (inp, res);
    parameter signed [31:0] old_width = 4;
    parameter signed [31:0] old_bin_pt = 1;
    parameter signed [31:0] new_width = 4;
    parameter signed [31:0] new_bin_pt = 1;
    parameter signed [31:0] new_arith = `xlSigned;
    input [old_width - 1 : 0] inp;
    output [new_width - 1 : 0] res;

   parameter signed [31:0] right_of_dp = new_bin_pt - old_bin_pt;
    wire [new_width-1:0] result;
   genvar i;
   assign res = result;
   generate
      for (i = 0; i<new_width;  i = i+1)
        begin:cast_loop
           if ((i-right_of_dp) > old_width - 1)
             begin:u0
                if (new_arith == `xlUnsigned)
                  begin:u1
                     assign result[i] = 1'b0;
                  end
                if (new_arith == `xlSigned)
                  begin:u2
                     assign result[i] = inp[old_width-1];
                  end
             end
           else if ((i-right_of_dp) >= 0)
             begin:u3
                assign result[i] = inp[i-right_of_dp];
             end
           else
             begin:u4
                assign result[i] = 1'b0;
             end
        end
      endgenerate

endmodule
module shift_division_result (quotient, fraction, res);
    parameter signed [31:0] q_width = 16;
    parameter signed [31:0] f_width = 16;
    parameter signed [31:0] fraction_width = 8;
    parameter signed [31:0] shift_value = 8;
    parameter signed [31:0] shift_dir = 0;
    parameter signed [31:0] vec_MSB = q_width + f_width - 1;
    parameter signed [31:0] result_MSB = q_width + fraction_width - 1;
    parameter signed [31:0] result_LSB = vec_MSB - result_MSB;
    input [q_width - 1 : 0] quotient;
    input [f_width - 1 : 0] fraction;
    output [result_MSB : 0] res;

    wire [vec_MSB:0] vec;
    wire [vec_MSB:0] temp;
   genvar i;
   assign res = vec[vec_MSB:result_LSB];
   assign temp = { quotient, fraction };
   generate
      if (shift_dir == 1)
      begin:left_shift_loop
         for (i = vec_MSB; i>=0;  i = i-1)
         begin:u0
            if (i < shift_value)
            begin:u1
               assign vec[i] = 1'b0;
            end
            else
            begin:u2
               assign vec[i] = temp[i-shift_value];
             end
         end
      end
      else
      begin:right_shift_loop
         for (i = 0; i <= vec_MSB; i = i+1)
         begin:u3
            if (i > vec_MSB - shift_value)
            begin:u4
               assign vec[i] = temp[vec_MSB];
            end
            else
            begin:u5
               assign vec[i] = temp[i+shift_value];
            end
         end
      end
   endgenerate

endmodule
module shift_op (inp, res);
    parameter signed [31:0] inp_width = 16;
    parameter signed [31:0] result_width = 16;
    parameter signed [31:0] shift_value = 8;
    parameter signed [31:0] shift_dir = 0;
    parameter signed [31:0] vec_MSB = inp_width - 1;
    parameter signed [31:0] result_MSB = result_width - 1;
    parameter signed [31:0] result_LSB = vec_MSB - result_MSB;
    input [vec_MSB : 0] inp;
    output [result_MSB : 0] res;

    wire [vec_MSB:0] vec;
   genvar i;
   assign res = vec[vec_MSB:result_LSB];
   generate
      if (shift_dir == 1)
      begin:left_shift_loop
         for (i = vec_MSB; i>=0;  i = i-1)
         begin:u0
            if (i < shift_value)
            begin:u1
               assign vec[i] = 1'b0;
            end
            else
            begin:u2
               assign vec[i] = inp[i-shift_value];
             end
         end
      end
      else
      begin:right_shift_loop
         for (i = 0; i <= vec_MSB; i = i+1)
         begin:u3
            if (i > vec_MSB - shift_value)
            begin:u4
               assign vec[i] = inp[vec_MSB];
            end
            else
            begin:u5
               assign vec[i] = inp[i+shift_value];
            end
         end
      end
   endgenerate

endmodule
module pad_lsb (inp, res);
   parameter signed [31:0] orig_width = 4;
   parameter signed [31:0] new_width = 2;
   input [orig_width - 1 : 0] inp;
   output [new_width - 1 : 0] res;
   parameter signed [31:0] pad_pos = new_width - orig_width -1;
   wire [new_width-1:0] result;
   genvar i;
   assign  res = result;
   generate
      if (new_width >= orig_width)
        begin:u0
           assign result[new_width-1:new_width-orig_width] = inp[orig_width-1:0];
        end
   endgenerate

   generate
      if (pad_pos >= 0)
        begin:u1
           assign result[pad_pos:0] = {pad_pos{1'b0}};
        end
   endgenerate
endmodule
module zero_ext (inp, res);
   parameter signed [31:0]  old_width = 4;
   parameter signed [31:0]  new_width = 2;
   input [old_width - 1 : 0] inp;
   output [new_width - 1 : 0] res;
   wire [new_width-1:0] result;
   genvar i;
   assign res = result;
   generate
     if (new_width > old_width)
       begin:u0
          assign result = { {(new_width-old_width){1'b0}}, inp};
       end
     else
       begin:u1
          assign result[new_width-1:0] = inp[new_width-1:0];
       end
    endgenerate
endmodule
module sign_ext (inp, res);
   parameter signed [31:0]  old_width = 4;
   parameter signed [31:0]  new_width = 2;
   input [old_width - 1 : 0] inp;
   output [new_width - 1 : 0] res;
   wire [new_width-1:0] result;
   assign res = result;
   generate
     if (new_width > old_width)
       begin:u0
          assign result = { {(new_width-old_width){inp[old_width-1]}}, inp};
       end
     else
       begin:u1
          assign result[new_width-1:0] = inp[new_width-1:0];
       end
   endgenerate

endmodule
module extend_msb (inp, res);
    parameter signed [31:0]  old_width = 4;
    parameter signed [31:0]  new_width = 4;
    parameter signed [31:0]  new_arith = `xlSigned;
    input [old_width - 1 : 0] inp;
    output [new_width - 1 : 0] res;
    wire [new_width-1:0] result;
   assign res = result;
   generate
      if (new_arith ==`xlUnsigned)
        begin:u0
           zero_ext # (old_width, new_width)
             em_zero_ext (.inp(inp), .res(result));
        end
      else
        begin:u1
           sign_ext # (old_width, new_width)
             em_sign_ext (.inp(inp), .res(result));
        end
    endgenerate
endmodule
module align_input (inp, res);
    parameter signed [31:0]  old_width = 4;
    parameter signed [31:0]  delta = 1;
    parameter signed [31:0]  new_arith = `xlSigned;
    parameter signed [31:0]  new_width = 4;
    input [old_width - 1 : 0] inp;
    output [new_width - 1 : 0] res;
    parameter signed [31:0]  abs_delta = (delta >= 0) ? (delta) : (-delta);
    wire [new_width-1:0] result;
    wire [(old_width+abs_delta)-1:0] padded_inp;
   assign res = result;
   generate
      if (delta > 0)
        begin:u0
           pad_lsb # (old_width, old_width+delta)
             ai_pad_lsb (.inp(inp), .res(padded_inp));
           extend_msb # (old_width+delta, new_width, new_arith)
             ai_extend_msb (.inp(padded_inp), .res(result));
        end
      else
        begin:u1
           extend_msb # (old_width, new_width, new_arith)
             ai_extend_msb (.inp(inp), .res(result));
        end
   endgenerate
endmodule
module round_towards_inf (inp, res);
    parameter signed [31:0]  old_width = 4;
    parameter signed [31:0]  old_bin_pt = 2;
    parameter signed [31:0]  old_arith = `xlSigned;
    parameter signed [31:0]  new_width = 4;
    parameter signed [31:0]  new_bin_pt = 1;
    parameter signed [31:0]  new_arith = `xlSigned;
    input [old_width - 1 : 0] inp;
    output [new_width - 1 : 0] res;

   parameter signed [31:0]  right_of_dp = old_bin_pt - new_bin_pt;
   parameter signed [31:0]  abs_right_of_dp = (new_bin_pt > old_bin_pt) ? (new_bin_pt-old_bin_pt) : (old_bin_pt - new_bin_pt);
   parameter signed [31:0]  right_of_dp_2 = (right_of_dp >=2) ? right_of_dp-2 : 0;
   parameter signed [31:0]  right_of_dp_1 = (right_of_dp >=1) ? right_of_dp-1 : 0;
   reg [new_width-1:0] one_or_zero;
   wire [new_width-1:0] truncated_val;
   wire signed [new_width-1:0] result_signed;
   wire [abs_right_of_dp+old_width-1 : 0] padded_val;
   initial
     begin
        one_or_zero = {new_width{1'b0}};
     end
   generate
      if (right_of_dp >= 0)
        begin:u0
           if (new_arith ==`xlUnsigned)
             begin:u1
                zero_ext # (old_width-right_of_dp, new_width)
                  rti_zero_ext (.inp(inp[old_width-1:right_of_dp]), .res(truncated_val));
             end
           else
             begin:u2
                sign_ext # (old_width-right_of_dp, new_width)
                  rti_sign_ext (.inp(inp[old_width-1:right_of_dp]), .res(truncated_val));
             end
        end
      else
        begin:u3
           pad_lsb # (old_width, abs_right_of_dp+old_width)
             rti_pad_lsb (.inp(inp), .res(padded_val));
           if (new_arith ==`xlUnsigned)
             begin:u4
                zero_ext # (abs_right_of_dp+old_width, new_width)
                  rti_zero_ext1 (.inp(padded_val), .res(truncated_val));
             end
           else
             begin:u5
                sign_ext # (abs_right_of_dp+old_width, new_width)
                  rti_sign_ext1 (.inp(padded_val), .res(truncated_val));
             end
        end
   endgenerate
   generate
      if (new_arith == `xlSigned)
        begin:u6
           always @(inp)
             begin
                one_or_zero = {new_width{1'b0}};
               if (inp[old_width-1] == 1'b0)
                 begin
                    one_or_zero[0] = 1'b1;
                 end
               if ((right_of_dp >=2) && (right_of_dp <= old_width))
                 begin
                    if(|inp[right_of_dp_2:0] == 1'b1)
                       begin
                          one_or_zero[0] = 1'b1;
                       end
                 end
               if ((right_of_dp >=1) && (right_of_dp <= old_width))
                 begin
                    if(inp[right_of_dp_1] == 1'b0)
                      begin
                         one_or_zero[0] = 1'b0;
                      end
                 end
               else
                 begin
                    one_or_zero[0] = 1'b0;
                 end
             end
             assign result_signed = truncated_val + one_or_zero;
             assign res = result_signed;
        end

      else
        begin:u7
           always @(inp)
             begin
                one_or_zero = {new_width{1'b0}};
               if ((right_of_dp >=1) && (right_of_dp <= old_width))
                 begin
                    one_or_zero[0] = inp[right_of_dp_1];
                 end
             end
             assign res = truncated_val + one_or_zero;
        end
   endgenerate

endmodule
module round_towards_even (inp, res);
    parameter signed [31:0]  old_width = 4;
    parameter signed [31:0]  old_bin_pt = 2;
    parameter signed [31:0]  old_arith = `xlSigned;
    parameter signed [31:0]  new_width = 4;
    parameter signed [31:0]  new_bin_pt = 1;
    parameter signed [31:0]  new_arith = `xlSigned;
    input [old_width - 1 : 0] inp;
    output [new_width - 1 : 0] res;
   parameter signed [31:0]  right_of_dp = old_bin_pt - new_bin_pt;
   parameter signed [31:0]  abs_right_of_dp = (new_bin_pt > old_bin_pt) ? (new_bin_pt-old_bin_pt) : (old_bin_pt - new_bin_pt);
   parameter signed [31:0]  expected_new_width = old_width - right_of_dp + 1;
   reg [new_width-1:0] one_or_zero;
   wire signed [new_width-1:0] result_signed;
   wire [new_width-1:0] truncated_val;
   wire [abs_right_of_dp+old_width-1 : 0] padded_val;
   initial
     begin
      one_or_zero = { new_width{1'b0}};
     end

   generate
      if (right_of_dp >= 0)
        begin:u0
           if (new_arith == `xlUnsigned)
             begin:u1
                zero_ext # (old_width-right_of_dp, new_width)
                            rte_zero_ext (.inp(inp[old_width-1:right_of_dp]), .res(truncated_val));
             end
           else
             begin:u2
                sign_ext # (old_width-right_of_dp, new_width)
                            rte_sign_ext (.inp(inp[old_width-1:right_of_dp]), .res(truncated_val));
             end
        end

      else
        begin:u3
           pad_lsb # (old_width, abs_right_of_dp+old_width)
                            rte_pad_lsb (.inp(inp), .res(padded_val));
           if (new_arith == `xlUnsigned)
             begin:u4
                zero_ext # (abs_right_of_dp+old_width, new_width)
                            rte_zero_ext1 (.inp(padded_val), .res(truncated_val));
             end
           else
             begin:u5
                sign_ext # (abs_right_of_dp+old_width, new_width)
                            rte_sign_ext1 (.inp(padded_val), .res(truncated_val));
             end
        end
   endgenerate

   generate
      if ((right_of_dp ==1) && (right_of_dp <= old_width))
        begin:u6a
           always @(inp)
             begin
                one_or_zero = { new_width{1'b0}};
                if(inp[right_of_dp-1] == 1'b1)
                  begin
                     one_or_zero[0] = inp[right_of_dp];
                  end
                else
                  begin
                     one_or_zero[0] = inp[right_of_dp-1];
                  end
             end
       end
      else if ((right_of_dp >=2) && (right_of_dp <= old_width))
        begin:u6b
           always @(inp)
             begin
                one_or_zero = { new_width{1'b0}};
                if( (inp[right_of_dp-1] == 'b1) && !(|inp[right_of_dp-2:0]) )
                  begin
                     one_or_zero[0] = inp[right_of_dp];
                  end
                else
                  begin
                     one_or_zero[0] = inp[right_of_dp-1];
                  end
             end
       end
      else
        begin:u7
            always @(inp)
             begin
                one_or_zero = { new_width{1'b0}};
             end
        end
   endgenerate

   generate
      if (new_arith == `xlSigned)
        begin:u8
           assign result_signed = truncated_val + one_or_zero;
           assign res = result_signed;
        end
      else
        begin:u9
           assign res = truncated_val + one_or_zero;
        end
   endgenerate

endmodule
module trunc (inp, res);
    parameter signed [31:0]  old_width = 4;
    parameter signed [31:0]  old_bin_pt = 2;
    parameter signed [31:0]  old_arith = `xlSigned;
    parameter signed [31:0]  new_width = 4;
    parameter signed [31:0]  new_bin_pt = 1;
    parameter signed [31:0]  new_arith = `xlSigned;
    input [old_width - 1 : 0] inp;
    output [new_width - 1 : 0] res;

   parameter signed [31:0]  right_of_dp = old_bin_pt - new_bin_pt;
   parameter signed [31:0]  abs_right_of_dp = (new_bin_pt > old_bin_pt) ? (new_bin_pt-old_bin_pt) : (old_bin_pt - new_bin_pt);
   wire [new_width-1:0] result;
   wire [abs_right_of_dp+old_width-1 : 0] padded_val;
   assign res = result;
   generate
      if (new_bin_pt > old_bin_pt)
        begin:tr_u2
           pad_lsb # (old_width, abs_right_of_dp+old_width)
             tr_pad_lsb (.inp(inp), .res(padded_val));
           extend_msb # (old_width+abs_right_of_dp, new_width, new_arith)
             tr_extend_msb (.inp(padded_val), .res(result));
        end
      else
        begin:tr_u1
           extend_msb # (old_width-right_of_dp, new_width, new_arith)
             tr_extend_msb (.inp(inp[old_width-1:right_of_dp]), .res(result));
        end
   endgenerate

endmodule
module saturation_arith (inp, res);
    parameter signed [31:0]  old_width = 4;
    parameter signed [31:0]  old_bin_pt = 2;
    parameter signed [31:0]  old_arith = `xlSigned;
    parameter signed [31:0]  new_width = 4;
    parameter signed [31:0]  new_bin_pt = 1;
    parameter signed [31:0]  new_arith = `xlSigned;
    input [old_width - 1 : 0] inp;
    output [new_width - 1 : 0] res;
   parameter signed [31:0]  abs_right_of_dp = (new_bin_pt > old_bin_pt) ? (new_bin_pt-old_bin_pt) : (old_bin_pt - new_bin_pt);
   parameter signed [31:0]  abs_width = (new_width > old_width) ? (new_width-old_width) : 1;
   parameter signed [31:0]  abs_new_width = (old_width > new_width) ? new_width : 1;
   reg overflow;
   reg [old_width-1:0] vec;
   reg [new_width-1:0] result;
   assign res = result;
   generate
      if (old_width > new_width)
        begin:sa_u0
           always @ (inp)
             begin
                vec = inp;
                overflow = 1;
                if ( (old_arith == `xlSigned) && (new_arith == `xlSigned) )
                  begin
                    if (~|inp[old_width-1:abs_new_width-1] || &inp[old_width-1:abs_new_width-1])
                     begin
                       overflow = 0;
                     end
                 end

                if ( (old_arith == `xlSigned) && (new_arith == `xlUnsigned))
                   begin
                    if (~|inp[old_width-1 : abs_new_width])
                    begin
                       overflow = 0;
                    end
                end

                if ((old_arith == `xlUnsigned) &&  (new_arith == `xlUnsigned))
                  begin
                    if (~|inp[old_width-1 : abs_new_width])
                     begin
                       overflow = 0;
                     end
                  end

               if ( (old_arith == `xlUnsigned) && (new_arith == `xlSigned))
                 begin
                  if (~|inp[old_width-1:abs_new_width-1] || &inp[old_width-1:abs_new_width-1])
                    begin
                      overflow = 0;
                    end
                 end
               if (overflow == 1)
                 begin
                   if (new_arith == `xlSigned)
                     begin
                       if (inp[old_width-1] == 'b0)
                         begin
                           result = (new_width ==1) ? 1'b0 : {1'b0, {(new_width-1){1'b1}} };
                         end
                      else
                        begin
                          result = (new_width ==1) ? 1'b1 : {1'b1, {(new_width-1){1'b0}} };
                       end
                     end
                   else
                     begin
                       if ((old_arith == `xlSigned) && (inp[old_width-1] == 'b1))
                         begin
                           result = {new_width{1'b0}};
                         end
                       else
                         begin
                           result = {new_width{1'b1}};
                         end
                     end
                 end
               else
                 begin
                    if ( (old_arith == `xlSigned) && (new_arith == `xlUnsigned) && (inp[old_width-1] == 'b1) )
                    begin
                      vec = {old_width{1'b0}};
                    end
                    result = vec[new_width-1:0];
                 end
             end
        end
   endgenerate
   generate
      if (new_width > old_width)
        begin:sa_u1
         always @ (inp)
           begin
            vec = inp;
            if ( (old_arith == `xlSigned) && (new_arith == `xlUnsigned) && (inp[old_width-1] == 1'b1) )
              begin
                vec = {old_width{1'b0}};
              end
              if (new_arith == `xlUnsigned)
                begin
                  result = { {abs_width{1'b0}}, vec};
                end
              else
                begin
                  result = { {abs_width{inp[old_width-1]}}, vec};
                end
           end
       end
   endgenerate

   generate
      if (new_width == old_width)
        begin:sa_u2
         always @ (inp)
           begin
             if ( (old_arith == `xlSigned) && (new_arith == `xlUnsigned) && (inp[old_width-1] == 'b1) )
               begin
                 result = {old_width{1'b0}};
               end
             else
               begin
                 result = inp;
               end
           end
        end
   endgenerate

endmodule
module wrap_arith (inp, res);
    parameter signed [31:0]  old_width = 4;
    parameter signed [31:0]  old_bin_pt = 2;
    parameter signed [31:0]  old_arith = `xlSigned;
    parameter signed [31:0]  new_width = 4;
    parameter signed [31:0]  new_bin_pt = 1;
    parameter signed [31:0]  new_arith = `xlSigned;
    parameter signed [31:0]  result_arith = ((old_arith==`xlSigned)&&(new_arith==`xlUnsigned))? `xlSigned : new_arith;
    input [old_width - 1 : 0] inp;
    output [new_width - 1 : 0] res;
   wire [new_width-1:0] result;
   cast # (old_width, old_bin_pt, new_width, new_bin_pt, result_arith)
     wrap_cast (.inp(inp), .res(result));
   assign res = result;

endmodule
module convert_type (inp, res);
    parameter signed [31:0]  old_width = 4;
    parameter signed [31:0]  old_bin_pt = 2;
    parameter signed [31:0]  old_arith = `xlSigned;
    parameter signed [31:0]  new_width = 4;
    parameter signed [31:0]  new_bin_pt = 1;
    parameter signed [31:0]  new_arith = `xlSigned;
    parameter signed [31:0]  quantization = `xlTruncate;
    parameter signed [31:0]  overflow = `xlWrap;
    input [old_width - 1 : 0] inp;
    output [new_width - 1 : 0] res;

   parameter signed [31:0]  fp_width = old_width + 2;
   parameter signed [31:0]  fp_bin_pt = old_bin_pt;
   parameter signed [31:0]  fp_arith = old_arith;
   parameter signed [31:0]  q_width = fp_width + new_bin_pt - old_bin_pt;
   parameter signed [31:0]  q_bin_pt = new_bin_pt;
   parameter signed [31:0]  q_arith = old_arith;
   wire [fp_width-1:0] full_precision_result;
   wire [new_width-1:0] result;
   wire [q_width-1:0] quantized_result;
   assign res = result;
   cast # (old_width, old_bin_pt, fp_width, fp_bin_pt, fp_arith)
     fp_cast (.inp(inp), .res(full_precision_result));
   generate
      if (quantization == `xlRound)
        begin:ct_u0
           round_towards_inf # (fp_width, fp_bin_pt, fp_arith, q_width, q_bin_pt, q_arith)
             quant_rtf (.inp(full_precision_result), .res(quantized_result));
        end
   endgenerate

   generate
      if (quantization == `xlRoundBanker)
        begin:ct_u1
           round_towards_even # (fp_width, fp_bin_pt, fp_arith, q_width, q_bin_pt, q_arith)
             quant_rte (.inp(full_precision_result), .res(quantized_result));
        end
   endgenerate

   generate
      if (quantization == `xlTruncate)
        begin:ct_u2
           trunc # (fp_width, fp_bin_pt, fp_arith, q_width, q_bin_pt, q_arith)
             quant_tr (.inp(full_precision_result), .res(quantized_result));
        end
   endgenerate

   generate
      if (overflow == `xlSaturate)
        begin:ct_u3
           saturation_arith # (q_width, q_bin_pt, q_arith, new_width, new_bin_pt, new_arith)
            ovflo_sat (.inp(quantized_result), .res(result));
        end
   endgenerate

   generate
      if ((overflow == `xlWrap) || (overflow == 3))
        begin:ct_u4
           wrap_arith # (q_width, q_bin_pt, q_arith, new_width, new_bin_pt, new_arith)
             ovflo_wrap (.inp(quantized_result), .res(result));
        end
   endgenerate

endmodule
`endif
// -------------------------------------------------------------
// 
// File Name: C:\Users\Sechw\Documents\MATLAB\4440\codegen\rgbtohsv\hdlsrc\rgbtohsv_fixpt.v
// Created: 2014-12-16 00:44:50
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
// h                             ce_out        1
// s                             ce_out        1
// v                             ce_out        1
// -- -------------------------------------------------------------
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: rgbtohsv_fixpt
// Source Path: rgbtohsv_fixpt
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module rgbtohsv_fixpt
          (
           clk,
           reset,
           ce,
           r,
           g,
           b,
           ce_out,
           h,
           s,
           v
          );


  input   clk;
  input   reset;
  input   ce;
  input   [7:0] r;  // ufix8
  input   [7:0] g;  // ufix8
  input   [7:0] b;  // ufix8
  output  ce_out;
  output  [7:0] h;  // ufix8
  output  [7:0] s;  // ufix8
  output  [7:0] v;  // ufix8


  wire enb;
  reg [7:0] h_1;  // ufix8
  reg [7:0] s_1;  // ufix8
  reg [7:0] v_1;  // ufix8
  reg [15:0] rgbtohsv_fixpt_r_d_1;  // ufix16_En7
  reg [15:0] rgbtohsv_fixpt_g_d_1;  // ufix16_En7
  reg [15:0] rgbtohsv_fixpt_b_d_1;  // ufix16_En7
  reg [15:0] rgbtohsv_fixpt_Cmax_1;  // ufix16_En15
  reg [15:0] rgbtohsv_fixpt_delta_1;  // ufix16_En15
  reg [15:0] rgbtohsv_fixpt_h_d_1;  // ufix16_En12
  reg [15:0] rgbtohsv_fixpt_tmp_3;  // ufix16_En15
  reg [15:0] rgbtohsv_fixpt_tmp_0_1;  // ufix16_En7
  reg [15:0] rgbtohsv_fixpt_tmp_1_1;  // ufix16_En7
  reg [15:0] rgbtohsv_fixpt_tmp_2_1;  // ufix16_En12
  reg [31:0] rgbtohsv_fixpt_div_temp_3;  // ufix32_En16
  reg [32:0] rgbtohsv_fixpt_div_temp_0_1;  // ufix33_En8
  reg [32:0] rgbtohsv_fixpt_div_temp_1_1;  // ufix33_En8
  reg [32:0] rgbtohsv_fixpt_div_temp_2_1;  // ufix33_En8
  reg signed [31:0] rgbtohsv_fixpt_cast_24;  // int32
  reg [15:0] rgbtohsv_fixpt_cast_0_1;  // ufix16_En7
  reg [31:0] rgbtohsv_fixpt_mul_temp_6;  // ufix32_En30
  reg signed [31:0] rgbtohsv_fixpt_cast_1_1;  // int32
  reg [15:0] rgbtohsv_fixpt_cast_2_1;  // ufix16_En7
  reg [31:0] rgbtohsv_fixpt_mul_temp_0_1;  // ufix32_En30
  reg signed [31:0] rgbtohsv_fixpt_cast_3_1;  // int32
  reg [15:0] rgbtohsv_fixpt_cast_4_1;  // ufix16_En7
  reg [31:0] rgbtohsv_fixpt_mul_temp_1_1;  // ufix32_En30
  reg signed [17:0] rgbtohsv_fixpt_sub_cast_8;  // sfix18_En15
  reg [15:0] rgbtohsv_fixpt_sub_cast_0_1;  // ufix16_En15
  reg signed [17:0] rgbtohsv_fixpt_sub_cast_1_1;  // sfix18_En15
  reg signed [17:0] rgbtohsv_fixpt_sub_temp_3;  // sfix18_En15
  reg [31:0] rgbtohsv_fixpt_cast_5_1;  // ufix32_En31
  reg [23:0] rgbtohsv_fixpt_cast_6_1;  // ufix24_En15
  reg [23:0] rgbtohsv_fixpt_cast_7_1;  // ufix24_En15
  reg [23:0] rgbtohsv_fixpt_cast_8_1;  // ufix24_En15
  reg [23:0] rgbtohsv_fixpt_cast_9_1;  // ufix24_En15
  reg signed [17:0] rgbtohsv_fixpt_sub_cast_2_1;  // sfix18_En7
  reg signed [17:0] rgbtohsv_fixpt_sub_cast_3_1;  // sfix18_En7
  reg signed [17:0] rgbtohsv_fixpt_sub_temp_0_1;  // sfix18_En7
  reg [16:0] rgbtohsv_fixpt_cast_10_1;  // ufix17_En7
  reg [32:0] rgbtohsv_fixpt_cast_11_1;  // ufix33_En23
  reg [23:0] rgbtohsv_fixpt_cast_12_1;  // ufix24_En15
  reg [23:0] rgbtohsv_fixpt_cast_13_1;  // ufix24_En15
  reg signed [17:0] rgbtohsv_fixpt_sub_cast_4_1;  // sfix18_En7
  reg signed [17:0] rgbtohsv_fixpt_sub_cast_5_1;  // sfix18_En7
  reg signed [17:0] rgbtohsv_fixpt_sub_temp_1_1;  // sfix18_En7
  reg [16:0] rgbtohsv_fixpt_cast_14_1;  // ufix17_En7
  reg [32:0] rgbtohsv_fixpt_cast_15_1;  // ufix33_En23
  reg signed [17:0] rgbtohsv_fixpt_sub_cast_6_1;  // sfix18_En7
  reg signed [17:0] rgbtohsv_fixpt_sub_cast_7_1;  // sfix18_En7
  reg signed [17:0] rgbtohsv_fixpt_sub_temp_2_1;  // sfix18_En7
  reg [16:0] rgbtohsv_fixpt_cast_16_1;  // ufix17_En7
  reg [32:0] rgbtohsv_fixpt_cast_17_1;  // ufix33_En23
  reg [33:0] rgbtohsv_fixpt_add_cast_5;  // ufix34_En8
  reg [34:0] rgbtohsv_fixpt_add_cast_0_1;  // ufix35_En8
  reg [34:0] rgbtohsv_fixpt_add_temp_2;  // ufix35_En8
  reg [33:0] rgbtohsv_fixpt_cast_18_1;  // ufix34_En8
  reg [31:0] rgbtohsv_fixpt_mul_temp_2_1;  // ufix32_En30
  reg [33:0] rgbtohsv_fixpt_add_cast_1_1;  // ufix34_En8
  reg [34:0] rgbtohsv_fixpt_add_cast_2_1;  // ufix35_En8
  reg [34:0] rgbtohsv_fixpt_add_temp_0_1;  // ufix35_En8
  reg [33:0] rgbtohsv_fixpt_cast_19_1;  // ufix34_En8
  reg [16:0] rgbtohsv_fixpt_add_cast_3_1;  // ufix17_En12
  reg [17:0] rgbtohsv_fixpt_add_cast_4_1;  // ufix18_En12
  reg [17:0] rgbtohsv_fixpt_add_temp_1_1;  // ufix18_En12
  reg [16:0] rgbtohsv_fixpt_cast_20_1;  // ufix17_En12
  reg [24:0] rgbtohsv_fixpt_mul_temp_3_1;  // ufix25_En12
  reg [7:0] rgbtohsv_fixpt_cast_21_1;  // uint8
  reg [24:0] rgbtohsv_fixpt_mul_temp_4_1;  // ufix25_En15
  reg [7:0] rgbtohsv_fixpt_cast_22_1;  // uint8
  reg [24:0] rgbtohsv_fixpt_mul_temp_5_1;  // ufix25_En15
  reg [7:0] rgbtohsv_fixpt_cast_23_1;  // uint8


  assign enb = ce;

  always @(r, g, b) begin
    //HDL code generation from MATLAB function: rgbtohsv_fixpt
    //'rgbtohsv_fixpt:38' h_d = fi(h_d + fi(1, 0, 1, 0, fm), 0, 16, 12, fm);
    //'rgbtohsv_fixpt:28' h_d = fi(0, 0, 16, 12, fm);
    //'rgbtohsv_fixpt:60' c = fi( c1, numerictype( c1 ), fimath( a ) );
    //'rgbtohsv_fixpt:59' c1 = divide( divideType( a1, b1 ), a1, b1 );
    //'rgbtohsv_fixpt:58' b1 = fi( b, 'RoundMode', 'fix' );
    //'rgbtohsv_fixpt:57' a1 = fi( a, 'RoundMode', 'fix' );
    //'rgbtohsv_fixpt:56' if isfi( a ) && isfi( b )
    //'rgbtohsv_fixpt:55' coder.inline( 'always' );
    //'rgbtohsv_fixpt:30' h_d = fi(fi_div((g_d - b_d), delta), 0, 16, 12, fm);
    //'rgbtohsv_fixpt:29' elseif r_d==Cmax
    //'rgbtohsv_fixpt:60' c = fi( c1, numerictype( c1 ), fimath( a ) );
    //'rgbtohsv_fixpt:59' c1 = divide( divideType( a1, b1 ), a1, b1 );
    //'rgbtohsv_fixpt:58' b1 = fi( b, 'RoundMode', 'fix' );
    //'rgbtohsv_fixpt:57' a1 = fi( a, 'RoundMode', 'fix' );
    //'rgbtohsv_fixpt:56' if isfi( a ) && isfi( b )
    //'rgbtohsv_fixpt:55' coder.inline( 'always' );
    //'rgbtohsv_fixpt:32' h_d = fi(fi(2, 0, 2, 0, fm) + fi_div((b_d - r_d), delta), 0, 16, 12, fm);
    //'rgbtohsv_fixpt:31' elseif g_d==Cmax
    //'rgbtohsv_fixpt:60' c = fi( c1, numerictype( c1 ), fimath( a ) );
    //'rgbtohsv_fixpt:59' c1 = divide( divideType( a1, b1 ), a1, b1 );
    //'rgbtohsv_fixpt:58' b1 = fi( b, 'RoundMode', 'fix' );
    //'rgbtohsv_fixpt:57' a1 = fi( a, 'RoundMode', 'fix' );
    //'rgbtohsv_fixpt:56' if isfi( a ) && isfi( b )
    //'rgbtohsv_fixpt:55' coder.inline( 'always' );
    //'rgbtohsv_fixpt:34' h_d = fi(fi(4, 0, 3, 0, fm) + fi_div((r_d - g_d), delta), 0, 16, 12, fm);
    //'rgbtohsv_fixpt:33' elseif b_d==Cmax
    //'rgbtohsv_fixpt:23' s_d = fi(0, 0, 16, 15, fm);
    //'rgbtohsv_fixpt:60' c = fi( c1, numerictype( c1 ), fimath( a ) );
    //'rgbtohsv_fixpt:59' c1 = divide( divideType( a1, b1 ), a1, b1 );
    //'rgbtohsv_fixpt:58' b1 = fi( b, 'RoundMode', 'fix' );
    //'rgbtohsv_fixpt:57' a1 = fi( a, 'RoundMode', 'fix' );
    //'rgbtohsv_fixpt:56' if isfi( a ) && isfi( b )
    //'rgbtohsv_fixpt:55' coder.inline( 'always' );
    //'rgbtohsv_fixpt:25' s_d = fi(fi_div(delta, Cmax), 0, 16, 15, fm);
    //'rgbtohsv_fixpt:24' else
    //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    //                                                                          %
    //       Generated by MATLAB 8.2, MATLAB Coder 2.5 and HDL Coder 3.3        %
    //                                                                          %
    //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    //'rgbtohsv_fixpt:9' fm = fimath('RoundingMethod', 'Floor', 'OverflowAction', 'Saturate', 'ProductMode', 'FullPrecision', 'SumMode', 'FullPrecision');
    //'rgbtohsv_fixpt:10' r_d = fi(double( r ), 0, 16, 7, fm);
    //'rgbtohsv_fixpt:11' g_d = fi(double( g ), 0, 16, 7, fm);
    //'rgbtohsv_fixpt:12' b_d = fi(double( b ), 0, 16, 7, fm);
    //'rgbtohsv_fixpt:13' r_d = fi(r_d*fi(1/255, 0, 16, 23, fm), 0, 16, 7, fm);
    rgbtohsv_fixpt_cast_24 = r;
    if ((rgbtohsv_fixpt_cast_24[31] == 1'b0) && (rgbtohsv_fixpt_cast_24[30:9] != 22'b0000000000000000000000)) begin
      rgbtohsv_fixpt_cast_0_1 = 16'b1111111111111111;
    end
    else if (rgbtohsv_fixpt_cast_24[31] == 1'b1) begin
      rgbtohsv_fixpt_cast_0_1 = 16'b0000000000000000;
    end
    else begin
      rgbtohsv_fixpt_cast_0_1 = {rgbtohsv_fixpt_cast_24[8:0], 7'b0000000};
    end
    rgbtohsv_fixpt_mul_temp_6 = rgbtohsv_fixpt_cast_0_1 * 32896;
    rgbtohsv_fixpt_r_d_1 = rgbtohsv_fixpt_mul_temp_6[31:23];
    //'rgbtohsv_fixpt:14' g_d = fi(g_d*fi(1/255, 0, 16, 23, fm), 0, 16, 7, fm);
    rgbtohsv_fixpt_cast_1_1 = g;
    if ((rgbtohsv_fixpt_cast_1_1[31] == 1'b0) && (rgbtohsv_fixpt_cast_1_1[30:9] != 22'b0000000000000000000000)) begin
      rgbtohsv_fixpt_cast_2_1 = 16'b1111111111111111;
    end
    else if (rgbtohsv_fixpt_cast_1_1[31] == 1'b1) begin
      rgbtohsv_fixpt_cast_2_1 = 16'b0000000000000000;
    end
    else begin
      rgbtohsv_fixpt_cast_2_1 = {rgbtohsv_fixpt_cast_1_1[8:0], 7'b0000000};
    end
    rgbtohsv_fixpt_mul_temp_0_1 = rgbtohsv_fixpt_cast_2_1 * 32896;
    rgbtohsv_fixpt_g_d_1 = rgbtohsv_fixpt_mul_temp_0_1[31:23];
    //'rgbtohsv_fixpt:15' b_d = fi(b_d*fi(1/255, 0, 16, 23, fm), 0, 16, 7, fm);
    rgbtohsv_fixpt_cast_3_1 = b;
    if ((rgbtohsv_fixpt_cast_3_1[31] == 1'b0) && (rgbtohsv_fixpt_cast_3_1[30:9] != 22'b0000000000000000000000)) begin
      rgbtohsv_fixpt_cast_4_1 = 16'b1111111111111111;
    end
    else if (rgbtohsv_fixpt_cast_3_1[31] == 1'b1) begin
      rgbtohsv_fixpt_cast_4_1 = 16'b0000000000000000;
    end
    else begin
      rgbtohsv_fixpt_cast_4_1 = {rgbtohsv_fixpt_cast_3_1[8:0], 7'b0000000};
    end
    rgbtohsv_fixpt_mul_temp_1_1 = rgbtohsv_fixpt_cast_4_1 * 32896;
    rgbtohsv_fixpt_b_d_1 = rgbtohsv_fixpt_mul_temp_1_1[31:23];
    //'rgbtohsv_fixpt:16' Cmax = fi(max( max( r_d, g_d ), b_d ), 0, 16, 15, fm);
    if (rgbtohsv_fixpt_r_d_1 < rgbtohsv_fixpt_g_d_1) begin
      rgbtohsv_fixpt_tmp_0_1 = rgbtohsv_fixpt_g_d_1;
    end
    else begin
      rgbtohsv_fixpt_tmp_0_1 = rgbtohsv_fixpt_r_d_1;
    end
    if (rgbtohsv_fixpt_tmp_0_1 < rgbtohsv_fixpt_b_d_1) begin
      rgbtohsv_fixpt_tmp_0_1 = rgbtohsv_fixpt_b_d_1;
    end
    if (rgbtohsv_fixpt_tmp_0_1[15:8] != 8'b00000000) begin
      rgbtohsv_fixpt_Cmax_1 = 16'b1111111111111111;
    end
    else begin
      rgbtohsv_fixpt_Cmax_1 = {rgbtohsv_fixpt_tmp_0_1[7:0], 8'b00000000};
    end
    //'rgbtohsv_fixpt:17' Cmin = fi(min( min( r_d, g_d ), b_d ), 0, 16, 15, fm);
    if (rgbtohsv_fixpt_r_d_1 > rgbtohsv_fixpt_g_d_1) begin
      rgbtohsv_fixpt_tmp_1_1 = rgbtohsv_fixpt_g_d_1;
    end
    else begin
      rgbtohsv_fixpt_tmp_1_1 = rgbtohsv_fixpt_r_d_1;
    end
    if (rgbtohsv_fixpt_tmp_1_1 > rgbtohsv_fixpt_b_d_1) begin
      rgbtohsv_fixpt_tmp_1_1 = rgbtohsv_fixpt_b_d_1;
    end
    //'rgbtohsv_fixpt:18' delta = fi(Cmax - Cmin, 0, 16, 15, fm);
    rgbtohsv_fixpt_sub_cast_8 = rgbtohsv_fixpt_Cmax_1;
    if (rgbtohsv_fixpt_tmp_1_1[15:8] != 8'b00000000) begin
      rgbtohsv_fixpt_sub_cast_0_1 = 16'b1111111111111111;
    end
    else begin
      rgbtohsv_fixpt_sub_cast_0_1 = {rgbtohsv_fixpt_tmp_1_1[7:0], 8'b00000000};
    end
    rgbtohsv_fixpt_sub_cast_1_1 = rgbtohsv_fixpt_sub_cast_0_1;
    rgbtohsv_fixpt_sub_temp_3 = rgbtohsv_fixpt_sub_cast_8 - rgbtohsv_fixpt_sub_cast_1_1;
    if ((rgbtohsv_fixpt_sub_temp_3[17] == 1'b0) && (rgbtohsv_fixpt_sub_temp_3[16] != 1'b0)) begin
      rgbtohsv_fixpt_delta_1 = 16'b1111111111111111;
    end
    else if (rgbtohsv_fixpt_sub_temp_3[17] == 1'b1) begin
      rgbtohsv_fixpt_delta_1 = 16'b0000000000000000;
    end
    else begin
      rgbtohsv_fixpt_delta_1 = rgbtohsv_fixpt_sub_temp_3[15:0];
    end
    //'rgbtohsv_fixpt:19' h_d = fi(0, 0, 16, 12, fm);
    //'rgbtohsv_fixpt:20' v_d = fi(Cmax, 0, 16, 15, fm);
    //'rgbtohsv_fixpt:21' s_d = fi(delta, 0, 16, 15, fm);
    //'rgbtohsv_fixpt:22' if Cmax==0
    if (rgbtohsv_fixpt_Cmax_1 == 16'b0000000000000000) begin
      rgbtohsv_fixpt_tmp_3 = 16'b0000000000000000;
    end
    else begin
      rgbtohsv_fixpt_cast_5_1 = {rgbtohsv_fixpt_delta_1, 16'b0000000000000000};
      if (rgbtohsv_fixpt_Cmax_1 == 31'sd0) begin
        rgbtohsv_fixpt_div_temp_3 = 32'b11111111111111111111111111111111;
      end
      else begin
        rgbtohsv_fixpt_div_temp_3 = rgbtohsv_fixpt_cast_5_1 / rgbtohsv_fixpt_Cmax_1;
      end
      if (rgbtohsv_fixpt_div_temp_3[31:17] != 15'b000000000000000) begin
        rgbtohsv_fixpt_tmp_3 = 16'b1111111111111111;
      end
      else begin
        rgbtohsv_fixpt_tmp_3 = rgbtohsv_fixpt_div_temp_3[16:1];
      end
    end
    //'rgbtohsv_fixpt:27' if delta==0
    if (rgbtohsv_fixpt_delta_1 == 16'b0000000000000000) begin
      rgbtohsv_fixpt_tmp_2_1 = 16'b0000000000000000;
    end
    else begin
      rgbtohsv_fixpt_cast_6_1 = {rgbtohsv_fixpt_r_d_1, 8'b00000000};
      rgbtohsv_fixpt_cast_7_1 = rgbtohsv_fixpt_Cmax_1;
      if (rgbtohsv_fixpt_cast_6_1 == rgbtohsv_fixpt_cast_7_1) begin
        rgbtohsv_fixpt_sub_cast_2_1 = rgbtohsv_fixpt_g_d_1;
        rgbtohsv_fixpt_sub_cast_3_1 = rgbtohsv_fixpt_b_d_1;
        rgbtohsv_fixpt_sub_temp_0_1 = rgbtohsv_fixpt_sub_cast_2_1 - rgbtohsv_fixpt_sub_cast_3_1;
        if (rgbtohsv_fixpt_sub_temp_0_1[17] == 1'b1) begin
          rgbtohsv_fixpt_cast_10_1 = 17'b00000000000000000;
        end
        else begin
          rgbtohsv_fixpt_cast_10_1 = rgbtohsv_fixpt_sub_temp_0_1[16:0];
        end
        rgbtohsv_fixpt_cast_11_1 = {rgbtohsv_fixpt_cast_10_1, 16'b0000000000000000};
        if (rgbtohsv_fixpt_delta_1 == 31'sd0) begin
          rgbtohsv_fixpt_div_temp_0_1 = 33'h1FFFFFFFF;
        end
        else begin
          rgbtohsv_fixpt_div_temp_0_1 = rgbtohsv_fixpt_cast_11_1 / rgbtohsv_fixpt_delta_1;
        end
        if (rgbtohsv_fixpt_div_temp_0_1[32:12] != 21'b000000000000000000000) begin
          rgbtohsv_fixpt_tmp_2_1 = 16'b1111111111111111;
        end
        else begin
          rgbtohsv_fixpt_tmp_2_1 = {rgbtohsv_fixpt_div_temp_0_1[11:0], 4'b0000};
        end
      end
      else begin
        rgbtohsv_fixpt_cast_8_1 = {rgbtohsv_fixpt_g_d_1, 8'b00000000};
        rgbtohsv_fixpt_cast_9_1 = rgbtohsv_fixpt_Cmax_1;
        if (rgbtohsv_fixpt_cast_8_1 == rgbtohsv_fixpt_cast_9_1) begin
          rgbtohsv_fixpt_sub_cast_4_1 = rgbtohsv_fixpt_b_d_1;
          rgbtohsv_fixpt_sub_cast_5_1 = rgbtohsv_fixpt_r_d_1;
          rgbtohsv_fixpt_sub_temp_1_1 = rgbtohsv_fixpt_sub_cast_4_1 - rgbtohsv_fixpt_sub_cast_5_1;
          if (rgbtohsv_fixpt_sub_temp_1_1[17] == 1'b1) begin
            rgbtohsv_fixpt_cast_14_1 = 17'b00000000000000000;
          end
          else begin
            rgbtohsv_fixpt_cast_14_1 = rgbtohsv_fixpt_sub_temp_1_1[16:0];
          end
          rgbtohsv_fixpt_cast_15_1 = {rgbtohsv_fixpt_cast_14_1, 16'b0000000000000000};
          if (rgbtohsv_fixpt_delta_1 == 31'sd0) begin
            rgbtohsv_fixpt_div_temp_1_1 = 33'h1FFFFFFFF;
          end
          else begin
            rgbtohsv_fixpt_div_temp_1_1 = rgbtohsv_fixpt_cast_15_1 / rgbtohsv_fixpt_delta_1;
          end
          rgbtohsv_fixpt_add_cast_5 = rgbtohsv_fixpt_div_temp_1_1;
          rgbtohsv_fixpt_add_cast_0_1 = rgbtohsv_fixpt_add_cast_5;
          rgbtohsv_fixpt_add_temp_2 = 35'h000000200 + rgbtohsv_fixpt_add_cast_0_1;
          if (rgbtohsv_fixpt_add_temp_2[34] != 1'b0) begin
            rgbtohsv_fixpt_cast_18_1 = 34'h3FFFFFFFF;
          end
          else begin
            rgbtohsv_fixpt_cast_18_1 = rgbtohsv_fixpt_add_temp_2[33:0];
          end
          if (rgbtohsv_fixpt_cast_18_1[33:12] != 22'b0000000000000000000000) begin
            rgbtohsv_fixpt_tmp_2_1 = 16'b1111111111111111;
          end
          else begin
            rgbtohsv_fixpt_tmp_2_1 = {rgbtohsv_fixpt_cast_18_1[11:0], 4'b0000};
          end
        end
        else begin
          rgbtohsv_fixpt_cast_12_1 = {rgbtohsv_fixpt_b_d_1, 8'b00000000};
          rgbtohsv_fixpt_cast_13_1 = rgbtohsv_fixpt_Cmax_1;
          if (rgbtohsv_fixpt_cast_12_1 == rgbtohsv_fixpt_cast_13_1) begin
            rgbtohsv_fixpt_sub_cast_6_1 = rgbtohsv_fixpt_r_d_1;
            rgbtohsv_fixpt_sub_cast_7_1 = rgbtohsv_fixpt_g_d_1;
            rgbtohsv_fixpt_sub_temp_2_1 = rgbtohsv_fixpt_sub_cast_6_1 - rgbtohsv_fixpt_sub_cast_7_1;
            if (rgbtohsv_fixpt_sub_temp_2_1[17] == 1'b1) begin
              rgbtohsv_fixpt_cast_16_1 = 17'b00000000000000000;
            end
            else begin
              rgbtohsv_fixpt_cast_16_1 = rgbtohsv_fixpt_sub_temp_2_1[16:0];
            end
            rgbtohsv_fixpt_cast_17_1 = {rgbtohsv_fixpt_cast_16_1, 16'b0000000000000000};
            if (rgbtohsv_fixpt_delta_1 == 31'sd0) begin
              rgbtohsv_fixpt_div_temp_2_1 = 33'h1FFFFFFFF;
            end
            else begin
              rgbtohsv_fixpt_div_temp_2_1 = rgbtohsv_fixpt_cast_17_1 / rgbtohsv_fixpt_delta_1;
            end
            rgbtohsv_fixpt_add_cast_1_1 = rgbtohsv_fixpt_div_temp_2_1;
            rgbtohsv_fixpt_add_cast_2_1 = rgbtohsv_fixpt_add_cast_1_1;
            rgbtohsv_fixpt_add_temp_0_1 = 35'h000000400 + rgbtohsv_fixpt_add_cast_2_1;
            if (rgbtohsv_fixpt_add_temp_0_1[34] != 1'b0) begin
              rgbtohsv_fixpt_cast_19_1 = 34'h3FFFFFFFF;
            end
            else begin
              rgbtohsv_fixpt_cast_19_1 = rgbtohsv_fixpt_add_temp_0_1[33:0];
            end
            if (rgbtohsv_fixpt_cast_19_1[33:12] != 22'b0000000000000000000000) begin
              rgbtohsv_fixpt_tmp_2_1 = 16'b1111111111111111;
            end
            else begin
              rgbtohsv_fixpt_tmp_2_1 = {rgbtohsv_fixpt_cast_19_1[11:0], 4'b0000};
            end
          end
          else begin
            rgbtohsv_fixpt_tmp_2_1 = 16'b0000000000000000;
          end
        end
      end
    end
    //'rgbtohsv_fixpt:36' h_d = fi(h_d*fi(1/6, 0, 16, 18, fm), 0, 16, 12, fm);
    rgbtohsv_fixpt_mul_temp_2_1 = rgbtohsv_fixpt_tmp_2_1 * 43690;
    rgbtohsv_fixpt_h_d_1 = rgbtohsv_fixpt_mul_temp_2_1[31:18];
    //'rgbtohsv_fixpt:37' if h_d<0
    if (rgbtohsv_fixpt_h_d_1 < 16'b0000000000000000) begin
      rgbtohsv_fixpt_add_cast_3_1 = rgbtohsv_fixpt_h_d_1;
      rgbtohsv_fixpt_add_cast_4_1 = rgbtohsv_fixpt_add_cast_3_1;
      rgbtohsv_fixpt_add_temp_1_1 = rgbtohsv_fixpt_add_cast_4_1 + 4096;
      if (rgbtohsv_fixpt_add_temp_1_1[17] != 1'b0) begin
        rgbtohsv_fixpt_cast_20_1 = 17'b11111111111111111;
      end
      else begin
        rgbtohsv_fixpt_cast_20_1 = rgbtohsv_fixpt_add_temp_1_1[16:0];
      end
      if (rgbtohsv_fixpt_cast_20_1[16] != 1'b0) begin
        rgbtohsv_fixpt_h_d_1 = 16'b1111111111111111;
      end
      else begin
        rgbtohsv_fixpt_h_d_1 = rgbtohsv_fixpt_cast_20_1[15:0];
      end
    end
    //'rgbtohsv_fixpt:40' h = fi(uint8( h_d*fi(255, 0, 9, 0, fm) ), 0, 8, 0, fm);
    //'rgbtohsv_fixpt:41' s = fi(uint8( s_d*fi(255, 0, 9, 0, fm) ), 0, 8, 0, fm);
    //'rgbtohsv_fixpt:42' v = fi(uint8( v_d*fi(255, 0, 9, 0, fm) ), 0, 8, 0, fm);
    rgbtohsv_fixpt_mul_temp_3_1 = rgbtohsv_fixpt_h_d_1 * 255;
    if ((rgbtohsv_fixpt_mul_temp_3_1[24:20] != 5'b00000) || ((rgbtohsv_fixpt_mul_temp_3_1[24] == 1'b0) && (rgbtohsv_fixpt_mul_temp_3_1[19:12] == 8'b11111111))) begin
      rgbtohsv_fixpt_cast_21_1 = 8'b11111111;
    end
    else begin
      rgbtohsv_fixpt_cast_21_1 = rgbtohsv_fixpt_mul_temp_3_1[19:12] + rgbtohsv_fixpt_mul_temp_3_1[11];
    end
    h_1 = rgbtohsv_fixpt_cast_21_1;
    rgbtohsv_fixpt_mul_temp_4_1 = rgbtohsv_fixpt_tmp_3 * 255;
    if ((rgbtohsv_fixpt_mul_temp_4_1[24:23] != 2'b00) || ((rgbtohsv_fixpt_mul_temp_4_1[24] == 1'b0) && (rgbtohsv_fixpt_mul_temp_4_1[22:15] == 8'b11111111))) begin
      rgbtohsv_fixpt_cast_22_1 = 8'b11111111;
    end
    else begin
      rgbtohsv_fixpt_cast_22_1 = rgbtohsv_fixpt_mul_temp_4_1[22:15] + rgbtohsv_fixpt_mul_temp_4_1[14];
    end
    s_1 = rgbtohsv_fixpt_cast_22_1;
    rgbtohsv_fixpt_mul_temp_5_1 = rgbtohsv_fixpt_Cmax_1 * 255;
    if ((rgbtohsv_fixpt_mul_temp_5_1[24:23] != 2'b00) || ((rgbtohsv_fixpt_mul_temp_5_1[24] == 1'b0) && (rgbtohsv_fixpt_mul_temp_5_1[22:15] == 8'b11111111))) begin
      rgbtohsv_fixpt_cast_23_1 = 8'b11111111;
    end
    else begin
      rgbtohsv_fixpt_cast_23_1 = rgbtohsv_fixpt_mul_temp_5_1[22:15] + rgbtohsv_fixpt_mul_temp_5_1[14];
    end
    v_1 = rgbtohsv_fixpt_cast_23_1;
  end



  assign ce_out = ce;

  assign h = h_1;

  assign s = s_1;

  assign v = v_1;

endmodule  // rgbtohsv_fixpt

// -------------------------------------------------------------
// 
// File Name: C:\Users\Sechw\Documents\MATLAB\4440\codegen\xyztorgb\hdlsrc\xyztorgb_fixpt.v
// Created: 2014-12-09 12:00:13
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
// r                             ce_out        1
// g                             ce_out        1
// b                             ce_out        1
// -- -------------------------------------------------------------
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: xyztorgb_fixpt
// Source Path: xyztorgb_fixpt
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module xyztorgb_fixpt
          (
           clk,
           reset,
           ce,
           x,
           y,
           z,
           ce_out,
           r,
           g,
           b
          );


  input   clk;
  input   reset;
  input   ce;
  input   [7:0] x;  // ufix8
  input   [7:0] y;  // ufix8
  input   [7:0] z;  // ufix8
  output  ce_out;
  output  [7:0] r;  // ufix8
  output  [7:0] g;  // ufix8
  output  [7:0] b;  // ufix8


  wire enb;
  wire [21:0] xyztorgb_fixpt_mul_temp;  // ufix22_En12
  wire signed [25:0] xyztorgb_fixpt_sub_cast;  // sfix26_En14
  wire [21:0] xyztorgb_fixpt_mul_temp_1;  // ufix22_En14
  wire signed [25:0] xyztorgb_fixpt_sub_cast_1;  // sfix26_En14
  wire signed [25:0] xyztorgb_fixpt_sub_temp;  // sfix26_En14
  wire [24:0] xyztorgb_fixpt_sub_cast_2;  // ufix25_En14
  wire signed [27:0] xyztorgb_fixpt_sub_cast_3;  // sfix28_En15
  wire [21:0] xyztorgb_fixpt_mul_temp_2;  // ufix22_En15
  wire signed [27:0] xyztorgb_fixpt_sub_cast_4;  // sfix28_En15
  wire signed [27:0] xyztorgb_fixpt_sub_temp_1;  // sfix28_En15
  wire [7:0] xyztorgb_fixpt_cast;  // uint8
  wire signed [8:0] xyztorgb_fixpt_add_cast;  // sfix9
  wire signed [22:0] xyztorgb_fixpt_add_cast_1;  // sfix23_En13
  wire signed [23:0] xyztorgb_fixpt_add_cast_2;  // sfix24_En13
  wire [21:0] xyztorgb_fixpt_mul_temp_3;  // ufix22_En13
  wire signed [22:0] xyztorgb_fixpt_add_cast_3;  // sfix23_En13
  wire signed [23:0] xyztorgb_fixpt_add_cast_4;  // sfix24_En13
  wire signed [23:0] xyztorgb_fixpt_add_temp;  // sfix24_En13
  wire signed [22:0] xyztorgb_fixpt_add_cast_5;  // sfix23_En13
  wire signed [28:0] xyztorgb_fixpt_add_cast_6;  // sfix29_En18
  wire [21:0] xyztorgb_fixpt_mul_temp_4;  // ufix22_En18
  wire signed [28:0] xyztorgb_fixpt_add_cast_7;  // sfix29_En18
  wire signed [28:0] xyztorgb_fixpt_add_temp_1;  // sfix29_En18
  wire [7:0] xyztorgb_fixpt_cast_1;  // uint8
  wire [21:0] xyztorgb_fixpt_mul_temp_5;  // ufix22_En20
  wire signed [26:0] xyztorgb_fixpt_sub_cast_5;  // sfix27_En20
  wire [21:0] xyztorgb_fixpt_mul_temp_6;  // ufix22_En17
  wire signed [26:0] xyztorgb_fixpt_sub_cast_6;  // sfix27_En20
  wire signed [26:0] xyztorgb_fixpt_sub_temp_2;  // sfix27_En20
  wire [25:0] xyztorgb_fixpt_add_cast_8;  // ufix26_En20
  wire [29:0] xyztorgb_fixpt_add_cast_9;  // ufix30_En20
  wire [21:0] xyztorgb_fixpt_mul_temp_7;  // ufix22_En13
  wire [29:0] xyztorgb_fixpt_add_cast_10;  // ufix30_En20
  wire [29:0] xyztorgb_fixpt_add_temp_2;  // ufix30_En20
  wire [7:0] xyztorgb_fixpt_cast_2;  // uint8


  assign enb = ce;

  //HDL code generation from MATLAB function: xyztorgb_fixpt
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  //                                                                          %
  //       Generated by MATLAB 8.2, MATLAB Coder 2.5 and HDL Coder 3.3        %
  //                                                                          %
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  //'xyztorgb_fixpt:9' fm = fimath('RoundingMethod', 'Floor', 'OverflowAction', 'Saturate', 'ProductMode', 'FullPrecision', 'SumMode', 'FullPrecision');
  //'xyztorgb_fixpt:10' r = fi(uint8( fi(2.0413690, 0, 14, 12)*x - fi(0.5649464, 0, 14, 14)*y - fi(0.3446944, 0, 14, 15)*z ), 0, 8, 0, fm);
  //'xyztorgb_fixpt:11' g = fi(uint8( fi_uminus(x) + fi(1.8760108, 0, 14, 13, fm)*y + fi(0.0415560, 0, 14, 18, fm)*z ), 0, 8, 0, fm);
  //'xyztorgb_fixpt:17' coder.inline( 'always' );
  //'xyztorgb_fixpt:18' if isfi( a )
  //'xyztorgb_fixpt:19' nt = numerictype( a );
  //'xyztorgb_fixpt:20' fm = fimath( a );
  //'xyztorgb_fixpt:21' new_nt = numerictype( 1, nt.WordLength + 1, nt.FractionLength );
  //'xyztorgb_fixpt:22' y = -fi( a, new_nt, fm );
  //'xyztorgb_fixpt:12' b = fi(uint8( fi(0.0134474, 0, 14, 20, fm)*x - fi(0.1183897, 0, 14, 17, fm)*y + fi(1.0154096, 0, 14, 13, fm)*z ), 0, 8, 0, fm);
  assign xyztorgb_fixpt_mul_temp = 8361 * x;
  assign xyztorgb_fixpt_sub_cast = {xyztorgb_fixpt_mul_temp, 2'b00};
  assign xyztorgb_fixpt_mul_temp_1 = 9256 * y;
  assign xyztorgb_fixpt_sub_cast_1 = xyztorgb_fixpt_mul_temp_1;
  assign xyztorgb_fixpt_sub_temp = xyztorgb_fixpt_sub_cast - xyztorgb_fixpt_sub_cast_1;
  assign xyztorgb_fixpt_sub_cast_2 = (xyztorgb_fixpt_sub_temp[25] == 1'b1 ? 25'b0000000000000000000000000 :
              xyztorgb_fixpt_sub_temp[24:0]);
  assign xyztorgb_fixpt_sub_cast_3 = {xyztorgb_fixpt_sub_cast_2, 1'b0};
  assign xyztorgb_fixpt_mul_temp_2 = 11295 * z;
  assign xyztorgb_fixpt_sub_cast_4 = xyztorgb_fixpt_mul_temp_2;
  assign xyztorgb_fixpt_sub_temp_1 = xyztorgb_fixpt_sub_cast_3 - xyztorgb_fixpt_sub_cast_4;
  assign xyztorgb_fixpt_cast = (((xyztorgb_fixpt_sub_temp_1[27] == 1'b0) && (xyztorgb_fixpt_sub_temp_1[26:23] != 4'b0000)) || ((xyztorgb_fixpt_sub_temp_1[27] == 1'b0) && (xyztorgb_fixpt_sub_temp_1[22:15] == 8'b11111111)) ? 8'b11111111 :
              (xyztorgb_fixpt_sub_temp_1[27] == 1'b1 ? 8'b00000000 :
              xyztorgb_fixpt_sub_temp_1[22:15] + (xyztorgb_fixpt_sub_temp_1[14] & (( ~ xyztorgb_fixpt_sub_temp_1[27]) | (|xyztorgb_fixpt_sub_temp_1[13:0])))));
  assign r = xyztorgb_fixpt_cast;
  assign xyztorgb_fixpt_add_cast =  - (x);
  assign xyztorgb_fixpt_add_cast_1 = {xyztorgb_fixpt_add_cast[8], {xyztorgb_fixpt_add_cast, 13'b0000000000000}};
  assign xyztorgb_fixpt_add_cast_2 = xyztorgb_fixpt_add_cast_1;
  assign xyztorgb_fixpt_mul_temp_3 = 15368 * y;
  assign xyztorgb_fixpt_add_cast_3 = xyztorgb_fixpt_mul_temp_3;
  assign xyztorgb_fixpt_add_cast_4 = xyztorgb_fixpt_add_cast_3;
  assign xyztorgb_fixpt_add_temp = xyztorgb_fixpt_add_cast_2 + xyztorgb_fixpt_add_cast_4;
  assign xyztorgb_fixpt_add_cast_5 = ((xyztorgb_fixpt_add_temp[23] == 1'b0) && (xyztorgb_fixpt_add_temp[22] != 1'b0) ? 23'sb01111111111111111111111 :
              ((xyztorgb_fixpt_add_temp[23] == 1'b1) && (xyztorgb_fixpt_add_temp[22] != 1'b1) ? 23'sb10000000000000000000000 :
              $signed(xyztorgb_fixpt_add_temp[22:0])));
  assign xyztorgb_fixpt_add_cast_6 = {xyztorgb_fixpt_add_cast_5[22], {xyztorgb_fixpt_add_cast_5, 5'b00000}};
  assign xyztorgb_fixpt_mul_temp_4 = 10893 * z;
  assign xyztorgb_fixpt_add_cast_7 = xyztorgb_fixpt_mul_temp_4;
  assign xyztorgb_fixpt_add_temp_1 = xyztorgb_fixpt_add_cast_6 + xyztorgb_fixpt_add_cast_7;
  assign xyztorgb_fixpt_cast_1 = (((xyztorgb_fixpt_add_temp_1[28] == 1'b0) && (xyztorgb_fixpt_add_temp_1[27:26] != 2'b00)) || ((xyztorgb_fixpt_add_temp_1[28] == 1'b0) && (xyztorgb_fixpt_add_temp_1[25:18] == 8'b11111111)) ? 8'b11111111 :
              (xyztorgb_fixpt_add_temp_1[28] == 1'b1 ? 8'b00000000 :
              xyztorgb_fixpt_add_temp_1[25:18] + (xyztorgb_fixpt_add_temp_1[17] & (( ~ xyztorgb_fixpt_add_temp_1[28]) | (|xyztorgb_fixpt_add_temp_1[16:0])))));
  assign g = xyztorgb_fixpt_cast_1;
  assign xyztorgb_fixpt_mul_temp_5 = 14100 * x;
  assign xyztorgb_fixpt_sub_cast_5 = xyztorgb_fixpt_mul_temp_5;
  assign xyztorgb_fixpt_mul_temp_6 = 15517 * y;
  assign xyztorgb_fixpt_sub_cast_6 = {xyztorgb_fixpt_mul_temp_6, 3'b000};
  assign xyztorgb_fixpt_sub_temp_2 = xyztorgb_fixpt_sub_cast_5 - xyztorgb_fixpt_sub_cast_6;
  assign xyztorgb_fixpt_add_cast_8 = (xyztorgb_fixpt_sub_temp_2[26] == 1'b1 ? 26'b00000000000000000000000000 :
              xyztorgb_fixpt_sub_temp_2[25:0]);
  assign xyztorgb_fixpt_add_cast_9 = xyztorgb_fixpt_add_cast_8;
  assign xyztorgb_fixpt_mul_temp_7 = 8318 * z;
  assign xyztorgb_fixpt_add_cast_10 = {xyztorgb_fixpt_mul_temp_7, 7'b0000000};
  assign xyztorgb_fixpt_add_temp_2 = xyztorgb_fixpt_add_cast_9 + xyztorgb_fixpt_add_cast_10;
  assign xyztorgb_fixpt_cast_2 = ((xyztorgb_fixpt_add_temp_2[29:28] != 2'b00) || ((xyztorgb_fixpt_add_temp_2[29] == 1'b0) && (xyztorgb_fixpt_add_temp_2[27:20] == 8'b11111111)) ? 8'b11111111 :
              xyztorgb_fixpt_add_temp_2[27:20] + xyztorgb_fixpt_add_temp_2[19]);
  assign b = xyztorgb_fixpt_cast_2;



  assign ce_out = ce;

endmodule  // xyztorgb_fixpt



module constant_ae323e07fc (
  output [(1 - 1):0] op,
  input clk,
  input ce,
  input clr);
  assign op = 1'b0;
endmodule
 



module mux_1495816f5f (
  input [(2 - 1):0] sel,
  input [(8 - 1):0] d0,
  input [(8 - 1):0] d1,
  input [(8 - 1):0] d2,
  output [(8 - 1):0] y,
  input clk,
  input ce,
  input clr);
  wire [(2 - 1):0] sel_1_20;
  wire [(8 - 1):0] d0_1_24;
  wire [(8 - 1):0] d1_1_27;
  wire [(8 - 1):0] d2_1_30;
  reg [(8 - 1):0] unregy_join_6_1;
  assign sel_1_20 = sel;
  assign d0_1_24 = d0;
  assign d1_1_27 = d1;
  assign d2_1_30 = d2;
  always @(d0_1_24 or d1_1_27 or d2_1_30 or sel_1_20)
    begin:proc_switch_6_1
      case (sel_1_20)
        2'b00 :
          begin
            unregy_join_6_1 = d0_1_24;
          end
        2'b01 :
          begin
            unregy_join_6_1 = d1_1_27;
          end
        default:
          begin
            unregy_join_6_1 = d2_1_30;
          end
      endcase
    end
  assign y = unregy_join_6_1;
endmodule
 

// -------------------------------------------------------------
// 
// File Name: C:\Users\Sechw\Documents\MATLAB\4440\codegen\rgbtoxyz\hdlsrc\rgbtoxyz_fixpt.v
// Created: 2014-12-04 16:26:43
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
// x                             ce_out        1
// y                             ce_out        1
// z                             ce_out        1
// -- -------------------------------------------------------------
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: rgbtoxyz_fixpt
// Source Path: rgbtoxyz_fixpt
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module rgbtoxyz_fixpt
          (
           clk,
           reset,
           ce,
           r,
           g,
           b,
           ce_out,
           x,
           y,
           z
          );


  input   clk;
  input   reset;
  input   ce;
  input   [7:0] r;  // ufix8
  input   [7:0] g;  // ufix8
  input   [7:0] b;  // ufix8
  output  ce_out;
  output  [7:0] x;  // ufix8
  output  [7:0] y;  // ufix8
  output  [7:0] z;  // ufix8


  wire enb;
  wire [21:0] rgbtoxyz_fixpt_mul_temp;  // ufix22_En14
  wire [24:0] rgbtoxyz_fixpt_add_cast;  // ufix25_En16
  wire [21:0] rgbtoxyz_fixpt_mul_temp_1;  // ufix22_En16
  wire [24:0] rgbtoxyz_fixpt_add_cast_1;  // ufix25_En16
  wire [24:0] rgbtoxyz_fixpt_add_temp;  // ufix25_En16
  wire [25:0] rgbtoxyz_fixpt_add_cast_2;  // ufix26_En16
  wire [21:0] rgbtoxyz_fixpt_mul_temp_2;  // ufix22_En16
  wire [25:0] rgbtoxyz_fixpt_add_cast_3;  // ufix26_En16
  wire [25:0] rgbtoxyz_fixpt_add_temp_1;  // ufix26_En16
  wire [7:0] rgbtoxyz_fixpt_cast;  // uint8
  wire [21:0] rgbtoxyz_fixpt_mul_temp_3;  // ufix22_En15
  wire [23:0] rgbtoxyz_fixpt_add_cast_4;  // ufix24_En15
  wire [21:0] rgbtoxyz_fixpt_mul_temp_4;  // ufix22_En14
  wire [23:0] rgbtoxyz_fixpt_add_cast_5;  // ufix24_En15
  wire [23:0] rgbtoxyz_fixpt_add_temp_2;  // ufix24_En15
  wire [26:0] rgbtoxyz_fixpt_add_cast_6;  // ufix27_En17
  wire [21:0] rgbtoxyz_fixpt_mul_temp_5;  // ufix22_En17
  wire [26:0] rgbtoxyz_fixpt_add_cast_7;  // ufix27_En17
  wire [26:0] rgbtoxyz_fixpt_add_temp_3;  // ufix27_En17
  wire [7:0] rgbtoxyz_fixpt_cast_1;  // uint8
  wire [21:0] rgbtoxyz_fixpt_mul_temp_6;  // ufix22_En19
  wire [24:0] rgbtoxyz_fixpt_add_cast_8;  // ufix25_En19
  wire [21:0] rgbtoxyz_fixpt_mul_temp_7;  // ufix22_En17
  wire [24:0] rgbtoxyz_fixpt_add_cast_9;  // ufix25_En19
  wire [24:0] rgbtoxyz_fixpt_add_temp_4;  // ufix25_En19
  wire [28:0] rgbtoxyz_fixpt_add_cast_10;  // ufix29_En19
  wire [21:0] rgbtoxyz_fixpt_mul_temp_8;  // ufix22_En13
  wire [28:0] rgbtoxyz_fixpt_add_cast_11;  // ufix29_En19
  wire [28:0] rgbtoxyz_fixpt_add_temp_5;  // ufix29_En19
  wire [7:0] rgbtoxyz_fixpt_cast_2;  // uint8


  assign enb = ce;

  //HDL code generation from MATLAB function: rgbtoxyz_fixpt
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  //                                                                          %
  //       Generated by MATLAB 8.2, MATLAB Coder 2.5 and HDL Coder 3.3        %
  //                                                                          %
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  //'rgbtoxyz_fixpt:9' fm = fimath('RoundingMethod', 'Floor', 'OverflowAction', 'Saturate', 'ProductMode', 'FullPrecision', 'SumMode', 'FullPrecision');
  //'rgbtoxyz_fixpt:10' x = fi(uint8( fi(0.5767309, 0, 14, 14)*r + fi(0.1855540, 0, 14, 16)*g + fi(0.1881852, 0, 14, 16)*b ), 0, 8, 0, fm);
  //'rgbtoxyz_fixpt:11' y = fi(uint8( fi(0.2973769, 0, 14, 15, fm)*r + fi(0.6273491, 0, 14, 14, fm)*g + fi(0.0752741, 0, 14, 17, fm)*b ), 0, 8, 0, fm);
  //'rgbtoxyz_fixpt:12' z = fi(uint8( fi(0.0270343, 0, 14, 19, fm)*r + fi(0.0706872, 0, 14, 17, fm)*g + fi(0.9911085, 0, 14, 13, fm)*b ), 0, 8, 0, fm);
  assign rgbtoxyz_fixpt_mul_temp = 9449 * r;
  assign rgbtoxyz_fixpt_add_cast = {rgbtoxyz_fixpt_mul_temp, 2'b00};
  assign rgbtoxyz_fixpt_mul_temp_1 = 12160 * g;
  assign rgbtoxyz_fixpt_add_cast_1 = rgbtoxyz_fixpt_mul_temp_1;
  assign rgbtoxyz_fixpt_add_temp = rgbtoxyz_fixpt_add_cast + rgbtoxyz_fixpt_add_cast_1;
  assign rgbtoxyz_fixpt_add_cast_2 = rgbtoxyz_fixpt_add_temp;
  assign rgbtoxyz_fixpt_mul_temp_2 = 12333 * b;
  assign rgbtoxyz_fixpt_add_cast_3 = rgbtoxyz_fixpt_mul_temp_2;
  assign rgbtoxyz_fixpt_add_temp_1 = rgbtoxyz_fixpt_add_cast_2 + rgbtoxyz_fixpt_add_cast_3;
  assign rgbtoxyz_fixpt_cast = ((rgbtoxyz_fixpt_add_temp_1[25:24] != 2'b00) || ((rgbtoxyz_fixpt_add_temp_1[25] == 1'b0) && (rgbtoxyz_fixpt_add_temp_1[23:16] == 8'b11111111)) ? 8'b11111111 :
              rgbtoxyz_fixpt_add_temp_1[23:16] + rgbtoxyz_fixpt_add_temp_1[15]);
  assign x = rgbtoxyz_fixpt_cast;
  assign rgbtoxyz_fixpt_mul_temp_3 = 9744 * r;
  assign rgbtoxyz_fixpt_add_cast_4 = rgbtoxyz_fixpt_mul_temp_3;
  assign rgbtoxyz_fixpt_mul_temp_4 = 10278 * g;
  assign rgbtoxyz_fixpt_add_cast_5 = {rgbtoxyz_fixpt_mul_temp_4, 1'b0};
  assign rgbtoxyz_fixpt_add_temp_2 = rgbtoxyz_fixpt_add_cast_4 + rgbtoxyz_fixpt_add_cast_5;
  assign rgbtoxyz_fixpt_add_cast_6 = {rgbtoxyz_fixpt_add_temp_2, 2'b00};
  assign rgbtoxyz_fixpt_mul_temp_5 = 9866 * b;
  assign rgbtoxyz_fixpt_add_cast_7 = rgbtoxyz_fixpt_mul_temp_5;
  assign rgbtoxyz_fixpt_add_temp_3 = rgbtoxyz_fixpt_add_cast_6 + rgbtoxyz_fixpt_add_cast_7;
  assign rgbtoxyz_fixpt_cast_1 = ((rgbtoxyz_fixpt_add_temp_3[26:25] != 2'b00) || ((rgbtoxyz_fixpt_add_temp_3[26] == 1'b0) && (rgbtoxyz_fixpt_add_temp_3[24:17] == 8'b11111111)) ? 8'b11111111 :
              rgbtoxyz_fixpt_add_temp_3[24:17] + rgbtoxyz_fixpt_add_temp_3[16]);
  assign y = rgbtoxyz_fixpt_cast_1;
  assign rgbtoxyz_fixpt_mul_temp_6 = 14173 * r;
  assign rgbtoxyz_fixpt_add_cast_8 = rgbtoxyz_fixpt_mul_temp_6;
  assign rgbtoxyz_fixpt_mul_temp_7 = 9265 * g;
  assign rgbtoxyz_fixpt_add_cast_9 = {rgbtoxyz_fixpt_mul_temp_7, 2'b00};
  assign rgbtoxyz_fixpt_add_temp_4 = rgbtoxyz_fixpt_add_cast_8 + rgbtoxyz_fixpt_add_cast_9;
  assign rgbtoxyz_fixpt_add_cast_10 = rgbtoxyz_fixpt_add_temp_4;
  assign rgbtoxyz_fixpt_mul_temp_8 = 8119 * b;
  assign rgbtoxyz_fixpt_add_cast_11 = {rgbtoxyz_fixpt_mul_temp_8, 6'b000000};
  assign rgbtoxyz_fixpt_add_temp_5 = rgbtoxyz_fixpt_add_cast_10 + rgbtoxyz_fixpt_add_cast_11;
  assign rgbtoxyz_fixpt_cast_2 = ((rgbtoxyz_fixpt_add_temp_5[28:27] != 2'b00) || ((rgbtoxyz_fixpt_add_temp_5[28] == 1'b0) && (rgbtoxyz_fixpt_add_temp_5[26:19] == 8'b11111111)) ? 8'b11111111 :
              rgbtoxyz_fixpt_add_temp_5[26:19] + rgbtoxyz_fixpt_add_temp_5[18]);
  assign z = rgbtoxyz_fixpt_cast_2;



  assign ce_out = ce;

endmodule  // rgbtoxyz_fixpt

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

// -------------------------------------------------------------
// 
// File Name: C:\Users\Sechw\Documents\MATLAB\4440\codegen\yiqtorgb\hdlsrc\yiqtorgb_fixpt.v
// Created: 2014-12-04 01:24:54
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
// r                             ce_out        1
// g                             ce_out        1
// b                             ce_out        1
// -- -------------------------------------------------------------
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: yiqtorgb_fixpt
// Source Path: yiqtorgb_fixpt
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module yiqtorgb_fixpt
          (
           clk,
           reset,
           ce,
           y,
           i,
           q,
           ce_out,
           r,
           g,
           b
          );


  input   clk;
  input   reset;
  input   ce;
  input   [7:0] y;  // ufix8
  input   [7:0] i;  // ufix8
  input   [7:0] q;  // ufix8
  output  ce_out;
  output  [7:0] r;  // ufix8
  output  [7:0] g;  // ufix8
  output  [7:0] b;  // ufix8


  wire enb;
  wire [8:0] yiqtorgb_fixpt_add_cast;  // ufix9
  wire [23:0] yiqtorgb_fixpt_add_cast_1;  // ufix24_En14
  wire [21:0] yiqtorgb_fixpt_mul_temp;  // ufix22_En14
  wire [23:0] yiqtorgb_fixpt_add_cast_2;  // ufix24_En14
  wire [23:0] yiqtorgb_fixpt_add_temp;  // ufix24_En14
  wire [24:0] yiqtorgb_fixpt_add_cast_3;  // ufix25_En14
  wire [21:0] yiqtorgb_fixpt_mul_temp_1;  // ufix22_En14
  wire [24:0] yiqtorgb_fixpt_add_cast_4;  // ufix25_En14
  wire [24:0] yiqtorgb_fixpt_add_temp_1;  // ufix25_En14
  wire [7:0] yiqtorgb_fixpt_cast;  // uint8
  wire [8:0] yiqtorgb_fixpt_sub_cast;  // ufix9
  wire signed [25:0] yiqtorgb_fixpt_sub_cast_1;  // sfix26_En15
  wire [21:0] yiqtorgb_fixpt_mul_temp_2;  // ufix22_En15
  wire signed [25:0] yiqtorgb_fixpt_sub_cast_2;  // sfix26_En15
  wire signed [25:0] yiqtorgb_fixpt_sub_temp;  // sfix26_En15
  wire [24:0] yiqtorgb_fixpt_sub_cast_3;  // ufix25_En15
  wire signed [26:0] yiqtorgb_fixpt_sub_cast_4;  // sfix27_En15
  wire [21:0] yiqtorgb_fixpt_mul_temp_3;  // ufix22_En14
  wire signed [26:0] yiqtorgb_fixpt_sub_cast_5;  // sfix27_En15
  wire signed [26:0] yiqtorgb_fixpt_sub_temp_1;  // sfix27_En15
  wire [7:0] yiqtorgb_fixpt_cast_1;  // uint8
  wire [8:0] yiqtorgb_fixpt_sub_cast_6;  // ufix9
  wire signed [23:0] yiqtorgb_fixpt_sub_cast_7;  // sfix24_En13
  wire [21:0] yiqtorgb_fixpt_mul_temp_4;  // ufix22_En13
  wire signed [23:0] yiqtorgb_fixpt_sub_cast_8;  // sfix24_En13
  wire signed [23:0] yiqtorgb_fixpt_sub_temp_2;  // sfix24_En13
  wire [22:0] yiqtorgb_fixpt_add_cast_5;  // ufix23_En13
  wire [23:0] yiqtorgb_fixpt_add_cast_6;  // ufix24_En13
  wire [21:0] yiqtorgb_fixpt_mul_temp_5;  // ufix22_En13
  wire [23:0] yiqtorgb_fixpt_add_cast_7;  // ufix24_En13
  wire [23:0] yiqtorgb_fixpt_add_temp_2;  // ufix24_En13
  wire [7:0] yiqtorgb_fixpt_cast_2;  // uint8


  assign enb = ce;

  //HDL code generation from MATLAB function: yiqtorgb_fixpt
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  //                                                                          %
  //       Generated by MATLAB 8.2, MATLAB Coder 2.5 and HDL Coder 3.3        %
  //                                                                          %
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  //'yiqtorgb_fixpt:9' fm = fimath('RoundingMethod', 'Floor', 'OverflowAction', 'Saturate', 'ProductMode', 'FullPrecision', 'SumMode', 'FullPrecision');
  //'yiqtorgb_fixpt:10' r = fi(uint8( fi(1, 0, 1, 0)*y + fi(0.956, 0, 14, 14)*i + fi(0.621, 0, 14, 14)*q ), 0, 8, 0, fm);
  //'yiqtorgb_fixpt:11' g = fi(uint8( fi(1, 0, 1, 0, fm)*y - fi(0.272, 0, 14, 15, fm)*i - fi(0.647, 0, 14, 14, fm)*q ), 0, 8, 0, fm);
  //'yiqtorgb_fixpt:12' b = fi(uint8( fi(1, 0, 1, 0, fm)*y - fi(1.105, 0, 14, 13, fm)*i + fi(1.702, 0, 14, 13, fm)*q ), 0, 8, 0, fm);
  assign yiqtorgb_fixpt_add_cast = y;
  assign yiqtorgb_fixpt_add_cast_1 = {yiqtorgb_fixpt_add_cast, 14'b00000000000000};
  assign yiqtorgb_fixpt_mul_temp = 15663 * i;
  assign yiqtorgb_fixpt_add_cast_2 = yiqtorgb_fixpt_mul_temp;
  assign yiqtorgb_fixpt_add_temp = yiqtorgb_fixpt_add_cast_1 + yiqtorgb_fixpt_add_cast_2;
  assign yiqtorgb_fixpt_add_cast_3 = yiqtorgb_fixpt_add_temp;
  assign yiqtorgb_fixpt_mul_temp_1 = 10174 * q;
  assign yiqtorgb_fixpt_add_cast_4 = yiqtorgb_fixpt_mul_temp_1;
  assign yiqtorgb_fixpt_add_temp_1 = yiqtorgb_fixpt_add_cast_3 + yiqtorgb_fixpt_add_cast_4;
  assign yiqtorgb_fixpt_cast = ((yiqtorgb_fixpt_add_temp_1[24:22] != 3'b000) || ((yiqtorgb_fixpt_add_temp_1[24] == 1'b0) && (yiqtorgb_fixpt_add_temp_1[21:14] == 8'b11111111)) ? 8'b11111111 :
              yiqtorgb_fixpt_add_temp_1[21:14] + yiqtorgb_fixpt_add_temp_1[13]);
  assign r = yiqtorgb_fixpt_cast;
  assign yiqtorgb_fixpt_sub_cast = y;
  assign yiqtorgb_fixpt_sub_cast_1 = {yiqtorgb_fixpt_sub_cast, 15'b000000000000000};
  assign yiqtorgb_fixpt_mul_temp_2 = 8912 * i;
  assign yiqtorgb_fixpt_sub_cast_2 = yiqtorgb_fixpt_mul_temp_2;
  assign yiqtorgb_fixpt_sub_temp = yiqtorgb_fixpt_sub_cast_1 - yiqtorgb_fixpt_sub_cast_2;
  assign yiqtorgb_fixpt_sub_cast_3 = (yiqtorgb_fixpt_sub_temp[25] == 1'b1 ? 25'b0000000000000000000000000 :
              yiqtorgb_fixpt_sub_temp[24:0]);
  assign yiqtorgb_fixpt_sub_cast_4 = yiqtorgb_fixpt_sub_cast_3;
  assign yiqtorgb_fixpt_mul_temp_3 = 10600 * q;
  assign yiqtorgb_fixpt_sub_cast_5 = {yiqtorgb_fixpt_mul_temp_3, 1'b0};
  assign yiqtorgb_fixpt_sub_temp_1 = yiqtorgb_fixpt_sub_cast_4 - yiqtorgb_fixpt_sub_cast_5;
  assign yiqtorgb_fixpt_cast_1 = (((yiqtorgb_fixpt_sub_temp_1[26] == 1'b0) && (yiqtorgb_fixpt_sub_temp_1[25:23] != 3'b000)) || ((yiqtorgb_fixpt_sub_temp_1[26] == 1'b0) && (yiqtorgb_fixpt_sub_temp_1[22:15] == 8'b11111111)) ? 8'b11111111 :
              (yiqtorgb_fixpt_sub_temp_1[26] == 1'b1 ? 8'b00000000 :
              yiqtorgb_fixpt_sub_temp_1[22:15] + (yiqtorgb_fixpt_sub_temp_1[14] & (( ~ yiqtorgb_fixpt_sub_temp_1[26]) | (|yiqtorgb_fixpt_sub_temp_1[13:0])))));
  assign g = yiqtorgb_fixpt_cast_1;
  assign yiqtorgb_fixpt_sub_cast_6 = y;
  assign yiqtorgb_fixpt_sub_cast_7 = {yiqtorgb_fixpt_sub_cast_6, 13'b0000000000000};
  assign yiqtorgb_fixpt_mul_temp_4 = 9052 * i;
  assign yiqtorgb_fixpt_sub_cast_8 = yiqtorgb_fixpt_mul_temp_4;
  assign yiqtorgb_fixpt_sub_temp_2 = yiqtorgb_fixpt_sub_cast_7 - yiqtorgb_fixpt_sub_cast_8;
  assign yiqtorgb_fixpt_add_cast_5 = (yiqtorgb_fixpt_sub_temp_2[23] == 1'b1 ? 23'b00000000000000000000000 :
              yiqtorgb_fixpt_sub_temp_2[22:0]);
  assign yiqtorgb_fixpt_add_cast_6 = yiqtorgb_fixpt_add_cast_5;
  assign yiqtorgb_fixpt_mul_temp_5 = 13942 * q;
  assign yiqtorgb_fixpt_add_cast_7 = yiqtorgb_fixpt_mul_temp_5;
  assign yiqtorgb_fixpt_add_temp_2 = yiqtorgb_fixpt_add_cast_6 + yiqtorgb_fixpt_add_cast_7;
  assign yiqtorgb_fixpt_cast_2 = ((yiqtorgb_fixpt_add_temp_2[23:21] != 3'b000) || ((yiqtorgb_fixpt_add_temp_2[23] == 1'b0) && (yiqtorgb_fixpt_add_temp_2[20:13] == 8'b11111111)) ? 8'b11111111 :
              yiqtorgb_fixpt_add_temp_2[20:13] + yiqtorgb_fixpt_add_temp_2[12]);
  assign b = yiqtorgb_fixpt_cast_2;



  assign ce_out = ce;

endmodule  // yiqtorgb_fixpt

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

