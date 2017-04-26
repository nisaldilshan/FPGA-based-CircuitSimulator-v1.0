`timescale 1ns / 1ps

module Sevn_segment_display(clk, iDIG, s0, s1, s2, s3, s4, s5, s6, s7, e0, e1, e2);
	
	input clk;
	input	[11:0]	iDIG;
	output s0, s1, s2, s3, s4, s5, s6, s7, e0, e1, e2;
	
	wire [7:0] oSEG0;
	wire [7:0] oSEG1;
	wire [7:0] oSEG2;
	
	SEVEN_SEGMENT_LUT	u0	(iDIG[3:0], oSEG0	);
	SEVEN_SEGMENT_LUT u1	(iDIG[7:4], oSEG1	);
	SEVEN_SEGMENT_LUT u2	(iDIG[11:8],oSEG2 );
	
	reg [7:0] value = 0;
	reg [2:0] en = 0;
	reg [1:0] p = 0;

	always@(posedge clk)
	begin
	if(p == 2'b00)
		begin
		value <= oSEG0;
		en <= 3'b110;
		p <= p+1;
		end
	else if(p == 2'b01)
		begin
		value <= oSEG1;
		en <= 3'b101;
		p <= p+1;
		end
	else if(p == 2'b10)
		begin
		value <= oSEG2;
		en <= 3'b011;
		p <= 2'b00;
		end
	else 
		begin
		p <= 2'b00;
		en <= 3'b111;
		end
	
	end
	
	assign s0 = value[0];
	assign s1 = value[1];
	assign s2 = value[2];
	assign s3 = value[3];
	assign s4 = value[4];
	assign s5 = value[5];
	assign s6 = value[6];
	assign s7 = value[7];
	
	assign e0 = en[0];
	assign e1 = en[1];
	assign e2 = en[2];

endmodule
