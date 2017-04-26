`timescale 1ns / 1ps

module SEVEN_SEGMENT_LUT(iDIG, oSEG);

	input	 [3:0]	  iDIG;
	output reg [7:0] oSEG;

	always @(iDIG)
	begin
			case(iDIG)
			4'h1: oSEG = ~8'b01100000;	   // ---t----
			4'h2: oSEG = ~8'b11011010; 	// |	  |
			4'h3: oSEG = ~8'b11110010; 	// lt	 rt
			4'h4: oSEG = ~8'b01100110; 	// |	  |
			4'h5: oSEG = ~8'b10110110; 	// ---m----
			4'h6: oSEG = ~8'b10111110; 	// |	  |
			4'h7: oSEG = ~8'b11100000; 	// lb	 rb
			4'h8: oSEG = ~8'b11111110; 	// |	  |
			4'h9: oSEG = ~8'b11110110; 	// ---b----
			4'ha: oSEG = ~8'b11101110;
			4'hb: oSEG = ~8'b00111110;
			4'hc: oSEG = ~8'b10011100;
			4'hd: oSEG = ~8'b01111010;
			4'he: oSEG = ~8'b10011110;
			4'hf: oSEG = ~8'b10001110;
			4'h0: oSEG = ~8'b11111100;
			endcase
	end

endmodule
