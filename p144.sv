module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);

    always @(*) begin
        case (y)
            0 : begin
                z <= 1'b0;
                Y0 <= x;
            end
            1 : begin
                z <= 1'b0;
                Y0 <= !x;
            end
            2 : begin
                z <= 1'b0;
                Y0 <= x;
            end
            3 : begin
                z <= 1'b1;
                Y0 <= !x;
            end
            default : begin
                z <= 1'b1;
                Y0 <= !x;
            end
        endcase
    end

endmodule
