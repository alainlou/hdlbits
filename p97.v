module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);

    initial q = 4'h0;

    always @(posedge clk) begin
        q <= (reset || q == 4'd9) ? 4'h0 : q + 1'b1;
    end

endmodule
