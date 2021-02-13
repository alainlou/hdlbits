module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] prev = 32'h0000;

    always @(posedge clk) begin
        out <= reset ? 32'h0000 : out|prev&(~in);
        prev <= in;
    end

endmodule
