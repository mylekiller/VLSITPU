module xor1b (
	s1, s2, output
	);

	input wire s1;
	input wire s2;
	output wire sign;

	wire not_s1, not_s2, clause1, clause2;


	inv 		i1(s1, not_s1);
	inv 		i2(s2, not_s2);

	and			a1(s1, not_s2, clause1);
	and			a2(not_s1, s2, clause2);
	or  		o1(c1, c2, sign);

endmodule


module xor30b (
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
