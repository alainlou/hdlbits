module bcd12(
    input [7:0] in,
    output [7:0] out);

    always @(*) begin
        if (in == 8'h12) begin
            out = 8'h01;
        end else if (in == 8'h09) begin
            out = 8'h10;
        end else begin
            out[7:4] = in[7:4];
            out[3:0] = in[3:0] + 4'h1;
        end
    end
endmodule

module bcd60(
    input [7:0] in,
    output [7:0] out);

    always @(*) begin
        if (in == 8'h59) begin
            out = 8'h00;
        end else if (in[3:0] == 4'h9) begin
            out[7:4] = in[7:4] + 4'h1;
            out[3:0] = 4'h0;
        end else begin
            out[7:4] = in[7:4];
            out[3:0] = in[3:0] + 4'h1;
        end
    end
endmodule

module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss);

    wire [7:0] h_out;
    wire [7:0] m_out;
    wire [7:0] s_out;

    bcd12 hr(hh, h_out);
    bcd60 min(mm, m_out);
    bcd60 sec(ss, s_out);

    always @(posedge clk) begin
        if (reset) begin
            ss <= 8'h0;
            mm <= 8'h0;
            hh <= 8'h12;
        end
        else if (ena) begin
            ss <= s_out;
            mm <= (ss == 8'h59) ? m_out : mm;
            hh <= ({mm, ss} == 16'h5959) ? h_out : hh;
            pm <= ({hh, mm, ss} == 24'h115959) ? !pm : pm;
        end
    end

endmodule
