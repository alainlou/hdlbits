module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //

    reg [1:0] cooldown;

    always @(posedge clk) begin
        if (reset)
        	cooldown <= 0;
        else begin
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
    end

    assign done = cooldown == 1;

endmodule
