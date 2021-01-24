`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   );
    wire one, two;

    assign one = a && b;
    assign two = c && d;

    assign out = one || two;
    assign out_n = !out;

endmodule
