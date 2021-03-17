module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );//

    assign q = {a, b, c, d} > 4 && ({a, b, c, d}%4 != 0);

endmodule
