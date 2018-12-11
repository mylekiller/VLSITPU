// http://verilogbynaresh.blogspot.com/2013/07/design-of-4-bit-subtractor-using.html

module sub4b(diff, a,b);
	input [3:0] wire a;
	input [3:0] wire b; 
	output [3:0] wire diff;

	wire [2:0] s; 
	wire [3:0] l;

	fulladder u0(diff[0],s[0],a[0],l[0],1'b1);
	fulladder u1(diff[1],s[1],a[1],l[1],s[0]);
	fulladder u2(diff[2],s[2],a[2],l[2],s[1]);
	fulladder u3(diff[3],borrow,a[3],l[3],s[2]);

endmodule