//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/15 21:35:33
// Design Name: 
// Module Name: CompareSignal
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
module CompareSignal(
    input clk,
    input rstn,
    input refresh,
    output reg [9:0] levels_compare
    );
    reg [11:0] counter;
    reg [9:0] levels_compare_temp;
    reg flag;
    initial begin
    flag = 0;
    end
    always@(posedge clk or negedge rstn)
    begin
        if(!rstn)
            counter <= 0;
        else if(counter == 12'hc03)
        begin
            levels_compare <= levels_compare_temp;
            counter <= 0; 
        end
        else 
            counter <= counter + 1;
    end
    always@(posedge clk or negedge rstn)
    begin
        if(!rstn)
            levels_compare_temp <= 0;
        else if(flag==0)
            levels_compare_temp <= levels_compare_temp + 1;
        else 
            levels_compare_temp <= levels_compare_temp - 1;  
    end
    always@(posedge clk)
    begin
        //if( ((flag == 0)|(flag == 1))&(levels == (max-1)) )
        if(levels_compare_temp == (10'b1111_1111_11))
            flag <= 1;
       // else if( ((flag==1)|(flag==0))&(levels==0) )
       else if(levels_compare_temp == 0)
            flag <= 0;
       else
            flag <= flag + 0;
    end
endmodule
