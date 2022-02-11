//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/04 16:05:04
// Design Name: 
// Module Name: decoder38
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


module decoder(
    input clk,
    input rstn,
    input [2:0] in,
    output reg [7:0] out
    );
    always@(posedge clk or negedge rstn)
    begin
        if(!rstn)
            out <= 8'b0000_0000;
        else 
            begin
            case(in)
                3'b000: out <= 8'b0000_0001;
                3'b001: out <= 8'b0000_0010;
                3'b010: out <= 8'b0000_0100;
                3'b011: out <= 8'b0000_1000;
                3'b100: out <= 8'b0001_0000;
                3'b101: out <= 8'b0010_0000;
                3'b110: out <= 8'b0100_0000;
                3'b111: out <= 8'b1000_0000;
                default: out <= 8'b1111_1111;
            endcase
            end
    end
endmodule
