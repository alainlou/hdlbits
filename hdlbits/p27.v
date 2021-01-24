module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
	wire carry;
    wire [15:0] lower_sum, upper_w_carry, upper_wo_carry;

    add16 lower(a[15:0], b[15:0], 1'b0, sum[15:0], carry);
    add16 upper_1(a[31:16], b[31:16], 1'b1, upper_w_carry);
    add16 upper_0(a[31:16], b[31:16], 1'b0, upper_wo_carry);

    always @(*) begin
        case (carry)
            1: sum[31:16] = upper_w_carry;
            default: sum[31:16] = upper_wo_carry;
        endcase
    end

endmodule
