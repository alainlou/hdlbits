module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);

    reg [2:0] counter = 0;

    always @(posedge clk) begin
        if (reset)
            counter <= 4;
        else
            counter <= counter > 0 ? counter - 1 : 0;
    end

    assign shift_ena = counter > 0;

endmodule
