module dff_and_mux(
    input clk,
    input wire [7:0] d,
    input wire [1:0] sel,
    output [7:0] q
);
    wire [7:0] dff_o1, dff_o2, dff_o3;    
    my_dff8 dff1(clk, d, dff_o1);
    my_dff8 dff2(clk, dff_o1, dff_o2);
    my_dff8 dff3(clk, dff_o2, dff_o3);
    mux_8bit_4to1 mux(.d0(d), .d1(dff_o1), .d2(dff_o2), .d3(dff_o3), .sel(sel), .q(q));
endmodule

module my_dff8(
    input clk,
    input wire [7:0] d,
    output reg [7:0] q
);
    always @(posedge clk) begin
        q <= d;
    end
endmodule

module mux_8bit_4to1(
    input wire [7:0] d0,
    input wire [7:0] d1,
    input wire [7:0] d2,
    input wire [7:0] d3,
    input wire [1:0] sel,
    output reg [7:0] q
);
    always @(*) begin 
        case(sel)
        2'b00: q = d0;
        2'b01: q = d1;
        2'b10: q = d2;
        2'b11: q = d3;
        default: q = {8{1'bx}}; 
        endcase
    end
endmodule