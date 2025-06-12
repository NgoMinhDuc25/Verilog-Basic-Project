module dff_and_mux_tb;
    reg [7:0] d;
    reg [1:0] sel;
    reg clk;
    wire [7:0] q;
    integer i, j;

    dff_and_mux dut (
        .clk(clk),
        .d(d),
        .sel(sel),
        .q(q)
    );

    task test_datain;
        begin
            fork begin
                for (j = 0; j < 256; j = j + 1) begin
                    #5 clk = ~clk;
                    d = j;
                end
            end
            begin
                repeat (256) begin
                    sel = 2'b00; #5; 
                    sel = 2'b01; #5;
                    sel = 2'b10; #5;
                    sel = 2'b11; #5;
                end
            end
            join
        end
    endtask

    initial begin
        clk = 0;
        d = 8'h00;
        sel = 2'b00;
        $dumpfile("dff_and_mux_tb.vcd");
        $dumpvars(0, dff_and_mux_tb);
        $monitor("Time: %0t, d: %b, sel: %b, q: %b", $time, d, sel, q);
        test_datain();
        $finish;
    end

endmodule