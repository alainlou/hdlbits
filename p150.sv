module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
);
    enum {A, B, C, D} state;

    always @(posedge clk) begin
        if (!resetn)
            state <= A;
    	else begin
            case (state)
                A : begin
                    if (r[1])
                        state <= B;
                    else if (r[2])
                        state <= C;
                    else if (r[3])
                        state <= D;
                end
                B : state <= r[1] ? B : A;
                C : state <= r[2]? C : A;
                D : state <= r[3] ? D : A;
            endcase
        end
    end

    assign g[1] = state == B;
    assign g[2] = state == C;
    assign g[3] = state == D;

endmodule
