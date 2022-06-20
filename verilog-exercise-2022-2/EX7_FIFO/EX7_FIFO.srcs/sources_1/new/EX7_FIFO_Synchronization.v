//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/12 09:11:36
// Design Name: 
// Module Name: FIFO_Synchronization
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


module FIFO_Synchronization
    #(parameter FIFO_addr_size = 4,parameter FIFO_data_size = 16)
    (
    input [FIFO_addr_size:0] din,
    output reg [FIFO_addr_size:0] dout,
    input rstn,
    input clk
    );
    
    always@(posedge clk or negedge rstn)
    begin
        if(!rstn)
            dout <= 0;
        else
            dout<=din;
    end
endmodule
