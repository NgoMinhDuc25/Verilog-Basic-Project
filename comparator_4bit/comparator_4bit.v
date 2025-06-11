module comparator_4bit(
    input wire [3:0] a, b,
    output reg a_gt_b, 
    output reg a_eq_b, 
    output reg a_lt_b  
);
    wire a_gt_b_lsb, a_eq_b_lsb, a_lt_b_lsb;
    wire a_gt_b_msb, a_eq_b_msb, a_lt_b_msb;
    comparator_2bit c2msb(a[2], a[3], b[2], b[3], a_gt_b_msb, a_eq_b_msb, a_lt_b_msb);
    comparator_2bit c2lsb(a[0], a[1], b[0], b[1], a_gt_b_lsb, a_eq_b_lsb, a_lt_b_lsb);
    always @(*) begin
        a_gt_b = (a_gt_b_msb | (a_eq_b_msb & a_gt_b_lsb));
        a_eq_b = (a_eq_b_msb & a_eq_b_lsb);
        a_lt_b = (a_lt_b_msb | (a_eq_b_msb & a_lt_b_lsb));
    end
endmodule

module comparator_2bit(
    input wire a0, a1, 
    input wire b0, b1,
    output reg a_gt_b, 
    output reg a_eq_b, 
    output reg a_lt_b  
);
    initial begin
        a_gt_b = 0;
        a_eq_b = 0;
        a_lt_b = 0;
    end
    always @(*) begin
        a_gt_b = (a1 & ~b1) | ((a1 ~^ b1) & a0 & ~b0);
        a_eq_b = ~(a0 ^ b0) & ~(a1 ^ b1);
        a_lt_b = (~a1 & b1) | ((a1 ~^ b1) & ~a0 & b0);
    end
endmodule