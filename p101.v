module top_module (
    input clk,
    input reset,
    output [3:0] q);

    initial q = 4'b0001;

    always @(posedge clk) begin
        q <= (q == 4'd10 || reset) ? 1 : q + 1;
    end

endmodule
