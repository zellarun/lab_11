module top(
    input sw, // w
    output [9:0] led, // see IO table
    input btnC, // clk
    input btnU // reset
);

   one_hot hot(
     .w(sw),
    .clk(btnC),
    .z(led[0]),
    .states(led[6:2]),
    .reset(btnU)
);

binary bin(
    .w(sw),
    .clk(btnC),
    .z(led[1]),
    .reset(btnU),
    .state_leds(led[9:7]) // connects state output
);

endmodule
