module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);

    reg [2:0] state;

    always @(posedge clk) begin
        if (reset)
            state <= 3'd0;
        else begin
            case (state)
                3'd0 : state <= !w;
                3'd1 : state <= w ? 3'd3 : 3'd2;
                3'd2 : state <= w ? 3'd3 : 3'd4;
                3'd3 : state <= w ? 3'd0 : 3'd5;
                3'd4 : state <= w ? 3'd3 : 3'd4;
                default : state <= w ? 3'd3 : 3'd2;
            endcase
        end
    end

    assign z = state > 3;

endmodule
