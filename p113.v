module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);

    reg [3:0] r;

    always @(posedge clk) begin
        r >>= 1;
        r[3] = in;
        if (!resetn)
            r = 4'b0000;
    end

    assign out = r[0];

endmodule
