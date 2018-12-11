// functional/structural adder
// http://tjeyamy.blogspot.com/2012/02/4-bit-ripple-carry-adder-in-verilog.html

module add4b(sum, data1, data2);
	input [3:0] data1;
	input [3:0] data2;
	output [4:0] sum;

	wire c1, c2, c3;

	full_adder fa1(sum[0], c1, data1[0], data2[0], 0);
	full_adder fa2(sum[1], c2, data1[1], data2[1], c1);
	full_adder fa3(sum[2], c3, data1[2], data2[2], c2);
	full_adder fa4(sum[3], sum[4], data1[3], data2[3], c3);

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
