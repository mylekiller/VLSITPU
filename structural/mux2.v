module mux2_1b(d, a, b, select);
	input wire a;
	input wire b;
	input wire select;
	output wire d;

	wire not_select, clause1, clause2;

	not 	i1(not_select, select);
	and		a1(clause1, a, not_select);
	and		a2(clause2, b, select);
	or		o1(d, clause1, clause2);

endmodule


module mux2_17b(d, a, b, c);
	input wire [16:0] a;
	input wire [16:0] b;
	input wire c;
	output wire [16:0] d;

	mux2_1b 	m1(d[0], a[0], b[0], c);
	mux2_1b 	m2(d[1], a[1], b[1], c);
	mux2_1b 	m3(d[2], a[2], b[2], c);
	mux2_1b 	m4(d[3], a[3], b[3], c);
	mux2_1b 	m5(d[4], a[4], b[4], c);
	mux2_1b 	m6(d[5], a[5], b[5], c);
	mux2_1b 	m7(d[6], a[6], b[6], c);
	mux2_1b 	m8(d[7], a[7], b[7], c);

	mux2_1b 	m9( d[8],  a[8],  b[8], c);
	mux2_1b 	m10(d[9],  a[9],  b[9], c);
	mux2_1b 	m11(d[10], a[10], b[10], c);
	mux2_1b 	m12(d[11], a[11], b[11], c);
	mux2_1b 	m13(d[12], a[12], b[12], c);
	mux2_1b 	m14(d[13], a[13], b[13], c);
	mux2_1b 	m15(d[14], a[14], b[14], c);
	mux2_1b 	m16(d[15], a[15], b[15], c);
	mux2_1b 	m17(d[16], a[16], b[16], c);

endmodule


module mux2_34b(d, a, b, c);
	input wire [33:0] a;
	input wire [33:0] b;
	input wire c;
	output wire [33:0] d;

	mux2_1b 	m1(d[0], a[0], b[0], c);
	mux2_1b 	m2(d[1], a[1], b[1], c);
	mux2_1b 	m3(d[2], a[2], b[2], c);
	mux2_1b 	m4(d[3], a[3], b[3], c);
	mux2_1b 	m5(d[4], a[4], b[4], c);
	mux2_1b 	m6(d[5], a[5], b[5], c);
	mux2_1b 	m7(d[6], a[6], b[6], c);
	mux2_1b 	m8(d[7], a[7], b[7], c);

	mux2_1b 	m9(d[8], a[8], b[8], c);
	mux2_1b 	m10(d[9], a[9], b[9], c);
	mux2_1b 	m11(d[10], a[10], b[10], c);
	mux2_1b 	m12(d[11], a[11], b[11], c);
	mux2_1b 	m13(d[12], a[12], b[12], c);
	mux2_1b 	m14(d[13], a[13], b[13], c);
	mux2_1b 	m15(d[14], a[14], b[14], c);
	mux2_1b 	m16(d[15], a[15], b[15], c);

	mux2_1b 	m17(d[16], a[16], b[16], c);
	mux2_1b 	m18(d[17], a[17], b[17], c);
	mux2_1b 	m19(d[18], a[18], b[18], c);
	mux2_1b 	m20(d[19], a[19], b[19], c);
	mux2_1b 	m21(d[20], a[20], b[20], c);
	mux2_1b 	m22(d[21], a[21], b[21], c);
	mux2_1b 	m23(d[22], a[22], b[22], c);
	mux2_1b 	m24(d[23], a[23], b[23], c);

	mux2_1b 	m25(d[24], a[24], b[24], c);
	mux2_1b 	m26(d[25], a[25], b[25], c);
	mux2_1b 	m27(d[26], a[26], b[26], c);
	mux2_1b 	m28(d[27], a[27], b[27], c);
	mux2_1b 	m29(d[28], a[28], b[28], c);
	mux2_1b 	m30(d[29], a[29], b[29], c);
	mux2_1b 	m31(d[30], a[30], b[30], c);
	mux2_1b 	m32(d[31], a[31], b[31], c);

	mux2_1b 	m33(d[32], a[32], b[32], c);
	mux2_1b 	m34(d[33], a[33], b[33], c);

endmodule

