module FIFO_RAM
    #(parameter FIFO_addr_size = 4,parameter FIFO_data_size = 16)
    (
    input clk_w,
    input clk_r,
    input rstn_w,
    input rstn_r,
    input [FIFO_data_size-1:0] data_in,
    input [FIFO_addr_size-1:0] w_addr,//RAM�ڵ�д��ַ���Ѿ�ת�����˸��������,д��ַ��ʮ����������Ҫ4λ������
    input write_full,//д��׷���˶�����Ҫ��һ����д����������ֹͣ
    input read_empty,//����������д�룬Ҫдһд�ٶ�,д������ֹͣ
    input write_en,
    input read_en,
    input [FIFO_addr_size-1:0] r_addr,//RAM�ڵĶ���ַ��Ҳ��ת��Ϊ���������
    output reg [FIFO_data_size-1:0] data_out
);
    //reg [FIFO_data_size-1:0] mem [FIFO_addr_size-1:0]; ���ֻ��0~3�����ǵ�ַ���뷶Χ��0~15
    reg [FIFO_data_size-1:0] mem [15:0];
    integer i;
    always@(posedge clk_w or negedge rstn_w)//д��
    begin
        if(!rstn_w)
        begin
            for(i=0;i<FIFO_addr_size;i=i+1)
                mem[i] <= {FIFO_data_size{1'b0}};   
        end
        else if((write_full==0)&&(write_en==1))
            mem[w_addr] <= data_in;
        else
        begin
            mem[w_addr] <= mem[w_addr] + 0;
            //for(i=0;i<FIFO_addr_size;i=i+1)
                //mem[i] <= {FIFO_data_size{1'b0}}; 
               // mem[i] <= mem[i] + 0;
        end  
    end
    
    always@(posedge clk_r or negedge rstn_r)//����
    begin
        if(!rstn_r)
            data_out <= {FIFO_data_size{1'b0}};
        else if((read_empty==0)&&(read_en==1))
            data_out <= mem[r_addr];
        else
            //data_out <= {FIFO_data_size{1'b0}};
            data_out <= data_out + 0;
    end
endmodule