module top_module (
    input [3:0] a,
    input [3:0] b,
    input [3:0] c,
    input [3:0] d,
    input [3:0] e,
    output [3:0] q );

    wire [63:0] w = {48'hffffffffffff,d,a,e,b};
    assign q = w[c*4 +: 4];

endmodule
