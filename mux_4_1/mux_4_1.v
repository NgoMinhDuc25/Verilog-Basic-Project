
module mux_4_1(
    input in1, in2, in3, in4,
    input [1:0] sel_wire,
    output out
);
    assign out = sel_wire[0] 
    ? (sel_wire[1] & in2) | (~sel_wire[1] & in4)
    : (sel_wire[1] & in1) | (~sel_wire[1] & in3);

endmodule