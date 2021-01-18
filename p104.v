module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    reg [11:0] counter;
    wire r = reset || (counter == 12'h999);

    assign c_enable[0] = 1'b1;
    assign c_enable[1] = counter[3:0] == 4'h9;
    assign c_enable[2] = counter[7:0] == 8'h99;

    bcdcount counter0 (clk, r, c_enable[0], counter[3:0]);
    bcdcount counter1 (clk, r, c_enable[1], counter[7:4]);
    bcdcount counter2 (clk, r, c_enable[2], counter[11:8]);

    assign OneHertz = counter == 12'h999;

endmodule
