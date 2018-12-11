// Taken from http://barrywatson.se/dd/dd_d_flip_flop_edge_triggered.html


module d_flip_flop32b(Q, C, D);
   output wire    [31:0] Q;
   input  wire    C;
   input  wire    [31:0] D;

   wire    [31:0] Qn;

   d_flip_flop    d1(Q[0], Qn[0], C, D[0]);
   d_flip_flop    d2(Q[1], Qn[1], C, D[1]);
   d_flip_flop    d3(Q[2], Qn[2], C, D[2]);
   d_flip_flop    d4(Q[3], Qn[3], C, D[3]);
   d_flip_flop    d5(Q[4], Qn[4], C, D[4]);
   d_flip_flop    d6(Q[5], Qn[5], C, D[5]);
   d_flip_flop    d7(Q[6], Qn[6], C, D[6]);
   d_flip_flop    d8(Q[7], Qn[7], C, D[7]);

   d_flip_flop    d9(Q[8], Qn[8], C, D[8]);
   d_flip_flop    d10(Q[9], Qn[9], C, D[9]);
   d_flip_flop    d11(Q[10], Qn[10], C, D[10]);
   d_flip_flop    d12(Q[11], Qn[11], C, D[11]);
   d_flip_flop    d13(Q[12], Qn[12], C, D[12]);
   d_flip_flop    d14(Q[13], Qn[13], C, D[13]);
   d_flip_flop    d15(Q[14], Qn[14], C, D[14]);
   d_flip_flop    d16(Q[15], Qn[15], C, D[15]);

   d_flip_flop    d17(Q[16], Qn[16], C, D[16]);
   d_flip_flop    d18(Q[17], Qn[17], C, D[17]);
   d_flip_flop    d19(Q[18], Qn[18], C, D[18]);
   d_flip_flop    d20(Q[19], Qn[19], C, D[19]);
   d_flip_flop    d21(Q[20], Qn[20], C, D[20]);
   d_flip_flop    d22(Q[21], Qn[21], C, D[21]);
   d_flip_flop    d23(Q[22], Qn[22], C, D[22]);
   d_flip_flop    d24(Q[23], Qn[23], C, D[23]);

   d_flip_flop    d25(Q[24], Qn[24], C, D[24]);
   d_flip_flop    d26(Q[25], Qn[25], C, D[25]);
   d_flip_flop    d27(Q[26], Qn[26], C, D[26]);
   d_flip_flop    d28(Q[27], Qn[27], C, D[27]);
   d_flip_flop    d29(Q[28], Qn[28], C, D[28]);
   d_flip_flop    d30(Q[29], Qn[29], C, D[29]);
   d_flip_flop    d31(Q[30], Qn[30], C, D[30]);
   d_flip_flop    d32(Q[31], Qn[31], C, D[31]);

endmodule


module d_flip_flop(Q, Qn, C, D);
   output wire    Q;
   output wire    Qn;
   input  wire    C;
   input  wire    D;

   wire           Cn;   // Control input to the D latch.
   wire           Cnn;  // Control input to the SR latch.
   wire           DQ;   // Output from the D latch, input to the gated SR latch.
   wire           DQn;  // Output from the D latch, input to the gated SR latch.
   
   inv            i1(Cn, C);
   inv            i2(Cnn, Cn);   
   d_latch        dl(DQ, DQn, Cn, D);
   sr_latch_gated sr(Q, Qn, Cnn, DQ, DQn);   
endmodule


module d_latch(Q, Qn, G, D);
   output wire Q;
   output wire Qn;
   input  wire G;   
   input  wire D;

   wire   Dn; 
   wire   D1;
   wire   Dn1;

   inv   i1(Dn, D);   
   and   a1(D1, G, D);
   and   a2(Dn1, G, Dn);   

   nor   n1(Qn, D1, Q);
   nor   n2(Q, Dn1, Qn);
endmodule

module sr_latch_gated(Q, Qn, G, S, R);
   output wire Q;
   output wire Qn;
   input  wire G;
   input  wire S;
   input  wire R;

   wire   S1;
   wire   R1;
   
   and a1(S1, G, S);
   and a2(R1, G, R);   
   nor n1(Qn, S1, Q);
   nor n2(Q, R1, Qn);
endmodule // sr_latch_gated
