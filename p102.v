module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);

    initial q = 4'd0;

    always @(posedge clk) begin
        q <= reset ? 4'd0 : slowena ? q == 9 ? 0 : q + 1: q;
    end

endmodule
