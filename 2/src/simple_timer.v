module simple_timer
        #(COUNT = 27_000_000/2, WIDTH = $clog2(COUNT))
        (input reset, clk_in, output reg clk_out, reg [WIDTH-1:0] counter);
    
    always @(posedge clk_in or posedge reset) begin
        if(reset) begin
            counter <= {WIDTH{1'b0}};
            clk_out <= 1'b0;
        end else if (counter == COUNT-1) begin
            counter <= {WIDTH{1'b0}};
            clk_out <= ~clk_out;
        end else begin
            counter <= counter + 1'b1;
        end
    end
endmodule