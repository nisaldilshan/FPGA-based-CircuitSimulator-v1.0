`timescale 1ns / 1ps

module elbertNotGate( Switch_0, Clk, B, clk1, SevenSegment_0, SevenSegment_1, SevenSegment_2, SevenSegment_3, SevenSegment_4, SevenSegment_5, SevenSegment_6, SevenSegment_7, Enable_0, Enable_1, Enable_2);
	input   Switch_0;
	input   Clk;
	output  B;
	output  clk1;
	
	output SevenSegment_0;
	output SevenSegment_1;
	output SevenSegment_2;
	output SevenSegment_3;
	output SevenSegment_4;
	output SevenSegment_5;
	output SevenSegment_6;
	output SevenSegment_7;
	output Enable_0;
	output Enable_1;
	output Enable_2;
		
	wire [31:0] v_1_o;
	wire [15:0] v_2i_o;
	wire [15:0] v_2d_o;
	wire  a;
	
	wire clk2;
	
	wire [11:0] test ;
	
	clock_divider k1 (.Clk(Clk),
							.clk1(clk1),
							.clk2(clk2)
							);
	
	buck_converter k2 (.clk_i(clk1),
							 .v_1_o(v_1_o), 
							 .v_2i_o(v_2i_o), 
							 .v_2d_o(v_2d_o), 
							 .a_out(a)
							 );
							 
	average k3 (.iclk(clk1), .v_2i_o(v_2i_o), .v_2d_o(v_2d_o), .disp_7seg(test));
	
	Sevn_segment_display k4	(.clk(clk2),
									 .iDIG (test),
									 .s0(SevenSegment_0),
									 .s1(SevenSegment_1),
									 .s2(SevenSegment_2),
									 .s3(SevenSegment_3),
									 .s4(SevenSegment_4),
									 .s5(SevenSegment_5),
									 .s6(SevenSegment_6),
									 .s7(SevenSegment_7),
									 .e0(Enable_0),
									 .e1(Enable_1),
									 .e2(Enable_2)
									 );

   assign B = !Switch_0;
	
endmodule
