//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/11 22:43:44
// Design Name: 
// Module Name: EX7_FIFO_WriteFull
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
module FIFO_WriteFull
    #(parameter FIFO_addr_size = 4,parameter FIFO_data_size = 16)
    (
    input write_en,
    input rstn_w,
    input clk_w,
    input [FIFO_addr_size:0] r_pointer_sync,
    output wire [FIFO_addr_size-1:0] w_addr,
    output reg write_full,
    output reg [FIFO_addr_size:0] w_pointer
    );
    reg [FIFO_addr_size:0] w_pointer_bin;
    always@(posedge clk_w or negedge rstn_w)
    begin
        if(!rstn_w)
            begin
                w_pointer_bin <= {(FIFO_addr_size+1){1'b0}};
            end
        else if((write_en==1)&&(write_full==0))
            begin
                w_pointer_bin <= w_pointer_bin + 1;
            end
        else 
            begin
                w_pointer_bin <= w_pointer_bin + 0;
            end
    end
    always@(*)
    begin
        w_pointer = (w_pointer_bin>>1)^w_pointer_bin;    
    end
    always@(posedge clk_w)
    begin
        if((w_pointer[FIFO_addr_size-1:0]==r_pointer_sync[FIFO_addr_size-1:0])&&(w_pointer[FIFO_addr_size]!=r_pointer_sync[FIFO_addr_size]))
            write_full = 1;
        else
            write_full = 0;
    end
    assign w_addr = w_pointer_bin[FIFO_addr_size-1:0];
endmodule
