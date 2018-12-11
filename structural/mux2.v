module mux2_1b(d, a, b, select);
	input wire a;
	input wire b;
	input wire select;
	output wire d;

	wire not_c, clause1, clause2;

	inv 	i1(not_c, c);
	and		a1(a, c, clause1);
	and		a2(b, not_c, clause2);
	or		o1(clause1, clause2, d);

endmodule

module mux2_32b(d, a, b, c);
	input wire [31:0] a;
	input wire [31:0] b;
	input wire c;
	output wire [31:0] d;

	mux2_1b 	m1(a[0], b[0], c, d[0]);
	mux2_1b 	m2(a[1], b[1], c, d[1]);
	mux2_1b 	m3(a[2], b[2], c, d[2]);
	mux2_1b 	m4(a[3], b[3], c, d[3]);
	mux2_1b 	m5(a[4], b[4], c, d[4]);
	mux2_1b 	m6(a[5], b[5], c, d[5]);
	mux2_1b 	m7(a[6], b[6], c, d[6]);
	mux2_1b 	m8(a[7], b[7], c, d[7]);

	mux2_1b 	m9(a[8], b[8], c, d[8]);
	mux2_1b 	m10(a[9], b[9], c, d[9]);
	mux2_1b 	m11(a[10], b[10], c, d[10]);
	mux2_1b 	m12(a[11], b[11], c, d[11]);
	mux2_1b 	m13(a[12], b[12], c, d[12]);
	mux2_1b 	m14(a[13], b[13], c, d[13]);
	mux2_1b 	m15(a[14], b[14], c, d[14]);
	mux2_1b 	m16(a[15], b[15], c, d[15]);

	mux2_1b 	m17(a[16], b[16], c, d[16]);
	mux2_1b 	m18(a[17], b[17], c, d[17]);
	mux2_1b 	m19(a[18], b[18], c, d[18]);
	mux2_1b 	m20(a[19], b[19], c, d[19]);
	mux2_1b 	m21(a[20], b[20], c, d[20]);
	mux2_1b 	m22(a[21], b[21], c, d[21]);
	mux2_1b 	m23(a[22], b[22], c, d[22]);
	mux2_1b 	m24(a[23], b[23], c, d[23]);

	mux2_1b 	m25(a[24], b[24], c, d[24]);
	mux2_1b 	m26(a[25], b[25], c, d[25]);
	mux2_1b 	m27(a[26], b[26], c, d[26]);
	mux2_1b 	m28(a[27], b[27], c, d[27]);
	mux2_1b 	m29(a[28], b[28], c, d[28]);
	mux2_1b 	m30(a[29], b[29], c, d[29]);
	mux2_1b 	m31(a[30], b[30], c, d[30]);
	mux2_1b 	m32(a[31], b[31], c, d[31]);





endmodule
