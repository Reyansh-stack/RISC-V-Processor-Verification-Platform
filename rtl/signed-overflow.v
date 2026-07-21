module fadder (input a, input b , input cin , output sum ,output cout);
    assign sum = a^b^cin;
    assign cout = a&b | cin&(a^b);
endmodule
module top_module (
    input [7:0] a,
    input [7:0] b, 
    output [7:0] s,
output wire overflow);
    wire cout [7:0];
    genvar i;
    fadder fadder0 (.a(a[0]),.b(b[0]), .cin(1'b0), .sum(s[0]), .cout(cout[0]));
    generate for (i=1;i<8;i=i+1)begin:ripple
        fadder fadder1 (.a(a[i]),.b(b[i]), .cin(cout[i-1]), .sum(s[i]), .cout(cout[i]));
        end
        
    endgenerate
    assign overflow = cout[6]^cout[7];
    

endmodule

