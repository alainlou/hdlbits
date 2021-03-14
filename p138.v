module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);

    reg [3:0] state = 4'b1111;

    always @(posedge clk) begin
        if (reset)
            state <= 0;
        else if (in) begin
            case (state)
                0, 8, 9, 10:
                    state <= 1;
                1, 2, 3, 4, 5, 6:
                    state <= state + 1;
                7:
                    state <= 7;
          		default:
                    state <= 4'b1111;
            endcase
        end else begin
            case (state)
                5, 6, 7:
                    state <= state + 3;
                default:
                    state <= 0;
            endcase
        end
    end

    assign disc = state == 8;
    assign flag = state == 9;
    assign err = state == 7;

endmodule
