module top_module (
    input clock,
    input a,
    output p,
    output q);

    assign p = clock ? a : p;
    assign q = !clock ? p : q;

endmodule
