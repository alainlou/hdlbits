module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z );

    reg [1:0] state;

    always @(posedge clk, negedge aresetn) begin
        if (!aresetn)
            state <= 0;
        else begin
            case (state)
                default: state <= x;
                1: state <= state + !x;
            endcase
        end
    end

    assign z = state == 2 && x;

endmodule
