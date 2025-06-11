module bin_decoder_tb;
    reg a, b;
    wire o0, o1, o2, o3;

    bin_decoder bin_d_tb(a, b, o0, o1, o2, o3);
    task init_val_test;
        begin
            a = 0; b = 0; #5; 
            a = 0; b = 1; #5; 
            a = 1; b = 0; #5; 
            a = 1; b = 1; #5; 

            a = 0; b = 0; #5; 
            a = 0; b = 1; #5; 
            a = 1; b = 0; #5; 
            a = 1; b = 1; #5; 
        end
    endtask

    initial begin
        $dumpfile("wave_bin_decoder_tb.vcd");
        $dumpvars(0, bin_decoder_tb);
        $monitor("a: %b, b: %b, o0: %b, o1: %b, o2: %b, o3: %b", a, b, o0, o1, o2, o3); 
        init_val_test();
        $finish;
    end

endmodule