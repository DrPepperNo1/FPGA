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
    reg [0:2] positive_counter;//�����ش����ļ�����
    reg [0:2] negtive_counter;//�½��ش����ļ�����
    reg divided_clk;//
    
    always@(posedge clk or negedge rstn)//�����ش����ļ�����
    begin
        if(!rstn)
            positive_counter <= 0;
        else if(positive_counter != 4)
            positive_counter <= positive_counter+1;
        else positive_counter<=0;
    end
    
    always@(negedge clk or negedge rstn)//�½��ش����ļ�����
    begin
        if(!rstn)
            negtive_counter <= 0;
        else if(negtive_counter != 4)
            negtive_counter <= negtive_counter+1;
        else negtive_counter<=0;
    end
    
    always@(*)//ʱ���߼�����������Ĵ�������һ�����ɸ�ֵ�õ���Ƶ�ź�
    begin
        divided_clk <= (positive_counter>1)&(negtive_counter>1);
    end
assign out_clk = divided_clk; //��������Ĵ�����������Ϊģ����� 
endmodule
