//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/22 22:35:35
// Design Name: 
// Module Name: EX6_EdgeDetector_SourceCode
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


module EX6_EdgeDetector_SourceCode(
    input data,
    input clk,
    input rstn,
    output [1:0] result
    );
    reg i0,i1;
    reg data_1,data_2;
    always@(posedge clk or negedge rstn)
    begin
        if(!rstn) begin
            data_1 <= 1'b0;
            data_2 <= 1'b1;
        end
        else begin
            data_1 <= data;
            data_2 <= ~data_1;
        end
    end
    always@(*)
    begin
        i0 = data_1&data_2;//ÉÏÉýÑØ¼ì²â,ÕýÂö³å
        i1 = data_1|data_2;//ÏÂ½µÑØ¼ì²â£¬¸ºÂö³å
    end
    assign result[0] = i0;
    assign result[1] = i1;
endmodule
