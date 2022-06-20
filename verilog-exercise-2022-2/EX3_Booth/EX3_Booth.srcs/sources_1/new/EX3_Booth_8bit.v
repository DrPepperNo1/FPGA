`define size 8
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/07 15:47:05
// Design Name: 
// Module Name: EX3_Booth_8bit
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


module EX3_Booth_8bit(
    input clk,
    input rstn,
    input [`size-1:0] mul_x,
    input [`size-1:0] mul_y,
    output reg [`size*2 - 1:0] result
    );
    reg [2:0] judge;
    reg [2:0] state;
    reg [`size*2-1:0] temp;
    reg [15:0] en_output;
    always@(posedge clk or negedge rstn)
    begin
        if(!rstn)
           en_output <= 'h0000;//这里有问题
        else 
            en_output <= 'hffff;
    end
    
    always@(posedge clk)
    begin
        case(state)
        3'b000: begin judge <= {mul_y[1:0],1'b0};state <= state+1;end
        3'b001: begin judge <= mul_y[3:1];state <= state+1;end
        3'b010: begin judge <= mul_y[5:3];state <= state+1;end
        3'b011: begin judge <= mul_y[7:5];state <= state+1;end
        default: state <= 0;
        endcase
    end
    always@(posedge clk)
    begin
        if(state==4) 
            temp <= 0;
        else begin
            case(judge)
            3'b000,3'b111:
                temp <= temp +0;
            3'b001,3'b010:
                temp <= temp+({{8{mul_x[`size-1]}},mul_x} << (state+state-2));
            3'b011:
                temp <= temp+({{8{mul_x[`size-1]}},mul_x} << (state+state-1));
            3'b101,3'b110:
                temp <= temp+(~{{8{mul_x[`size-1]}},mul_x}+1 << (state+state-2));
            3'b100:
                temp <= temp+(~{{8{mul_x[`size-1]}},mul_x}+1 << (state+state-1));
            default:
                temp <= 0;
            endcase
        end
    end
    always@(*)
    begin
        result <= temp & en_output;
    end
endmodule
