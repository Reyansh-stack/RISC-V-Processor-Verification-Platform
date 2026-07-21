module fadder (input a, input b , input cin , output sum ,output cout);
    assign sum = a^b^cin;
    assign cout = a&b | cin&(a^b);
endmodule
module top_module (
       input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
    wire [99:0] couti ;
    genvar i;
    fadder fadder0 (.a(a[0]),.b(b[0]), .cin(cin), .sum(sum[0]), .cout(couti[0]));
    generate for (i=1;i<100;i=i+1)begin:ripple
        fadder fadder1 (.a(a[i]),.b(b[i]), .cin(couti[i-1]), .sum(sum[i]), .cout(couti[i]));
        end
        
    endgenerate
    assign cout = couti[99];
    

endmodule

