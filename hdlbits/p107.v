module top_module(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q);

    always @(posedge clk, posedge areset) begin
        q <= areset ? 4'b0000 : (load ? data : (ena ? {1'b0, q[3:1]} : q));
    end

endmodule

