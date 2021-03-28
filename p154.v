module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);

    enum {A, B, C, D, E} state = A;

    always @(posedge clk) begin
        if (reset)
            state <= A;
        else begin
            case (state)
                A: state <= data == 1'b1 ? B : A;
                B: state <= data == 1'b1 ? C : A;
                C: state <= data == 1'b0 ? D : C;
                D: state <= data == 1'b1 ? E : A;
               	E: state <= E;
            endcase
        end
    end

    assign start_shifting = state == E;

endmodule
