module adder(
    input a, b, cin,
    output cout, sum );

    assign {cout, sum} = a + b + cin;

endmodule

module top_module(
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    generate
        genvar i;
        for (i = 0; i < 100; i++) begin : step
            adder unit(a[i], b[i], (i == 0) ? cin : cout[i-1], cout[i], sum[i]);
        end
    endgenerate

endmodule
