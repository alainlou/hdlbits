module top_module ( );

    reg clk;
    always #5 clk = !clk;

    dut dut_inst(clk);

    initial begin
        clk = 0;
    end

endmodule
