`timescale 1ns / 1ps

module simcounter0_11(
    );
    reg clki,rsti;
    wire [3:0] outp;
    counter0_10 counter0_10(.clk(clki),.rst(rsti),.out(outp));
    initial begin
        rsti=1;
        clki=1;
        forever #10 clki=~clki;
    end
endmodule
