module add16_tb;

    reg [31:0] a, b;
    wire [31:0] sum;

    add16 uut (
        .a(a),
        .b(b),
        .sum(sum)
    );

    reg [31:0] a_set [6:0];
    reg [31:0] b_set [6:0];
    integer i;

    task generate_input_wave;
        begin
            $display("Starting generating test wave...");
            a = a_set[0];
            b = b_set[0];
            #10
            b = b_set[1];
            #5 
            a = a_set[1];
            b = b_set[2];
            #5 
            b = b_set[3];
            #5 
            a = a_set[2];
            #5
            a = a_set[3];
            b = b_set[4];
            #5
            a = a_set[4];
            #5
            a = a_set[5];
            b = b_set[5];
            #5
            b = b_set[6];
            #10;
        end
    endtask

    initial begin
        $dumpfile("add16_wave2.vcd");     
        $dumpvars(0, add16_tb); 
        a_set[0] = 32'h00000000;
        a_set[1] = 32'h00000001;
        a_set[2] = 32'h00000000;
        a_set[3] = 32'h00000001;
        a_set[4] = 32'h00000003;
        a_set[5] = 32'h0000FFFF;
        a_set[6] = 32'h0000FFFF;

        b_set[0] = 32'h00000000;
        b_set[1] = 32'h00000001;
        b_set[2] = 32'h00000000;
        b_set[3] = 32'h00000001;
        b_set[4] = 32'h00000003;
        b_set[5] = 32'h00000000;
        b_set[6] = 32'h00000001;
        generate_input_wave();
        $finish;
    end
endmodule