`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/28 23:13:03
// Design Name: 
// Module Name: tb_EX8
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


module tb_EX8();

    reg clk;
    reg rstn;
    reg keyin_1,keyin_2;
    wire drink,givechange;

    initial begin
        clk = 1'b0;
        rstn = 1'b0;
        keyin_1 = 1'b0;
        keyin_2 = 1'b0;
        #50;
        rstn = 1'b1;
        #50;
        keyin_1 = 1'b1;
        #200;
        keyin_1 = 1'b0;
        #100;
        keyin_1 = 1'b1;
        #200;
        keyin_1 = 1'b0;
        #100;
        keyin_1 = 1'b1;
        #200;
        keyin_1 = 1'b0;
        #100;
        keyin_2 = 1'b1;
        #200;
        keyin_2 = 1'b0;
    end

    always #10 clk = ~clk;

    top Top(
        .clk(clk),
        .rstn(rstn),
        .keyin_1(keyin_1),
        .keyin_2(keyin_2),
        .drink(drink),
        .givechange(givechange)
    );
endmodule
