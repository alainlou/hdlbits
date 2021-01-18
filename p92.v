module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    wire sel1, sel2;
    assign sel1 = E ? w : Q;
    assign sel2 = L ? R : sel1;

    always @(posedge clk) begin
        Q <= sel2;
    end

endmodule
