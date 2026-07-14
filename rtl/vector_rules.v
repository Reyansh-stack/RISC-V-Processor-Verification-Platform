`default_nettype none     // Disable implicit nets. Reduces some types of bugs.
module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );
    assign out_lo = in[7:0];
    assign out_hi = in[15:8];
    
endmodule

// Declaration Rules.
// type [upper:lower] vector_name;

// wire [7:0] w;         // 8-bit wire
// reg  [4:1] x;         // 4-bit reg
// output reg [0:0] y;   // 1-bit reg that is also an output port (this is still a vector)
// input wire [3:-2] z;  // 6-bit wire input (negative ranges are allowed)
// output [3:0] a;       // 4-bit output wire. Type is 'wire' unless specified otherwise.
// wire [0:7] b;         // 8-bit wire where b[0] is the most-significant bit.



// Default NETTYPE NONE.
// wire [2:0] a, c;   // Two vectors
// assign a = 3'b101;  // a = 101
// assign b = a;       // b =   1  implicitly-created wire
// assign c = b;       // c = 001  <-- bug
// my_module i1 (d,e); // d and e are implicitly one-bit wide if not declared.
//                     // This could be a bug if the port was intended to be a vector.

// Unpacked & Packed Elements

// reg [7:0] mem [255:0];   // 256 unpacked elements, each of which is a 8-bit packed vector of reg.
// reg mem2 [28:0];         // 29 unpacked elements, each of which is a 1-bit reg.

// Accessing Elements from a vector.
// w[3:0]      // Only the lower 4 bits of w
// x[1]        // The lowest bit of x
// x[1:1]      // ...also the lowest bit of x
// z[-1:-2]    // Two lowest bits of z
// b[3:0]      // Illegal. Vector part-select must match the direction of the declaration.
// b[0:3]      // The *upper* 4 bits of b.
// assign w[3:0] = b[0:3];    // Assign upper 4 bits of b to lower 4 bits of w. w[3]=b[0], w[2]=b[1], etc.

