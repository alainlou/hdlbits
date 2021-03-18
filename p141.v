module top_module (
    input clk,
    input areset,
    input x,
    output z
);
    reg [1:0] state;
    parameter A = 0, B = 2;

    always @(posedge clk, posedge areset) begin
        if (areset)
            state <= 0;
        else begin
            case (state)
                A: state <= x ? B : A;
            endcase
        end
    end

    always @(*) begin
        z <= state == A ? x : !x;
    end

endmodule
