`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/12 11:18:34
// Design Name: 
// Module Name: tb_EX7
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


module tb_EX7 #(parameter FIFO_addr_size = 4,parameter FIFO_data_size = 16)();
    reg clk_r,rstn_r,write_en,read_en,clk_w,rstn_w;
    reg [FIFO_data_size-1:0]data_in;
    wire [FIFO_data_size-1:0]data_out;
 
    reg [FIFO_data_size-1:0] i;

    initial begin
        clk_w=0;
        rstn_w=1;
        data_in={FIFO_data_size{1'b0}};
        #15
        rstn_w=0;
        #20
        rstn_w=1;
    end

    initial begin
        clk_r=0;
        rstn_r=1;
        read_en=0;
        #25
        rstn_r=0;
        #50
        rstn_r=1;
    end
 
    initial begin
        write_en=0;
        #450
        write_en=1;
        #400
        write_en=0;
        #750
        write_en=1;
    end
  
    initial begin
        read_en=0;
        #900
        read_en=1;
        #400
        read_en=0;
        #300
        read_en=1;
    end
    
    initial begin
    for(i=0;i<=1000;i=i+1)
        begin
            #100;
            data_in = i;
        end
    end
 
    always #25 clk_w=~clk_w;
    always #50 clk_r=~clk_r;

    FIFO_top top(
              .clk_w(clk_w),
              .rstn_w(rstn_w),
              .write_en(write_en),
              .clk_r(clk_r),
              .rstn_r(rstn_r),
              .read_en(read_en),
              .data_in(data_in),
              .data_out(data_out)
    ); 
endmodule

