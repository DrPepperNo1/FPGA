module counter0_10(
    input clk,
    input rst,
    output [3:0] out
    );
    reg [3:0] out_tem;
//定义状态
    reg [3:0] Current_state;
    reg [3:0] Next_state;
    parameter [3:0] S0=0;
    parameter [3:0] S1=1;
    parameter [3:0] S2=2;
    parameter [3:0] S3=3;
    parameter [3:0] S4=4;
    parameter [3:0] S5=5;
    parameter [3:0] S6=6;
    parameter [3:0] S7=7;
    parameter [3:0] S8=8;
    parameter [3:0] S9=9;
    parameter [3:0] S10=10;
 //初始化状态   
    initial begin
        Next_state=0;
    end
//时序逻辑状态转移
    always@(posedge clk)
        begin
            if(!rst)
                Current_state<=S0;
            else
                Current_state<=Next_state;
        end
//组合逻辑决定状态
    always@(*)
        begin
            case(Current_state)
                S0:
                    Next_state=S1;
                S1:
                    Next_state=S2; 
                S2:
                    Next_state=S3;
                S3:
                    Next_state=S4;
                S4:
                    Next_state=S5;
                S5:
                    Next_state=S6;
                S6:
                    Next_state=S7;
                S7:
                    Next_state=S8;  
                S8:
                    Next_state=S9;
                S9:
                    Next_state=S10;
                S10:
                    Next_state=S0;
             default:
                Next_state=S0;
             endcase                  
        end
//时序逻辑完成输出
    always@(*)
    begin
        case(Current_state)
            S0:
                out_tem<=S0;
            S1:
                out_tem<=S1;
            S2:
                out_tem<=S2;
            S3:
                out_tem<=S3;
            S4:
                out_tem<=S4;    
            S5:
                out_tem<=S5;    
            S6:
                out_tem<=S6;
            S7:
                out_tem<=S7;    
            S8:
                out_tem<=S8;
            S9:
                out_tem<=S9;
            S10:
                out_tem<=S10;    
        endcase
    end
assign out=out_tem;
endmodule