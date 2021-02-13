module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//

    parameter A=1'b0, B=1'b1;
    reg state;

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        if (areset)
            state <= B;
        else begin
            state <= in == 0 ? !state : state;
        end
    end

    // Output logic
	assign out = state == B;

endmodule
