module xor34b (
	number_2comp, number, sign
	);

	input wire [33:0] number;
	input wire sign;
	output wire [33:0] number_2comp;

	xor 	x1(number_2comp[0], number[0], sign);
	xor 	x2(number_2comp[1], number[1], sign);
	xor 	x3(number_2comp[2], number[2], sign);
	xor 	x4(number_2comp[3], number[3], sign);
	xor 	x5(number_2comp[4], number[4], sign);
	xor 	x6(number_2comp[5], number[5], sign);
	xor 	x7(number_2comp[6], number[6], sign);
	xor 	x8(number_2comp[7], number[7], sign);

	xor 	x9(number_2comp[8], number[8], sign);
	xor 	x10(number_2comp[9], number[9], sign);
	xor 	x11(number_2comp[10], number[10], sign);
	xor 	x12(number_2comp[11], number[11], sign);
	xor 	x13(number_2comp[12], number[12], sign);
	xor 	x14(number_2comp[13], number[13], sign);
	xor 	x15(number_2comp[14], number[14], sign);
	xor 	x16(number_2comp[15], number[15], sign);

	xor 	x17(number_2comp[16], number[16], sign);
	xor 	x18(number_2comp[17], number[17], sign);
	xor 	x19(number_2comp[18], number[18], sign);
	xor 	x20(number_2comp[19], number[19], sign);
	xor 	x21(number_2comp[20], number[20], sign);
	xor 	x22(number_2comp[21], number[21], sign);
	xor 	x23(number_2comp[22], number[22], sign);
	xor 	x24(number_2comp[23], number[23], sign);

	xor 	x25(number_2comp[24], number[24], sign);
	xor 	x26(number_2comp[25], number[25], sign);
	xor 	x27(number_2comp[26], number[26], sign);
	xor 	x28(number_2comp[27], number[27], sign);
	xor 	x29(number_2comp[28], number[28], sign);
	xor 	x30(number_2comp[29], number[29], sign);
	xor 	x31(number_2comp[30], number[30], sign);
	xor 	x32(number_2comp[31], number[31], sign);
	xor 	x33(number_2comp[32], number[32], sign);
	xor 	x34(number_2comp[33], number[33], sign);


endmodule
