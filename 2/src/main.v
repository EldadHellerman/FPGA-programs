module main(input clk, [1:0] buttons, output reg [5:0] leds, wire [6:0] segments);
    wire clk_seconds;
    simple_timer timer_seconds(1'b0, clk, clk_seconds,);
    
    wire [3:0] number;
    simple_timer #(.COUNT(16)) timer_numbers(1'b0, clk_seconds, ,number);

	// seven_segment_using_lut #(.COMMON_ANODE(1)) ss_lut (number, segments);
	seven_segment_using_case #(.COMMON_ANODE(1)) ss_case (number, segments);

endmodule