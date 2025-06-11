module pri_enc_8to3_tb;
    reg d0, d1, d2, d3, d4, d5, d6, d7;
    wire q0, q1, q2;

    pri_enc_8to3 uut(d0, d1, d2, d3, d4, d5, d6, d7, q0, q1, q2);

    task init_inputs_test;
        begin
            d0 = 1; d1 = 0; d2 = 0; d3 = 0;
            d4 = 0; d5 = 0; d6 = 0; d7 = 0; #5;
            d0 = 1'bx; d1 = 1; d2 = 0; d3 = 0;
            d4 = 0; d5 = 0; d6 = 0; d7 = 0; #5;
            d0 = 1'bx; d1 = 1'bx; d2 = 1; d3 = 0;
            d4 = 0; d5 = 0; d6 = 0; d7 = 0; #5;
            d0 = 1'bx; d1 = 1'bx; d2 = 1'bx; d3 = 1;
            d4 = 0; d5 = 0; d6 = 0; d7 = 0; #5;
            d0 = 1'bx; d1 = 1'bx; d2 = 1'bx; d3 = 1'bx;
            d4 = 1; d5 = 0; d6 = 0; d7 = 0; #5;
            d0 = 1'bx; d1 = 1'bx; d2 = 1'bx; d3 = 1'bx;
            d4 = 1'bx; d5 = 1; d6 = 0; d7 = 0; #5;
            d0 = 1'bx; d1 = 1'bx; d2 = 1'bx; d3 = 1'bx;
            d4 = 1'bx; d5 = 1'bx; d6 = 1; d7 = 0; #5;
            d0 = 1'bx; d1 = 1'bx; d2 = 1'bx; d3 = 1'bx;
            d4 = 1'bx; d5 = 1'bx; d6 = 1'bx; d7 = 1; #5;
        end
    endtask

    initial begin
        $dumpfile("wave_pri_enc_8to3_tb.vcd");
        $dumpvars(0, pri_enc_8to3_tb);
        $monitor("d0=%b, d1=%b, d2=%b, d3=%b, d4=%b, d5=%b, d6=%b, d7=%b => q2=%b, q1=%b, q0=%b", 
                 d0, d1, d2, d3, d4, d5, d6, d7, q2, q1, q0);
        init_inputs_test();
        $finish;
    end

endmodule