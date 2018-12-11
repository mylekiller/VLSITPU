module TPU_functional (
	reset, clk, out_HL,
	error,
	input1, input2, out
	);

	input wire reset, clk, out_HL;
	output reg error;
	input wire [7:0] input1;
	input wire [7:0] input2;
	output reg [15:0] out;

	reg [31:0] accumulate;
	reg signbit;
	reg [7:0] mantissa;
	reg [5:0] exponent;
	reg [31:0] bitshift_out;

	always @(out_HL)
	begin
		if (out_HL == 0) begin
			out = accumulate[15:0];
		end
		else if(out_HL == 1) begin
			out = accumulate[31:16];
		end
	end
	
	always @(posedge clk)
	begin
		if (reset == 1) begin
			accumulate = 0;
			error = 0;
			signbit = 0;
		end
		else
			begin
				signbit = input1[7] ^ input2[7]; //sign bit
				exponent = input1[6:3] + input2[6:3];
				mantissa = {1'b1,input1[2:0]} * {1'b1, input2[2:0]};

				// Bit shift to create integer
				bitshift_out = mantissa << (exponent - 2);
				if (signbit == 1) begin // negative
					bitshift_out = bitshift_out ^ 32'd4294967295;
					bitshift_out = bitshift_out + 1;
				end
				
				// accumulate
				accumulate = accumulate + bitshift_out;


			end
		end
endmodule
