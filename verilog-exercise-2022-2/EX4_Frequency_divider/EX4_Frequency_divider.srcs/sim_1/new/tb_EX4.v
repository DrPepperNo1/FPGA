`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/02 22:02:11
// Design Name: 
// Module Name: tb_EX4
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


module tb_EX4();
    reg sys_clk;
    reg sys_rstn;
    wire out_clk;
    initial begin
        sys_clk = 1'b0;
        sys_rstn = 1'b0;
        #200
        sys_rstn=~sys_rstn;
    end
    
    always #10 sys_clk = ~sys_clk;
    
    EX4_Frequency_divider_sourcecode EX4_Frequency_divider_sourcecode(
    .clk(sys_clk),
    .rstn(sys_rstn),
    .out_clk(out_clk)
    );
endmodule
