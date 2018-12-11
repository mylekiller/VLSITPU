module xor32b (
	number, sign, output
	);

	input wire [31:0] number;
	input wire sign;
	output wire [31:0] number_2comp;

	wire [31:0] sign_shift;
	wire [31:0] clause1;
	wire [31:0] clause2;

	shift_left_32	sl1(sign, sign_shift);

	inv32b		i1(number, not_number);
	inv32b		i2(sign_shift, not_sign_shift);

	and32b		a1(sign_shift, not_number, clause1);
	and32b		a2not_sign_shift, number, clause2);
	or32b		o1(clause1, clause2, number_2comp);

endmodule
