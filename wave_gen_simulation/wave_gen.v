module wave_gen(
    input en,
    input [1:0] pat,
    output [7:0] wave
);
assign wave = en 
? {4{pat}}
: {8{1'bz}};

endmodule