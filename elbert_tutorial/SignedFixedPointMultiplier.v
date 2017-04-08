`timescale 1ns / 1ps

 module SignedFixedPointMultiplier(

	input signed [15:0] dataa, datab,
	input 		clock, aclr,
	output reg 	[15:0] result1,
	output reg 	[15:0] result2	
    );
		
	reg signed	[15:0] dataa_reg, datab_reg;
	reg signed	[31:0] mult0_result;

	always @ (dataa or datab) begin
    	if (aclr) begin
			dataa_reg = {16{1'b0}};
			datab_reg = {16{1'b0}};
			mult0_result = {32{1'b0}};
			result1 = {16{1'b0}};
			result2 = {16{1'b0}};
		end
		else begin
			dataa_reg = dataa;
			datab_reg = datab;
			mult0_result = dataa_reg * datab_reg;
			result1 = mult0_result[31:16];
			result2 = mult0_result[15:0];
		end
	end

endmodule
