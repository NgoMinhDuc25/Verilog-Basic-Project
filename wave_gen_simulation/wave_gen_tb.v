module wave_gen_tb;
    reg en;
    reg [1:0] pat;
    wire [7:0] wave;
wave_gen w_tb(.en(en), .pat(pat), .wave(wave));
initial begin
    pat = 2'b10; en = 1'b1; #5;
    $display("Pattern: %b, Enable: %b, Wave: %b", pat, en, wave);
    en = 0; #5; 
    $display("Pattern: %b, Enable: %b, Wave: %b", pat, en, wave);
    $finish;
end

endmodule