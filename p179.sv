module top_module(
	input clk,
	input load,
	input [9:0] data,
	output tc
);
    logic [9:0] counter_r;

    always_ff @(posedge clk)
    begin
        if (load)
            counter_r <= data;
        else
            counter_r <= counter_r > '0 ? counter_r - 1'b1 : '0;
    end

    assign tc = counter_r == 0;

endmodule
