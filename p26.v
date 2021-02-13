module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire carry, ignore;
    wire [15:0] lower_sum, upper_sum;

    add16 lower(a[15:0], b[15:0], 0, lower_sum, carry);
    add16 upper(a[31:16], b[31:16], carry, upper_sum, ignore);

    assign sum = { upper_sum, lower_sum};
endmodule

module add1 ( input a, input b, input cin, output sum, output cout );
    assign sum = a^b^cin;
    assign cout = (a&b)|(a&cin)|(b&cin);
endmodule
