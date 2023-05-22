module main(input clk, [1:0] buttons, output reg [5:0] leds);

reg [23:0] counter;

always @(posedge clk) begin
        counter <= counter + 1'b1;
        if (counter >= 24'd13_499_999) counter <= 24'd0;
end

always @(posedge clk) begin
        if (counter == 24'd2_000_000) begin// 0.5s delay
                leds[5:0] <= (buttons[0] ? {leds[4:0],leds[5]} : ~6'b1);
        end
end

endmodule
