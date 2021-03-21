module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);

    reg [2:0] state;

    always @(posedge clk) begin
        if (reset)
            state <= 0;
        else begin
            case (state)
                0: state <= x;
                1: state <= x ? 4 : 1;
                2: state <= x ? 1 : 2;
                3: state <= x ? 2 : 1;
                4: state <= x ? 4 : 3;
            endcase
        end
    end

    assign z = state > 2;

endmodule
