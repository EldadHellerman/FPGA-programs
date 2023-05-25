module main(input clk, [1:0] buttons, output reg [5:0] leds);
    //Input: 1 clock signal, 2 buttons
    //Output: 6 LEDs
    reg [23:0] counter; //using a 24 bits wide register
    
    always @(posedge clk) begin //on every positive edge clock execute this
        //check if counter reached 13500000, which is 0.5 second.
        //here it is 13499999 since counter is starting at 0 and not 1.
        if(counter == 24'd13_499_999) begin //'execute' multiple commands
            counter <= 24'd0; //reset counter to 0
            leds[0] <= !leds[0]; //toggle led[0].

            //set LEDs 2 and 1 to buttons 1 and 0:
           leds[2:1] <= buttons[1:0];
            //cascading effect, set LEDs 5 4 3 next state to be
            //leds 4 3 5 current state, or to 110 if button 0 is pressed:
           leds[5:3] <= (buttons[0] ? {leds[4:3],leds[5]} : ~3'b1);
        end
        else counter <= counter + 1'b1; //else, just increase counter by 1.
    end
endmodule