// http://verilogbynaresh.blogspot.com/2013/07/design-of-4-bit-subtractor-using.html

module sub4b(diff, a,b);
	input wire [4:0] a;
	input wire  b; 
	output wire [4:0] diff;

	wire [3:0] s; 
	wire l;
	wire borrow;
	
	not n0(l, b);

	fulladder u0(diff[0],s[0],a[0],l,1'b1);
	fulladder u1(diff[1],s[1],a[1],1,s[0]);
	fulladder u2(diff[2],s[2],a[2],1,s[1]);
	fulladder u3(diff[3],s[3],a[3],1,s[2]);
	fulladder u4(diff[4],borrow,a[4],1,s[3]);

endmodule