  /* Added by HAN Haiyang */
  wire [31:0] divider_quotient0;
  wire [32:0] divider_quotient1;
  wire [32:0] divider_quotient2;
  wire [32:0] divider_quotient3;
  
  wire [15:0] divider_fractional0;
  wire [7:0] divider_fractional1;
  wire [7:0] divider_fractional2;
  wire [7:0] divider_fractional3;
  
  divider0 divider0 (
	.clk(clk), // input clk
	.nd(1), // input nd
	//.rdy(1), // output rdy
	//.rfd(1), // output rfd
	.dividend(rgbtohsv_fixpt_cast_5_1), // input [31 : 0] dividend
	.divisor(rgbtohsv_fixpt_Cmax_1), // input [15 : 0] divisor
	.quotient(divider_quotient0), // output [31 : 0] quotient
	.fractional(divider_fractional0)); // output [15 : 0] fractional
	
	divider1 divider1 (
	.clk(clk), // input clk
	.nd(1), // input nd
	//.rdy(1), // output rdy
	//.rfd(1), // output rfd
	.dividend(rgbtohsv_fixpt_cast_11_1), // input [32 : 0] dividend
	.divisor(rgbtohsv_fixpt_delta_1), // input [15 : 0] divisor
	.quotient(divider_quotient1), // output [32 : 0] quotient
	.fractional(divider_fractional1)); // output [7 : 0] fractional
  
   divider1 divider2 (
	.clk(clk), // input clk
	.nd(1), // input nd
	//.rdy(1), // output rdy
	//.rfd(1), // output rfd
	.dividend(rgbtohsv_fixpt_cast_15_1), // input [32 : 0] dividend
	.divisor(rgbtohsv_fixpt_delta_1), // input [15 : 0] divisor
	.quotient(divider_quotient2), // output [32 : 0] quotient
	.fractional(divider_fractional2)); // output [7 : 0] fractional
	
	 divider1 divider3 (
	.clk(clk), // input clk
	.nd(1), // input nd
	//.rdy(1), // output rdy
	//.rfd(1), // output rfd
	.dividend(rgbtohsv_fixpt_cast_17_1), // input [32 : 0] dividend
	.divisor(rgbtohsv_fixpt_delta_1), // input [15 : 0] divisor
	.quotient(divider_quotient3), // output [32 : 0] quotient
	.fractional(divider_fractional3)); // output [7 : 0] fractional
	
	/*end of code added by HAN Haiyang */