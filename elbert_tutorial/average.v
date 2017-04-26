`timescale 1ns / 1ps

module average(iclk,v_2i_o,v_2d_o, disp_7seg);

	input iclk;
	input [15:0] v_2i_o;
	input [15:0] v_2d_o;
	output reg [11:0] disp_7seg;
	reg [10:0] count = 0;
	reg [63:0] value =0;
	
	always@(posedge iclk)
		begin
		count <= count +1;
		if(count < 1024)
			begin
			value <= (value + {v_2i_o[3:0],v_2d_o[15:8]}); //>> 10;	
			end
		else
			begin
			disp_7seg <= value >> 10;
			value <= 0;
			count <= 0;
			end
		end
	
	
endmodule
