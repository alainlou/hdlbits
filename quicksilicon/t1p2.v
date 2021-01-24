module logic_from_waveform (
  input   wire        clk,
  input   wire        reset,

  input   wire        a_i,

  output  wire [2:0]  q_o

);

  reg [2:0] buffer;

  always @(posedge clk, posedge reset) begin
    if (reset)
      buffer <= 0;
    else if (a_i)
      buffer <= 3'h4;
    else
      buffer <= (buffer + 1)%7;
  end

  assign q_o = buffer;

endmodule
