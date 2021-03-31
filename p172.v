module top_module (
    input clk,
    input a,
    output reg [3:0] q );

    always @(posedge clk) begin
        q <= a ? 4 : (q == 6 ? 0 : q + 1);
    end

endmodule
