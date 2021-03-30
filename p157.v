module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output reg [3:0] count,
    output counting,
    output done,
    input ack );

    enum {A, B, C, D, E, F, G} state = A;
    reg [1:0] count_idx = 3;
    reg [$clog2(1000)-1:0] tick = 0;

    always @(posedge clk) begin
        if (reset)
            state <= A;
        else begin
            case (state)
                A: state <= data == 1'b1 ? B : A;
                B: state <= data == 1'b1 ? C : A;
                C: state <= data == 1'b0 ? D : C;
                D: begin
                    state <= data == 1'b1 ? E : A;
                    count_idx <= 3;
                end
               	E: begin
                    count[count_idx] <= data;
                    state <= count_idx == 0 ? F : E;
                    count_idx <= count_idx - 1;
                    tick <= 0;
                end
                F: begin
                    if (tick == 999) begin
                    	if (count == 0)
                        	state <= G;
                        tick <= 0;
                        count <= count - 1;
                    end
                    else
                        tick <= tick + 1;
                end
                G: state <= ack ? A : G;
            endcase
        end
    end

    assign counting = state == F;
    assign done = state == G;

endmodule
