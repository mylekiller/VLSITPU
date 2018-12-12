// functional/structural adder
// http://tjeyamy.blogspot.com/2012/02/4-bit-ripple-carry-adder-in-verilog.html

module add4b(sum, input1, input2, cin);
	input wire [3:0] input1;
	input wire [3:0] input2;
	input wire cin;
	output wire [4:0] sum;

	wire c1, c2, c3;

	fulladder fa1(sum[0], c1, input1[0], input2[0], cin);
	fulladder fa2(sum[1], c2, input1[1], input2[1], c1);
	fulladder fa3(sum[2], c3, input1[2], input2[2], c2);
	fulladder fa4(sum[3], sum[4], input1[3], input2[3], c3);

endmodule


module add34b(sum, input1, input2, cin);
	input wire [33:0] input1;
	input wire [33:0] input2;
	input wire cin;
	output wire [33:0] sum;

	wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17;
	wire c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31,c32;

	fulladder fa1(sum[0], c1, input1[0], input2[0], cin);
	fulladder fa2(sum[1], c2, input1[1], input2[1], c1);

	fulladder fa3(sum[2], c3, input1[2], input2[2], c2);
	fulladder fa4(sum[3], c4, input1[3], input2[3], c3);
	fulladder fa5(sum[4], c5, input1[4], input2[4], c4);
	fulladder fa6(sum[5], c6, input1[5], input2[5], c5);
	fulladder fa7(sum[6], c7, input1[6], input2[6], c6);
	fulladder fa8(sum[7], c8, input1[7], input2[7], c7);
	fulladder fa9(sum[8], c9, input1[8], input2[8], c8);
	fulladder fa10(sum[9], c10, input1[9], input2[9], c9);
	
	fulladder fa11(sum[10], c11, input1[10], input2[10], c10);
	fulladder fa12(sum[11], c12, input1[11], input2[11], c11);
	fulladder fa13(sum[12], c13, input1[12], input2[12], c12);
	fulladder fa14(sum[13], c14, input1[13], input2[13], c13);
	fulladder fa15(sum[14], c15, input1[14], input2[14], c14);
	fulladder fa16(sum[15], c16, input1[15], input2[15], c15);
	fulladder fa17(sum[16], c17, input1[16], input2[16], c16);
	fulladder fa18(sum[17], c18, input1[17], input2[17], c17);

	fulladder fa19(sum[18], c19, input1[18], input2[18], c18);
	fulladder fa20(sum[19], c20, input1[19], input2[19], c19);
	fulladder fa21(sum[20], c21, input1[20], input2[20], c20);
	fulladder fa22(sum[21], c22, input1[21], input2[21], c21);
	fulladder fa23(sum[22], c23, input1[22], input2[22], c22);
	fulladder fa24(sum[23], c24, input1[23], input2[23], c23);
	fulladder fa25(sum[24], c25, input1[24], input2[24], c24);
	fulladder fa26(sum[25], c26, input1[25], input2[25], c25);

	fulladder fa27(sum[26], c27, input1[26], input2[26], c26);
	fulladder fa28(sum[27], c28, input1[27], input2[27], c27);
	fulladder fa29(sum[28], c29, input1[28], input2[28], c28);
	fulladder fa30(sum[29], c30, input1[29], input2[29], c29);
	fulladder fa31(sum[30], c31, input1[30], input2[30], c30);
	fulladder fa32(sum[31], c32, input1[31], input2[31], c31);
	fulladder fa33(sum[32], sum[33], input1[3], input2[3], c32);

endmodule

module fulladder(sum, cout, a, b, cin);
	input wire a;
	input wire b;
	input wire cin;
	output wire sum;
	output wire cout;

	wire c1, c2, c3;

	xor 	x1(c1, a, b);
	xor 	x2(sum, c1, cin);
	and   	a1(c3, a, b);
	or		o1(cout, c2, c3);

endmodule
