`timescale 1ns / 1ps

module SignedMultiplier_16bit
(	
	input signed [7:0] dataa, datab,
	input 		clock, aclr,
	output reg signed	[7:0] result1,
	output reg signed	[7:0] result2
);


	reg signed	[7:0] dataa_reg, datab_reg;
	reg signed	[15:0] mult0_result;

	always @ (posedge clock or posedge aclr) begin
    	if (aclr) begin
			dataa_reg <= {8{1'b0}};
			datab_reg <= {8{1'b0}};
			mult0_result <= {16{1'b0}};
			result1 <= {8{1'b0}};
			result2 <= {8{1'b0}};
		end
		else begin
			dataa_reg <= dataa;
			datab_reg <= datab;
			mult0_result <= dataa_reg * datab_reg;
			result1 = mult0_result[15:8];
			result2 = mult0_result[7:0];
		end
	end
endmodule
