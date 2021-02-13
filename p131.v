module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging );

    reg walking_right;
    reg falling;
    reg digg;
    reg splat;
    reg [4:0] fall_time;

    always @(posedge clk, posedge areset) begin
        if (areset) begin
            walking_right <= 1'b0;
        	digg <= 1'b0;
            splat <= 1'b0;
        end else if (!ground) begin
            falling <= 1'b1;
            digg <= 1'b0;
            fall_time <= fall_time < 31 ? fall_time + 1 : fall_time;
        end else if (falling && ground) begin
            falling <= 1'b0;
 			splat <= splat || fall_time > 20;
        	fall_time <= 0;
        end else if (dig && !falling)
            digg <= 1'b1;
        else if (!falling && !digg) begin
            if (bump_left && bump_right)
                walking_right <= !walking_right;
            else if (bump_left)
                walking_right <= 1'b1;
            else if (bump_right)
                walking_right <= 1'b0;
        end
    end

    assign walk_left = !splat && !falling && !digg && !walking_right;
    assign walk_right = !splat && !falling && !digg && walking_right;
    assign aaah = !splat && falling;
    assign digging = !splat && digg;

endmodule
