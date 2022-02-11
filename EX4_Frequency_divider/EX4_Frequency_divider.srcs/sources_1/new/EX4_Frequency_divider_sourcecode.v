//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/02 21:34:35
// Design Name: 
// Module Name: EX4_Frequency_divider_sourcecode
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
module EX4_Frequency_divider_sourcecode(
    input clk,
    input rstn,
    output wire out_clk
    );
    reg [0:2] positive_counter;//上升沿触发的计数器
    reg [0:2] negtive_counter;//下降沿触发的计数器
    reg divided_clk;//
    
    always@(posedge clk or negedge rstn)//上升沿触发的计数器
    begin
        if(!rstn)
            positive_counter <= 0;
        else if(positive_counter != 4)
            positive_counter <= positive_counter+1;
        else positive_counter<=0;
    end
    
    always@(negedge clk or negedge rstn)//下降沿触发的计数器
    begin
        if(!rstn)
            negtive_counter <= 0;
        else if(negtive_counter != 4)
            negtive_counter <= negtive_counter+1;
        else negtive_counter<=0;
    end
    
    always@(*)//时序逻辑对输出变量寄存器按照一定规律赋值得到分频信号
    begin
        divided_clk <= (positive_counter>1)&(negtive_counter>1);
    end
assign out_clk = divided_clk; //输出变量寄存器用线网作为模块输出 
endmodule
