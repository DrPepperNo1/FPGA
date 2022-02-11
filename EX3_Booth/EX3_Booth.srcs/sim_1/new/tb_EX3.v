`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/07 22:37:24
// Design Name: 
// Module Name: tb_EX3
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


module tb_EX3();
    reg clk;
    reg rstn;
    reg [7:0] mul1,mul2;
    wire [15:0] result;
    initial begin
    clk <= 0;
    mul1 <= -8'd7;
    mul2 <= 8'd3;
    #100;
    rstn <= 1;
    #100;
    end
    always #10 clk=~clk;
    EX3_Booth_8bit Booth_8bit(
    .clk(clk),
    .rstn(rstn),
    .mul_x(mul1),
    .mul_y(mul2),
    .result(result)
    );
endmodule
