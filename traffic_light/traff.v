module traff (
    input wire clk,            // 10MHz clock
    input wire rst_n,          // Active low reset
    input wire en,             // Enable
    output reg red_light,
    output reg yellow_light,
    output reg green_light,
    output reg [15:0] display_led  // 2-digit 7 segment
);

    // ======= Parameters =======
    parameter CLK_FREQ = 10000000;    // 10 MHz
    parameter ONE_SEC = CLK_FREQ;     // 10 million ticks = 1 second

    // ======= State encoding =======
    typedef enum logic [1:0] {
        RED = 2'b00,
        GREEN = 2'b01,
        YELLOW = 2'b10
    } state_t;

    state_t state, next_state;

    // ======= Counters =======
    reg [23:0] clk_div;
    reg one_sec_tick;
    reg [5:0] sec_cnt;

    // ======= Clock Divider =======
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            clk_div <= 0;
            one_sec_tick <= 0;
        end else if (en) begin
            if (clk_div == ONE_SEC - 1) begin
                clk_div <= 0;
                one_sec_tick <= 1;
            end else begin
                clk_div <= clk_div + 1;
                one_sec_tick <= 0;
            end
        end
    end

    // ======= State Transition =======
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= RED;
            sec_cnt <= 18;
        end else if (en && one_sec_tick) begin
            if (sec_cnt == 0) begin
                case (state)
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
                    default: begin
                        state <= RED;
                        sec_cnt <= 18;
                    end
                endcase
            end else begin
                sec_cnt <= sec_cnt - 1;
            end
        end
    end

    // ======= Light Control =======
    always @(*) begin
        red_light = (state == RED);
        yellow_light = (state == YELLOW);
        green_light = (state == GREEN);
    end

    // ======= 7 Segment Decoder (2 digits) =======
    function [6:0] seg_decoder(input [3:0] bin);
        case (bin)
            4'd0: seg_decoder = 7'b1000000;
            4'd1: seg_decoder = 7'b1111001;
            4'd2: seg_decoder = 7'b0100100;
            4'd3: seg_decoder = 7'b0110000;
            4'd4: seg_decoder = 7'b0011001;
            4'd5: seg_decoder = 7'b0010010;
            4'd6: seg_decoder = 7'b0000010;
            4'd7: seg_decoder = 7'b1111000;
            4'd8: seg_decoder = 7'b0000000;
            4'd9: seg_decoder = 7'b0010000;
            default: seg_decoder = 7'b1111111;  // blank
        endcase
    endfunction

    always @(*) begin
        reg [3:0] tens, ones;
        tens = sec_cnt / 10;
        ones = sec_cnt % 10;

        display_led[6:0]   = seg_decoder(ones);     // right digit
        display_led[14:8]  = seg_decoder(tens);     // left digit
        display_led[7]     = 1; // unused DP
        display_led[15]    = 1; // unused DP
    end

endmodule