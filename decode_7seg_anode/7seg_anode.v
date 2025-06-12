module sev7seg_anode(
    input wire [3:0] digit,
    output reg [6:0] seg
);
always @(digit) begin
    case(digit)
        4'h0: seg = 7'h01;
        4'h1: seg = 7'h4F;
        4'h2: seg = 7'h12;
        4'h3: seg = 7'h06;
        4'h4: seg = 7'h4C;
        4'h5: seg = 7'h24;
        4'h6: seg = 7'h20;
        4'h7: seg = 7'h0F;
        4'h8: seg = 7'h00;
        4'h9: seg = 7'h0C;
        4'hA: seg = 7'h08;
        4'hB: seg = 7'h60;
        4'hC: seg = 7'h31;
        4'hD: seg = 7'h42;
        4'hE: seg = 7'h30;
        4'hF: seg = 7'h38;
        default: seg = 7'h7F;
    endcase
end
endmodule