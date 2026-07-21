module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire [3:0] couti;
    genvar i;
    bcd_fadd digit1(.a(a[3:0]),.b(b[3:0]),.cin(cin),.cout(couti[0]),.sum(sum[3:0]));
    generate for (i=1;i<4;i=i+1) begin : ripple
        bcd_fadd digiti(.a(a[4*i+3: 4*i]),.b(b[4*i+3:4*i]),.cin(couti[i-1]),.cout(couti[i]),.sum(sum[4*i+3:4*i]));
    end
    endgenerate
                        
    assign cout = couti[3];
   

endmodule
