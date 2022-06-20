//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/27 21:08:15
// Design Name: 
// Module Name: EX8_Result
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


module EX8_Result(
    input [1:0] keyoutfromjudge,
    input clk,
    input rstn,
    output reg drink,
    output reg givechange,
    output reg hold
    );

    parameter ZERO = 3'b000;
    parameter POINTFIVE = 3'b001;
    parameter ONE = 3'b010;
    parameter ONEPOINTFIVE = 3'b011;
    parameter TWO = 3'b100;

    reg [31:0] counter;
    reg [2:0] current_state,next_state;

    always@(posedge clk or negedge rstn)
    begin
        if(!rstn)
            current_state <= ZERO;
        else
            current_state <= next_state;
    end

    always@(*)
    begin
        case(current_state)
        ZERO:
            if(keyoutfromjudge == 2'b00) begin
                next_state = ZERO;
            end else if(keyoutfromjudge == 2'b01) begin
                next_state = POINTFIVE;
            end else if(keyoutfromjudge == 2'b10) begin
                next_state = ONE;
            end else begin
                next_state = ZERO;
            end
        POINTFIVE:
            if(keyoutfromjudge == 2'b00)
                next_state = POINTFIVE;
            else if(keyoutfromjudge == 2'b01)
                next_state = ONE;
            else if(keyoutfromjudge == 2'b10)
                next_state = ONEPOINTFIVE;
            else 
                next_state = ZERO;
        ONE:
            if(keyoutfromjudge == 2'b00)
                next_state = ONE;
            else if(keyoutfromjudge == 2'b01)
                next_state = ONEPOINTFIVE;
            else if(keyoutfromjudge == 2'b10)
                next_state = TWO;
            else
                next_state = ZERO;
        ONEPOINTFIVE:
            if(counter == 32'h00ffffff) begin
                next_state = ZERO;
            end else begin
                next_state = ONEPOINTFIVE;
            end
        TWO:
            if(counter == 32'h00ffffff) begin
                next_state = ZERO;
            end else begin
                next_state = TWO;
            end 
        endcase 
    end

    always@(posedge clk)
    begin
        if(current_state == ONEPOINTFIVE) begin
            counter <= counter + 1;
            drink <= 1'b1;
            givechange <= 1'b0;
            hold <= 1'b1;
        end else if(current_state == TWO) begin
            counter <= counter + 1; 
            drink <= 1'b1;
            givechange <= 1'b1;
            hold <= 1'b0;
        end else begin
            counter <= 0;
            drink <= 1'b0;
            givechange <= 1'b0;
            hold <= 1'b0;
        end
    end
endmodule
