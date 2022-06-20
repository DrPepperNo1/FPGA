`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/22 23:02:47
// Design Name: 
// Module Name: tb_EX6
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


module tb_EX6();
    reg clk,rstn;
    reg data;
    reg flag;
    wire [1:0]result;
    initial begin
    clk=0;
    flag = 0;
    rstn = 0;
    data=0;
    #100;
    rstn = 1;
    flag =1;
    end
    always #10 clk=~clk;
    always #23 data=~data;
    EX6_EdgeDetector_SourceCode EX6(
    .data(data),
    .clk(clk),
    .rstn(rstn),
    .result(result));
endmodule
