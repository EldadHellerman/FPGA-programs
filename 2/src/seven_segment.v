module seven_segment_using_lut #(parameter COMMON_ANODE = 0) (input [3:0] n, output [6:0] segments);
    LUT4 lut_a ( .I0(n[0]), .I1(n[1]), .I2(n[2]), .I3(n[3]), .F(segments[0]));
    LUT4 lut_b ( .I0(n[0]), .I1(n[1]), .I2(n[2]), .I3(n[3]), .F(segments[1]));
    LUT4 lut_c ( .I0(n[0]), .I1(n[1]), .I2(n[2]), .I3(n[3]), .F(segments[2]));
    LUT4 lut_d ( .I0(n[0]), .I1(n[1]), .I2(n[2]), .I3(n[3]), .F(segments[3]));
    LUT4 lut_e ( .I0(n[0]), .I1(n[1]), .I2(n[2]), .I3(n[3]), .F(segments[4]));
    LUT4 lut_f ( .I0(n[0]), .I1(n[1]), .I2(n[2]), .I3(n[3]), .F(segments[5]));
    LUT4 lut_g ( .I0(n[0]), .I1(n[1]), .I2(n[2]), .I3(n[3]), .F(segments[6]));

    //bits are: FEdcbA_9876543210
    defparam lut_a .INIT = COMMON_ANODE ? ~16'b110001_1111101101 : 16'b110001_1111101101;
    defparam lut_b .INIT = COMMON_ANODE ? ~16'b001001_1110011111 : 16'b001001_1110011111;
    defparam lut_c .INIT = COMMON_ANODE ? ~16'b001011_1111111011 : 16'b001011_1111111011;
    defparam lut_d .INIT = COMMON_ANODE ? ~16'b011110_1101101101 : 16'b011110_1101101101;
    defparam lut_e .INIT = COMMON_ANODE ? ~16'b111111_0101000101 : 16'b111111_0101000101;
    defparam lut_f .INIT = COMMON_ANODE ? ~16'b110011_1101110001 : 16'b110011_1101110001;
    defparam lut_g .INIT = COMMON_ANODE ? ~16'b111111_1101111100 : 16'b111111_1101111100;
endmodule

module seven_segment_using_case #(parameter COMMON_ANODE = 0) (input [3:0] number, output [6:0] segments);
    reg [6:0] out;
    assign segments = COMMON_ANODE ? ~out : out;
    
    always @(number) begin
        case(number)
            4'h0: out = 7'b0111111;
            4'h1: out = 7'b0000110;
            4'h2: out = 7'b1011011;
            4'h3: out = 7'b1001111;
            4'h4: out = 7'b1100110;
            4'h5: out = 7'b1101101;
            4'h6: out = 7'b1111101;
            4'h7: out = 7'b0000111;
            4'h8: out = 7'b1111111;
            4'h9: out = 7'b1101111;
            4'hA: out = 7'b1110111;
            4'hb: out = 7'b1111100;
            4'hc: out = 7'b1011000;
            // 4'hC: out = 7'b0111001; //capital C instead of lower
            4'hd: out = 7'b1011110;
            4'hE: out = 7'b1111001;
            4'hF: out = 7'b1110001;
        endcase
    end
endmodule
