module top_module(
    input [2:0] in,
    output [1:0] out );

    always @(*) begin
    	out = 0;
        for(int i = 0; i < 3; ++i) begin
            out += in[i];
        end
    end

endmodule
