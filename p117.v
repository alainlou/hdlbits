module top_module(
    input clk,
    input load,
    input [511:0] data,
    output reg [511:0] q
);
    function get_next;
        input left, center, right;
        begin
            case ({left, center, right})
                3'b000, 3'b100, 3'b111:
                    get_next = 1'b0;
                default:
                    get_next = 1'b1;
            endcase
        end
    endfunction

    always @(posedge clk) begin
        if (load)
            q <= data;
        else begin
            q[0] <= get_next(q[1], q[0], 1'b0);
        	q[511] <= get_next(1'b0, q[511], q[510]);
            for(integer i = 1; i < 511; i += 1) begin
                q[i] <= get_next(q[i+1], q[i], q[i-1]);
            end
    	end
    end
endmodule
