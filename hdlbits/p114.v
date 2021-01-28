module MUXDFF (
    input clk,
    input w, R, E, L,
    output Q
);
    wire sel1, sel2;
    assign sel1 = E ? w : Q;
    assign sel2 = L ? R : sel1;

    always @(posedge clk) begin
        Q <= sel2;
    end

endmodule

module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
	wire clk, E, L, w;
    wire w3, w2, w1, w0;
    assign {w, L, E, clk} = KEY;

    MUXDFF MD3 (clk, w, SW[3], E, L, w3);
    MUXDFF MD2 (clk, w3, SW[2], E, L, w2);
    MUXDFF MD1 (clk, w2, SW[1], E, L, w1);
    MUXDFF MD0 (clk, w1, SW[0], E, L, w0);

    assign LEDR = {w3, w2, w1, w0};

endmodule
