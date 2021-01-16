module top_module(
    input [31:0] in,
    output [31:0] out );//
    wire [7:0] a, b, c, d;
    assign {a, b, c, d} = in;
    assign out = {d, c, b, a};
    // assign out[31:24] = ...;

endmodule
