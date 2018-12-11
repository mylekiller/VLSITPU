module TPU_structural (
	reset, clk, out_HL, error,
	input1, input2, out
	);

	input wire reset, clk, out_HL;
	input wire [7:0] input1;
	input wire [7:0] input2;

	output wire error;
	output wire [15:0] out;

	wire [31:0] accumulate;

	wire [31:0] accumulate_wire;

	wire [31:0] product_regular;
	wire [31:0] product_tcomp;
	wire [7:0] 	mult_output;
	wire [5:0] 	mantissa;
	wire [4:0] 	exponent;
	wire sign;

	xor			x1(sign, input1[7], input2[7]);
	add4b		a1(exponent, input1[6:3], input2[6:3]);
	mult3b		m1(mantissa, input1[2:0], input2[2:0]);

	shifter		s1(product_regular, mantissa, exponent, error);

	xor32b		x2(product_tcomp, product_regular, sign);

	add32b		a2(accumulate_wire, accumulate, product_tcomp);

	mux2_32b 	m2(accumulate_wire, accumulate_wire, 0, reset);

	d_flip_flop	d1(accumulate, clk, accumulate_wire);


	mux2_16b	m3(out, accumulate, out_HL);

endmodule
