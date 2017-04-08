`timescale 1ns / 1ps

module test_bench; // create a module called elbert_testBox 

   wire out1;         // create an output called wire
	wire[15:0] out2;         // create an output called wire
	wire[31:0] out3;
	wire[15:0] out4;
	wire[15:0] out5;
   reg clock;         // create a register called clock

   always begin     // Start the clock oscillating
   #1 clock =!clock;
   end

   initial begin        // Initialize clock at zero
   clock = 0;
       
   #200;          // Wait 10 ns to end simulation
   $finish;
 
   end
	

   elbertNotGate NotGate(clock, out1, out2, out3, out4, out5); // Set the outputs
   
endmodule

