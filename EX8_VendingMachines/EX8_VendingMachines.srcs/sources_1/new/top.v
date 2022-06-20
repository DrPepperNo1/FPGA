`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/25 14:33:14
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    //input rstn,
    input keyin_1,
    input keyin_2,
    output drink,
    output givechange
    );
    reg rstn;
    wire hold;
    wire [1:0] keyoutfromjudge;
    initial begin
        rstn = 1'b0;
        #100;
        rstn = 1'b1;
    end
    EX8_Judge Judge(
        .clk(clk),
        .rstn(rstn),
        .keyin_1(keyin_1),
        .keyin_2(keyin_2),
        .hold(hold),
        .keyout(keyoutfromjudge)
    );
    EX8_Result Result(
        .keyoutfromjudge(keyoutfromjudge),
        .clk(clk),
        .rstn(rstn),
        .drink(drink),
        .givechange(givechange),
        .hold(hold)
    );
endmodule
