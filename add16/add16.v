module add16(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] sh, sl;
    wire cout_h, cout_l;
    add16_m add16_m1(
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sl),
        .cout(cout_l)
    );
    add16_m add16_m2(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(cout_l),
        .sum(sh),
        .cout(cout_h)
    );
    assign sum = {sh, sl};
endmodule


module add16_m(
    input wire [15:0] a, b,
    input wire cin,
    output wire [15:0] sum,
    output wire cout
);
    wire [15:0]carry;
    genvar i;
    generate
        for(i = 0 ; i < 16 ; i=i+1) begin : adder_loop
            if(i == 0) begin
                add_1bit add1(a[i], b[i], cin, sum[i], carry[i]);
            end else begin
                add_1bit add1(a[i], b[i], carry[i-1], sum[i], carry[i]);
            end
        end
        assign cout = carry[15];
    endgenerate
endmodule

module add_1bit(
    input a, b, cin,
    output sum, cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);

endmodule