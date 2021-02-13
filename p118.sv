module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q );

    reg [15:0] state[0:15];

    function get_next(
        integer x, y);
        integer counter = 0;

        for(integer i = x-1; i < x+2; i += 1) begin
            for(integer j = y-1; j < y+2; j += 1) begin
                integer i_pick = i < 0 ? i + 16 : i > 15 ? i - 16 : i;
                integer j_pick = j < 0 ? j + 16 : j > 15 ? j - 16 : j;
                if (state[i_pick][j_pick] == 1 && (i_pick != x || j_pick != y))
                    counter += 1;
            end
        end

        case (counter)
            2: get_next = state[x][y];
            3: get_next = 1;
            default: get_next = 0;
        endcase
    endfunction

    always @(posedge clk) begin
        if (load) begin
            for(integer i = 0; i < 16; i += 1) begin
                for(integer j = 0; j < 16; j += 1) begin
                    state[i][j] <= data[i*16+j];
                end
            end
        end else begin
            for(integer i = 0; i < 16; i += 1) begin
                for(integer j = 0; j < 16; j += 1) begin
                    state[i][j] <= get_next(i, j);
                end
            end
        end
    end

    always @(*) begin
        for(integer i = 0; i < 16; i += 1) begin
            for(integer j = 0; j < 16; j += 1) begin
                q[i*16+j] <= state[i][j];
            end
        end
    end
endmodule
