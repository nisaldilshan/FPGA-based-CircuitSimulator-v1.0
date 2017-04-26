`timescale 1ns / 1ps

module clock_divider( Clk , clk1, clk2);
	input   Clk;
	output reg  clk1;
	output reg  clk2;
	
	reg	[10:0]	Cont;
	reg	[12:0]	Cont2;
	
	always@(posedge Clk)
	begin
		Cont <= Cont +1;
		Cont2 <= Cont2 +1;
		if(Cont < 11'd600)
			clk1 <= 0;
		else if(Cont >= 11'd600 && Cont < 11'd1200)
			clk1 <= 1;
		else
			Cont <= 0;
			
		if(Cont2 < 13'd4096)
			clk2 <= 0;
		else
			clk2 <= 1;

	end


endmodule
