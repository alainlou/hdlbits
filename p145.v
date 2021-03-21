module top_module (
    input [3:1] y,
    input w,
    output Y2);

    always @(*) begin
        case (y)
            3'd0, 3'd3 : Y2 <= 1'b0;
            3'd1, 3'd5 : Y2 <= 1'b1;
            default : Y2 <= w;
        endcase
    end

endmodule
