module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
);

    enum {START, ACK, MONITOR, G, ONE, ZERO} state = START;
    reg [1:0] buffer = 2'd0;
    reg idx = 1'b0;

    always @(posedge clk) begin
        if (!resetn) begin
            state <= START;
        end
        else begin
            case (state)
                START : state <= ACK;
                ACK : state <= MONITOR;
                MONITOR : begin
                    if (buffer == 2'b10 && x) begin
                        state <= G;
                        buffer <= 2'd0;
                        idx <= 1'b0;
                    end
                    else begin
                        buffer <= {buffer[0], x};
                    end
                end
                G : begin
                    if (idx == 1'd1) begin
                        state <= buffer + y > 0 ? ONE : ZERO;
                        buffer <= 2'd0;
                        idx <= 1'b0;
                    end
                    else begin
                        buffer <= buffer + y;
                        idx <= 1'b1;
                    end
                end
            endcase
        end
    end

	assign f = state == ACK;
    assign g = state == G || state == ONE;

endmodule
