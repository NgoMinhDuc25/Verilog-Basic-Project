
module mux21_4(
    input [3:0] in1, in2,
    input sel,
    output reg [3:0] out
);
    always @(*) begin
        case(sel)
            1'b0: out = in1;
            1'b1: out = in2;
            default: out = 4'bxxxx;
        endcase
    end
endmodule

