module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah );

    reg direction;
    reg falling;

    always @(posedge clk, posedge areset) begin
        if (areset)
            direction <= 1'b0;
        else if (!falling && !ground)
            falling <= 1'b1;
        else if (falling && ground)
            falling <= 1'b0;
        else if (!falling) begin
            if (bump_left && bump_right)
                direction <= !direction;
            else if (bump_left)
                direction <= 1'b1;
            else if (bump_right)
                direction <= 1'b0;
        end
    end

    assign aaah = falling;
    assign walk_left = !falling && direction == 1'b0;
    assign walk_right = !falling && direction == 1'b1;

endmodule
