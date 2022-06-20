`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/27 11:45:43
// Design Name: 
// Module Name: EX8_EdgeDetector
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


module EX8_EdgeDetector(
    input data,
    input clk,
    input rstn,
    output [1:0] result
    );
    reg i0,i1;
    reg data_1,data_2;
    always@(posedge clk or negedge rstn)
    begin
        if(!rstn) begin
            data_1 <= 1'b0;
            data_2 <= 1'b1;
        end
        else begin
            data_1 <= data;
            data_2 <= ~data_1;
        end
    end
    always@(*)
    begin
        i0 = data_1&data_2;//�����ؼ��,������
        i1 = data_1|data_2;//�½��ؼ�⣬������
    end
    assign result[0] = i0;
    assign result[1] = i1;
endmodule