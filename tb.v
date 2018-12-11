`timescale 1 ns / 1 ns
module tpu_tb;

	reg reset, clk, out_HL;
	wire error;
	reg [7:0] input1;
	reg [7:0] input2;
	wire [16:0] out;
	
	TPU_functional uut(reset, clk, out_HL, error, input1, input2, out);
	
	initial
	begin
		clk = 1; reset = 1; out_HL = 0; input1 = 8'b00001101; input2 = 8'b00001111;
		#5 reset = 0; //output should be 11000000 (195)
		#5 out_HL = 1;
		#5 out_HL = 0;
		#5 input1 = 8'b00101001; input2 = 8'b00101111; //output should be 1111000000000 (7680)
		// when added to the previous number should be 1111011000000 (7872)
		#5 out_HL = 1; input1 = 8'd0; input2 = 8'd0;
		#5 out_HL = 0;
		#5 input1 = 8'b10001001; input2 = 8'b00001001;
		#5 out_HL = 1;
		#5 out_HL = 0; input1 = 8'd0; input2 = 8'd0; reset = 1;
		#10 reset = 0; input1 = 8'b00000001; input2 = 8'b00000001;
		#10 input1 = 8'd0; input2 = 8'd0;
		
	end
	
	always begin
		#5 clk = !clk;
	end
	
endmodule
		
		
		
	