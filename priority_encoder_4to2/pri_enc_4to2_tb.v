module pri_enc_4to2_tb;
    reg d0, d1, d2, d3;
    wire q0, q1;

    pri_enc_4to2 m(d0, d1, d2, d3, q0, q1);
    task init_val_test;
        begin
            d0 = 0; d1 = 0; d2 = 0; d3 = 0; #5;
            d0 = 1; d1 = 0; d2 = 0; d3 = 0; #5;
            d0 = 0; d1 = 1; d2 = 0; d3 = 0; #5;
            d0 = 0; d1 = 0; d2 = 1; d3 = 0; #5;
            d0 = 0; d1 = 0; d2 = 0; d3 = 1; #5;
        end
    endtask

    initial begin
        $dumpfile("wave_pri_enc_4to2.vcd");
        $dumpvars(0, pri_enc_4to2_tb);
        $monitor("d0: %b, d1: %b, d2: %b, d3: %b | q0: %b, q1: %b", d0, d1, d2, d3, q0, q1);
        init_val_test();
        $finish;
    end
endmodule