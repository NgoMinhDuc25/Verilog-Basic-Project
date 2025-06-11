module pri_enc_8to3(
    input wire d0, d1, d2, d3,d4, d5, d6, d7,
    output reg q0, q1, q2
);
always @(*) begin
    case ({d7, d6, d5, d4, d3, d2, d1, d0})
        8'b00000001: {q2, q1, q0} = 3'd0;
        8'b0000001x: {q2, q1, q0} = 3'd1; 
        8'b000001xx: {q2, q1, q0} = 3'd2;
        8'b00001xxx: {q2, q1, q0} = 3'd3;
        8'b0001xxxx: {q2, q1, q0} = 3'd4;
        8'b001xxxxx: {q2, q1, q0} = 3'd5;
        8'b01xxxxxx: {q2, q1, q0} = 3'd6;
        8'b1xxxxxxx: {q2, q1, q0} = 3'd7;
    endcase
end
endmodule