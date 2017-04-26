`timescale 1ns / 1ps

module test_bench; // create a module called elbert_testBox 


   wire out;         // create an output called wire
   reg clock;         // create a register called clock
	
	wire [31:0] v_1_o;
	wire [15:0] v_2i_o;
	wire [15:0] v_2d_o;
	wire  a;

   always begin     // Start the clock oscillating
   #1 clock =!clock;
   end

   initial begin        // Initialize clock at zero
   clock = 0;
       
   #1000000;          // Wait 10 ns to end simulation
   $finish;
 
   end
   
   elbertNotGate NotGate(.Clk(clock), .clk1(out), .v_1_o(v_1_o), .v_2i_o(v_2i_o), .v_2d_o(v_2d_o), .a(a) ); // Set the outputs
   
endmodule

