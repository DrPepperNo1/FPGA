//д��16bit���ݣ�����
//`ifndef FIFO_addr_size
//`define parameter FIFO_addr_size = 4;
//`endif
//
//`ifndef FIFO_data_size
//`define parameter FIFO_data_size = 16;
//`endif

module FIFO_top
    #(parameter FIFO_addr_size = 4,parameter FIFO_data_size = 16)
    (
    //��д���ݼ������ź�
    input [FIFO_data_size-1:0] data_in,
    input write_en,
    input clk_w,
    input rstn_w,
    //�������ݼ������ź�
    input clk_r,
    input rstn_r,
    input read_en,
    output wire [FIFO_data_size-1:0] data_out
);
    wire read_empty,write_full;
    wire [FIFO_addr_size-1:0] w_addr,r_addr;
    wire [FIFO_addr_size:0] w_pointer,r_pointer;
    wire [FIFO_addr_size:0] w_pointer_sync,r_pointer_sync;
    
    FIFO_RAM RAM(
        .clk_r(clk_r),
        .clk_w(clk_w),
        .rstn_w(rstn_w),
        .rstn_r(rstn_r),
        .data_in(data_in),
        .w_addr(w_addr),//RAM�ڵ�д��ַ���Ѿ�ת�����˸��������,д��ַ��ʮ����������Ҫ4λ������
        .write_full(write_full),//д��׷���˶�����Ҫ��һ����д����������ֹͣ
        .read_empty(read_empty),//����������д�룬Ҫдһд�ٶ�,д������ֹͣ
        .write_en(write_en),
        .read_en(read_en),
        .r_addr(r_addr),//RAM�ڵĶ���ַ��Ҳ��ת��Ϊ���������
        .data_out(data_out) 
    );
    
    FIFO_ReadEmpty ReadEmpty(
        .read_en(read_en),
        .clk_r(clk_r),
        .rstn_r(rstn_r),
        .w_pointer_sync(w_pointer_sync),
        .r_addr(r_addr),
        .read_empty(read_empty),
        .r_pointer(r_pointer)
    );
    
    FIFO_WriteFull WriteFull(
        .write_en(write_en),
        .rstn_w(rstn_w),
        .clk_w(clk_w),
        .r_pointer_sync(r_pointer_sync),
        .w_addr(w_addr),
        .write_full(write_full),
        .w_pointer(w_pointer)
    );
    
    FIFO_Synchronization RtoW(
        .din(r_pointer),
        .dout(r_pointer_sync),
        .clk(clk_w),
        .rstn(rstn_w)
    );
    
    FIFO_Synchronization WtoR(
        .din(w_pointer),
        .dout(w_pointer_sync),
        .clk(clk_r),
        .rstn(rstn_r)
    );
endmodule