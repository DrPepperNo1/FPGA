//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/04 12:13:29
// Design Name: 
// Module Name: PWM
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


module PWM(
    input clk,
    input rstn,
    output reg pwmwave
    );
    reg [9:0] levels;
    wire [9:0] levels_compare;
    reg flag;//0 stands for rise,1 stands for fall
    reg refresh;
    initial begin
    flag = 0;
    refresh = 0;
    end
    always@(posedge clk or negedge rstn)
    begin
        if(!rstn)
            levels <= 0;
        else if(flag==0)
            levels <= levels + 1;
        else 
            levels <= levels - 1;
    end
    
    always@(clk or levels_compare or levels or flag)
    begin
        
        //if( ((flag == 0)|(flag == 1))&(levels == (max-1)) )
        if(levels == levels_compare)
            flag <= 1;
       // else if( ((flag==1)|(flag==0))&(levels==0) )
        else if(levels==0)
            flag <= 0;
        else
            flag <= flag + 0;
    end
    
    always@(*)
    begin
        if(levels<=levels_compare)//pwmÕ¼¿Õ±È
            pwmwave <= 1;
        else 
            pwmwave <= 0;
    end
    always@(flag)
    begin
        refresh <= ~refresh;
    end
    CompareSignal CompareSignal(
    .rstn(rstn),
    .refresh(refresh),
    .levels_compare(levels_compare)
    );
endmodule
