//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/02 23:33:26
// Design Name: 
// Module Name: EX1_Sequence_Detector
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


module EX1_Sequence_Detector(
    input clk,
    input rstn,
    input mode_select,//1'b1Îª11010Ì½²â£¬1'b0Îª10101Ì½²â
    input seq_input,
    output reg [0:1] flag
    );
    //¶¨Òå×´Ì¬11010,mode_select=1
    parameter state_11010_0_IDLE = 3'b000;
    parameter state_11010_1_1 = 3'b001;
    parameter state_11010_1_2 = 3'b010;
    parameter state_11010_0_1 = 3'b011;
    parameter state_11010_1_3 = 3'b100;
    parameter state_11010_0_2 = 3'b101;
    //¶¨Òå×´Ì¬10101,mode_select=0
    parameter state_10101_0_IDLE = 3'b000;
    parameter state_10101_1_1 = 3'b001;
    parameter state_10101_0_1 = 3'b010;
    parameter state_10101_1_2 = 3'b011;
    parameter state_10101_0_2 = 3'b100;
    parameter state_10101_1_3 = 3'b110;
    reg [0:2] Current_State;
    reg [0:2] Next_State;
//Ê±ÐòÂß¼­×´Ì¬×ªÒÆ
    always@(posedge clk or negedge rstn)
    begin
        if(mode_select)
        begin
            if(!rstn)
                Current_State <=  state_11010_0_IDLE;
            else 
                Current_State <= Next_State;
        end
        else
        begin
            if(!rstn)
                Current_State <=  state_10101_0_IDLE;
            else 
                Current_State <= Next_State;
        end    
    end
    
//×éºÏÂß¼­¾ö¶¨×´Ì¬
    always@(*)
        if(mode_select)
        begin
            case(Current_State)
                state_11010_0_IDLE:
                    Next_State = (seq_input==0)?state_11010_0_IDLE:state_11010_1_1;      
                state_11010_1_1:
                    Next_State = (seq_input==0)?state_11010_0_IDLE:state_11010_1_2;   
                state_11010_1_2:
                    Next_State = (seq_input==0)?state_11010_0_1:state_11010_1_2;    
                state_11010_0_1:
                    Next_State = (seq_input==0)?state_11010_0_IDLE:state_11010_1_3;
                state_11010_1_3:
                    Next_State = (seq_input==0)?state_11010_0_2:state_11010_1_2;     
                state_11010_0_2:
                    Next_State = (seq_input==0)?state_11010_0_IDLE:state_11010_1_1;
                default:
                    Next_State = state_11010_0_IDLE;
            endcase
        end
        else
        begin//10101
            case(Current_State)
                state_10101_0_IDLE:
                    Next_State = (seq_input==0)?state_10101_0_IDLE:state_10101_1_1;      
                state_10101_1_1:
                    Next_State = (seq_input==0)?state_10101_0_1:state_10101_1_1;   
                state_10101_0_1:
                    Next_State = (seq_input==0)?state_10101_0_IDLE:state_10101_1_2;    
                state_10101_1_2:
                    Next_State = (seq_input==0)?state_10101_0_2:state_10101_1_1;
                state_10101_0_2:
                    Next_State = (seq_input==0)?state_10101_0_IDLE:state_10101_1_3;     
                state_10101_1_3:
                    Next_State = (seq_input==0)?state_10101_0_2:state_10101_1_1;
                default:
                    Next_State = state_10101_0_IDLE;
            endcase
        end    
//Ê±ÐòÂß¼­Êä³ö×´Ì¬        
    always@(*)
    begin
        case(Current_State)
            state_11010_0_2:
                flag <= 2'b01;
            state_10101_1_3:
                flag <= 2'b10;
            default:
                flag <= 2'b00;
        endcase
    end
endmodule
