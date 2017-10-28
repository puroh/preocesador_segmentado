`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2017 20:13:49
// Design Name: 
// Module Name: Execute
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


module Execute(clk,out,outE,oZero,oZeroD,data2D,data2D_E,RegEscr1,RegEscr1E,salSum2out,salSum2E);

    input clk;
    input [31:0] out;
    input oZero;
    input [31:0] data2D;
    input [31:0] RegEscr1;
    input [31:0] salSum2out;
    
    output reg [31:0] outE;
    output reg oZeroD;
    output reg [31:0] data2D_E;
    output reg [31:0] RegEscr1E;
    output reg [31:0] salSum2E;
    
always @(posedge clk)

begin
    
    outE = out;
    oZeroD = oZero;
    data2D_E = data2D;
    RegEscr1E = RegEscr1;
    salSum2E = salSum2out;    
end
    
endmodule
