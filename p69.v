module f_adder(
    input a, b, cin,
    output cout, sum );

    assign {cout, sum} = a + b + cin;

endmodule

module top_module (
    input [3:0] x,
    input [3:0] y,
    output [4:0] sum);

    wire [3:0] carry;

    f_adder add1(x[0], y[0], 1'b0, carry[0], sum[0]);
    f_adder add2(x[1], y[1], carry[0], carry[1], sum[1]);
    f_adder add3(x[2], y[2], carry[1], carry[2], sum[2]);
    f_adder add4(x[3], y[3], carry[2], sum[4], sum[3]);

endmodule
