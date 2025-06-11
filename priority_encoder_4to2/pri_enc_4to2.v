module pri_enc_4to2(
    input d0, d1, d2, d3,
    output reg q0, q1
);
    always @(*) begin
        case({d3, d2, d1, d0})
            4'b0001: {q1, q0} = 2'b00; 
            4'b0010: {q1, q0} = 2'b01; 
            4'b0100: {q1, q0} = 2'b10; 
            4'b1000: {q1, q0} = 2'b11; 
            4'b0000: {q1, q0} = 2'bxx; 
            default: {q1, q0} = 2'bzz; 
        endcase
    end
endmodule