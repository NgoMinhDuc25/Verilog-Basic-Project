module string_shift(
    input [3:0] in1,
    input [3:0] in2,
    output [7:0] out
);
assign out = {in1, in2} << 2;

endmodule