`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/27 10:56:04
// Design Name: 
// Module Name: EX8_Judge
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


module EX8_Judge(
    input clk,
    input rstn,
    input keyin_1,
    input keyin_2,
    input hold,
    output reg [1:0] keyout
    );
    wire key_1,key_2;//1 1YUAN 2 0.5YUAN
    wire [1:0] key_1_edge,key_2_edge; //0 posedge, 1 negedge

    parameter ZEROYUAN = 2'b00;
    parameter POINTFIVEYUAN = 2'b01;
    parameter ONEYUAN = 2'b10;
    parameter OTHER = 2'b11;

    reg [1:0] current_state,next_state;
    
    always@(posedge clk or negedge rstn)
    begin
        if(!rstn) begin
            current_state <= ZEROYUAN;
        end else begin
            current_state <= next_state;
        end
    end

    always@(*)
    begin
        case(current_state)
        ZEROYUAN:
            if(hold) begin
                next_state = current_state; 
            end else if(key_1_edge[0]==1&&key_2_edge[0]==0) begin
                next_state = ONEYUAN;
            end else if(key_2_edge[0]==1&&key_1_edge[0]==0) begin
                next_state = POINTFIVEYUAN;
            end else if(key_1_edge[0] == 0 && key_2_edge[0] == 0) begin
                next_state = ZEROYUAN;
            end else
                next_state = OTHER;

        ONEYUAN:
            if(hold) begin
                next_state = current_state;
            end else if(key_1_edge[0]==1&&key_2_edge[0]==0) begin
                next_state = ONEYUAN;
            end else if(key_2_edge[0]==1&&key_1_edge[0]==0) begin
                next_state = POINTFIVEYUAN;
            end else if(key_1_edge[0] == 0 && key_2_edge[0] == 0) begin
                next_state = ZEROYUAN;
            end else
                next_state = OTHER;

        POINTFIVEYUAN:
            if(hold) begin
                next_state = current_state;
            end else if(key_1_edge[0]==1&&key_2_edge[0]==0) begin
                next_state = ONEYUAN;
            end else if(key_2_edge[0]==1&&key_1_edge[0]==0) begin
                next_state = POINTFIVEYUAN;
            end else if(key_1_edge[0] == 0 && key_2_edge[0] == 0) begin
                next_state = ZEROYUAN;
            end else
                next_state = OTHER;

        OTHER:
            if(hold) begin
                next_state = current_state;
            end else if(key_1_edge[0]==1&&key_2_edge[0]==0) begin
                next_state = ONEYUAN;
            end else if(key_2_edge[0]==1&&key_1_edge[0]==0) begin
                next_state = POINTFIVEYUAN;
            end else if(key_1_edge[0] == 0 && key_2_edge[0] == 0) begin
                next_state = ZEROYUAN;
            end else
                next_state = OTHER;
        endcase
    end

    always@(posedge clk)
    begin
        case(current_state)
        ZEROYUAN:
            keyout = ZEROYUAN;
        ONEYUAN:
            keyout = ONEYUAN;
        POINTFIVEYUAN:
            keyout = POINTFIVEYUAN;
        OTHER:
            keyout = OTHER;
        endcase
    end
    EX8_KeyInput KeyInput_1(
        .clk(clk),
        .rstn(rstn),
        .keyin(keyin_1),
        .keyout(key_1)
    );
    EX8_KeyInput KeyInput_2(
        .clk(clk),
        .rstn(rstn),
        .keyin(keyin_2),
        .keyout(key_2)
    );
    EX8_EdgeDetector EdgeDetector_1(
        .data(key_1),
        .clk(clk),
        .rstn(rstn),
        .result(key_1_edge)
    );
    EX8_EdgeDetector EdgeDetector_2(
        .data(key_2),
        .clk(clk),
        .rstn(rstn),
        .result(key_2_edge)
    );
endmodule
