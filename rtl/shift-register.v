module my_dff ( input clk, input d, output q ); 
endmodule
module top_module ( input clk, input d, output q );
   
    wire dff1out;
    wire dff2out;
    my_dff instance1(.clk(clk),.d(d),.q(dff1out));
    my_dff instance2(.clk(clk),.d(dff1out),.q(dff2out));
    my_dff instance3(.clk(clk),.d(dff2out),.q(q));
    
    

endmodule
