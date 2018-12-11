module TPU_functional (
	reset, clk, out_HL,
	error,
	input1, input2, out
	);

	input wire reset, clk, out_HL;
	output reg error;
	input wire [7:0] input1;
	input wire [7:0] input2;
	output reg [16:0] out;

	reg [33:0] accumulate;
	reg signbit;
	reg [7:0] mantissa;
	reg [5:0] exponent;
	reg [33:0] bitshift_out;
	reg norm1;
	reg norm2;

	always @(*)
	begin
		if (out_HL == 0) begin
			out = accumulate[16:0];
		end
		else if(out_HL == 1) begin
			out = accumulate[33:17];
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
				if (input1[6:3] != 0) begin
					norm1 = 1;
				end
				else begin
					norm1 = 0;
				end
				if (input2[6:3] != 0) begin
					norm2 = 1;
				end
				else begin
					norm2 = 0;
				end	
				signbit = input1[7] ^ input2[7]; //sign bit
				exponent = input1[6:3] + input2[6:3];
				mantissa = {norm1, input1[2:0]} * {norm2, input2[2:0]};

				// Bit shift to create integer
				bitshift_out = mantissa << (exponent - norm1 - norm2);
				if (signbit == 1) begin // negative
					bitshift_out = bitshift_out ^ 34'd17179869183;
					bitshift_out = bitshift_out + 1;
				end
				
				// accumulate
				accumulate = accumulate + bitshift_out;


			end
		end
endmodule
