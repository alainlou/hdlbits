module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );

    enum {A, B, C, D, E, F, G} state = A;
    reg [1:0] counter = 0;

    always @(posedge clk) begin
        if (reset)
            state <= A;
        else begin
            case (state)
                A: state <= data == 1'b1 ? B : A;
                B: state <= data == 1'b1 ? C : A;
                C: state <= data == 1'b0 ? D : C;
                D: state <= data == 1'b1 ? E : A;
               	E: begin
                    state <= counter == 3 ? F : E;
                    counter <= counter + 1;
                end
                F: state <= done_counting ? G : F;
                G: state <= ack ? A : G;
            endcase
        end
    end

    assign shift_ena = state == E;
    assign counting = state == F;
    assign done = state == G;

endmodule
