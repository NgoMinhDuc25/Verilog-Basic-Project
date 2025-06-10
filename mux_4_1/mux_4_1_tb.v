
module mux_4_1_tb;
    reg [3:0] in;
    reg [1:0] sel;
    wire out;

mux_4_1 m_tb(in[0], in[1], in[2], in[3], sel, out);

initial begin
    $dumpfile("wave.vcd");     
    $dumpvars(0, mux_4_1_tb); 
    $display("Selection\t in1\t in2\t in3\t in4\t out");  
    $monitor("sel: %b, in1: %b, in2: %b, in3: %b, in4: %b, out: %b", sel, in[0], in[1], in[2], in[3], out);
    in = 4'b1010;
    sel = 2'b00; #5;
    sel = 2'b01; #5; 
    sel = 2'b10; #5;
    $finish;
end

 
endmodule