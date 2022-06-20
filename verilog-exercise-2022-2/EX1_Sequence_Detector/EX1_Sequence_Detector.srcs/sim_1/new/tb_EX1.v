`timescale 1ns / 1ps
`define clk_period 20
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/03 16:31:09
// Design Name: 
// Module Name: tb_EX1
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


module tb_EX1();
    reg clk;
    reg rstn;
    reg mode_select;
    wire [0:1] flag;
    reg seq_input;
    
    initial begin
    seq_input=0;
    mode_select=1'b0;
    clk = 1'b0;
    rstn = 1'b0;
    #100;
    rstn = 1'b1;
    #100;
    seq_input=1'b1;
    #(`clk_period);
    seq_input=1'b0;
    #(`clk_period);
    seq_input=1'b0;
    #(`clk_period);
    seq_input=1'b1;
    #(`clk_period);
    seq_input=1'b0;
    #(`clk_period);
    seq_input=1'b1;
    #(`clk_period);
    seq_input=1'b0;
    #(`clk_period);
    seq_input=1'b1;
    #(`clk_period);
    seq_input=1'b0;
    #(`clk_period);
    seq_input=1'b1;
    #(`clk_period);
    seq_input=1'b0;
    #(`clk_period);
    seq_input=1'b1;
    #(`clk_period);
    seq_input=1'b1;
    #(`clk_period);
    seq_input=1'b1;
    #(`clk_period);
    seq_input=1'b0;
    #(`clk_period);
    #50;
    mode_select=1'b1;
    seq_input=1'b1;
    #(`clk_period);
    seq_input=1'b1;
    #(`clk_period);
    seq_input=1'b1;
    #(`clk_period);
    seq_input=1'b0;
    #(`clk_period);
    seq_input=1'b0;
    #(`clk_period);
    seq_input=1'b1;
    #(`clk_period);
    seq_input=1'b1;
    #(`clk_period);
    seq_input=1'b0;
    #(`clk_period);
    seq_input=1'b1;
    #(`clk_period);
    seq_input=1'b0;
    #(`clk_period);
    seq_input=1'b1;
    #(`clk_period);
    seq_input=1'b1;
    #(`clk_period);
    seq_input=1'b0;
    #(`clk_period);
    seq_input=1'b1;
    #(`clk_period);
    seq_input=1'b0;
    #(`clk_period);
    end
    
    always #(`clk_period/2) clk = ~clk;
    
    EX1_Sequence_Detector EX1_Sequence_Detector(
    .clk(clk),
    .rstn(rstn),
    .mode_select(mode_select),//1'b1Îª11010Ì½²â£¬1'b0Îª10101Ì½²â
    .seq_input(seq_input),
    .flag(flag)
    );
    
endmodule
