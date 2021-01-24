module top_module(
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

    wire [99:0] carry;

    generate
        genvar i;
        for(i = 3; i < 400; i = i + 4) begin : step
            bcd_fadd unit(a[i:i-3], b[i:i-3], (i == 3) ? cin : carry[i/4 - 1], carry[i/4], sum[i:i-3]);
        end
    endgenerate

    assign cout = carry[99];

endmodule
