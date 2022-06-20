`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/25 19:56:37
// Design Name: 
// Module Name: EX8_KeyInput
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


module EX8_KeyInput(
    input clk,
    input rstn,
    input keyin,
    output reg keyout
    );
    parameter INITIAL_STATE = 2'b00;
    parameter PRESS_STATE = 2'b01;
    parameter RELEASE_STATE = 2'b10;
    
    parameter Period = 32'h00000001;
    reg [31:0] counter;
    reg clean_n;
    reg [1:0] current_state,next_state;
    reg time_up;
    always@(posedge clk or negedge rstn)
    begin
        if(!rstn) begin
            counter <= 0;
            time_up <= 0;
        end else if(!clean_n) begin
            counter <= 0;
            time_up <= 0;
        end else if(counter==Period) begin
            time_up <= 1;
            counter <=0;
        end else begin
            counter <= counter + 1;
        end
    end

    always@(posedge clk or negedge rstn)
    begin
        if(!rstn)
            current_state <= INITIAL_STATE;
        else 
            current_state <= next_state;
    end

    always@(*)
    begin
        case(current_state)
        INITIAL_STATE:
        begin
            keyout = 0;
            if(keyin==0) begin
                next_state = INITIAL_STATE;
                clean_n = 0;
            end else begin
                next_state = PRESS_STATE;
                clean_n = 1;
            end
        end
        PRESS_STATE:
        begin
            if(keyin) begin
                if(time_up) begin
                    keyout = 1;
                    next_state = PRESS_STATE;
                end else begin
                    clean_n = 1;
                    keyout = 0;
                    next_state = PRESS_STATE;
                end
            end else begin
                if(time_up) begin
                    clean_n = 0;
                    keyout = 0;
                    next_state = RELEASE_STATE;

                end else begin
                    clean_n = 1;
                    keyout = 0;
                    next_state = PRESS_STATE;
                end
            end 
        end
        RELEASE_STATE:
        begin
            clean_n = 1;
            if(time_up) begin
                if(keyin)
                    next_state = PRESS_STATE;
                else
                    clean_n = 0;
                    next_state = INITIAL_STATE;
            end else begin
                if(keyin) begin
                    next_state = RELEASE_STATE;
                end else begin
                    next_state = RELEASE_STATE;
                end
            end
        end
        default:
        begin
            clean_n = 0;
            next_state = INITIAL_STATE;
        end
        endcase
    end
endmodule
