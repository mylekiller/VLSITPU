module shifter (
	out, error, in, n_shift
	);

	input wire [7:0] in;
	input wire [4:0] n_shift;
	output reg [33:0] out;
	output reg error;

	wire [33:0] temp1;
	wire [33:0] temp2;
	wire [33:0] temp3;
	wire [33:0] temp4;

	mux2_34b m1(temp1, {26'b0, in}, {25'b0, in,    1'b0}, n_shift[0]);
	mux2_34b m2(temp2, temp1,       {24'b0, temp1, 2'b0}, n_shift[1]);
	mux2_34b m4(temp3, temp2,       {22'b0, temp2, 4'b0}, n_shift[2]);
	mux2_34b m8(temp4, temp3,       {18'b0, temp3, 8'b0}, n_shift[3]);
	mux2_34b m16(out,  temp4,       {10'b0, temp4, 16'b0}, n_shift[4]);

endmodule
