

module add1 ( input a, input b, input cin,   output sum, output cout );

    assign sum = a^b^cin;
    assign cout = (a&b) | (cin&(a^b));

endmodule

module add16(input [15:0]a,input [15:0]b,input cin, output [15:0] sum, output cout);
    wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14;
                         add1 bit0(.a(a[0]),.b(b[0]),.sum(sum[0]),.cin(cin),.cout(c0));
                         add1 bit1(.a(a[1]),.b(b[1]),.sum(sum[1]),.cin(c0),.cout(c1));
                         add1 bit2(.a(a[2]),.b(b[2]),.sum(sum[2]),.cin(c1),.cout(c2));
                         add1 bit3(.a(a[3]),.b(b[3]),.sum(sum[3]),.cin(c2),.cout(c3));
                         add1 bit4(.a(a[4]),.b(b[4]),.sum(sum[4]),.cin(c3),.cout(c4));
                         add1 bit5(.a(a[5]),.b(b[5]),.sum(sum[5]),.cin(c4),.cout(c5));
                         add1 bit6(.a(a[6]),.b(b[6]),.sum(sum[6]),.cin(c5),.cout(c6));
                         add1 bit7(.a(a[7]),.b(b[7]),.sum(sum[7]),.cin(c6),.cout(c7));
                         add1 bit8(.a(a[8]),.b(b[8]),.sum(sum[8]),.cin(c7),.cout(c8));
                         add1 bit9(.a(a[9]),.b(b[9]),.sum(sum[9]),.cin(c8),.cout(c9));
                         add1 bit10(.a(a[10]),.b(b[10]),.sum(sum[10]),.cin(c9),.cout(c10));
                         add1 bit11(.a(a[11]),.b(b[11]),.sum(sum[11]),.cin(c10),.cout(c11));
                         add1 bit12(.a(a[12]),.b(b[12]),.sum(sum[12]),.cin(c11),.cout(c12));
                         add1 bit13(.a(a[13]),.b(b[13]),.sum(sum[13]),.cin(c12),.cout(c13));
                         add1 bit14(.a(a[14]),.b(b[14]),.sum(sum[14]),.cin(c13),.cout(c14));
                         add1 bit15(.a(a[15]),.b(b[15]),.sum(sum[15]),.cin(c14),.cout(cout));
endmodule

module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] bsub;
    wire coutlow;
    assign bsub = b^{32{sub}};
    add16 lowerbits (.a(a[15:0]),.b(bsub[15:0]),.cin(sub),.sum(sum[15:0]),.cout(coutlow));
    add16 higherbits (.a(a[31:16]),.b(bsub[31:16]),.cin(coutlow),.sum(sum[31:16]),.cout());
endmodule
