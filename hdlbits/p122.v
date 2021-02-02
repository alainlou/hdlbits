module top_module(
    input clk,
    input reset,    // Synchronous reset to OFF
    input j,
    input k,
    output out); //

   	parameter OFF=1'b0, ON=1'b1;
    reg state, next_state;

    always @(*) begin
        // State transition logic
        if (state == OFF)
            next_state <= (j == 1'b1) ? ON : OFF;
        else
            next_state <= (k == 1'b1) ? OFF : ON;
    end

    always @(posedge clk) begin
        if (reset)
            state <= OFF;
        else
            state <= next_state;
    end

    // Output logic
    assign out = (state == ON);

endmodule
