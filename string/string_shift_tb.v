module string_shift_tb;
    reg [3:0] in1;
    reg [3:0] in2;
    wire [7:0] out;

string_shift s_tb(in1, in2, out);
initial begin
    // $monitor("%b\t %b\t %b", in1, in2, out);
    in1 = 4'b1010; in2 = 4'b0101; #5;
    $display("%b\t %b\t %b", in1, in2, out);
    $finish;
end


endmodule 