module TPU_structural (
	reset, clk, out_HL, error,
	input1, input2, out
	);

	input wire reset, clk, out_HL;
	input wire [7:0] input1;
	input wire [7:0] input2;

	output reg error;
	output wire [15:0] out;

	wire [31:0] accumulate;

	wire [31:0] product_regular;
	wire [31:0] product_tcomp;
	wire [31:0] accumulate_output;
	wire [7:0] 	mult_output;
	wire [5:0] 	mantissa;
	wire [4:0] 	exponent;
	wire sign;

	xor			x1(sign, input1[7], input2[7]);
	add4b		a4(exponent, input1[6:3], input2[6:3]);
	mult3b		m1(mantissa, input1[2:0], input2[2:0]);

	shifter		s1(mantissa, exponent, error, product_regular);

	xor32b		x2(product_regular, sign, product_tcomp);

	tad32		t1(product_tcomp, accumulate, reset, sync, accumulate_output);

	dec			d1(accumulate_output, out_HL, out);

	mux2		m1(sync, ready);



endmodule
