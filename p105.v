module decade_counter (
    input clk,
    input reset,
    input ena,
    output [3:0] q);

    always @(posedge clk) begin
        if (reset || (ena && q == 4'h9))
            q <= 4'h0;
        else if (ena) begin
            q <= q + 1;
        end
    end

endmodule

module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    assign ena[1] = q[3:0] == 4'h9;
    assign ena[2] = q[7:0] == 8'h99;
    assign ena[3] = q[11:0] == 12'h999;

    decade_counter ones(clk, reset, 1'b1, q[3:0]);
    decade_counter tens(clk, reset, ena[1], q[7:4]);
    decade_counter hundreds(clk, reset, ena[2], q[11:8]);
    decade_counter thousands(clk, reset, ena[3], q[15:12]);

endmodule
