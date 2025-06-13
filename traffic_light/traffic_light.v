module traffic_light(
    input clk, en, rst_n,
    output reg red_light,
    output reg yellow_light,
    output reg green_light
);
    wire one_sec_tick;
    clock_div clk_div1(.clk(clk), .en(en), .rst_n(rst_n), .one_sec_tick(one_sec_tick));

    reg [5:0] sec_cnt;
    reg [1:0] state;

    localparam RED = 2'b00, YELLOW = 2'b01, GREEN = 2'b10, IDLE = 2'b11;

    initial begin
        red_light = 1;
        yellow_light = 0;
        green_light = 0;
        sec_cnt = 0; 
        state = IDLE;
    end
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            state <= RED;
            sec_cnt <= 18;
        end else if(!en) begin
            state <= IDLE; 
        end else if(en && one_sec_tick) begin
            if(sec_cnt == 0) begin
                case(state)
                    RED: begin
                        state <= GREEN;
                        sec_cnt <= 15;
                    end
                    GREEN: begin
                        state <= YELLOW;
                        sec_cnt <= 3;
                    end
                    YELLOW: begin
                        state <= RED;
                        sec_cnt <= 18;
                    end
                    IDLE: begin
                        state <= RED; 
                        sec_cnt <= 18; 
                    end
                endcase
            end else begin
                sec_cnt <= sec_cnt - 1;
            end
        end
    end
    always @(*) begin
        red_light = (state === RED);
        yellow_light = (state === YELLOW);
        green_light = (state === GREEN);
    end
endmodule

module clock_div #(parameter ONE_SEC = 10) (
    input clk, en, rst_n,
    output reg one_sec_tick
);
    reg [23:0] counter;
    initial begin
        counter = 0;
        one_sec_tick = 0;
    end
    always @(posedge clk) begin
        if(!rst_n) begin
            counter <= 0;
            one_sec_tick <= 0;
        end else if (en) begin
            if (counter == (ONE_SEC - 1)) begin
                counter <= 0;
                one_sec_tick <= 1; 
            end else begin
                counter <= counter + 1;
                one_sec_tick <= 0; 
            end
        end
    end

endmodule