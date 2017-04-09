`timescale 1ns / 1ps

module top(
	clk_i,
	v_1_o,
	v_2i_o,
	v_2d_o
);

input 		clk_i;
output [3:0]		v_1_o;
output [15:0]		v_2i_o;
output [15:0]		v_2d_o;

reg [13:0] 	r_t;
reg [6:0] 	r_tsw;
reg 			r_d;
 
reg [6:0]	r_counter; 
reg [3:0]	r_e_val;

reg [3:0] 	v_1;
reg [31:0] 	v_2;
reg [31:0] 	i_l;
reg [31:0] 	i_c;
reg [40:0]	temp_1;
reg [40:0]	temp_2;

localparam[8:0] 	CONST_1   =    9'b1; //... T/L = 0.002 [0,9]
localparam[8:0] 	CONST_2   =    9'b111010001; // 0.90826... <= (1/1.101)
localparam[12:0] 	CONST_3   =    9'd7; //... 1/1101
initial begin
	r_t 			= 		14'b1;
	r_tsw 		= 		7'b1;
	r_d			= 		1'b1;
	r_counter 	= 		0;
	r_e_val 		=		10;
	v_1			=		0;
	v_2			=		0;
	i_l			= 		0;
	i_c			= 		0;	
	temp_1 		=		0;
	temp_2 		=		0;
end         

always @(posedge clk_i) begin 
	if(r_counter < 50) begin
		r_e_val 		<= 		4'd10;
		r_counter 	<= r_counter +1;
	end	
	else if (r_counter >= 100) begin
		r_counter 	<= 0;
	end
	else begin
		r_e_val 		<= 		4'd0;
		r_counter 	<= r_counter +1;
	end
	
	temp_2 	<= ({temp_2[40:9],9'b000_000_000} + ({12'b0000_0000_0000, v_1 ,16'b0000_0000_0000_0000} - temp_1[40:9])* CONST_1);
	//i_l  		<= temp_2[40:9];
	
	i_c 		<= (temp_1[40:9]* 2) - i_c; 			//......4*c/T = 2
	
	v_1 		<= r_e_val;
	
	temp_1 	<= temp_2[40:9] * CONST_2 + {13'b000_00000_00000, r_e_val * CONST_3 ,12'b0000_0000_0000};
	//v_2 		<= temp_1[40:9];
	
end

assign v_1_o = v_1 ;
assign v_2i_o = temp_1[40:25] ;
assign v_2d_o = temp_1[24:9] ;

endmodule
