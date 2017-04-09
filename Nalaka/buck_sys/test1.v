`timescale 1ns / 1ps

module test1;

	// Inputs
	reg clk_i;

	// Outputs
	wire [3:0] v_1_o;
	wire [15:0] v_2i_o;
	wire [15:0] v_2d_o;
	
	integer file_i;
	integer file_d;
	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk_i(clk_i), 
		.v_1_o(v_1_o), 
		.v_2i_o(v_2i_o), 
		.v_2d_o(v_2d_o)
	);
always #5 clk_i = ~ clk_i;
	initial begin
		clk_i = 0;
		file_i           		  = $fopen("integer.txt","w");
		file_d           		  = $fopen("decimal.txt","w");
		#100000;
		$fclose(file_i);
		$fclose(file_d);
		$finish;
	end
    always @ (posedge clk_i)begin
			$fwrite(file_i,"%d\n",v_2i_o);
			$fwrite(file_d,"%d\n",v_2d_o);
	 end
endmodule

