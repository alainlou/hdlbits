module top_module (
    input clk,
    input areset,
    input x,
    output z
);
    enum {A, B, C, D} state;

    always @(posedge clk, posedge areset) begin
        if (areset)
            state <= A;
        else begin
            case (state)
                A: state <= x ? B : A;
                B: state <= x ? C : B;
                C: state <= x ? C : D;
                D: state <= x ? C : D;
            endcase
        end
    end

    always @(*) begin
        z <= state == B || state == D;
    end
endmodule
