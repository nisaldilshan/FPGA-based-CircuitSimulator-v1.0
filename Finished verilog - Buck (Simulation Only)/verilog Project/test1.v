`timescale 1ns / 1ps

module test1;



	// Inputs
	reg clk_i;

	// Outputs
	wire [31:0] v_1_o;
	wire [15:0] v_2i_o;
	wire [15:0] v_2d_o;
	wire  a;
	
	integer file_i;
	integer file_d;
	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk_i(clk_i), 
		.v_1_o(v_1_o), 
		.v_2i_o(v_2i_o), 
		.v_2d_o(v_2d_o),
		.a_out(a)
	);
always #50000 clk_i = ~ clk_i;
	initial begin
		clk_i = 0;
		file_i           		  = $fopen("integer.txt","w");
		file_d           		  = $fopen("decimal.txt","w");
		#500000000;
		$fclose(file_i);
		$fclose(file_d);
		$finish;
	end
    always @ (posedge clk_i)
	 begin
		if(a == 1'b1)
			begin
			$fwrite(file_i,"%d\n",(v_2i_o));//$signed
			$fwrite(file_d,"%d\n",v_2d_o);
			end
	 end
	 
	 
	 
endmodule
