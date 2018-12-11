// functional/structural adder
// http://tjeyamy.blogspot.com/2012/02/4-bit-ripple-carry-adder-in-verilog.html

module add4b(sum, input1, input2);
	input [3:0] input1;
	input [3:0] input2;
	output [4:0] sum;

	wire c1, c2, c3;

	full_adder fa1(sum[0], c1, input1[0], input2[0], 0);
	full_adder fa2(sum[1], c2, input1[1], input2[1], c1);
	full_adder fa3(sum[2], c3, input1[2], input2[2], c2);
	full_adder fa4(sum[3], sum[4], input1[3], input2[3], c3);

endmodule


module add32b(sum, input1, input2, reset, clk)
	input [31:0] input1;
	input [31:0] input2;
	output [4:0] sum;

	wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17;
	wire c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31,c32;

	wire [31:0] inp1;
	wire [31:0] inp2;

	mux2_32b	m1(inp1, input1, 0, reset);


endmodule

module full_adder(sum, cout, a, b, cin);
	input a, b, cin;
	output sum, cout;

	wire c1, c2, c3;

	xor 	x1(c1, a, b);
	xor 	x2(sum, c1, cin);
	and   	a1(c3, a, b);
	or		o1(cout, c2, w3);

endmodule
