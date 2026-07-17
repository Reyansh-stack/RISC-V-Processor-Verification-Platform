module mux4to1(
    input  [7:0] in0,
    input  [7:0] in1,
    input  [7:0] in2,
    input  [7:0] in3,
    input  [1:0] sel,
    output reg [7:0] out
);

always @(*) begin
    case(sel)
        2'b00: out = in0;
        2'b01: out = in1;
        2'b10: out = in2;
        2'b11: out = in3;
    endcase
end

endmodule
module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0] dff1out;
    wire [7:0] dff2out;
    wire [7:0] dff3out;
    my_dff8 instance1(.clk(clk),.d(d),.q(dff1out));
    my_dff8 instance2(.clk(clk),.d(dff1out),.q(dff2out));
    my_dff8 instance3(.clk(clk),.d(dff2out),.q(dff3out));
    mux4to1 instancemux1(.in0(d),.in1(dff1out),.in2(dff2out),.in3(dff3out),.sel(sel),.out(q));
endmodule
