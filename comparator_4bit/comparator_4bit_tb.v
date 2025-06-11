module comparator_4bit_tb;
    reg [3:0] a, b;
    wire a_gt_b, a_eq_b, a_lt_b;
    comparator_4bit uut (
        .a(a),
        .b(b),
        .a_gt_b(a_gt_b),
        .a_eq_b(a_eq_b),
        .a_lt_b(a_lt_b)
    );
    task initialize_inputs;
        begin
            a = 4'b0000; 
            b = 4'b0000; #5; //a = b
            a = 4'b0001;
            b = 4'b0000; #5; // a > b
            a = 4'b0010;
            b = 4'b0001; #5; // a > b
            a = 4'b0011;
            b = 4'b1000; #5; // a < b
        end
    endtask
    initial begin 
        $dumpfile("comparator_4bit_tb.vcd");
        $dumpvars(0, comparator_4bit_tb);
        $monitor("Time: %0t | a: %b, b: %b | a_gt_b: %b, a_eq_b: %b, a_lt_b: %b", 
                 $time, a, b, a_gt_b, a_eq_b, a_lt_b);
        initialize_inputs();
        $finish;
    end
endmodule