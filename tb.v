`timescale 1 ns / 1 ns
module tpu_tb;

	reg reset, clk, sync, out_HL;
	wire ready, error;
	reg [7:0] input1;
	reg [7:0] input2;
	wire [15:0] out;
	
	TPU_functional uut(reset, clk, sync, out_HL, ready, error, input1, input2, out);
	
	initial
	begin
		clk = 0; reset = 1; out_HL = 0;
		#10 reset = 0; input1 = 8'b00001101; input2 = 8'b00001111; sync = 1;
		#10 sync = 0;
		#10 out_HL = 1;
		#10 out_HL = 0;
		
		
		
	