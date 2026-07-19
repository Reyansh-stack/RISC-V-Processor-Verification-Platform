module fulladd(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));
endmodule

module top_module(
    input  [99:0] a,
    input  [99:0] b,
    input  cin,
    output [99:0] cout,
    output [99:0] sum
);

    genvar i;

    // First full adder
    fulladd fa0 (
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .sum(sum[0]),
        .cout(cout[0])
    );

    // Remaining full adders
    generate
        for(i = 1; i < 100; i = i + 1) begin : ripple
            fulladd fa (
                .a(a[i]),
                .b(b[i]),
                .cin(cout[i-1]),
                .sum(sum[i]),
                .cout(cout[i])
            );
        end
    endgenerate

endmodule