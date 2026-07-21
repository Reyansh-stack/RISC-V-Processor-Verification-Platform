module fadder (input a, input b , input cin , output sum ,output cout);
    assign sum = a^b^cin;
    assign cout = a&b | cin&(a^b);
endmodule
module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire [4:0] cout;
    genvar i;
    fadder fadder0 (.a(x[0]),.b(y[0]), .cin(0), .sum(sum[0]), .cout(cout[0]));
    generate for (i=1;i<4;i=i+1)begin:ripple
            fadder fadder1 (.a(x[i]),.b(y[i]), .cin(cout[i-1]), .sum(sum[i]), .cout(cout[i]));
        end
        assign sum[i] = cout[i-1];
    endgenerate
    

endmodule
