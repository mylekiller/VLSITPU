module xor32b (
	number, sign, number_2comp
	);

	input wire [31:0] number;
	input wire sign;
	output wire [31:0] number_2comp;

	xor 	x1(number[0], sign, number_2comp[0]);
	xor 	x2(number[1], sign, number_2comp[1]);
	xor 	x3(number[2], sign, number_2comp[2]);
	xor 	x4(number[3], sign, number_2comp[3]);
	xor 	x5(number[4], sign, number_2comp[4]);
	xor 	x6(number[5], sign, number_2comp[5]);
	xor 	x7(number[6], sign, number_2comp[6]);
	xor 	x8(number[7], sign, number_2comp[7]);

	xor 	x9(number[8], sign, number_2comp[8]);
	xor 	x10(number[9], sign, number_2comp[9]);
	xor 	x11(number[10], sign, number_2comp[10]);
	xor 	x12(number[11], sign, number_2comp[11]);
	xor 	x13(number[12], sign, number_2comp[12]);
	xor 	x14(number[13], sign, number_2comp[13]);
	xor 	x15(number[14], sign, number_2comp[14]);
	xor 	x16(number[15], sign, number_2comp[15]);

	xor 	x17(number[16], sign, number_2comp[16]);
	xor 	x18(number[17], sign, number_2comp[17]);
	xor 	x19(number[18], sign, number_2comp[18]);
	xor 	x20(number[19], sign, number_2comp[19]);
	xor 	x21(number[20], sign, number_2comp[20]);
	xor 	x22(number[21], sign, number_2comp[21]);
	xor 	x23(number[22], sign, number_2comp[22]);
	xor 	x24(number[23], sign, number_2comp[23]);

	xor 	x25(number[24], sign, number_2comp[24]);
	xor 	x26(number[25], sign, number_2comp[25]);
	xor 	x27(number[26], sign, number_2comp[26]);
	xor 	x28(number[27], sign, number_2comp[27]);
	xor 	x29(number[28], sign, number_2comp[28]);
	xor 	x30(number[29], sign, number_2comp[29]);
	xor 	x31(number[30], sign, number_2comp[30]);
	xor 	x32(number[31], sign, number_2comp[31]);

endmodule
