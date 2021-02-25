module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output reg [23:0] out_bytes,
    output done); //

    reg [1:0] cooldown;

    always @(posedge clk) begin
        if (reset) begin
        	cooldown <= 0;
        end else begin
            case (cooldown)
                2'b00: begin
                    if (in[3])
                        cooldown <= 3;
                end
                2'b01: begin
                    if(in[3])
                        cooldown <= 3;
                    else
                        cooldown <= 0;
                end
                default: begin
                    cooldown <= cooldown - 1;
                end
            endcase
        end
        out_bytes <= {out_bytes[15:0], in};
    end

    assign done = cooldown == 1;

endmodule
