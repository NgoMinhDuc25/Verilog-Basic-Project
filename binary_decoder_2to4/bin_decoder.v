module bin_decoder(
    input a, b,
    output reg o0, o1, o2, o3
);
always @(*) begin
    case({a, b})
        2'b00: {o0, o1, o2, o3} = 4'b1000;
        2'b01: {o0, o1, o2, o3} = 4'b0100;
        2'b10: {o0, o1, o2, o3} = 4'b0010;
        2'b11: {o0, o1, o2, o3} = 4'b0001;
        default: {o0, o1, o2, o3} = {4{1'bx}}; 
    endcase
end
endmodule