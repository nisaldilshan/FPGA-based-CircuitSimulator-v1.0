`timescale 1ns / 1ps

module top(
	clk_i,
	v_1_o,
	v_2i_o,
	v_2d_o,
	a_out
);

input 		clk_i;
output  [31:0]		v_1_o;
output  [15:0]		v_2i_o;
output  [15:0]		v_2d_o;
output    	a_out;
 
reg [9:0]	r_counter = 10'd0; 

reg  [31:0]	   r_e_val = 32'd0;
reg  [31:0] 	v_1     = 32'd0;

reg  [63:0] 	v_2     = 64'd0;
reg  [63:0] 	i_l     = 64'd0;
reg  [63:0] 	i_c     = 64'd0;

reg  a = 1'b0;

// L = 50x10^-3
// C = 50x10^-6
// R = 10

wire  [31:0] 	CONST_1   =    {16'b0000_0000_0000_0000,16'b0000_0000_1000_0011}; //... T/L = 0.002 [0,9] nearly equal to 9'b1 in fixed point format
wire  [31:0] 	CONST_2   =    {16'b0000_0000_0000_0000,16'b1110_1000_1000_0100}; //9'b111010001; // 0.90826... <= (1/1.101)
wire  [31:0] 	CONST_3   =    {16'b0000_0000_0000_0010,16'b0000_0000_0000_0000}; //4C/T = 2
wire  [31:0] 	CONST_4   =    {16'b0000_0000_0000_0000,16'b0000_0000_0011_1011}; //13'd7; //... 1/1101       

always @( clk_i) 
	begin 
	
	if(r_counter < 100) 
		begin
		r_e_val 		= 		{16'b0000_0000_0000_0000,16'b0000_0000_0000_0000};
		r_counter 	= r_counter +1;
		end	
	else if (r_counter >= 100 && r_counter < 200) 
		begin
		r_e_val 		= 		{16'b0000_0000_0000_1010,16'b0000_0000_0000_0000};
		r_counter 	= r_counter +1;
		end
	else 
		begin
		r_counter 	= 0;
		end
	//////////////// Main Equations for V2 output ////////////////////////////////////////	
	if(a == 1'b0)
		begin
		i_l 	= i_l + ((v_1 - v_2[47:16])* CONST_1);
		i_c 	= (v_2[47:16]* CONST_3) - i_c ;
		end
	else 
		begin
		v_2 	= ((i_l[47:16] + i_c[47:16]) * CONST_2) +(r_e_val * CONST_4);
		v_1 	= r_e_val;
		end
	////////////////////////////////////////////////////////////////////////
	a = a+ 1'b1;
	end

assign v_1_o = v_1 ;
assign v_2i_o = v_2[47:32] ;
assign v_2d_o = v_2[31:16] ;
assign a_out = a;

endmodule
