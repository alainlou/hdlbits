module top_module(
    input clk,
    input areset,

    input  predict_valid,
    input  [6:0] predict_pc,
    output logic predict_taken,
    output logic [6:0] predict_history,

    input train_valid,
    input train_taken,
    input train_mispredicted,
    input [6:0] train_history,
    input [6:0] train_pc
);

    logic [1:0] pht [127:0];
    wire [6:0] predict_idx = predict_pc ^ predict_history;
    logic [6:0] predict_history_b;
    wire [6:0] train_idx = train_pc ^ train_history;
    logic [1:0] train_val_b;


    always_comb
    begin
        predict_taken = 1'b0;
        if (predict_valid)
        begin
            predict_taken = pht[predict_idx] >= 2;
        end

        if (train_valid && train_mispredicted)
        begin
            predict_history_b = {train_history[5:0], train_taken};
        end
        else if (predict_valid)
        begin
            predict_history_b = {predict_history[5:0], predict_taken};
        end
        else
        begin
            predict_history_b = predict_history;
        end

        train_val_b = pht[train_idx];
        if (train_valid)
        begin
            if (train_taken)
            begin
                train_val_b = pht[train_idx] < 2'd3 ? pht[train_idx] + 1'b1 : 2'd3;
            end
            else
            begin
                train_val_b = pht[train_idx] > 2'd0 ? pht[train_idx] - 1'b1 : 2'd0;
            end
        end
    end

    always_ff @(posedge clk, posedge areset)
    begin
        if (areset)
        begin
            for (int i = 0; i < 128; i += 1)
            begin
                pht[i] <= 2'b01;
            end
            predict_history <= '0;
        end
        else
        begin
            predict_history <= predict_history_b;
            pht[train_idx] <= train_val_b;
        end
    end

endmodule
