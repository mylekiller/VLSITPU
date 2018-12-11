module TPU_structural (
	reset, clk, out_HL,input1, input2, error, out
	);

	input wire reset, clk, out_HL;
	input wire [7:0] input1;
	input wire [7:0] input2;

	output wire error;
	output wire [15:0] out;

	wire [31:0] accumulate;
	wire [31:0] accumulate_wire;
	wire [31:0] accumulate_wire_final;

	wire [31:0] product_regular;
	wire [31:0] product_tcomp;
	wire [5:0] 	mult_output;

	wire [4:0] 	exponent;
	wire [4:0] 	exp_mod1;
	wire [4:0] 	exp_mod2;

	wire sign;

	wire t1_1, t2_1, norm_1;
	wire t1_2, t2_2, norm_2;

	/* Calculate sign and exponent */
	xor			x1(sign, input1[7], input2[7]);
	add4b		a1(exponent, input1[6:3], input2[6:3], 0);

	/* Get normalized vs. denormanlized for each input */
	or 			o1(t1_1, input1[3], input1[4]);
	or 			o2(t2_1, input1[5], input1[6]);
	or 			o3(norm_1, t2_1, t1_1);
	or 			o1(t1_2, input2[3], input2[4]);
	or 			o2(t2_2, input2[5], input2[6]);
	or 			o3(norm_2, t2_2, t1_2);

	/* Calculate ~mult_output~ */
	mult4b		m1(mult_output, {norm_1, input1[2:0]}, {norm_2, input2[2:0]});

	/* Adjust exponent */
	sub4b		z1(exp_mod1, exponent, norm_1);
	sub4b		z2(exp_mod2, exp_mod1, norm_2);

	/* Shift input correctly */
	shifter		s1(product_regular, error, mult_output, exp_mod2);

	/* Get the twos complement of the product*/
	xor32b		x2(product_tcomp, product_regular, sign);

	/* Add the accumulate and the product */
	add32b		a2(accumulate_wire, accumulate, product_tcomp, sign); // sign is cin

	/* Either 0 or accumulate wire goes to accumulate*/
	mux2_32b 	m2(accumulate_wire_final, 0, accumulate_wire, reset);

	/* Only change on posedge */
	d_flip_flop	d1(accumulate, clk, accumulate_wire_final);

	/* See which bits to select */
	mux2_17b	m3(out, accumulate[33:17], accumulate[16:0], out_HL);

endmodule