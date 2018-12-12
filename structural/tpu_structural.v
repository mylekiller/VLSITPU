module tpu_structural (
	reset, clk, out_HL,error, input1, input2, out
	);

	input wire reset, clk, out_HL;
	input wire [7:0] input1;
	input wire [7:0] input2;

	output wire error;
	output wire [16:0] out;

	wire [33:0] accumulate;
	wire [33:0] accumulate_wire;
	wire [33:0] accumulate_wire_final;

	wire [33:0] product_regular;
	wire [33:0] product_tcomp;
	wire [7:0] 	mult_output;

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
	or 			o4(t1_2, input2[3], input2[4]);
	or 			o5(t2_2, input2[5], input2[6]);
	or 			o6(norm_2, t2_2, t1_2);

	/* Calculate ~mult_output~ */
	mult4b		m1(mult_output, {norm_1, input1[2:0]}, {norm_2, input2[2:0]});

	/* Adjust exponent */
	sub4b		z1(exp_mod1, exponent, norm_1);
	sub4b		z2(exp_mod2, exp_mod1, norm_2);

	/* Shift input correctly */
	shifter		s1(product_regular, error, mult_output, exp_mod2);

	/* Get the twos complement of the product*/
	xor34b		x2(product_tcomp, product_regular, sign);

	/* Add the accumulate and the product */
	add34b		a2(accumulate_wire, accumulate, product_tcomp, sign); // sign is cin

	/* Either 0 or accumulate wire goes to accumulate*/
	mux2_34b 	m2(accumulate_wire_final, accumulate_wire, 34'b0, reset);

	/* Only change on posedge */
	d_flip_flop34b	d1(accumulate, clk, accumulate_wire_final);
	//always @(posedge clk) begin
	//	accumulate = accumulate_wire_final;
	//end

	/* See which bits to select */
	mux2_17b	m3(out, accumulate[16:0], accumulate[33:17], out_HL);

endmodule
