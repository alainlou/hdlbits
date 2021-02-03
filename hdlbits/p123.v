module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //

    parameter A=2'd0, B=2'd1, C=2'd2, D=2'd3;

    function [1:0] get_state(
        input [1:0] state,
        input in);
        case (state)
            A: get_state = in ? B : A;
            B: get_state = in ? B : C;
            C: get_state = in ? D : A;
            default: get_state = in ? B : C;
        endcase
    endfunction

    function get_out(
        input [1:0] state);
        case (state)
            D: get_out = 1'b1;
            default: get_out = 1'b0;
        endcase
    endfunction

    // State transition logic: next_state = f(state, in)
    assign next_state = get_state(state, in);

    // Output logic:  out = f(state) for a Moore state machine
    assign out = get_out(state);

endmodule
