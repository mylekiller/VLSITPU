module array4x4(a,b,p);
    //inputs
    input [3:0]a,b;
    //outputs
    output [7:0]p;
    
    //wires
    wire [39:0]w;
    
    //andgate instantiations 
    and a1(w[0],a[0],b[0]);
    and a2(w[1],a[1],b[0]);
    and a3(w[2],a[2],b[0]);
    and a4(w[3],a[3],b[0]);
    
    and a5(w[4],a[0],b[1]);
    and a6(w[5],a[1],b[1]);
    and a7(w[6],a[2],b[1]);
    and a8(w[7],a[3],b[1]);
    
    and a9(w[8],a[0],b[2]);
    and a10(w[9],a[1],b[2]);
    and a11(w[10],a[2],b[2]);
    and a12(w[11],a[3],b[2]);
    
    and a13(w[12],a[0],b[3]);
    and a14(w[13],a[1],b[3]);
    and a15(w[14],a[2],b[3]);
    and a16(w[15],a[3],b[3]);
    
    assign p[0]=w[0];
    //full adders instatiations
    fulladder a17(1'b0,w[1],w[4],w[16],w[17]);
    fulladder a18(1'b0,w[2],w[5],w[18],w[19]);
    fulladder a19(1'b0,w[3],w[6],w[20],w[21]);
    
    fulladder a20(w[8],w[17],w[18],w[22],w[23]);
    fulladder a21(w[9],w[19],w[20],w[24],w[25]);
    fulladder a22(w[10],w[7],w[21],w[26],w[27]);
    
    fulladder a23(w[12],w[23],w[24],w[28],w[29]);
    fulladder a24(w[13],w[25],w[26],w[30],w[31]);
    fulladder a25(w[14],w[11],w[27],w[32],w[33]);
    
    fulladder a26(1'b0,w[29],w[30],w[34],w[35]);
    fulladder a27(w[31],w[32],w[35],w[36],w[37]);
    fulladder a28(w[15],w[33],w[37],w[38],w[39]);
    
    //output assignments
    assign p[1]=w[16];
    assign p[2]=w[22];
    assign p[3]=w[28];
    assign p[4]=w[34];
    assign p[5]=w[36];
    assign p[6]=w[38];
    assign p[7]=w[39];

endmodule
