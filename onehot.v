module one_hot(
    input w,
    input clk,
    input reset,
    output z,
    output [4:0] states
);
    wire Anext, Bnext, Cnext, Dnext, Enext;
    wire Astate, Bstate, Cstate, Dstate, Estate;
    
    assign states = {Astate, Bstate, Cstate, Dstate, Estate};

    dff Adff(
        .Default(1'b1),
        .D(Anext),
        .clk(clk),
        .Q(Astate)
    );

    dff Bdff(
        .Default(1'b0),
        .D(Bnext),
        .clk(clk),
        .Q(Bstate)
    );

    dff Cdff(
        .Default(1'b0),
        .D(Cnext),
        .clk(clk),
        .Q(Cstate)
    );
    
     dff Ddff(
        .Default(1'b0),
        .D(Dnext),
        .clk(clk),
        .Q(Dstate)
    );
    
     dff Edff(
        .Default(1'b0),
        .D(Enext),
        .clk(clk),
        .Q(Estate)
    );

    assign z = Estate;

    assign Anext = (~w & Bstate) | (w & Dstate);
    assign Bnext = (~w & Cstate) | (w & Dstate);
    assign Cnext = (~w & Cstate) | (w & Dstate);
    assign Dnext = (~w & Bstate) | (w & Estate);
    assign Enext = (~w & Bstate) | (w & Estate);
endmodule