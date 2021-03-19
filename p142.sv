module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    enum {A, B} state;
    reg [1:0] counter;
    reg [1:0] countdown;

    always @(posedge clk) begin
        if (reset) begin
            state <= A;
            z <= 0;
        end else if (state == A) begin
            if (s) begin
                state <= B;
                countdown <= 2;
                counter <= 0;
            end
            z <= 0;
        end else begin
            if (countdown == 0) begin
                countdown <= 2;
                counter <= 0;
                z <= counter + w == 2;
            end else begin
            	countdown <= countdown - 1;
                counter <= counter + w;
                z <= 0;
            end
        end
    end

endmodule
