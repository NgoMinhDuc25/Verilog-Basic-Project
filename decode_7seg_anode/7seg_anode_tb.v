module sev7seg_anode_tb;
    reg [3:0] digit;
    wire [6:0] seg;
    sev7seg_anode uut(digit, seg);
    reg [3:0] hex_digits [0:15];
    integer i;
    initial begin
        hex_digits[0] = 4'h0;
        hex_digits[1] = 4'h1;
        hex_digits[2] = 4'h2;
        hex_digits[3] = 4'h3;
        hex_digits[4] = 4'h4;
        hex_digits[5] = 4'h5;
        hex_digits[6] = 4'h6;
        hex_digits[7] = 4'h7;
        hex_digits[8] = 4'h8;
        hex_digits[9] = 4'h9;
        hex_digits[10] = 4'hA;
        hex_digits[11] = 4'hB;
        hex_digits[12] = 4'hC;
        hex_digits[13] = 4'hD;
        hex_digits[14] = 4'hE;
        hex_digits[15] = 4'hF;
    end

    task test_digit;
        begin
            digit = 4'h0; #5;
            for(i = 0 ; i < 16; i = i + 1) begin
                digit = hex_digits[i]; #5;
            end
        end
    endtask

    initial begin
        $dumpfile("wave_7seg_anode.vcd");
        $dumpvars(0, sev7seg_anode_tb);
        $monitor("Time: %0t, digit: %b, seg: %b", $time, digit, seg);
        test_digit();
        $finish;
    end
endmodule