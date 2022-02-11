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
    parameter max = 50;//PWM½×ÌÝÊý
    reg [15:0] levels;
    reg flag;//0 stands for rise,1 stands for fall
    always@(posedge clk or negedge rstn)
    begin
        if(!rstn)
            levels <= 16'b0000_0000_0000_0000;
        else if(flag==0)
            levels <= levels + 1;
        else 
            levels <= levels - 1;
    end
    
    always@(clk or levels)
    begin
        
        //if( ((flag == 0)|(flag == 1))&(levels == (max-1)) )
        if(levels == (max-1))
            flag <= 1;
       // else if( ((flag==1)|(flag==0))&(levels==0) )
       else if(levels==0)
            flag <= 0;

    end
    
    always@(*)
    begin
        if(levels>24)//pwmÕ¼¿Õ±È
            pwmwave <= 1;
        else 
            pwmwave <= 0;
    end
endmodule
