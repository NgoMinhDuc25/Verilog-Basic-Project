module mux21_4_tb;
    reg [3:0] in1, in2;
    reg sel;
    wire [3:0] out;

    task init_val_test;
        begin
            in1 = 4'b1010;
            in2 = 4'b0101;
            sel = 1'b0; #5;
            sel = 1'b1; #5;
            in1 = 4'b1111;
            in2 = 4'b0000;
            sel = 1'b0; #5;
            sel = 1'b1; #5;
        end
    endtask
    mux21_4 m_tb(in1, in2, sel, out);
    initial begin
        $dumpfile("wave_mux21_4.vcd");
        $dumpvars(0, mux21_4_tb);
        $monitor("sel: %b, in1: %b, in2: %b, out: %b", sel, in1, in2, out);
        init_val_test();
        $finish;
    end

endmodule