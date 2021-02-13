module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr);

    reg [1:0] prev_state;
    reg [1:0] curr_state;
    wire [1:0] next_state;

    always @(*) begin
        next_state <= s[3] ? 3 : s[2] ? 2 : s[1] ? 1 : 0;
    end

    always @(posedge clk) begin
        if (reset) begin
            curr_state <= 0;
            prev_state <= -1;
        end else begin
            curr_state <= next_state;
        	prev_state <= curr_state;
        end
    end

    assign fr3 = curr_state == 0;
    assign fr2 = curr_state < 2;
    assign fr1 = curr_state < 3;
    assign dfr = curr_state < prev_state || (curr_state == prev_state && dfr);

endmodule
