module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output reg done
);

    enum {IDLE, RECEIVE, STOP, CLEANUP} state;
    reg [3:0] counter = 0;
	reg prev;

    always @(posedge clk) begin
        if (reset) begin
            state <= IDLE;
        	done <= 1'b0;
            counter <= 0;
        end else begin
            case (state)
                IDLE: begin
                    done = 1'b0;
                    if (!in)
                        state <= RECEIVE;
                end
                RECEIVE: begin
                    counter <= counter + 1;
                    if (counter == 7) begin
                        state <= STOP;
                        counter <= 0;
                    end
                end
                STOP: begin
                    if (in) begin
                        done <= 1'b1;
                        state <= IDLE;
                    end
                    else
                        state <= CLEANUP;
                end
                CLEANUP: begin
                    if (in)
                        state <= IDLE;
                end
            endcase
        end
        prev <= in;
    end

endmodule
