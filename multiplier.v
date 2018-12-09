// multiplier

module mult3x3(input [2:0] a, [2:0] b, output [5:0] c);

wire [2:1] sum0,[2:0] sum1,[2:0] sum2,[2:0] n1,[2:0] n2,[1:0] cout1,[2:0] cout2,[2:0] cout3;

	// Row 1
	and 		and00 (a[0], b[0], c[0]);
	and 		and01 (a[0], b[1], sum0[1]);
	and 		and02 (a[0], b[2], sum0[2]);

	// Row 2
	and 		and10 (a[1], b[0], n1[0]);
	full_adder	add10 (n1[0], sum0[1], 1‘b0, c[1], cout1[0]);
	and 		and11 (a[1], b[1], n1[1]);
	full_adder	add11 (n1[1], sum0[2], 1‘b0, sum1[1], cout1[1]);
	and 		and12 (a[1], b[2], sum1[2]);

	// Row 3
	and 		and20 (a[2], b[0], n2[0]);
	full_adder	add20 (n2[0], sum1[1], cout1[0], c[2], cout2[0]);
	and 		and21 (a[2], b[1], n2[1]);
	full_adder	add21 (n2[1], sum1[2], cout1[1], sum2[1], cout2[1]);
	and 		and22 (a[2], b[2], n2[2]);
	full_adder	add22 (n2[2], b’0, cout1[2], sum2[2], cout2[2]);

`	// Row 4
	full_adder	add30 (b’0, sum2[1], cout2[0], c[3], cout3[0]);
	full_adder	add31 (cout3[0], sum2[2], cout2[1], c[4], cout3[1]);
	full_adder	add32 (cout3[1],  b’0, cout2[2], c[5], cout3[2]);

endmodule

module and(input a, b, output c);

	assign c = a & b;

endmodule

