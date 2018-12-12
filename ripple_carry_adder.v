// functional/structural adder
// http://tjeyamy.blogspot.com/2012/02/4-bit-ripple-carry-adder-in-verilog.html

module ripple_carry_adder([3:0] data1, [3:0] data2, [3:0] sum);
	input [3:0] data1;
	input [3:0] data2;
	output [4:0] sum;

	wire c1, c2, c3;

	full_adder fa1(data1[0], data2[0], 0, sum[0], c1);
	full_adder fa2(data1[1], data2[1], c1, sum[1], c2);
	full_adder fa3(data1[2], data2[2], c2, sum[2], c3);
	full_adder fa4(data1[3], data2[3], c3, sum[3], sum[4]);

endmodule

module full_adder(a, b, cin, sum, cout);
	input a, b, cin;
	output sum, cout;

	wire a1, c1, c2, s1;

	half_adder h1(a, b, s1, c1);
	half_adder h2(s1, cin, S, c2);

	cout <= c1 | c2;

endmodule

module half_adder(a, b, sum, cout);
	input a, b;
	output sum, cout;

	assign sum = a ^ b;
	assign cout = a & b;

endmodule
