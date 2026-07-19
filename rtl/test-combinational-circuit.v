module a (input x, input y, output z);
    assign  z = (x^y) & x;

endmodule
module b (input x, input y, output z);
    assign  z = ~(x^y);

endmodule

module top_module (input x, input y, output z);
     wire a1out,a2out,b1out,b2out,a1orb1out,a2andb2out;
    a ia1(.x(x),.y(y),.z(a1out));
    a ia2(.x(x),.y(y),.z(a2out));
    b ib1(.x(x),.y(y),.z(b1out));
    b ib2(.x(x),.y(y),.z(b2out));
    assign a1orb1out = a1out | b1out;
    assign a2andb2out = a2out & b2out;
    assign z = a1orb1out^a2andb2out;
    
    

endmodule
