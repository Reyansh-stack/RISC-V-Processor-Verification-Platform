module mod_a ( input in1, input in2, output out );
    // Module body
endmodule
module top_module ( input a, input b, output out );
    mod_a instance1(.in1(a), .in2(b),.out(out));

endmodule
