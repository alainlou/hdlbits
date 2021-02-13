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
    output reg digging );

    reg walking_right;
    reg falling;

    always @(posedge clk, posedge areset) begin
        if (areset) begin
            walking_right <= 1'b0;
        	digging <= 1'b0;
        end else if (!ground) begin
            falling <= 1'b1;
            digging <= 1'b0;
        end else if (falling && ground)
            falling <= 1'b0;
        else if (dig && !falling)
            digging <= 1'b1;
        else if (!falling && !digging) begin
            if (bump_left && bump_right)
                walking_right <= !walking_right;
            else if (bump_left)
                walking_right <= 1'b1;
            else if (bump_right)
                walking_right <= 1'b0;
        end
    end

    assign walk_left = !falling && !digging && !walking_right;
    assign walk_right = !falling && !digging && walking_right;
    assign aaah = falling;

endmodule
