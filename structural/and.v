module and32b(c, a, b);

	input wire [31:0] a;
	input wire [31:0] b;
	output wire [31:0] c;

	and 	a1(a[0], b[0], c[0]);
	and 	a2(a[1], b[1], c[1]);
	and 	a3(a[2], b[2], c[2]);
	and 	a4(a[3], b[3], c[3]);
	and 	a5(a[4], b[4], c[4]);
	and 	a6(a[5], b[5], c[5]);
	and 	a7(a[6], b[6], c[6]);
	and 	a8(a[7], b[7], c[7]);

	and 	a9(a[8], b[8], c[8]);
	and 	a10(a[9], b[9], c[9]);
	and 	a11(a[10], b[10], c[10]);
	and 	a12(a[11], b[11], c[11]);
	and 	a13(a[12], b[12], c[12]);
	and 	a14(a[13], b[13], c[13]);
	and 	a15(a[14], b[14], c[14]);
	and 	a16(a[15], b[15], c[15]);

	and 	a17(a[16], b[16], c[16]);
	and 	a18(a[17], b[17], c[17]);
	and 	a19(a[18], b[18], c[18]);
	and 	a20(a[19], b[19], c[19]);
	and 	a21(a[20], b[20], c[20]);
	and 	a22(a[21], b[21], c[21]);
	and 	a23(a[22], b[22], c[22]);
	and 	a24(a[23], b[23], c[23]);

	and 	a25(a[24], b[24], c[24]);
	and 	a26(a[25], b[25], c[25]);
	and 	a27(a[26], b[26], c[26]);
	and 	a28(a[27], b[27], c[27]);
	and 	a29(a[28], b[28], c[28]);
	and 	a30(a[29], b[29], c[29]);
	and 	a31(a[30], b[30], c[30]);
	and 	a32(a[31], b[31], c[31]);

endmodule
