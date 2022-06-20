`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/04 12:12:39
// Design Name: 
// Module Name: RunningWaterLight
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RunningWaterLight(
    input clk,
    input rstn,
    output [7:0] LED
    );
    reg [2:0] input_decoder38;
    wire [7:0] outputofdecoder38;
    wire pwm;
    wire [7:0] pwm_signal;
    assign pwm_signal[0]=pwm;
    assign pwm_signal[1]=pwm;
    assign pwm_signal[2]=pwm;
    assign pwm_signal[3]=pwm;
    assign pwm_signal[4]=pwm;
    assign pwm_signal[5]=pwm;
    assign pwm_signal[6]=pwm;
    assign pwm_signal[7]=pwm;
    reg [7:0] LED_signal;
    wire LED_clock;
    
    always@(posedge LED_clock or negedge rstn)
    begin
        if(!rstn)
            input_decoder38 <= 3'b000;
        else 
            input_decoder38 <= input_decoder38 + 1;              
    end
    
    always@(outputofdecoder38 or pwm_signal)
    begin
        case(outputofdecoder38)
                8'b0000_0001: 
                begin
                   LED_signal = pwm_signal&(8'b0000_0001);
                end
                8'b0000_0010:
                begin
                   LED_signal = pwm_signal&(8'b0000_0010);
                end    
                8'b0000_0100:
                begin
                   LED_signal = pwm_signal&(8'b0000_0100);
                end    
                8'b0000_1000:
                begin
                  LED_signal = pwm_signal&(8'b0000_1000);
                end   
                8'b0001_0000:
                begin
                   LED_signal = pwm_signal&(8'b0001_0000);
                end   
                8'b0010_0000:
                begin
                   LED_signal = pwm_signal&(8'b0010_0000);
                end
                8'b0100_0000:
                begin
                   LED_signal = pwm_signal&(8'b0100_0000);
                end
                8'b1000_0000:
                begin
                   LED_signal = pwm_signal&(8'b1000_0000);
                end
                default: LED_signal = pwm_signal&(8'b1111_1111);   
            endcase
    end
    
    decoder decoder38(
    .clk(clk),
    .rstn(rstn),
    .in(input_decoder38),
    .out(outputofdecoder38)
    );
    PWM PWM(
    .clk(clk),
    .rstn(rstn),
    .pwmwave(pwm)
    );
    flowclock_generater flowclock_generater(
    .clk(clk),
    .rstn(rstn),
    .out_slowclk(LED_clock)
    );
    assign LED = LED_signal;
endmodule
