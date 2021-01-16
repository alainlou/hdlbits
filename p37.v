module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    wire [7:0] candidate_1, candidate_2;

    assign candidate_1 = (a < b) ? a : b;
    assign candidate_2 = (c < d) ? c : d;

    assign min = (candidate_1 < candidate_2) ? candidate_1 : candidate_2;

endmodule
