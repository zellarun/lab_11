module binary(
    input w,
    input clk,
    input reset,
    output z,
    output [2:0] state_leds
);

    wire [2:0] State, Next;

    assign state_leds = State; //for the output

    dff zero(
        .D(Next[0]),
        .clk(clk),
        .Q(State[0]),
        .reset(reset)
    );

    dff one(
        .D(Next[1]),
        .clk(clk),
        .Q(State[1]),
        .reset(reset)
    );
    
    dff two(
        .D(Next[2]),
        .clk(clk),
        .Q(State[2]),
        .reset(reset)
    );

    assign z = (State == 3'b010) || (State == 3'b100); //z is 1 in state C or E
    assign Next[0] = (~State[2] & ~State[1] & ~State[0] & ~w) | (~State[2] & State[1] & ~State[0] & ~w) | (State[2] & ~State[1] & ~State[0] & ~w) | (~State[2] & State[1] & State[0] & ~w);
    assign Next[1] = (~State[2] & ~State[1] & State[0] & ~w) | (~State[2] & State[1] & ~State[0] & ~w) | (~State[2] & ~State[1] & ~State[0] & w);
    assign Next[2] = (~State[2] & State[1] & State[0] & w) | (State[2] & ~State[1] & ~State[0] & w);

endmodule
