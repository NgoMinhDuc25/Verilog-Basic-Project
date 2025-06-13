module traffic_light_tb;
    reg clk;
    reg en;
    reg rst_n;
    wire red_light;
    wire yellow_light;
    wire green_light;
    traffic_light uut (
        .clk(clk),
        .en(en),
        .rst_n(rst_n),
        .red_light(red_light),
        .yellow_light(yellow_light),
        .green_light(green_light)
    );


    task gen_clk;
    begin
        fork
        repeat (1000) begin
            #5 clk = ~clk; 
        end
        begin 
            // #22 rst_n = 0; 
            // #30 rst_n = 1; 
            // #2000 rst_n = 0;
            // #5 rst_n = 1; 
            #500 en = 1;
        end
        join
    end
    endtask

    initial begin
        clk = 0;
        en = 0;
        rst_n = 1;
        $dumpfile("traffic_light_tb.vcd");
        $dumpvars(0, traffic_light_tb);
        $monitor("Time: %0t, Red: %b, Yellow: %b, Green: %b", $time, red_light, yellow_light, green_light);
        gen_clk();
        $finish;
    end
endmodule