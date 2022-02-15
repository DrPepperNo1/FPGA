//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/04 23:32:12
// Design Name: 
// Module Name: flowclock_generater
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


module flowclock_generater(
    input clk,
    input rstn,
    output reg out_slowclk
    );
    reg [23:0] counter;
    parameter max = 24'h9fffff;
    always@(posedge clk or negedge rstn)
    begin
        if(!rstn)
            counter <= 0;
        else if(counter<max)
            counter <= counter + 1;
        else
            counter <= 0;
    end
    
    always@(counter)
    begin
        if(counter>=max)
        begin
            out_slowclk <= 1;
        end
        else
            out_slowclk <= 0;
    end
endmodule
