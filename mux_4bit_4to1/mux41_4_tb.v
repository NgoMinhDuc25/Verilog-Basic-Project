module mux41_1_tb;
    reg [3:0] in1, in2, in3, in4;
    reg [1:0] sel;
    wire [3:0] out;

    task init_val_test;
        begin
            in1 = 4'b1010; in2 = 4'b0101; in3 = 4'b1100; in4 = 4'b0011;
            sel = 2'b00; #5;
            sel = 2'b01; #5;
            sel = 2'b10; #5;
            sel = 2'b11; #5;

            in1 = 4'b1111; in2 = 4'b0000; in3 = 4'b1110; in4 = 4'b0001;
            sel = 2'b00; #5;
            sel = 2'b01; #5;
            sel = 2'b10; #5;
            sel = 2'b11; #5;
        end
    endtask

    mux41_1 m_tb(in1, in2, in3, in4, sel, out);
    initial begin
        $dumpfile("wave_mux41_1.vcd");
        $dumpvars(0, mux41_1_tb);
        $monitor("sel: %b, in1: %b, in2: %b, in3: %b, in4: %b, out: %b", sel, in1, in2, in3, in4, out);
        init_val_test();
        $finish;
    end

endmodule