module TPU_functional (
	reset, clk, sync, out_HL,
	ready, error,
	input1, input2, out
	);

	input wire reset, clk, sync, out_HL;
	output reg ready, error;
	input wire [7:0] input1;
	input wire [7:0] input2;
	output reg [15:0] out;

	reg [31:0] accumulate;
	reg [7:0] mult_output;
	reg [5:0] mantissa;
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
	
	always @(sync, reset)
	begin
		if (reset == 1) begin
			accumulate = 0;
			error = 0;
			ready = 1;
			mult_output = 0;
		end
		else if (sync == 1)
			begin
				ready = 0;
				mult_output[7] = input1[7] ^ input2[7]; //sign bit
				exponent = input1[6:3] + input2[6:3];
				mantissa = input1[2:0] * input2[2:0];
				// bit shift mantissa and update exponent
				if (mantissa[5] == 1) begin
					mantissa = mantissa >> 3;
					exponent = exponent + 3;
				end
				else if (mantissa[4] == 1) begin
					mantissa = mantissa >> 2;
					exponent = exponent + 2;
				end
				else if (mantissa[3] == 1) begin
					mantissa = mantissa >> 1;
					exponent = exponent + 1;
				end
				// check for exponent overflow
				if (exponent[5:4] != 2'b00) begin
					error = 1;
					mult_output = 8'b11111111; //NaN (infinity maybe?)
				end
				else begin
					mult_output[6:3] = exponent[3:0];
					mult_output[2:0] = mantissa[2:0];
				end

				// Bit shift to create integer
				bitshift_out = {1'b1, mult_output[2:0]} << (mult_output[6:3] - 1);
				if (mult_output[7] == 1) begin // negative
					bitshift_out = bitshift_out ^ 32'b11111111111111111111111111111111;
					bitshift_out = bitshift_out + 1;
				end
				
				// accumulate
				accumulate = accumulate + bitshift_out;

				ready = 1;

			end
		end
endmodule
