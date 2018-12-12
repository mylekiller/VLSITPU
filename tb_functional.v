`timescale 1 ns / 1 ns
module tpu_tb;

	reg reset, clk, out_HL;
	wire error;
	reg [7:0] input1;
	reg [7:0] input2;
	wire [16:0] out;
	
	TPU_functional uut_func(reset, clk, out_HL, error, input1, input2, out);
	
	initial
	begin
		clk = 1; reset = 1; out_HL = 0; input1 = 8'b00001101; input2 = 8'b00001111;
		#15 reset = 0; out_HL = 1;//output should be (195) out_HL = 1;
		#5 out_HL = 1;
		#5 out_HL = 0;
		#5 input1 = 8'b00101001; input2 = 8'b00101111; //output should be (34560)
		// when added to the previous number should be (34755)
		#5 out_HL = 1; input1 = 8'd0; input2 = 8'd0;
		#5 out_HL = 0;
		#5 input1 = 8'b10001001; input2 = 8'b00001001; //-9*9=-81 total output should be 34755-81 = 34674
		#5 out_HL = 1;
		#5 out_HL = 0; input1 = 8'd0; input2 = 8'd0; reset = 1;
		#15 reset = 0; input1 = 8'b00000001; input2 = 8'b00000001; //output should be (1)
		#5 input1 = 8'b10001001; input2 = 8'b10000010; //-9*-2=18 Plus the previous 1 stored should be 19
		#5 out_HL = 1;
		#5 input1 = 8'd0; input2 = 8'd0; out_HL = 0;
		#10 $stop;
		
	end
	
	always begin
		#5 clk = !clk;
	end
	
endmodule
		
		
		
	