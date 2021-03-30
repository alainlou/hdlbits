module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );//

    assign q = {b,c,d} > 1; // Fix me

endmodule
