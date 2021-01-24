module top_module ( input clk, input d, output q );
    wire q1, q2;
    my_dff left(clk, d, q1);
    my_dff middle(clk, q1, q2);
    my_dff right(clk, q2, q);
endmodule
