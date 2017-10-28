`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2017 20:48:07
// Design Name: 
// Module Name: Memory
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


module Memory(clk,outE,outE_M,Dataout,DataoutM,RegEscr1E,RegEscr1E_M);

    input clk;
    input [31:0] outE;
    input [31:0] Dataout;
    input [4:0] RegEscr1E;
    
    output reg [31:0] outE_M;
    output reg [31:0] DataoutM;
    output reg [4:0] RegEscr1E_M;
    
 always @ (posedge clk)
    begin
        
        outE_M = outE;
        DataoutM = Dataout;
        RegEscr1E_M = RegEscr1E;
        
    end

endmodule
