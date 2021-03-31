module top_module ();

    reg clk;
    reg reset;
    reg t;
    wire q;

    tff tff_inst(clk, reset, t, q);

    always #5 clk = !clk;

    initial begin
        clk = 0;
        reset = 0;
        t = 0;

        #2 reset = 1;
        #10 reset = 0;
        #2 t = 1;
        #10 t = 0;
    end

endmodule
