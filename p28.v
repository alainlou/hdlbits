module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] new_b;
    wire [15:0] lower_bits, upper_bits;
    wire carry;
    assign new_b = {32{sub}} ^ b;
    add16 lower(a[15:0], new_b[15:0], sub, lower_bits, carry);
    add16 upper(a[31:16], new_b[31:16], carry, upper_bits, );

    assign sum = {upper_bits, lower_bits};
endmodule
