module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q

    wire L, clk;
    assign {L, clk} = KEY;

    always @(posedge clk) begin
        LEDR[0] <= L ? SW[0] : LEDR[2];
        LEDR[1] <= L ? SW[1] : LEDR[0];
        LEDR[2] <= L ? SW[2] : LEDR[1]^LEDR[2];
    end

endmodule
