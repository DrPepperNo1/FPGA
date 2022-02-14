module FIFO_ReadEmpty
    #(parameter FIFO_addr_size = 4,parameter FIFO_data_size = 16)
    (
    input read_en,
    input clk_r,
    input rstn_r,
    input [FIFO_addr_size:0] w_pointer_sync,
    output wire [FIFO_addr_size-1:0] r_addr,
    output reg read_empty,
    output reg [FIFO_addr_size:0] r_pointer
);
    reg [FIFO_addr_size:0] r_pointer_bin;
    
    always@(posedge clk_r or negedge rstn_r)
    begin
        if(!rstn_r)
            begin
                r_pointer_bin <= {(FIFO_addr_size+1){1'b0}};
            end
        else if((read_en==1)&&(read_empty==0))
            begin
                r_pointer_bin <= r_pointer_bin + 1;
            end
        else 
            begin
                r_pointer_bin <= r_pointer_bin + 0;
            end
    end
    
    always@(*)
    begin
        r_pointer = (r_pointer_bin>>1)^r_pointer_bin;
    end
    
    always@(posedge clk_r)
    begin
        if(r_pointer==w_pointer_sync)
            read_empty <= 1;
        else
            read_empty <= 0;
    end
    assign r_addr = r_pointer_bin[FIFO_addr_size-1:0];
endmodule