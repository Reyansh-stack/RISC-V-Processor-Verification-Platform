`default_nettype none
module fadd (
    input a,
    input b,
    input     cin,
    output   cout,
    output sum );
    assign sum = a^b^cin;
    assign cout = (a&b) | (cin&(a^b));
endmodule
module bcd_fadd (
    input [3:0] a,
    input [3:0] b,
    input     cin,
    output   cout,
    output [3:0] sum );
    genvar i;
    wire [3:0] couti;
    fadd instance0(.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.cout(couti[0]));
    generate 
        for (i=1;i<4; i=i+1)begin : ripple
            
                fadd instance1(.a(a[i]),.b(b[i]),.cin(couti[i-1]),.sum(sum[i]),.cout(couti[i]));
            end
    endgenerate
    assign cout = couti[3];

endmodule




module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    wire [99:0] couti;
    genvar i;
    bcd_fadd instance0(.a(a[3:0]),.b(b[3:0]),.cin(cin),.sum(sum[3:0]),.cout(couti[0]));
    generate 
        for (i=1;i<100; i=i+1)begin : ripple
            
                bcd_fadd instance1(.a(a[4*i+3:4*i]),.b(b[4*i+3:4*i]),.cin(couti[i-1]),.sum(sum[4*i+3:4*i]),.cout(couti[i]));
            end
    endgenerate
    assign cout = couti[99];

endmodule
