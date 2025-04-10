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
    //Added
//    .Astate(led[2]), 
//    .Bstate(led[3]),
//    .Cstate(led[4]),
//    .Dstate(led[5]),
//    .Estate(led[6])
);

binary bin(
    .w(sw),
    .clk(btnC),
    .z(led[1]),
    .reset(btnU)
);

endmodule