module FIFO_RAM
    #(parameter FIFO_addr_size = 4,parameter FIFO_data_size = 16)
    (
    input clk_w,
    input clk_r,
    input rstn_w,
    input rstn_r,
    input [FIFO_data_size-1:0] data_in,
    input [FIFO_addr_size-1:0] w_addr,//RAM内的写地址，已经转换成了格雷码编码,写地址有十六个，故需要4位二进制
    input write_full,//写入追上了读出，要读一读再写，读操作不停止
    input read_empty,//读出超过了写入，要写一写再度,写操作不停止
    input write_en,
    input read_en,
    input [FIFO_addr_size-1:0] r_addr,//RAM内的读地址，也已转换为格雷码编码
    output reg [FIFO_data_size-1:0] data_out
);
    //reg [FIFO_data_size-1:0] mem [FIFO_addr_size-1:0]; 深度只有0~3，但是地址编码范围是0~15
    reg [FIFO_data_size-1:0] mem [15:0];
    integer i;
    always@(posedge clk_w or negedge rstn_w)//写入
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
    
    always@(posedge clk_r or negedge rstn_r)//读出
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