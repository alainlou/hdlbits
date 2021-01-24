module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
);

    always @(*) begin
    	c_enable <= enable;
        if ((enable && (Q == 4'd12 || Q == 4'd0)) || reset) begin
            c_load <= 1'b1;
            c_d <= 4'd1;
        end else begin
            c_load <= 1'b0;
            c_d <= 4'dx;
        end
    end
    count4 the_counter (clk, c_enable, c_load, c_d, Q );

endmodule
