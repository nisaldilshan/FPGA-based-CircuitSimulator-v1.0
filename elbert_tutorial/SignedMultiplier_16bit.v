`timescale 1ns / 1ps

module SignedMultiplier_16bit
(	
	input signed [15:0] dataa, datab,
	input 		clock, aclr,
	output reg 	[31:0] result
);

	reg signed	[15:0] dataa_reg, datab_reg;
	reg signed	[31:0] mult0_result;

	always @ (posedge clock or posedge aclr) begin
    	if (aclr) begin
			dataa_reg <= {16{1'b0}};
			datab_reg <= {16{1'b0}};
			mult0_result <= {32{1'b0}};
			result <= {33{1'b0}};
		end
		else begin
			dataa_reg <= dataa;
			datab_reg <= datab;
			mult0_result <= dataa_reg * datab_reg;
			result <= mult0_result;
		end
	end
endmodule
