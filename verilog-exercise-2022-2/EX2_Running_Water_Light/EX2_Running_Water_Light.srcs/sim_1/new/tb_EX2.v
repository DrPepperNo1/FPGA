`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/04 17:54:18
// Design Name: 
// Module Name: tb_EX2
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


module tb_EX2();
    reg clk;
    reg rstn;
    wire [7:0] LED;
    initial begin
    clk = 0;
    rstn = 0;
    #100;
    rstn = 1;
    end
    always #10 clk=~clk;
    RunningWaterLight RunningWaterLight(
        .clk(clk),
        .rstn(rstn),
        .LED(LED)
    );
endmodule
