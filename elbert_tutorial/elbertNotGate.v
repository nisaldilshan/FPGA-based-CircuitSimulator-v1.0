`timescale 1ns / 1ps

module elbertNotGate( A, B, E, result);

	input wire A;
	output reg B = 1'b0;
	output reg[15:0] E = 16'b0;
	output wire [31:0] result;
	
	reg[3:0] c = 4'b0;
	reg[15:0] E_val = 16'd7;
	
	wire signed [15:0] dataa = 16'b1111111111111110;
	wire signed [15:0] datab = 16'b0000000000000111;

	
	SignedMultiplier_16bit a1 (dataa, datab, A, 1'b0, result);
	
///////////////////////////////////////////////////	
	always@(posedge A)
	begin
	 c = c + 4'b1;
	 B = c[3];
	end
////////////////////////////////////////////////////	
	always@(posedge A)
	begin
	 if(c[3])
	 begin
		E = E_val;
	 end
	 
	 else
	 begin
		E = 16'b0;
	 end
	 
//	 I_L = I_L  + (v_1-v_2)*T/L;
//    I_C = -I_C + 4*v_2*C/T;        
//   z = [-I_L  ;  I_L+I_C  ; E];

	
	
	end
////////////////////////////////////////////////////	
endmodule
