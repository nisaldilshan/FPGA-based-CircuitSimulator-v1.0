`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:32:12 04/05/2017
// Design Name:   top
// Module Name:   E:/FYP/verilog/buck_sys/test.v
// Project Name:  buck_sys
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg clk_i;

	// Outputs
	wire [15:0] v_1i_o;
	wire [15:0] v_2i_o;
	wire [15:0] v_1d_o;
	wire [15:0] v_2d_o;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk_i(clk_i), 
		.v_1i_o(v_1i_o), 
		.v_2i_o(v_2i_o), 
		.v_1d_o(v_1d_o), 
		.v_2d_o(v_2d_o)
	);

	initial begin
		// Initialize Inputs
		clk_i = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

