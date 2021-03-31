module top_module (
    input clk,
    input a,
    input b,
    output q,
    output reg state);

    always @(posedge clk) begin
        if (a + b == 2)
            state <= 1;
        else if (a + b == 0)
            state <= 0;
    end

    assign q =  (a + b + state)%2 == 1;

endmodule
