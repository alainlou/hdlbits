module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] prev = 8'b00000000;
    always @(posedge clk) begin
        pedge <= in&~prev;
        prev <= in;
    end

endmodule
