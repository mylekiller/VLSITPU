module shifter (
	out, error, in, n_shift
	);

	input wire [7:0] in;
	input wire [4:0] n_shift;
	output wire [34:0] out;
	output wire error;


	assign out = in << n_shift;
	assign error = 0;

endmodule
