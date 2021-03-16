module top_module (input a, input b, input c, output out);//

    wire out_neg;
    andgate inst1 ( out_neg, a, b, c, 1'b1, 1'b1 );
	assign out = !out_neg;

endmodule
