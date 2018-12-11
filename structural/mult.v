// multiplier

module mult3b(output [5:0] product, input [2:0] a, [2:0] b);

wire [2:1] sum0,[2:0] sum1,[2:0] sum2,[2:0] n1,[2:0] n2,[1:0] cout1,[2:0] cout2,[2:0] cout3;

	// Row 1
	and 		and00 (product[0], a[0], b[0]);
	and 		and01 (sum0[1], a[0], b[1]);
	and 		and02 (sum0[2], a[0], b[2]);

	// Row 2
	and 		and10 (n1[0], a[1], b[0]);
	full_adder	add10 (product[1], cout1[0], n1[0], sum0[1], 1‘b0);
	and 		and11 (n1[1], a[1], b[1]);
	full_adder	add11 (sum1[1], cout1[1], n1[1], sum0[2], 1‘b0);
	and 		and12 (sum1[2], a[1], b[2]);

	// Row 3
	and 		and20 (n2[0], a[2], b[0]);
	full_adder	add20 (product[2], cout2[0], n2[0], sum1[1], cout1[0]);
	and 		and21 (n2[1], a[2], b[1]);
	full_adder	add21 (sum2[1], cout2[1], n2[1], sum1[2], cout1[1]);
	and 		and22 (n2[2], a[2], b[2]);
	full_adder	add22 (sum2[2], cout2[2], n2[2], b’0, cout1[2]);

`	// Row 4
	full_adder	add30 (product[3], cout3[0], 0, sum2[1], cout2[0]);
	full_adder	add31 (product[4], cout3[1], cout3[0], sum2[2], cout2[1]);
	full_adder	add32 (product[5], cout3[2], cout3[1],  b’0, cout2[2]);

endmodule
